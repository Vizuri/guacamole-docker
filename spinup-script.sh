#!/bin/bash

USAGE='  -[d|D] (script debug|full debug inc. docker-machine) 
  -n <num instances> (size of swarm [also size of guac cluster])
  -t <target>[:<profile>] (cloud to spin up on, with optional profile indicated'

typeset -i NODE_COUNT=3
unset LOCAL_REG

while getopts dDn:t: flag
do
	case $flag in
	'd') set -x
	;;
	'D') 
		set -x
		export MACHINE_DEBUG=1
	;;
	'n') NODE_COUNT=$OPTARG
	;;
	't') 
		if [[ $OPTARG != virtualbox && $OPTARG != vmwarefusion && $OPTARG != aws* ]] ; then 
			echo 'Invalid or unsupported cloud provider specified:' "$OPTARG"
			exit 1
		fi
		CLOUD="$OPTARG"
	;;
	'?') echo 'Unknown option provided.'
		echo "$USAGE"
		exit 1
	;;
	esac
done

if [[ -z $CLOUD ]]; then 
  echo 'The target argument is required (-t).'
  echo "$USAGE"
  exit 1
fi

# +=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~
# function to pull the credencial out of a specif profile in order to use them with 
# the docker-machine command and the aws driver
# paramters: $1 is the name of the cloud profile requested
# globals: sets the VIZ_AWS_* variables for later use by other routines
function set_aws_creds() {
local instanza=0 line
	while read line
	do
		if (( ! $instanza )); then
			if [[ $line == "[profile $1]" ]]; then
				instanza=1
			fi
			continue
		else
			case $line in
				aws_access_key_id=*)
					#export AWS_ACCESS_KEY_ID="${line#*=}"
					VIZ_AWS_ACCES_KEY_ID="${line#*=}"
					;;
				aws_secret_access_key=*)
					#export AWS_SECRET_ACCESS_KEY="${line#*=}"
					VIZ_AWS_SECRET_ACCESS_KEY="${line#*=}"
					;;
				region\ =*)
					VIZ_AWS_REGION="${line#* = }"
					;;
				'['*) # indicates end of stanza, so end of processing
					break
					;;
			esac
		fi
	done <~/.aws/config
}


# +=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~
# function to allow a central place to set configuration options on 
#  the docker-machine command line.  Expected to be executed in 
#  subshell expression $()
#
# expected options: $1 == machine name (indicates the role)
# global vars: CLOUD  - details what type of cloud we are using
# retuns: nothing, but provides a list of options on stdout. If passed 
#  an unknown host, terminated the program with a message.
function set_cloud_opts() {
	case $CLOUD in
    virtualbox)
			echo --driver virtualbox
			# We set no virtualbox specific options at this time. Some instance sizing might be reasonable if we ever tune things.
		;;
    vmwarefusion)
			echo --driver vmwarefusion
			# We set no vmware specific options at this time. Some instance sizing might be reasonable if we ever tune things.
		;;
    aws | aws:*)
      if [[ $CLOUD == aws:* ]] ; then
			set_aws_creds "${CLOUD#*:}"
		fi

		echo --driver amazonec2
		#echo --amazonec2-ssh-keypath ~/.ssh/docker-training-guacamole-01.pem
		echo --amazonec2-subnet-id subnet-6ae57b41 --amazonec2-vpc-id vpc-6825250d
		echo --amazonec2-zone a 
		echo --amazonec2-monitoring
		echo --amazonec2-tags Name,guacamole,Role,$1
		if [[ $VIZ_AWS_ACCES_KEY_ID ]] ; then
			echo --amazonec2-access-key $VIZ_AWS_ACCES_KEY_ID
		fi
		if [[ $VIZ_AWS_SECRET_ACCESS_KEY ]] ; then
			echo --amazonec2-secret-key $VIZ_AWS_SECRET_ACCESS_KEY 
		fi
		if [[ $VIZ_AWS_REGION ]]; then
			echo --amazonec2-region $VIZ_AWS_REGION
		fi


		# note on security groups:
		#  * guacamole-cluster - holds the swarm nodes
		#  * guac-infrastructure - used for the group machine, no access from outside (except for machine of course), but access from the swarm nodes on 5000 (guacamole-cluster)
		case $1 in 
			infrastructure)
				echo --amazonec2-security-group guac-infrastructure
			;;
			swmaster | swnode*)
				echo --amazonec2-security-group guacamole-cluster
			;;
		esac
		;;
       \*) 
			echo 'Unknown cloud -- unexpected request to configure options'
			exit 1;
		;;
	esac
  # The last item is the name of the instance; this lets us replace the name with all of the configs w/o complicating the command line or introducing redundancy.
  echo $1
return 0
}

# +=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~
# function to pull images from Docker HUB into our local registry
# paramters: list of images to pull
# globals: looks for the LOCAL_REG, defining the registry to push to
function pull_to_local() {
 local IMAGE NEWTAG
 for IMAGE 
 do
   NEWTAG="${LOCAL_REG:-127.0.0.1:5000}/${IMAGE##*/}"
   docker pull $IMAGE
   docker tag $IMAGE $NEWTAG
   docker push $NEWTAG
 done
 }

# +=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~+=~
# START MAINLINE
#
# Spin up the infrastructure system.. This is used to run the consul system and 
#  registry.  It's not part of the swarm, just a supporting player.
docker-machine create $(set_cloud_opts infrastructure) && \
   eval $(docker-machine env infrastructure) && \
   docker run --name consul -h consul --restart=always -p 8400:8400 -p 8500:8500 \
     -d progrium/consul -server -bootstrap-expect 1 -ui-dir /ui && \
   docker run -d --restart=always -p 5000:5000 registry:2
# EGN - temp removed the DNS port publish from consul since Ubuntu has some dnsmasq process in place causing collision: -p 53:53/udp 

if (( $? == 0 )); then
  echo 'Infrastructure node is up.'
else 
  echo 'Failed to set up infrastructure node.'
  exit 1
fi

pull_to_local swarm

# these are the values that are needed in order to bring the swarm elements together
INF_SERVER=$(docker-machine ip infrastructure)
if [[ $CLOUD == aws* ]] ; then
	# Important note: AWS ACLs dictate that you use the hostname! That's why we change the operation for AWS. Also
	# note that we need to strip the training dot form the hostname because nobody in the world knows how to
	# properly handle hostnames.
	INF_SERVER=$(dig -x $INF_SERVER | awk '/^[^;]/{print substr($5,1,length($5)-1); exit;}' )
fi
CONSUL_ACCESS="consul://${INF_SERVER}:8500"
export LOCAL_REG="${INF_SERVER}:5000"

# Spin up the swarm master.  This system is also a working node, so it could be the
#   only system in the cluster in a small setup. In our case we also add a label to 
#   use this system to run the shared database.
docker-machine create --swarm --swarm-master \
  --swarm-discovery="$CONSUL_ACCESS" \
  --swarm-image="$LOCAL_REG/swarm" \
  --engine-opt="cluster-store=$CONSUL_ACCESS" \
  --engine-opt="label com.vizuri.use=database" \
  --engine-opt="insecure-registry=$LOCAL_REG" \
  --engine-opt="cluster-advertise=eth0:2376" $(set_cloud_opts swmaster)
  NODES='swmaster'

if (( $? == 0 )); then
  echo 'Swarm master node is up.'
else 
  echo 'Failed to set up swarm master node.'
  exit 1
fi

# We use the swarm mster node to pull the additional images, since they can 
#  be used here as well (master is also a worker in our case.)
eval $(docker-machine env swmaster)
pull_to_local glyptodon/guacamole glyptodon/guacd &

# Spin up all additional worker nodes.
for ((NODE=NODE_COUNT-1; NODE > 0; NODE--))
do
 docker-machine create --swarm \
  --swarm-discovery="$CONSUL_ACCESS" \
  --swarm-image="$LOCAL_REG/swarm" \
  --engine-opt="cluster-store=$CONSUL_ACCESS" \
  --engine-opt='cluster-advertise=eth0:2376' \
  --engine-opt="insecure-registry=$LOCAL_REG" \
   $(set_cloud_opts "swnode$NODE") &
  NODES="$NODES swnode$NODE"
done

# We pull and spin up the extra nodes all at once.  These are non-dependent operations.
# Block here until both complete...
wait 

eval $(docker-machine env --swarm swmaster)

# Define overlay network for back end communication.
docker network create --driver overlay --subnet 10.0.1.0/24 guacnet || { echo 'Unable to interact with the swarm'; exit 1; }

# Build configuration in a volume; this will be passed to the database container for inital setup.
docker run --name config -v guac_dbconfig:/docker-entrypoint-initdb.d -e 'constraint:com.vizuri.use==database' \
   ${LOCAL_REG}/guacamole bash -c '{ echo "\\c guacamole;"; /opt/guacamole/bin/initdb.sh --postgres; } >/docker-entrypoint-initdb.d/10guac_init.sql' 
(cd dbconfigs && docker cp . config:/docker-entrypoint-initdb.d)

# Spin up database container for shared configuration and authentication
docker run -d --name postgres --volumes-from config --net guacnet --restart=always postgres 

#docker pull ${LOCAL_REG}/guacd
#docker pull ${LOCAL_REG}/guacamole

# We give the DB a short time to settle.  Not sure this is needed, could put in a socket test instead...
sleep 20

# Spin up a pair of containers per swarm host (we use affinity rules to keep them apart.) The guac 
#  and guacamole containers have a one-to-one relationship.
for ((i=NODE_COUNT; i>0; i--))
do
 docker run --name guacd_$i -e ‘affinity:container!=/guacd_[0-9]+/’ -d --restart=always ${LOCAL_REG}/guacd

 # Note: we set the GUACD_PORT... variables because the startup script is checking for an old style link (Docker legacy link).
 docker run -d -e affinty:container==guacd_$i --net guacnet -p 8080:8080 -e GUACD_PORT_4822_TCP_ADDR=guacd_$i -e GUACD_PORT_4822_TCP_PORT=4822 \
      -e POSTGRES_HOSTNAME=postgres -e POSTGRES_USER=guac -e POSTGRES_DATABASE=guacamole -e POSTGRES_PASSWORD=C34CA980-F949-4CE9-ACB6-3C619F95EA5C \
      --name guacamole_$i --restart=always ${LOCAL_REG}/guacamole
done

# Register the instances with the load balancer here. Each spun up instance will 
#  listen on the same port and so is compatable with ELB.

echo '+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-+=-'
echo -e 'Guac cluster started\n'
echo 'Guacamole endpoints:'
docker ps --filter name=guacamole_\? -q | xargs -I {} docker port {} 8080 | sed -e 's@^@endpoint: http://@'

if [[ $CLOUD == aws* ]]; then
	echo -e '\nGuacamole instances:'
	for NODE in $NODES
	do
		docker-machine inspect --format='{{ .Driver.InstanceId }}' $NODE
	done
fi

echo -e '\nFor DB access:'
echo '1) eval $(docker-machine env --swarm swmaster)'
echo '2) docker exec -it postgres psql -U postgres'

