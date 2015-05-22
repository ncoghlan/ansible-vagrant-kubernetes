#!/bin/sh

echo "Start small, build up incrementally!"
which ansible
# TODO: Add vagrant to the runtime image
#       vagrant isn't in EPEL7, so may need to switch to Fedora
which vagrant
pwd
ls .
