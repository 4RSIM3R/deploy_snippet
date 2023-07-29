#!/usr/bin/bash

apt install nginx -y

systemctl start nginx

systemctl enable nginx

sudo chown -R www-data:www-data /var/www/html/*

# enable php fpm

systemctl start php8.2-fpm

systemctl enable php8.2-fpm

# install certbot for ssl

apt install certbot python3-certbot-nginx -y