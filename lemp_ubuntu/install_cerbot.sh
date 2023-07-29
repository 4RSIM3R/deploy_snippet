#!/usr/bin/bash

apt install certbot python3-certbot-nginx -y

certbot --nginx -d example.com -d www.example.com

# certbot --nginx -d chat.beceran.id

# see the cron of certbot systemctl status certbot.timer

# test renew : certbot renew --dry-run

# 12 12 * * * /usr/bin/certbot renew --dry-run