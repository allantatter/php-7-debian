#!/bin/bash
cd "$(dirname "$0")"

# Create a dir for storing PHP module conf
mkdir -p /etc/php7
mkdir -p /etc/php7/cli
mkdir -p /etc/php7/cli/conf.d
mkdir -p /etc/php7/fpm
mkdir -p /etc/php7/fpm/conf.d
mkdir -p /etc/php7/fpm/pool.d

# Symlink php-fpm to php7-fpm
ln -fs /usr/local/php7/sbin/php-fpm /usr/local/php7/sbin/php7-fpm

ln -fs /usr/local/php7/bin/phar /usr/local/bin/
ln -fs /usr/local/php7/bin/phar.phar /usr/local/bin/
ln -fs /usr/local/php7/bin/php /usr/local/bin/
ln -fs /usr/local/php7/bin/php-cgi /usr/local/bin/
ln -fs /usr/local/php7/bin/php-config /usr/local/bin/
ln -fs /usr/local/php7/bin/phpdbg /usr/local/bin/
ln -fs /usr/local/php7/bin/phpize /usr/local/bin/

ln -fs /usr/local/php7/sbin/php-fpm /usr/local/sbin/
ln -fs /usr/local/php7/sbin/php7-fpm /usr/local/sbin/

# Add config files
cp php-src/php.ini-production /etc/php7/cli/php.ini
cp php-src/php.ini-production /etc/php7/fpm/php.ini
cp conf/www.conf /etc/php7/fpm/pool.d/www.conf
cp conf/php-fpm.conf /etc/php7/fpm/php-fpm.conf
cp conf/modules.ini /etc/php7/cli/conf.d/modules.ini
cp conf/modules.ini /etc/php7/fpm/conf.d/modules.ini

# Add the init script
cp conf/php7-fpm.init /etc/init.d/php7-fpm
chmod +x /etc/init.d/php7-fpm
update-rc.d php7-fpm defaults

service php7-fpm start
