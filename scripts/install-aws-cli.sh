#!/bin/bash
set -e

sudo apt-get update
sudo apt-get install -y unzip curl

# Remove all previous AWS CLI files to avoid overwrite prompt
sudo rm -rf /usr/local/aws-cli /usr/local/bin/aws /usr/local/bin/aws_completer

cd /tmp
curl -s -o awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
unzip -q -o awscliv2.zip

sudo ./aws/install --update

rm -rf aws awscliv2.zip

/usr/local/bin/aws --version
