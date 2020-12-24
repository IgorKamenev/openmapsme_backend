#!/bin/bash

ARGC=$#

if [ $ARGC -ne 1 ]; then
    echo "";
    echo "Using: $0 <path to application folder>";
    echo "";
    exit 1;
fi;

echo "Running..."

CONTAINER_NAME="openmaps"

APPLICATION_PATH=$1

MYSQL_DATA_DIR=$APPLICATION_PATH/container/mysql_data
REDIS_DATA_DIR=$APPLICATION_PATH/container/redis_data

NGINX_LOG_PATH=$APPLICATION_PATH/container/logs/nginx
NGINX_OPENMAPS_LOG_PATH=$APPLICATION_PATH/container/logs/nginx/om
REDIS_LOG_PATH=$APPLICATION_PATH/container/logs/redis
MYSQL_LOG_PATH=$APPLICATION_PATH/container/logs/mysql
SUPERVISOR_LOG_PATH=$APPLICATION_PATH/container/logs/supervisor
PHP_LOG_PATH=$APPLICATION_PATH/container/logs/php

mkdir -p $MYSQL_DATA_DIR
mkdir -p $REDIS_DATA_DIR

mkdir -p $REDIS_LOG_PATH
mkdir -p $PHP_LOG_PATH
mkdir -p $MYSQL_LOG_PATH
mkdir -p $NGINX_LOG_PATH
mkdir -p $NGINX_OPENMAPS_LOG_PATH
mkdir -p $SUPERVISOR_LOG_PATH

docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

docker run \
--restart=always \
-p 80:80 \
-p 443:443 \
-v $APPLICATION_PATH:/application \
-v $APPLICATION_PATH/container/etc/nginx:/etc/nginx \
-v $APPLICATION_PATH/container/etc/redis:/etc/redis \
-v $APPLICATION_PATH/container/etc/supervisor:/etc/supervisor \
-v $APPLICATION_PATH/container/etc/php:/etc/php \
-v $REDIS_DATA_DIR:/var/lib/redis \
-v $REDIS_LOG_PATH:/var/log/redis \
-v $MYSQL_LOG_PATH:/var/log/mysql \
-v $PHP_LOG_PATH:/var/log/php \
-v $NGINX_LOG_PATH:/var/log/nginx \
-v $NGINX_OPENMAPS_LOG_PATH:/var/log/nginx/om \
-v $SUPERVISOR_LOG_PATH:/var/log/supervisor \
-v $MYSQL_DATA_DIR:/var/lib/mysql \
-v $APPLICATION_PATH/container/etc/mysql:/etc/mysql \
-v /tmp:/var/run/mysqld \
-v /tmp:/tmp \
--ulimit nofile=200000:200000 \
--shm-size=8g \
--env TZ=UTC \
-ti -d \
--name $CONTAINER_NAME \
--hostname $CONTAINER_NAME \
mrjamesbond/openmaps /application/container/launchScripts/start.sh


#--sysctl net.ipv4.tcp_fin_timeout=3 \
#--sysctl net.ipv4.ip_local_port_range="10000 61000" \
#--sysctl net.ipv4.tcp_tw_reuse=0 \
#--sysctl net.ipv4.tcp_max_tw_buckets=100 \
#--sysctl net.core.somaxconn=1024 \
