#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start apache2
mkdir /var/www/html/cloth
echo "<h1> This is Cloth Section <h2> Weclome To Cloth" > /var/www/html/cloth/index.html
