#!/usr/bin/env bash
app_name='cim-server'
docker stop ${app_name}
echo '----stop container----'
docker rm ${app_name}
echo '----rm container----'
docker rmi `docker images | grep none | awk '{print $3}'`
echo '----rm none images----'
docker run -p 8081:8081 --name ${app_name} \
-e TZ="Asia/Shanghai" \
-v /etc/localtime:/etc/localtime \
-v /mydata/app/${app_name}/logs:/var/logs \
-dit 2084team/${app_name}:1.0.0
echo '----start container----'