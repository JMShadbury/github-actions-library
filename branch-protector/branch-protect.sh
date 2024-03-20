#!/bin/bash

ALLOWED_ACTOR=$1
SOURCE_BRANCH=$2
TARGET_BRANCH=$3

# Check for actor restrictions if allowed_actor is provided
if [ -n "$ALLOWED_ACTOR" ]; then
    if [ "$GITHUB_ACTOR" != "$ALLOWED_ACTOR" ]; then
        echo "Error: Only $ALLOWED_ACTOR is allowed to push or create a PR."
        exit 1
    fi
fi

# Check for branch merge restrictions if source_branch and target_branch are provided
if [ -n "$SOURCE_BRANCH" ] && [ -n "$TARGET_BRANCH" ]; then
    if [ "$GITHUB_BASE_REF" == "$TARGET_BRANCH" ] && [ "$GITHUB_HEAD_REF" == "$SOURCE_BRANCH" ]; then
        echo "Error: Merging from $SOURCE_BRANCH to $TARGET_BRANCH is not allowed."
        exit 1
    fi
fi
