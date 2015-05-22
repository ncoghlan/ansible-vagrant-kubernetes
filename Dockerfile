FROM centos:centos7

MAINTAINER Nick Coghlan <ncoghlan@redhat.com>

ADD content/bootstrap_k8s.sh /usr/bin/

LABEL RUN docker run -it --rm --privileged --net=host -v /run:/run -v /:/host --name NAME -e NAME=NAME -e IMAGE=IMAGE IMAGE -v run

ENTRYPOINT ["/usr/bin/bootstrap_k8s.sh"]

