#!/bin/bash

# Add config files
echo "extension=imagick.so" | sudo tee -a /etc/php7/cli/conf.d/modules.ini
echo "extension=imagick.so" | sudo tee -a /etc/php7/fpm/conf.d/modules.ini
