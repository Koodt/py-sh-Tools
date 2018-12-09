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
