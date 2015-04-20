#!/bin/bash

########################
# Vagrant + Dependencies
echo -e "${yellow}Installing Vagrant and dependencies${NC}"

# Virtual Box:
# https://www.virtualbox.org/wiki/Downloads
echo -e "${yellow}VirtualBox${NC}"
if [ -e "`which vboxmanage`" ]; then
  echo -e "${green}VirtualBox is installed. Continuing...${NC}" >&2
else
  echo -e "${red}VirtualBox is not installed...${NC}" >&2
  echo -e "${green}Installing VirtualBox${NC}" >&2
  echo -e "${green}Downloading VirtualBox...${NC}"
  virtual_box='VirtualBox-4.3.26-98988-OSX.dmg'
  curl -fS -o ${virtual_box} -L http://dlc-cdn.sun.com/virtualbox/4.3.26/VirtualBox-4.3.26-98988-OSX.dmg
  echo -e "${green}Mounting VirtualBox...${NC}"
  hdiutil attach ${virtual_box}
  echo -e "${green}Running VirtualBox Installer...${NC}"
  sudo installer -pkg /Volumes/VirtualBox/VirtualBox.pkg -target /Volumes/Macintosh\ HD
  rm -rf ${virtual_box}
  echo -e "${green}Complete${NC}"
fi

# Vagrant:
# http://www.vagrantup.com/downloads
echo -e "${yellow}Vagrant${NC}"
if [ -e "`which vagrant`" ]; then
  echo -e "${green}Vagrant is installed. Continuing...${NC}" >&2
else
  echo -e "${red}Vagrant is not installed...${NC}" >&2
  echo -e "${green}Installing Vagrant${NC}" >&2
  echo -e "${green}Downloading Vagrant...${NC}"
  vagrant_file='vagrant_1.7.2.dmg'
  curl -fS -o ${vagrant_file} -L https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2.dmg
  echo -e "${green}Mounting Vagrant...${NC}"
  hdiutil attach ${vagrant_file}
  echo -e "${green}Running Vagrant Installer...${NC}"
  sudo installer -pkg /Volumes/Vagrant/Vagrant.pkg -target /Volumes/Macintosh\ HD
  rm -rf ${vagrant_file}
  echo -e "${green}Complete${NC}"
fi

#########################
# Vagrant Plugins
echo -e "${green}Installing Vagrant Plugins: ${red}vagrant-hostsupdater, vagrant-triggers${NC}"

echo -e "${green}Installing vagrant-hostsupdater${NC}"
# Vagrant Hosts Updater 
vagrant plugin install vagrant-hostsupdater

echo -e "${green}Installing vagrant-triggers${NC}"
# Vagrant Triggers:
vagrant plugin install vagrant-triggers

echo -e "${green}Installation is complete.${nc}"