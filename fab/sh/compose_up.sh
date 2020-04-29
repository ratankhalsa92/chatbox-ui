#!/bin/sh
#set -x

if [ -z $1 ]
then
  COMMAND="bash"
else
  COMMAND="${@}"
fi

./fab/sh/docker_network_create.sh

PROJECT_FOLDER=`git rev-parse --show-toplevel`
cd $PROJECT_FOLDER
export REPO_NAME=$(basename $PROJECT_FOLDER)

docker-compose \
  -f fab/d/docker-compose.yaml \
  -p gmetrixr \
  --project-directory . \
  ps | grep gmetrixr_$REPO_NAME > /dev/null
#$? is 0 if already running, 1 if not (0=no error)
ALREADY_RUNNING=$?

if [ "$ALREADY_RUNNING" -eq 0 ];
then
  echo "Service already running, only opening shell"
else
  docker-compose \
    -f fab/d/docker-compose.yaml \
    --project-name gmetrixr \
    --project-directory . \
    up -d
fi

echo "Connecting to docker shell and running command $COMMAND..."
docker-compose \
  -f fab/d/docker-compose.yaml \
  --project-name gmetrixr \
  --project-directory . \
  exec $REPO_NAME $COMMAND
