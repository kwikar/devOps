#!/bin/bash

export DOCKER_TAG=kwik:latest;
export AWS_PATH=435485570390.dkr.ecr.eu-central-1.amazonaws.com

cd ~/docker
docker build -t $DOCKER_TAG
docker run -d -p 1600:80 $DOCKER_TAG
aws ecr get-login --no-include-email --region eu-central-1
docker tag $DOCKER_TAG $AWS_PATH/$DOCKER_TAG
docker push $AWS_PATH/$DOCKER_TAG .
