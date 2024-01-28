#!/bin/bash

while ps ax | grep -i [a]pt ; do sleep 10; done;

apt update
apt install -y ruby-full ruby-bundler build-essential mongodb git

cd /home/ubuntu
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
