#!/bin/bash
#install ruby

while ps ax | grep -i [a]pt ; do sleep 10; done;

sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
