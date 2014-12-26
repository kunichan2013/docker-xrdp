#
# Docker VNC
#
# run this image with environment for vnc password. For example: 
#
#   docker run -it -e VNC_PASSWORD=<yourpassword> docker-vnc
#

# Pull base image.
FROM ubuntu:latest

# RUN rm -fr /tmp/.X1-lock /tmp/.X11-unix

# Install packages
RUN apt-get update
RUN apt-get install -y \
      xfce4\
      xubuntu-icon-theme\ 
      xfce4-terminal\
      tightvncserver\
      expect


RUN mkdir -p /root/.vnc

ADD xstartup /root/.vnc/xstartup
ADD setvncpasswd.sh /usr/local/bin/setvncpasswd.sh
ADD docker-entrypoint.sh /entrypoint.sh

VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define Entry Point
ENTRYPOINT ["/entrypoint.sh"]

# Expose ports.
EXPOSE 5901
