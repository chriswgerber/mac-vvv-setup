#!/bin/bash

########################
# Homebrew:
echo -e "${yellow}Checking to see if Homebrew is installed.${NC}"

if [ -e "`which brew`" ]; then
  echo -e "${green}Homebrew is installed${NC}" >&2
else
  echo -e "${red}Homebrew is not installed.${NC}" >&2
  echo -e "${green}Mac Command Line Tools are installed${NC}" >&2
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi