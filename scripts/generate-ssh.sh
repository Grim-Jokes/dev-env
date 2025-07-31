mkdir -p /vagrant/ssh

if [[ ! -f "/vagrant/ssh/github" ]]; then
  ssh-keygen -t ed25519 -C "danszekely@gmail.com" -f /vagrant/ssh/github -q -N ""
fi

if [[ ! -f "/vagrant/ssh/config" ]]; then
  printf "Host github.com\n  HostName github.com\n  PreferredAuthentications publickey\n  IdentityFile ~/.ssh/github\n" >> "/vagrant/ssh/config"
fi

eval "$(ssh-agent -s)"

cp /vagrant/ssh/* ~/.ssh -R
sudo chmod 700 ~/.ssh/ -R
ssh-add ~/.ssh/github