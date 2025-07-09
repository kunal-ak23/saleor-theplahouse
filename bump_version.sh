#!/bin/bash

PART=$1
VERSION=$(cat .version)
IFS='.' read -r MAJOR MINOR PATCH <<< "$VERSION"

case "$PART" in
  major)
    ((MAJOR+=1)); MINOR=0; PATCH=0 ;;
  minor)
    ((MINOR+=1)); PATCH=0 ;;
  patch)
    ((PATCH+=1)) ;;
  *)
    echo "Usage: ./bump_version.sh [major|minor|patch]"
    exit 1 ;;
esac

NEW_VERSION="$MAJOR.$MINOR.$PATCH"
echo "$NEW_VERSION" > .version
echo "📦 Bumped version to $NEW_VERSION"
