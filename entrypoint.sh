#!/bin/bash -l

set -e

NUMBER=$(jq --raw-output .pull_request.number "$GITHUB_EVENT_PATH")


if [[ -n $ADD_LABEL ]]; then
    curl -sSL \
      -H "Authorization: token ${GITHUB_TOKEN}" \
      -H "Accept: application/vnd.github.v3+json" \
      -X POST \
      -H "Content-Type: application/json" \
      -d "{\"labels\":[\"${ADD_LABEL}\"]}" \
      "https://api.github.com/repos/${GITHUB_REPOSITORY}/issues/${NUMBER}/labels"
fi

if [[ -n $REMOVE_LABEL ]]; then
    curl -sSL \
      -H "Authorization: token ${GITHUB_TOKEN}" \
      -H "Accept: application/vnd.github.v3+json" \
      -X DELETE \
      "https://api.github.com/repos/${GITHUB_REPOSITORY}/issues/${NUMBER}/labels/${REMOVE_LABEL}"
fi
