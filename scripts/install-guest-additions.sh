
LATEST_VERSION=$(curl http://download.virtualbox.org/virtualbox/LATEST-STABLE.TXT)
VERSION=${1:-$LATEST_VERSION}

if [[ ! -f /tmp/VBoxGuestAdditions_${VERSION}.iso ]]; then
    sudo apt-get install linux-headers-$(uname -r)
    wget http://download.virtualbox.org/virtualbox/${VERSION}/VBoxGuestAdditions_${VERSION}.iso -P /tmp
    sudo mount -o loop /tmp/VBoxGuestAdditions_${VERSION}.iso /mnt
    sudo sh /mnt/VBoxLinuxAdditions.run
fi

exit 0