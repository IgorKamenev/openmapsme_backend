#!/bin/bash

echo "init"

chown -R mysql:mysql /var/log/mysql
chown -R mysql:mysql /var/lib/mysql

/usr/sbin/cron

exec /usr/bin/supervisord