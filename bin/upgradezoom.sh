#!/usr/bin/env bash

url=https://zoom.us/client/latest/
file=zoom_amd64.deb
cd ~/Downloads

wget -qN $url$file
downloadedVer=`dpkg -f $file version`

dpkgReport=`dpkg -s zoom`
echo "$dpkgReport" | grep '^Status: install ok' > /dev/null && \
  installedVer=`echo "$dpkgReport" | grep ^Version: | sed -e 's/Version: //'`

if [ "$installedVer" != "$downloadedVer" ]; then
  sudo dpkg -i $file
else
  echo "Zoom is up to date"
fi
