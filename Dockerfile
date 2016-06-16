FROM phusion/baseimage:0.9.18

#Both the name of the site for apache but also the name of the config file
ENV siteName ESP


CMD ["/sbin/my_init"]




RUN apt-get update && \
	apt-get install -y \
	git	\
	vim \
	apache2 \
	php5 \
	apache2-utils \
	libapache2-mod-php5

##### site setup

RUN mkdir /var/www/$siteName
RUN mkdir /var/www/$siteName/public_html
RUN mkdir /var/www/$siteName/log


COPY $siteName.conf /etc/apache2/sites-available/$siteName.conf

RUN ["sudo","a2ensite","ESP"]
RUN ["sudo","a2dissite","000-default"]
RUN ["sudo","service","apache2","start"]


#COPY ESP/public_html /var/www/crazn.com/public_html/
##VOLUME /var/www/crazn.com

#EXPOSE 80 443 3306

##CMD ["apache2ctl","-D","FOREGROUND","-k","start"]



##Make runit folder and file
RUN mkdir /etc/service/ESP
ADD ESP.sh /etc/service/ESP/run




# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
