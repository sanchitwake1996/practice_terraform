#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start apache2
mkdir /var/www/html/laptop
echo "<h1> This is Laptop Section <h2> Weclome To Laptop" > /var/www/html/laptop/index.html
