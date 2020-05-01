#!/bin/bash

#stop if already container is running
docker stop artifactory

#remove container for fresh installation
docker rm artifactory

#delete if folder is already existing
rm -rf /jfrog

#create new installation directory
mkdir -p /jfrog/artifactory/var/etc/
cd /jfrog/artifactory/var/etc/
touch ./system.yaml
chown -R 1030:1030 /jfrog/artifactory/var

#start the container
docker run --name artifactory -v /jfrog/artifactory/var/:/var/opt/jfrog/artifactory -d -p 8083:8081 -p 8082:8082 docker.bintray.io/jfrog/artifactory-oss:latest



