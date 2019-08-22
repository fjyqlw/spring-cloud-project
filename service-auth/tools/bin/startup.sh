#!/bin/bash
BASEDIR=$(dirname "$PWD")
nohup java -server -Dbase.dir=$BASEDIR -jar $BASEDIR/service-auth-*.*.jar --spring.config.location=$BASEDIR/conf/application-prod.yml > /dev/null &
echo $! > $BASEDIR/server.pid
echo 'service-auth started successful!'
