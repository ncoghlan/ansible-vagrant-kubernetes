#!/bin/sh

# TODO sanity check that we got docker >= 1.6

IMAGE_NAME=bootstrap-kubernetes

if [ -z "$USERNAME" ]; then
    echo "setting USERNAME to " `whoami` 
    USERNAME=`whoami`
fi

echo docker build $USERNAME/$IMAGE_NAME
sudo docker build --rm --tag $USERNAME/$IMAGE_NAME .

#doesn't really make sense to run it
#test
#docker run -it --privileged -v /run:/run -v /:/host -v `pwd`:/application-entity $USERNAME/atomicapp-run /bin/bash
#run
#docker run -dt --privileged -v /run:/run -v /:/host -v `pwd`:/application-entity $USERNAME/atomicapp-run
