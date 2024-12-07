#!/usr/bin/env bash

name=$(curl -s https://go.dev/VERSION?m=text | head -n 1).linux-amd64.tar.gz
echo "url" "https://go.dev/dl/$name"

if [ ! -f $name ]; then
  echo "Downloading package"
  curl -LO "https://go.dev/dl/$name"
fi 

echo "Removing old go and unzipping the new one"
sudo rm -rf /usr/local/go 
sudo tar -C /usr/local -xzf $name
echo "Setting PATH to find bin"
export PATH=$PATH:/usr/local/go/bin

echo 'export PATH=$PATH:/usr/local/go/bin' | sudo tee /etc/profile.d/go.sh
sudo chmod +x /etc/profile.d/go.sh


echo "Checking version:"
go version