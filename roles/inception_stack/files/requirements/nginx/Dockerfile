FROM debian:buster

RUN apt-get update -y && apt-get install -y \
    nginx \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/nginx /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./conf/adbenmc.works.ca.crt /etc/nginx/ssl/adbenmc.works.ca.crt
COPY ./conf/adbenmc.works.crt /etc/nginx/ssl/adbenmc.works.crt
COPY ./conf/adbenmc.works.nopass.key /etc/nginx/ssl/adbenmc.works.nopass.key

RUN	chown -R www-data:www-data /var/www/* \
	&& chmod 755 /var/www/*

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
