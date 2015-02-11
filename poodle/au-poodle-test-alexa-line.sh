#!/bin/bash

IFS=,
TARGET_LINE=`head -$2 $1 | tail -1`
mkdir -p out
read -r RANK DOMAIN <<< "$TARGET_LINE"
if [ `./nmap -p443 --host-timeout 3 $DOMAIN 2>/dev/null | grep 443 | grep open` ]; then
  ./au-poodle-test-domain.sh $DOMAIN &> "out/$RANK-$DOMAIN.out" 
  echo DONE $RANK:$DOMAIN
else
  echo SKIP $RANK:$DOMAIN
fi
