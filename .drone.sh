#!/bin/sh

set -e
set -x

COMMIT_SHA="${DRONE_COMMIT_SHA:-unknown}"
VERSION_TAG="${DRONE_TAG:-latest}"

LDFLAGS="-extldflags=-static -X main.commit=${COMMIT_SHA} -X main.version=${VERSION_TAG}"

go build \
  -ldflags "${LDFLAGS}" \
  -o release/linux/amd64/drone-autoscaler \
  github.com/drone/autoscaler/cmd/drone-autoscaler
  