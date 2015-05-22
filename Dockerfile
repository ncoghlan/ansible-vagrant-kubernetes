FROM centos:centos7

MAINTAINER Nick Coghlan <ncoghlan@redhat.com>

RUN echo -e "[epel]\nname=epel\nenabled=1\nbaseurl=https://dl.fedoraproject.org/pub/epel/7/x86_64/\ngpgkey=https://getfedora.org/static/352C64E5.txt" > /etc/yum.repos.d/epel.repo

# TODO: Reduce the bootstrap image size by assuming git is available on host
RUN yum install -y --setopt=tsflags=nodocs ansible git && \
    yum clean all

# TODO: Look at using a git submodule & ADD to include OMV into the image
RUN mkdir -p /opt/bootstrap_k8s && \
    git clone --depth 1 https://github.com/purpleidea/oh-my-vagrant.git \
                        /opt/bootstrap_k8s/omv

ADD content/bootstrap_k8s.sh /usr/bin/

LABEL RUN docker run -it --rm --privileged --net=host -v /run:/run -v /:/host --name NAME -e NAME=NAME -e IMAGE=IMAGE IMAGE -v run

ENTRYPOINT ["/usr/bin/bootstrap_k8s.sh"]

