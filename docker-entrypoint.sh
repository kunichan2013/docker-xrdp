#!/bin/bash

if [ -z "$ROOT_PASSWORD" ]; then
  echo >&2 'error: ROOT_PASSWORD not set'
  echo >&2 '  Did you forget to add -e ROOT_PASSWORD=...?'
  exit 1
fi

echo -e "${ROOT_PASSWORD}\n${ROOT_PASSWORD}" | passwd
# USER=root vncserver :1 -geometry 1024x768 -depth 16
service xrdp start
bash

