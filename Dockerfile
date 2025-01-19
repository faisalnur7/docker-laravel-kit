# Use the latest stable PHP 8.3 Alpine image
FROM php:8.3.0-fpm-alpine

# Copy custom PHP-FPM configuration
ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

# Create a user and group for Laravel
RUN addgroup -g 1000 laravel && adduser -G laravel -s /bin/sh -D laravel

# Create the application directory
RUN mkdir -p /var/www/html

# Set the working directory
WORKDIR /var/www/html

# Install required system packages
RUN apk add --no-cache \
    curl \
    git \
    unzip \
    libzip-dev \
    zlib-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    gcc \
    g++ \
    make \
    musl-dev \
    autoconf \
    libc-dev \
    pkgconf


# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql zip gd

# Install PHP Redis extension
RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del .build-deps

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

# Adjust permissions for the Laravel user
RUN chown -R laravel:laravel /var/www/html

# Switch to the Laravel user
USER laravel
