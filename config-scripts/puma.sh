#!/bin/bash
cd ~
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

echo "=================================================== RUBY&BUNDLER OK==============================================================="
sleep 10

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt update
sudo apt install -y mongodb-org
#if $? -ne 0 then exit
sudo systemctl start mongod
sudo systemctl enable mongod
#sudo systemctl status mongod

echo "=================================================== MONGOD OK==============================================================="
sleep 10

#if $? -ne 0 then exit
sudo apt install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit
bundle install
puma -d
exit
