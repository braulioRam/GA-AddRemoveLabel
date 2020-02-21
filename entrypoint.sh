#!/bin/sh -l

NUMBER=$(jq --raw-output .pull_request.number "$2")
REPO=$(jq --raw-output .repository.name "$2")


if [[ -n $3 ]]; then
    curl -sSL \
      -H "Authorization: token $1" \
      -H "Accept: application/vnd.github.v3+json" \
      -X POST \
      -H "Content-Type: application/json" \
      -d "{\"labels\":[\"$3\"]}" \
      "https://api.github.com/repos/$REPO/issues/$NUMBER/labels"
fi

if [[ -n $4 ]]; then
    curl -sSL \
      -H "Authorization: token $1" \
      -H "Accept: application/vnd.github.v3+json" \
      -X DELETE \
      "https://api.github.com/repos/$REPO/issues/$NUMBER/labels/$4"
fi
