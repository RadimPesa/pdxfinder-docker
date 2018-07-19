FROM ubuntu:18.04

LABEL maintainer="pesa@ics.muni.cz"

RUN apt-get update &&\
    apt-get install -y apache2  &&\
    apt-get clean
    
RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/2 /var/log/apache2/error.log

COPY ./conf/proxy.conf /etc/apache2/sites-available/proxy.conf

RUN rm -rf /etc/apache2/sites-enabled/* &&\
    ln -s /etc/apache2/sites-available/proxy.conf /etc/apache2/sites-enabled/proxy.conf
    
RUN a2enmod proxy && \
    a2enmod proxy_http && \
    a2enmod rewrite
    
ENV TZ=Europe/Prague

COPY start.sh start.sh
RUN chmod +x /start.sh

EXPOSE 80

#CMD apachectl -D FOREGROUND
CMD [ "/start.sh" ]