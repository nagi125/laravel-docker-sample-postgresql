FROM php:7.3.6-fpm

ENV TZ Asia/Tokyo

# install Lib for composer
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y libpq-dev git zip unzip && \
    apt-get clean && \
    rm -rf /var/cache/apt

# add php,apache-module
RUN docker-php-ext-install mbstring pdo pdo_pgsql

# php.conf php-fpm.conf
COPY docker/app/conf/php/php.ini /usr/local/etc/php/php.ini
COPY docker/app/conf/php/docker.conf /usr/local/etc/php-fpm.d/docker.conf

# install Composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer

COPY . /app

WORKDIR /app
RUN composer install

# change owner
RUN chown www-data:www-data -R ./

