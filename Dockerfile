##
#
# Modified: R. Alcazar 8/20/2018
#
##

FROM centos:7
LABEL maintainer="ricardo.d.alcazar@gmail.com"

# Update OS
RUN yum update -y && \
	yum clean all

# Install packages
RUN yum install socat -y && \
	yum clean all

# Reference the Docker socket
VOLUME /var/run/docker.sock

# Docker tcp port
EXPOSE 2375

# Socat for bi-directional communication between docker.sock and :2375
ENTRYPOINT socat TCP-LISTEN:2375,reuseaddr,fork UNIX-CLIENT:/var/run/docker.sock