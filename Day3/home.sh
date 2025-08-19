#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start apache2
echo "<h1> Hello World <h2> Weclome To Home" > /var/www/html/index.html
