#!/bin/bash

echo "Config mariadb..."
if [ ! -d "/var/lib/mysql/wordpress" ]; then
    service mysql start
    echo "CREATE"
    echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql
    echo "GRANT"
    echo "GRANT ALL ON wordpress.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;" | mysql
    echo "FLUSH"
    echo "FLUSH PRIVILEGES;" | mysql
    echo "SET"
    echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql
    echo "SET/SERVICE"
    #service mysql stop
fi
rm /etc/mysql/my.cnf && touch /etc/mysql/my.cnf
echo "[mysqld]" >> /etc/mysql/my.cnf 
#echo "skip-grant-tables" >> /etc/mysql/my.cnf
echo "bind-address=0.0.0.0" >> /etc/mysql/my.cnf

echo "SERVICE STOP"
service mysql stop

mysqld --user=mysql --console

echo "END"
