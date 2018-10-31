#!/bin/bash
# Format
# {"ping":32,"download":50.1,"upload":13.6}
#
BIN=/usr/local/lib/node_modules/speed-test/cli.js
PATH=$PATH:/usr/local/bin

if [ -x "$BIN" ]
then
  $BIN -j | perl -ne 'if (/download..([0-9.]+)/) { print "$1" } if (/download..([0-9.]+),.upload..([0-9.]+)/) { print ",$2" }'
else
  echo "0"
  exit 1
fi
