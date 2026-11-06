#!/bin/sh

if [ $# -ne 2 ]; then
  echo "Usage: ./builder.sh <github-repo> <docker-image>"
  exit 1
fi

GITHUB_REPO="$1"
DOCKER_REPO="$2"

rm -rf /tmp/builder_repo
git clone "https://github.com/$GITHUB_REPO.git" /tmp/builder_repo || exit 1
cd /tmp/builder_repo || exit 1

docker build -t "$DOCKER_REPO" . || exit 1

docker push "$DOCKER_REPO"