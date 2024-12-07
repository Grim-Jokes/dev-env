vb_version=7.0.8
cd /opt
sudo wget -c http://download.virtualbox.org/virtualbox/${vb_version}/VBoxGuestAdditions_${vb_version}.iso \
                       -O VBoxGuestAdditions_${vb_version}.iso
sudo mount VBoxGuestAdditions_${vb_version}.iso -o loop /mnt
cd /mnt
sudo sh VBoxLinuxAdditions.run --nox11
cd /opt
sudo rm *.iso