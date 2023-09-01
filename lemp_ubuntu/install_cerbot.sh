#!/usr/bin/bash

apt install certbot python3-certbot-nginx -y

certbot --nginx -d example.com -d www.example.com

# certbot --nginx --agree-tos --email ilzammulkhaq85@gmail.com -d nawa.kendali.xyz

sudo certbot certonly --non-interactive --agree-tos --email your_email@example.com --cert-name your_domain_name --webroot -w /path/to/your/webroot -d your_domain.com -d www.your_domain.com

# see the cron of certbot systemctl status certbot.timer

# test renew : certbot renew --dry-run

# 12 12 * * * /usr/bin/certbot renew --dry-run