FROM ghcr.io/jyje/ansible
# FROM williamyeh/ansible:debian9 

RUN apt-get update && apt-get install -y vim python3 net-tools telnet curl