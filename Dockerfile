# Base images 
FROM ubuntu

MAINTAINER whirlwind whirlwind110@163.com

ENV DEBIAN_FRONTEND=noninteractive

ADD start.sh start.sh
RUN echo "starting install lamp..."\
	&& sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install apache2 libapache2-mod-php mysql-server php php-gd php-curl php-mysql php-pdo php-xml -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& a2enmod rewrite \
	&& sed -i '/Indexes/d' /etc/apache2/apache2.conf \
	&& sed -i 's/ErrorLog/#ErrorLog/' /etc/apache2/sites-available/000-default.conf \
	&& sed -i 's/CustomLog/#CustomLog/' /etc/apache2/sites-available/000-default.conf \
	&& sed -i 's/log_errors = On/log_errors = Off/' /etc/php/*/apache2/php.ini \
	&& sed -i 's/log_error/#log_error/' /etc/mysql/mysql.conf.d/mysqld.cnf \
	&& echo "hello whirwlind." > /var/www/html/index.html \
	&& chmod +x start.sh

EXPOSE 80

CMD ["/start.sh"]
