#!/usr/bin/env bash

APP_NAME="servingwebcontent-0.0.1-SNAPSHOT.jar"
LOGS_DIR=~/logs

echo 'Packaging files...'

mvn clean package

echo "Copy files... from $PWD/target/$APP_NAME to ~/"
cp $PWD/target/$APP_NAME ~/

if [ ! -d "$LOGS_DIR" ]; then
    echo "Creating directory"
    mkdir $LOGS_DIR
fi

echo 'Restart server...'

pgrep java | xargs kill -9
nohup java -jar ~/$APP_NAME > $LOGS_DIR/log.txt &

echo 'Bye'