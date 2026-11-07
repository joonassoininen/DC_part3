#!/bin/sh


if [ $# -ne 2 ]; then
  echo "Usage: ./builder.sh <github-repo> <docker-image>"
  exit 1
fi

GITHUB_REPO="$1"
DOCKER_REPO="$2"

if [ -z "$DOCKER_USER" ] || [ -z "$DOCKER_PWD" ]; then
  echo "Set DOCKER_USER and DOCKER_PWD!"
  exit 1
fi


git clone "https://github.com/$GITHUB_REPO.git" /tmp/builder_repo || exit 1
cd /tmp/builder_repo || exit 1

docker build -t "$DOCKER_REPO" . || exit 1

echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin || exit 1

docker push "$DOCKER_REPO"