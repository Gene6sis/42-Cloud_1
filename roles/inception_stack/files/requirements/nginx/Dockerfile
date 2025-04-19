FROM debian:buster

RUN apt-get update -y && apt-get install -y \
    nginx \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/nginx /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN	chown -R www-data:www-data /var/www/* \
	&& chmod 755 /var/www/*

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
