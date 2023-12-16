#!/usr/bin/bash

apt update -y && apt upgrade -y

apt install lsb-release ca-certificates apt-transport-https software-properties-common unzip -y

add-apt-repository ppa:ondrej/php -y

apt update -y

# Install php
apt install php8.2 -y 

# Optional
apt install libapache2-mod-php -y

# Install php modules
apt install php8.2-common \
    php8.2-curl \
    php8.2-dba \
    php8.2-decimal \
    php8.2-imagick \
    php8.2-intl \
    php8.2-mbstring \
    php8.2-mysql \
    php8.2-cgi \
    php8.2-cli \
    php8.2-xml \
    php8.2-fpm -y \
    php8.2-gd \
    php8.2-common \
    php8.2-zip -y
 
# install pecl

apt install php-dev \
apt install php8.2-openswoole \
pecl install openswoole -y

# Install composer

cd ~

curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php \
HASH=`curl -sS https://composer.github.io/installer.sig` \
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

# remove default apache web server

systemctl stop apache2

apt remove apache2 -y

apt purge apache2 -y

# zypper install php8 php8-cli php8-bcmath php8-bz2 php8-calendar php8-curl php8-dba php8-devel php8-fpm php8-exif php8-gmagick php8-imagick php8-mysql php8-mbstring
# zypper install php8-phar php8-pcntl php8-pdo  php8-pear  php8-pecl php8-zip
# zypper install php8-phar php8-openssl php8-tokenizer php8-dom
# zypper install php8-xmlwriter php8-xmlreader  php8-posix php8-psr php8-fileinfo php8-gd php8-ftp