FROM php:8.0-apache

# Install additional PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-install zip

# Enable Apache rewrite module
RUN a2enmod rewrite

# Copy your application files to the container
COPY . /var/www/html

# Set the document root
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80