#!/bin/bash
mv /tmp/puma.service /etc/systemd/system/puma.service

sudo systemctl daemon-reload
sudo systemctl start puma
sudo systemctl enable puma
