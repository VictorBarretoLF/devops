#!/bin/bash

apt-get update
apt-get install -y apache2
echo "Installing Apache and setting it up..."

cp -r /vagrant/html/* /var/www/html/

systemctl enable apache2
systemctl start apache2