#!/bin/sh

apt-get -y update
apt-get install -y python3-pip python3-dev
cd /usr/local/bin
ln -s /usr/bin/python3 python
pip3 install --upgrade pip

apt-get install -y awscli

apt-get install -y cmake git libopenjp2-tools

cd /tmp
git clone https://github.com/zimeon/iiif.git
cd iiif
git checkout v1.0.6
pip install Pillow==6.0.0