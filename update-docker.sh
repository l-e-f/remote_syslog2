#! /usr/bin/bash

docker buildx build --platform linux/amd64 -f Dockerfile -t ellief/remote_syslog2:amd64 --push .
docker buildx build --platform linux/arm64/v8 -f Dockerfile -t ellief/remote_syslog2:arm64v8 --push .

docker manifest create ellief/remote_syslog2:latest ellief/remote_syslog2:amd64v8 ellief/remote_syslog2:arm64
docker manifest push ellief/remote_syslog2:latest
