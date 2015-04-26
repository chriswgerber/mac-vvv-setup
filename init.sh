#!/bin/bash

inc_dir='inc'

chmod -x ${inc_dir}/*.sh

########################
# Colors
source $inc_dir/colors.sh

########################
# Xcode Command Line Tools
source $inc_dir/command-line-tools.sh

########################
# Homebrew:
source $inc_dir/homebrew.sh

########################
# Vagrant:
source $inc_dir/vagrant.sh

########################
# VVV + VV + Dashboard:
source $inc_dir/vvv.sh

########################
# Run other scripts in the assets directory
sh_array=($inc_dir/*.sh)

for f in "${sh_array[@]}";
do
	if [ $f = "$inc_dir/colors.sh" ];
	then

	else
		echo -e "${yellow}Running $f${NC}"
		source $f
	fi
done

########################
# Complete
echo -e "${green}########################################${NC}"
echo -e "${green}#${NC}"
echo -e ""
echo -e "${green}VVV Setup Complete ${NC}"
echo -e ""
echo -e "${green}#${NC}"
echo -e "${green}########################################${NC}"
