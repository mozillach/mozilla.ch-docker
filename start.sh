#! /bin/sh

# Install vendor deps
cd /var/www/main
composer.phar install --no-dev --optimize-autoloader

# Run symfony server checks
php app/check.php

# Warm up cache
php app/console cache:warmup --env=prod --no-debug

# Dump assetic assets
php app/console assetic:dump --env=prod --no-debug

# Explicitly run apache, so the container doesn't quit
/usr/sbin/apache2ctl -k start -D FOREGROUND
