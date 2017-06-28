## -*- docker-image-name: "scaleway/ubuntu:yakkety" -*-
FROM scaleway/ubuntu:amd64-yakkety
# following 'FROM' lines are used dynamically thanks do the image-builder
# which dynamically update the Dockerfile if needed.
#FROM scaleway/ubuntu:armhf-yakkety # arch=armv7l
#FROM scaleway/ubuntu:i386-yakkety  # arch=i386
#FROM scaleway/ubuntu:amd64-yakkety # arch=x86_64
#FROM scaleway/ubuntu:mips-yakkety  # arch=mips

MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder.
#   This script prevent aptitude to run services when installed
RUN /usr/local/sbin/scw-builder-enter


# Install packages
RUN apt-get -q update && \
    apt-get -y -qq upgrade && \
    apt-get install -y -qq cowsay


# Add local files from the patches directory
COPY ./patches/ /


# Clean rootfs from image-builder.
#   Revert the builder-enter script
RUN /usr/local/sbin/scw-builder-leave
