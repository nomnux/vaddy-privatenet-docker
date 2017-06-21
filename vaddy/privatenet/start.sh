#!/bin/sh

echo "Start VAddy privatenet connection"
./vaddy_privatenet.sh connect
top -b -d30
