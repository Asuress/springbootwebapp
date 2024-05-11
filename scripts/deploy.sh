#!/usr/bin/env bash

# APP_NAME="sweater-1.0-SNAPSHOT.jar"
# SSH_USER_ADDRESS="maxim@95.140.158.3"

echo 'Packaging files...'

mvn clean package

# echo 'Copy files...'

# scp -i ~/.ssh/id_rsa \
#     target/$APP_NAME \
#     $SSH_USER_ADDRESS:/home/maxim/

echo 'Restart server...'

# ssh -i ~/.ssh/id_rsa $SSH_USER_ADDRESS << EOF

pgrep java | xargs kill -9
nohup java -jar $APP_NAME > log.txt &

# EOF

echo 'Bye'