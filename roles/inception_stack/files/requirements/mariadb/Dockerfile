FROM debian:buster

RUN apt-get update && apt-get install -y \
    mariadb-server mariadb-client
#&& rm -rf /var/lib/apt/lists/* 

COPY ./tools/script.sh ./script.sh

RUN chown -R mysql:mysql /var/lib/mysql ;\
    mkdir -p /run/mysqld ;\
    chown -R mysql:mysql /run/mysqld ;\
    mysql_install_db --datadir=/var/lib/mysql --user=mysql

RUN chmod +x ./script.sh

EXPOSE 3306

CMD ["./script.sh"]
