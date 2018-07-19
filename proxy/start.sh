#!/bin/sh

# create fqdn.conf
echo "Define FQDN ${HOST}" >/etc/apache2/fqdn.conf
echo "Define EMAILADMIN ${ADMIN_USER}" >> /etc/apache2/fqdn.conf
# run Apache
/usr/sbin/apache2ctl -D FOREGROUND