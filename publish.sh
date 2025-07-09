#!/bin/bash

set -e

DOCKER_USER="kunalms"
IMAGE_NAME="saleor-theplahouse"

# Read version from file
VERSION=$(cat .version)

# Validate semver
SEMVER_REGEX="^([0-9]+)\.([0-9]+)\.([0-9]+)$"
if [[ ! $VERSION =~ $SEMVER_REGEX ]]; then
  echo "❌ Invalid version in .version file. Use format MAJOR.MINOR.PATCH"
  exit 1
fi

IMAGE_TAG="$DOCKER_USER/$IMAGE_NAME:$VERSION"

echo "🔧 Building Docker image: $IMAGE_TAG"
docker build -t "$IMAGE_TAG" .

echo "🐳 Pushing to Docker Hub..."
docker push "$IMAGE_TAG"

echo "✅ Successfully pushed: $IMAGE_TAG"
