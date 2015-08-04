FROM fedora:22 

MAINTAINER Christoph Görn <goern@redhat.com>

ENV container docker

LABEL summary "This is a OpenShift Online client container image, including Rails4"
LABEL vendor "Red Hat, Inc."
LABEL version "1.0.0"
LABEL architecture "x86_64"

# if there is no tar within to container, gem install will fail with `sh: zxf: command not found`... tar zxf !? ;)

RUN dnf install -y --setopt=tsflags=nodocs rubygem-rhc ruby-devel zlib-devel libxml2-devel libxslt-devel gcc tar patch make gcc-c++ && \
    gem install nokogiri --no-ri --no-rdoc -- --use-system-libraries && \
    gem install rails --no-ri --no-rdoc && \
    gem install therubyracer --no-ri --no-rdoc && \
    dnf update -y && \
    dnf clean all

WORKDIR /root

VOLUME [ "/root/.openshift", "/root/.ssh", "/root/.git" ]

ENTRYPOINT "/bin/bash"

EXPOSE 3000
