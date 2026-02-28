#!/bin/sh

timeout=0

echo "waiting for docker sandbox to boot ..."
while true
do
  docker info > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    break
  fi
  if [ $timeout == 120 ]; then
    echo "giving up on sandbox after 120 seconds ..."
    exit 1
  fi
  sleep 1s
  timeout=`expr $timeout + 1`
done
echo "sandbox is ready ..."
