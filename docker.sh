#!/bin/bash

### create local registry
docker run -d -p 5000:5000 --restart=always --name registry registry:2

### import from tar
docker import /path/to/tar newName:tag

### set local registry tag
docker tag newName:tag localhost:5000/newTag

### push image to local registry
docker push localhost:5000/newTag

### remove local images
docker rmi localhost:5000/newTag newName:tag

### load image from local registry
docker pull localhost:5000/newTag

### kill exited containers
docker rm $(docker ps -aqf status=exited)

### kill zombie images
docker rmi $(docker image ls -qf dangling=true)

### list images from local repository
curl -X GET http://localhost:5000/v2/_catalog

### list images tags
curl -X GET http://localhost:5000/v2/astra16/tags/list

### create new network bridge
docker network create --subnet=172.27.0.0/16 localDockerNetwork

### run docker container with static ip from new network
docker run --rm -it --net localDockerNetwork --ip 172.27.0.10 imageName /bin/bash
