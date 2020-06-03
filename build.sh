#!/bin/sh

IMAGE=vouchio/aws-cli
docker build --no-cache -t $IMAGE .
VERSION=$(docker run -it $IMAGE aws --version | awk '{ print $1 }' | sed 's|aws-cli/||')

docker tag $IMAGE $IMAGE:$VERSION
docker tag $IMAGE $IMAGE:latest

docker push $IMAGE:$VERSION
docker push $IMAGE:latest

echo "Build $IMAGE:$VERSION"
