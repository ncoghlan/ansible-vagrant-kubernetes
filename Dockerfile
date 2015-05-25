FROM centos:centos7

MAINTAINER Nick Coghlan <ncoghlan@redhat.com>

RUN echo -e "[epel]\nname=epel\nenabled=1\nbaseurl=https://dl.fedoraproject.org/pub/epel/7/x86_64/\ngpgkey=https://getfedora.org/static/352C64E5.txt" > /etc/yum.repos.d/epel.repo

RUN yum install -y --setopt=tsflags=nodocs ansible && yum clean all

ADD content/omv /opt/bootstrap_k8s/omv

ADD content/kubernetes-ansible /opt/bootstrap_k8s/kubernetes-ansible

ADD content/bootstrap_k8s.sh /usr/bin/

LABEL RUN docker run -it --rm --privileged --net=host -v /run:/run -v /:/host --name NAME -e NAME=NAME -e IMAGE=IMAGE IMAGE -v run

WORKDIR /opt/bootstrap_k8s/omv

ENTRYPOINT ["/usr/bin/bootstrap_k8s.sh"]

