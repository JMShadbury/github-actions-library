#!/bin/bash

# Fetch the ID of the release associated with the tag
RELEASE_ID=$(curl -s -X GET -H "Accept: application/vnd.github.v3+json" \
-H "Authorization: token $1" \
"https://api.github.com/repos/$2/releases/tags/$3" | jq '.id')

# If the release exists, delete it
if [ "$RELEASE_ID" != "null" ]; then
  curl -s -X DELETE -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $1" \
  "https://api.github.com/repos/$2/releases/$RELEASE_ID"
fi
