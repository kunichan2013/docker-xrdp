#
# Docker VNC
#
# run this image with environment for vnc password. For example: 
#
#   docker run -it -e VNC_PASSWORD=<yourpassword> docker-vnc
#

# Pull base image.
FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
# http_proxy http://your proxy server:port/
# RUN rm -fr /tmp/.X1-lock /tmp/.X11-unix

# Install packages
RUN apt-get update
RUN apt-get install -y \
      xfce4\
      xubuntu-icon-theme\ 
      xfce4-terminal\
      tightvncserver\
      xrdp\
      expect

RUN sed -i -e 's/name=sesman-Xvnc/name=Docker RDP/g' /etc/xrdp/xrdp.ini
RUN mkdir -p /root/.vnc

ADD km-0411.ini /etc/xrdp/km-0411.ini
RUN  ln -s /etc/xrdp/km-0411.ini /etc/xrdp/km-e0010411.ini
RUN  ln -s /etc/xrdp/km-0411.ini /etc/xrdp/km-e0200411.ini

ADD xstartup /root/.vnc/xstartup
ADD docker-entrypoint.sh /entrypoint.sh

VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define Entry Point
ENTRYPOINT ["/entrypoint.sh"]

# Expose ports.
EXPOSE 3389
