#!/usr/bin/env sh

set -e

IMAGE=vouchio/aws-cli
docker build --no-cache -t ${IMAGE} .
AWS_CLI_VERSION=$(docker run -it ${IMAGE} aws --version | awk '{ print $1 }' | sed 's|aws-cli/||')
BABASHKA_VERSION=$(docker run -it ${IMAGE} bb --version | awk '{ print $2 }' | sed 's|^v||' | tr -d '\r')
VERSION=${AWS_CLI_VERSION}_${BABASHKA_VERSION}

docker tag ${IMAGE} ${IMAGE}:${VERSION}
docker tag ${IMAGE} ${IMAGE}:latest

docker push ${IMAGE}:${VERSION}
docker push ${IMAGE}:latest

echo "Build ${IMAGE}:${VERSION}"
