#!/bin/bash
echo -n "Masukkan nama domain : "
read domain
sudo cp support/subdomain.conf /etc/apache2/sites-available/$domain.conf 
sed -i "s/sample.$domain/$domain/g" /etc/apache2/sites-available/$domain.conf
sed -i "s/sample/saungnet/g" /etc/apache2/sites-available/$domain.conf
sed -i "s/saungnet.com.pem/$domain.pem/g" /etc/apache2/sites-available/$domain.conf
sed -i "s/saungnet.com.key/$domain.key/g" /etc/apache2/sites-available/$domain.conf
nano /etc/apache2/ssl/$domain.pem
nano /etc/apache2/ssl/$domain.key
a2ensite $domain.conf
service apache2 restart
 
