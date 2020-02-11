FROM php:7.2-apache
RUN apt-get update

RUN apt-get install -y libapache2-mod-auth-openidc
RUN a2enmod auth_openidc
COPY ./apache.conf /etc/apache2/sites-enabled/000-default.conf

COPY index.php /var/www/html/index.php