#!/bin/sh

IMAGE=vouchio/aws-cli
docker build -t $IMAGE .
VERSION=$(docker run -it vouch.io/aws-cli aws --version | awk '{ print $1 }' | sed 's|aws-cli/||')

docker tag $IMAGE $IMAGE:$VERSION
docker tag $IMAGE $IMAGE:latest

docker push $IMAGE:$VERSION
docker push $IMAGE:latest
