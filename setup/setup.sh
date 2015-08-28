#!/bin/bash
#
# Valhalla Network initial server setup script
#
# Functions

function update() {
  case $1 in
    ent)
      sudo yum update -y
      sudo yum install NetworkManager -y
      sudo systemctl daemon-reload
      sudo systemctl start NetworkManager
      sudo systemctl enable NetworkManager
      ;;
  esac
}

#######
# Run #
#######
# Update Linux
update ent

# Add valhalla nameserver
sudo echo -e "\n#Valhalla Nameserver\nnameserver 192.168.33.100" >> /etc/resolv.conf

# Disable SELinux
sudo sed -i -e 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

# Sudo for me!
sudo echo "xiii ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
