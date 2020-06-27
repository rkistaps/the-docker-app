FROM php:7.4-apache

RUN apt-get update
RUN apt-get install nano
RUN apt-get -y install vim

RUN a2enmod rewrite

COPY src /var/www/html/
COPY ./docker-conf/httpd.conf /etc/apache2/sites-available/000-default.conf