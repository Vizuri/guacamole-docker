# Guacamole deployment using Docker #

Script to deploy gucamole as a series of nodes controlled as a Docker Swarm. Makes use of docker-machine command, so requires that either Docker Machine or Docker Tooolbox is installed. Makes use of features requiring Docker 1.9.1+.

List of files:

* alt-dbconfigs/ -- Various SQL files for inserting data into the shared database. Useful as examples and for adding custom changes.
* dbconfigs/ -- Copied into the database setup directory for inital spinup.
* docker-compose.yml -- Not used yet; would have driven the process using Docker Compose. **Project does not use compose at this time.**
* spinup-script.sh -- The actual bash script for setup.
