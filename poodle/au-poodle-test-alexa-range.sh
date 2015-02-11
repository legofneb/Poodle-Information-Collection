#!/bin/bash

for i in `seq $2 $3`; do
  timeout 500 ./au-poodle-test-alexa-line.sh $1 $i &

  if [ $(( $i % 50)) -eq 0 ] ; then
    wait
  fi
done
