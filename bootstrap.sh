#!/usr/bin/env bash

apt-get update
apt-get upgrade

cd /vagrant

echo ">> Booting..."

echo ">> Set environment"
export LC_ALL="en_US.UTF-8"
if [ ! -d ".env" ]; then
  export $(grep -v '^#' .env | xargs -d '\n')
fi

echo ">> Install wptserver..."
chmod +x ./wptserver-install/ubuntu.sh
./wptserver-install/ubuntu.sh

echo ">> Install wptagent..."
chmod +x ./wptagent-install/ubuntu.sh
./wptagent-install/ubuntu.sh
