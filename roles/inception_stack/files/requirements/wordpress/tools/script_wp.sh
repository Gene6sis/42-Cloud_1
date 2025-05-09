#!/bin/bash

rm -rf wp-config.php

echo "Config wp"
wp --allow-root core config --dbhost='mariadb' --dbname='wordpress' --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --skip-check
echo "install"
wp --allow-root core install --url=$DOMAIN_NAME --title=$PROJECT_NAME --admin_user=$WP_AD_USER --admin_password=$WP_AD_PASSWORD --admin_email=$WP_AD_EMAIL

exec php-fpm7.3 -F
