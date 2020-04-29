#!/bin/sh
echo "Image ENTRYPOINT executing as user `whoami` in directory `pwd`"

set -x
#Run command passed by docker exec/run as arguments (else the default CMD gets executed)
sh -c "$*"
