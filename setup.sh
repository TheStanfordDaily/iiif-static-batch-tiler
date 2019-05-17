#!/bin/sh

apt-get -y update
apt-get install -y python3-pip python3-dev cmake git libopenjp2-tools awscli curl
curl -sL https://aka.ms/InstallAzureCLIDeb | bash

cd /usr/local/bin
ln -s /usr/bin/python3 python
pip3 install --upgrade pip


cd /tmp
git clone https://github.com/zimeon/iiif.git
cd iiif
git checkout v1.0.6
pip install Pillow==6.0.0