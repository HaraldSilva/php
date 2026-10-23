ARG PHP_VERSION=8.4
FROM serversideup/php:${PHP_VERSION}-fpm

USER root

# Install missing extensions
RUN install-php-extensions gd intl yaml mysqli exif apcu bcmath maxminddb

# Change user www-data to UID/GID 1000
RUN docker-php-serversideup-set-id www-data 1000:1000 && \
    docker-php-serversideup-set-file-permissions --owner 1000:1000

USER www-data
