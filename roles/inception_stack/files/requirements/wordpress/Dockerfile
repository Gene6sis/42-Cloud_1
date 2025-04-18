FROM debian:buster

RUN apt-get update -y && apt-get install -y\
    wget \
    curl \
    vim \
    php-curl php-mbstring php-xml php-zip php-mysqli \
    php7.3-fpm php7.3-common php7.3-mysql php7.3-mysqli php7.3-curl php7.3-mbstring php7.3-cli \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /var/run/php \
    && mkdir -p /var/www/html \
    && chown -R www-data:www-data /var/www/html
    # && chmod -R 755 /var/www/html

WORKDIR /var/www/html

COPY ./conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./tools/script_wp.sh /usr/local/bin/install

EXPOSE 9000

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp \
    && chmod +x /usr/local/bin/wp \
    && chmod +x /usr/local/bin/install \
    && wp core download --allow-root

CMD [ "bash", "install" ]

#CMD [ "" ]
