#!/bin/bash

if [ -z "$VNC_PASSWORD" ]; then
  echo >&2 'error: VNC_PASSWORD not set'
  echo >&2 '  Diy you forget to add -e VNC_PASSWORD=...?'
  exit 1
fi

/usr/local/bin/setvncpasswd.sh
USER=root vncserver :1 -geometry 1024x768 -depth 16
bash

