#!/bin/sh

mkdir /etc/apache2/mellon
mv helper.sh /etc/apache2/mellon
cd /etc/apache2/mellon
./helper.sh "http://rsasinka.edirex.ics.muni.cz/mellon" "http://rsasinka.edirex.ics.muni.cz/mellon"
mv /etc/apache2/mellon/*.xml /etc/apache2/mellon/sp-metadata.xml
mv /idp-metadata.xml /etc/apache2/mellon/
mv /etc/apache2/mellon/*.cert /etc/apache2/mellon/sp_cert.pem
mv /etc/apache2/mellon/*.key /etc/apache2/mellon/sp_key.pem



# create fqdn.conf
echo "Define FQDN ${HOST}" >/etc/apache2/fqdn.conf
echo "Define EMAILADMIN ${ADMIN_USER}" >> /etc/apache2/fqdn.conf
# run Apache
/usr/sbin/apache2ctl -D FOREGROUND
