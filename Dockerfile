ARG PHP_VERSION=8.4
FROM serversideup/php:${PHP_VERSION}-fpm

USER root

# 1. Fehlende Extensions installieren
RUN install-php-extensions gd intl yaml mysqli exif

# 2. Benutzer www-data fest auf UID/GID 1000 umstellen (wie bisher bei thecodingmachine)
RUN docker-php-serversideup-set-id www-data 1000:1000 && \
    docker-php-serversideup-set-file-permissions --owner 1000:1000

USER www-data
