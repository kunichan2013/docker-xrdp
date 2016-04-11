#
# Docker VNC
#
# run this image with environment for vnc password. For example: 
#
#   docker run -it -e VNC_PASSWORD=<yourpassword> docker-vnc
#

# Pull base image.
FROM centos:latest

ENV http_proxy http://172.19.0.3:18080/
ENV https_proxy http://172.19.0.3:18080/

# Install packages
RUN yum install -y epel-release
RUN yum install -y \
      xrdp\
      xfce4 xfwm4 xfsettingsd xfdesktop xfce4-session\
      ipa-gothic-fonts ipa-mincho-fonts ipa-pgothic-fonts ipa-pmincho-fonts \
      orange \
      which \
      expect

RUN sed -i -e 's/name=sesman-Xvnc/name=Docker RDP/g' /etc/xrdp/xrdp.ini
RUN sed -i -e 's/xterm/xfce4-session/g' /etc/xrdp/startwm.sh
RUN mkdir -p /root/.vnc

ADD km-0411.ini /etc/xrdp/km-0411.ini
# RUN  ln -s /etc/xrdp/km-0411.ini /etc/xrdp/km-e0010411.ini
# RUN  ln -s /etc/xrdp/km-0411.ini /etc/xrdp/km-e0200411.ini

ADD xstartup /root/.vnc/xstartup
ADD docker-entrypoint.sh /entrypoint.sh

VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define Entry Point
ENTRYPOINT ["/entrypoint.sh"]

# Expose ports.
EXPOSE 3389
