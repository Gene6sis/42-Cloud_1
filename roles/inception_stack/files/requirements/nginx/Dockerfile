FROM debian:buster

RUN apt-get update -y && apt-get install -y \
    nginx openssl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

# Generate self-signed SSL certificate
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/adben-mc.42.fr.pem \
    -keyout /etc/nginx/ssl/adben-mc.42.fr.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=adben-mc/CN=adben-mc.42.fr"

RUN mkdir -p /run/nginx 

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN	chown -R www-data:www-data /var/www/* \
	&& chmod 755 /var/www/*

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
