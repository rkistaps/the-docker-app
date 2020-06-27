FROM php:7.4-apache

# Install Vim and Nano
RUN apt-get update
RUN apt-get install nano
RUN apt-get -y install vim

# Add mod_rewrite module
RUN a2enmod rewrite

COPY src /var/www/html/
COPY ./docker-conf/httpd.conf /etc/apache2/sites-available/000-default.conf

# Install composer globally
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer