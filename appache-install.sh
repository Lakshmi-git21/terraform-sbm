#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd 
mkdir /var/www/html
echo "<HTML><h1>Hello world</h1></HTML>" > /var/www/html/index.html
