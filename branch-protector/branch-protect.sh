#!/bin/bash

ALLOWED_ACTOR=$1

if [ "$GITHUB_ACTOR" != "$ALLOWED_ACTOR" ]; then
  echo "Error: Only $ALLOWED_ACTOR is allowed to push or create a PR on this branch."
  exit 1
fi
