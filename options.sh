#!/bin/bash

sudo apt-get update
sudo apt-get -qq -y --force-yes install gcc libpcre++-dev libcurl4-openssl-dev libxml2-dev libjpeg-dev libpng-dev libxpm-dev libfreetype6-dev libmcrypt-dev libmysql++-dev autoconf libevent-dev libltdl-dev libxml2-dev libxslt1-dev libreadline-dev

etxdir="$instdir/etc"

mkdir -p "$etxdir/conf.d"

ln -s "$etxdir/conf.d/php.ini" "$etxdir/php.ini"

initarget="$etxdir/conf.d/php.ini"

configoptions="\
--with-config-file-path=$etxdir \
--with-config-file-scan-dir=$etxdir/conf.d \
--with-fpm-user=www-data \
--with-fpm-group=www-data \
--enable-cgi \
--enable-fpm \
--enable-soap \
--with-mcrypt \
--enable-mbstring \
--with-openssl \
--with-kerberos \
--with-gd \
--with-jpeg-dir=/usr/lib \
--enable-gd-native-ttf \
--with-libxml-dir=/usr/lib \
--with-curl \
--enable-zip \
--enable-sockets \
--with-zlib \
--enable-exif \
--enable-ftp \
--with-iconv \
--with-gettext \
--enable-gd-native-ttf \
--with-freetype-dir=/usr \
--with-mysql \
--with-xsl=/usr \
--with-readline
"
