#!/bin/bash

########################
# Xcode Command Line Tools

echo -e "${yellow}Checking to see if command line tools are installed.${NC}"

if [ -e "`which make`" ]; then
  echo -e "${green}Mac Command Line Tools are installed${NC}" >&2
  xcode-select --version
else
  echo -e "${red}Command line tools are not installed...${NC}" >&2
  echo -e "${green}Installing Command Line Tools${NC}" >&2
  xcode-select --install
fi
