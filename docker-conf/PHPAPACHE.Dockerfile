FROM php:7.4-apache

# Install Vim and Nano
RUN apt-get update
RUN apt-get install nano
RUN apt-get -y install vim

RUN apt-get install libzip-dev -y
RUN apt-get install zip -y
RUN docker-php-ext-install zip

# Install Git
RUN apt-get install -y git

# Add mod_rewrite module
RUN a2enmod rewrite

COPY src /var/www/html/
COPY ./docker-conf/httpd.conf /etc/apache2/sites-available/000-default.conf

# Install composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer