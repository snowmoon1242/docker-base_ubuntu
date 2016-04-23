FROM ubuntu:14.04

MAINTAINER snowmoon6467

USER root

# Update
RUN apt-get update

# Add repository for jdk8
RUN sudo apt-get -y install software-properties-common python-software-properties
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update

# Install required tools
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y openssh-server

# Install additional tools several jobs needs.
# (Following packages are just examples.)
RUN apt-get install -y gcc git wget curl unzip make

# Creates /etc/bootstrap.sh and runs this script as entry point
RUN echo "#!/bin/bash" > /etc/bootstrap.sh \
&& chmod 777 /etc/bootstrap.sh

# This entry point will be inherited by all derived images
ENTRYPOINT ["/etc/bootstrap.sh"]
