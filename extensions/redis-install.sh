#!/bin/bash

# Enable the module
echo "extension=redis.so" | sudo tee -a /etc/php7/cli/conf.d/modules.ini
echo "extension=redis.so" | sudo tee -a /etc/php7/fpm/conf.d/modules.ini
