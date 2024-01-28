#!/bin/bash
yc compute instance create \
  --name reddit-app-1 \
  --hostname reddit-app-1 \
  --platform=standard-v1 \
  --memory=4 \
  --create-boot-disk image-id=fd8b2infgri0g991hd8m \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata-from-file user-data=cloud-init-create-reddit.yml
