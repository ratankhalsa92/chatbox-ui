#!/bin/sh
#Externalizing the network creation step allows multiple docker composes to independently connect
#to the same network without worrying about start order

docker network ls | grep gmetrixr > /dev/null
#0 if already exists, 1 if doesn't exist (0=no error)
NETWORK_EXISTS=$?

if [ "$NETWORK_EXISTS" -eq 0 ];
then
  echo "Network exists"
else
  set -x
  docker network create --attachable gmetrixr
fi
