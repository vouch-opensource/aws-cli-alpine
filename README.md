# Docker image for aws-cli based on Alpine Linux

This Docker image builds on top of Alpine Linux and contains:
- [AWS CLI v2](https://github.com/aws/aws-cli)
- [babashka](https://github.com/borkdude/babashka); since scripting the AWS CLI in `ash` is pretty painful.

## Usage

```shell
docker run \
  -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY \ 
  vouchio/aws-cli \
  aws --region us-east-1 ec2 describe-instances 
```

## Versions

See [Docker Hub](https://hub.docker.com/repository/docker/vouchio/aws-cli) for available versions.
If you need a specific version to be available on the docker registry, create an issue.

The version is the concatenation of `aws-cli-version`_`babashka-version`.

## Credits

AWS CLI on Alpine idea taken from taken from https://github.com/aws/aws-cli/issues/3553#issuecomment-615149941
