#!/bin/bash

########################
# VVV:
echo -e "${yellow}Installing VVV in the ~/vagrant-local directory${NC}"
if [ ! -d ~/vagrant-local ];
then
  cd ~/ && git clone git://github.com/Varying-Vagrant-Vagrants/VVV.git vagrant-local
fi

echo -e "${green}Running Vagrant Up. This can take awhile...${NC}"
cd ~/vagrant-local && vagrant up
echo -e "${green}Vagrant and VVV are installed and running...${NC}"

########################
# Homebrew Packages:
echo -e "${yellow}Setting up Homebrew packages: ${NC}"
echo -e "${green}Tapping homebrew/dupes${NC}"
brew tap homebrew/dupes
echo -e "${green}Tapping homebrew/versions${NC}"
brew tap homebrew/versions
echo -e "${green}Tapping homebrew/homebrew-php${NC}"
brew tap homebrew/homebrew-php
echo -e "${green}Installing packages: closure-linter composer git mysql nginx node nmap php56 php-code-sniffer bradp/vv/vv wget wp-cli${NC}"
brew install closure-linter composer git mysql nginx node nmap php56 php-code-sniffer bradp/vv/vv wget wp-cli
echo -e "${green}Complete!${NC}"

########################
# Custom VVV Dashboard
echo -e "${yellow}Installing custom VVV Dashboard${NC}"
if [ ! -d ~/vagrant-local/www/default/dashboard ];
then
	cd ~/vagrant-local/www/default/
	echo -e "${green}Cloning repo into `pwd`/VVV-Dash-Files-tmp${NC}"
	git clone git@github.com:leogopal/VVV-Dashboard.git VVV-Dash-Files-tmp
	sudo ditto VVV-Dash-Files-tmp/dashboard dashboard/
	sudo ditto VVV-Dash-Files-tmp/dashboard-custom.php dashboard-custom.php
	echo -e "${green}Removing leftover directory${NC}"
	sudo rm -rf VVV-Dash-Files-tmp
	echo -e "${green}Complete${NC}"
fi
