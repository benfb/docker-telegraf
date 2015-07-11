#! /bin/bash

SHA1=$1

# Deploy image to Docker Hub
docker push bbailey/telegraf:$SHA1
