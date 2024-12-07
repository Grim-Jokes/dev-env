# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "Debian12"
  
  config.vm.network "forwarded_port", guest: 22, host: 2222

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  
  config.vm.provider "virtualbox" do |vb|
  	 # Display the VirtualBox GUI when booting the machine
	 vb.gui = true
   vb.name = "Projects"



  #  disk_path = "budget.vdi"
  #  unless File.exists?(disk_path)
  #   vb.customize ["createhd", "--filename", disk_path, "--size", 51200] # Size in MB
  #   vb.customize ["storageattach", :id, "--storagectl", "SATA", "--port", 1, "--device", 0, "--type", "hdd", "--medium", disk_path]
  #  end


  # Customize the amount of memory on the VM:
  vb.memory = "24276"
	vb.cpus = 8
  end
  
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.

  # Install xfce and virtualbox additions
  config.vm.provision "shell", inline: "sudo apt-get update -y"

  config.vm.provision "file", source: "./.bashrc", destination: "~/.bashrc"
  config.vm.provision "file", source: "./git/.gitconfig", destination: "~/.gitconfig"

  config.vm.provision "shell", name:'code', privileged: false, path: './scripts/update-code.sh'
  config.vm.provision "shell", name:'docker', privileged: true, path: './scripts/get-docker.sh'
  config.vm.provision "shell", name:'grant-non-root', privileged: false, path: './scripts/grant-non-root.sh'
  config.vm.provision "shell", name:'ssh', privileged: false, path: './scripts/generate-ssh.sh'
  config.vm.provision "shell", name:'nvm', privileged: false, path: './scripts/nvm.sh'
  config.vm.provision "shell", name:'aws-cli', privileged: false, path: './scripts/install-aws-cli.sh'
  config.vm.provision "shell", name:'golang', privileged: false, path: './scripts/install-go.sh'
  config.vm.provision "shell", name:'gitk', privileged: false, path: './scripts/install-gitk.sh'
  config.vm.provision "shell", name: "xclip", privileged: false, path: './scripts/install-xclip.sh';
  
  config.vm.provision "shell", name:'projects', privileged: false, path: './scripts/checkout-projects.sh'

  config.vm.provision "shell", name:"terminal", privileged: false, path: "./scripts/editor.sh"

  config.vm.provision "shell", name: "hello-world", privileged: false, inline: <<-SHELL
    docker run hello-world
  SHELL


end
