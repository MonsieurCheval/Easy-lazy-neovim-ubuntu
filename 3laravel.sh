#!/bin/bash


#LARAVEL
# php artisan serve --host 192.168.0.101 --port 8080
echo "=== Installing essential dependencies for laravel ==="
sudo apt install -y \
    php8.3 \
    composer

/bin/bash -c "$(curl -fsSL https://php.new/install/linux/8.3)"

