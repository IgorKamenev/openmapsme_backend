FROM ubuntu:20.04

RUN apt update
RUN apt upgrade -y
RUN apt install -y nginx-full
RUN apt install -y supervisor
RUN apt install -y redis-server
RUN apt install -y mysql-server mysql-client
RUN apt install -y nano less certbot
RUN apt install -y php7.4 php7.4-cli php7.4-fpm php7.4-gd php7.4-curl php7.4-mysql php7.4-json php7.4-mbstring php7.4-xml php7.4-xsl php7.4-zip php-redis


CMD ["/bin/bash"]
