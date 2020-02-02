FROM ubuntu

MAINTAINER whirlwind whirlwind110@163.com

ADD start.sh start.sh

RUN echo "starting install lamp..."\
	&& DEBIAN_FRONTEND=noninteractive \
	&& sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install apache2 libapache2-mod-php mysql-server php php-gd php-curl php-mysql php-pdo php-xml -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& a2enmod rewrite \
	&& sed -i 's/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf \
	&& sed -i '/Indexes/d' /etc/apache2/apache2.conf \
	&& a2disconf other-vhosts-access-log \
	&& sed -i 's/ErrorLog/#ErrorLog/' /etc/apache2/sites-available/000-default.conf \
	&& sed -i 's/CustomLog/#CustomLog/' /etc/apache2/sites-available/000-default.conf \
	&& sed -i 's/ErrorLog.*/ErrorLog \/dev\/null/' /etc/apache2/apache2.conf \
	&& sed -i 's/log_errors = On/log_errors = Off/' /etc/php/*/apache2/php.ini \
	&& sed -i 's/log_error/#log_error/' /etc/mysql/mysql.conf.d/mysqld.cnf \
	&& sed -i 's/;open_basedir =/open_basedir = \/var\/www\/:\/tmp\//' /etc/php/*/apache2/php.ini \
	&& echo "hello whirwlind.<br> Security Latest Lamp Docker." > /var/www/html/index.html \
	&& chmod +x start.sh

EXPOSE 80

CMD ["/start.sh"]
