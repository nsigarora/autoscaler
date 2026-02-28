#!/bin/sh

apk add --no-cache curl bash >/dev/null 2>&1
source .gitenrichment/scripts/ep-versioner.sh
VERSION=$($VERSIONER calc -s triple --deepen)
echo $VERSION
