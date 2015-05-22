#!/bin/sh

echo "Start small, build up incrementally!"
rpm -qa ansible
rpm -qa git
ls -l /opt/bootstrap_k8s/omv
