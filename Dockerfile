FROM ubuntu:14.04
MAINTAINER Pavel Litvyak <pvlltvk@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

#RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list && \
#    apt-get update && \
#    apt-get -y dist-upgrade

RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu trusty main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key E5267A6C && \
    apt-get update

RUN apt-get -y install php5.6 php5.6-gd php5.6-ldap \
    php5.6-sqlite php5.6-pgsql php5.6-mysql \
    php5.6-mcrypt php5.6-xmlrpc php5.6-fpm php5.6-dom php5.6-xmlwriter

RUN sed -i '/daemonize /c \
daemonize = no' /etc/php/5.6/fpm/php-fpm.conf

RUN sed -i '/^pid /c \
pid = /run/php5.6-fpm.pid' /etc/php/5.6/fpm/php-fpm.conf

RUN sed -i '/error_log /c \
error_log = /proc/self/fd/2' /etc/php/5.6/fpm/php-fpm.conf

RUN sed -i '/^listen /c \
listen = 0.0.0.0:9000' /etc/php/5.6/fpm/pool.d/www.conf

RUN sed -i 's/^listen.allowed_clients/;listen.allowed_clients/' /etc/php/5.6/fpm/pool.d/www.conf

RUN mkdir -p /var/www && \
    echo "<?php phpinfo(); ?>" > /var/www/index.php && \
    chown -R www-data:www-data /var/www

EXPOSE 9000
VOLUME /var/www
ENTRYPOINT ["/usr/sbin/php-fpm5.6"]
