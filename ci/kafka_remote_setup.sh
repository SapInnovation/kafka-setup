#!/bin/sh -x



echo $USER_NAME+":username"

apk update
apk add  sshpass
apk add openssh

cd git-repo
pwd
ls -ltr

sshpass -p $USER_PASS scp -r -o StrictHostKeyChecking=no . $USER_NAME@$HOST_NAME:/opt/kafkasetup

sshpass -p $USER_PASS ssh -o StrictHostKeyChecking=no $USER_NAME@$HOST_NAME 'cd /opt/kafkasetup && export SERVERNAME='+$HOST_NAME+' && docker-compose up -d && docker-compose scale kafka=2'
