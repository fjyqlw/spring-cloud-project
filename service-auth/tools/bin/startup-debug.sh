#!/bin/bash
BASEDIR=$(dirname "$PWD")
#nohup
java -server -Dbase.dir=$BASEDIR -jar $BASEDIR/laser-guided-vehicle-*.*.*.jar --spring.config.location=$BASEDIR/conf/application-prod.yml
#> /dev/null &
echo $! > $BASEDIR/server.pid
echo 'laser-guided-vehicle started successful!'
