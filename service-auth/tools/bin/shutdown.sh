#!/bin/bash

BASEDIR=..
PID=$(cat $BASEDIR/server.pid)
echo $PID
kill $PID
rm -f $BASEDIR/server.pid
echo server shutdown.
exit 0
