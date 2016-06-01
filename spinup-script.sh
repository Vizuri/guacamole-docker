#!/bin/bash

#set -x 

USAGE=' -d (debug); -n <num instances> (size of swarm [also size of guac cluster]); -t <target> (cloud to spin up on (def. vmwarefusion))'

DRIVER=vmwarefusion
typeset -i NODE_COUNT=3
unset LOCAL_REG

while getopts dn:t: flag
do
  case $flag in
  'd') set -x
  ;;
  'n') NODE_COUNT=$OPTARG
  ;;
  't') # not implementing this yet
    if [[ $OPTARG != 'vmwarefustion' ]] ; then echo 'Only works local at this  point.'; exit 1; fi
  ;;
  '?') echo 'Unknown option provided.'
       echo "$USAGE"
       exit 1
  ;;
  esac
done

# function to pull images from Docker HUB into our local registry
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

# Spin up the infrastructure system.. This is used to run the consul system and 
#  registry.  It's not part of the swarm, just a supporting player.
docker-machine create -d $DRIVER infrastructure  && \
   eval $(docker-machine env infrastructure) && \
   docker run --name consul -h consul --restart=always -p 8400:8400 -p 8500:8500 \
     -p 53:53/udp -d progrium/consul -server -bootstrap-expect 1 -ui-dir /ui && \
   docker run -d --restart=always -p 5000:5000 registry:2

if (( $? == 0 )); then
  echo 'Infrastructure node is up.'
else 
  echo 'Failed to set up infrastructure node.'
  exit 1
fi

pull_to_local swarm

# these are the values that are needed in order to bring the swarm elements together
INF_SERVER=$(docker-machine ip infrastructure)
CONSUL_ACCESS="consul://${INF_SERVER}:8500"
export LOCAL_REG="${INF_SERVER}:5000"

# Spin up the swarm master.  This system is also a working node, so it could be the
#   only system in the cluster in a small setup. In our case we also add a label to 
#   use this system to run the shared database.
docker-machine create -d $DRIVER --swarm --swarm-master \
  --swarm-discovery="$CONSUL_ACCESS" \
  --swarm-image="$LOCAL_REG/swarm" \
  --engine-opt="cluster-store=$CONSUL_ACCESS" \
  --engine-opt="label com.vizuri.use=database" \
  --engine-opt="insecure-registry=$LOCAL_REG" \
  --engine-opt="cluster-advertise=eth0:2376" swmaster

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
 docker-machine create -d $DRIVER --swarm \
  --swarm-discovery="$CONSUL_ACCESS" \
  --swarm-image="$LOCAL_REG/swarm" \
  --engine-opt="cluster-store=$CONSUL_ACCESS" \
  --engine-opt='cluster-advertise=eth0:2376' \
  --engine-opt="insecure-registry=$LOCAL_REG" \
   "swnode$NODE" &
  NODES="$NODES swnode$NODE"
done

# We pull and spin up the extra nodes all at once.  These are non-dependent operations.
# Block here until both complete...
wait 

eval $(docker-machine env --swarm swmaster)

# Define overlay network for back end communication.
docker network create --driver overlay --subnet 10.0.1.0/24 guacnet

# Build configuration in a volume; this will be passed to the database container for inital setup.
docker run --name config -v guac_dbconfig:/docker-entrypoint-initdb.d -e 'constraint:com.vizuri.use==database' \
   ${LOCAL_REG}/guacamole bash -c '{ echo "\\c guacamole;"; /opt/guacamole/bin/initdb.sh --postgres; } >/docker-entrypoint-initdb.d/10guac_init.sql' 
(cd dbconfigs && docker cp . config:/docker-entrypoint-initdb.d)

# Spin up database container for shared configuration and authentication
docker run -d --name postgres --volumes-from config --net guacnet postgres 

docker pull ${LOCAL_REG}/guacd
docker pull ${LOCAL_REG}/guacamole

# We give the DB a short time to settle.  Not sure this is needed, could put in a socket test instead...
sleep 20

# Spin up a pair of containers per swarm host (we use affinity rules to keep them apart.) The guac 
#  and guacamole containers have a one-to-one relationship.
for ((i=NODE_COUNT; i>0; i--))
do
 docker run --name guacd_$i -e ‘affinity:container!=/guacd_[0-9]+/’ -d ${LOCAL_REG}/guacd

 # Note: we set the GUACD_PORT... variables because the startup script is checking for an old style link (Docker legacy link).
 docker run -d -e affinty:container==guacd_$i --net guacnet -p 8080:8080 -e GUACD_PORT_4822_TCP_ADDR=guacd_$i -e GUACD_PORT_4822_TCP_PORT=4822 \
      -e POSTGRES_HOSTNAME=postgres -e POSTGRES_USER=guac -e POSTGRES_DATABASE=guacamole -e POSTGRES_PASSWORD=C34CA980-F949-4CE9-ACB6-3C619F95EA5C \
      --name guacamole_$i ${LOCAL_REG}/guacamole
done

# Register the instances with the load balancer here. Each spun up instance will 
#  listen on the same port and so is compatable with ELB.

echo 'Guacamole endpoints:'
docker ps --filter name=guacamole_\? -q | xargs -I {} docker port {} 8080 | sed -e 's@^@endpoints: tcp://@'


