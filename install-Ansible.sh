#!/bin/bash
# Adding Colors to the script.
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
reset=`tput sgr0`
# Example of using colors.
#echo "${red}red text ${green}green text ${yellow}yellow text ${blue}blue text ${reset}"
clear
if [[ $(which ansible) && $(which python3) && $(which pip3) ]]; then
    echo ""
    echo "${green}-------------------------------------------------------------${reset}"
    echo ""
    echo "${yellow}Ansible, Python3 and Pip3 is already installed on the server.${reset}"
    echo ""
    echo "${green}------------------ Current Version --------------------------${reset}"
    echo ""
    echo "${yellow}$(ansible --version).${reset}"
    echo ""
    echo "${yellow}$(python3 --version).${reset}"
    echo ""
    echo "${yellow}$(pip3 --version).${reset}"
    echo ""
    exit 0
fi
if [[ $(which ansible) && $(which python3) && ! $(which pip3) ]]; then
    echo ""
    echo "${green}-------------------------------------------------------${reset}"
    echo ""
    echo "${yellow}Ansible and Python3 is already installed on the server.${reset}"
    echo ""
    echo "${green}------------------ Current Version --------------------${reset}"
    echo ""
    echo "${yellow}$(ansible --version).${reset}"
    echo ""
    echo "${yellow}$(python3 --version).${reset}"
    echo ""
    echo "${red}Pip3 is not installed on the server.${reset}"
    echo ""
    echo "Do you want to install Pip3 on the server? (yes/no)"
        read replyUser
        replyUser=${replyUser,,}
        if [[ $replyUser == "yes" ]] || [[ $replyUser == "y" ]]; then
            echo ""
            echo "${yellow}Installing Pip3.${reset}"
            # Install Pip3:
            sudo apt install -y python3-pip

            echo ""
            echo "${green}Installation is completed.${reset}"
            echo ""
            echo "${green}$(pip3 --version).${reset}"
            echo ""
        fi
    exit 0

  else
    echo ""
    echo "${yellow}-----------------------------------------------------${reset}"
    echo ""
    echo "${yellow}Installation of Ansible.${reset}"
    echo ""
    echo "${yellow}-----------------------------------------------------${reset}"
    echo ""
    ############# COMMAND #############
    # Install Ansible on Ubuntu:
    # Update the apt package index:
    sudo echo ""
    echo "${yellow}Updating package repository.${reset}"
    sudo apt-get update

    if ! [[ $(which python3) ]]; then
          echo ""
          echo "${yellow}Installation of Python3 and Pip3.${reset}"
          echo ""
          # Install Python3.8:
          sudo apt install -y python3.8 \
          python3-pip
    fi

    if  [[ $(which python3) && ! $(which pip3) ]]; then
          echo ""
          echo "${yellow}Installation of Pip3.${reset}"
          echo ""
          # Install Pip3:
          sudo apt install -y python3-pip
    fi

    # Install software-properties-common to allow easily manage the repositories that you install software from:
    echo ""
    echo "${yellow}Installing Software Properties Common.${reset}"
    sudo apt install -y software-properties-common

    # Setup Ansible official repository:
    sudo add-apt-repository --yes --update ppa:ansible/ansible

    # Update the apt package index:
    sudo apt-get update

    # Install Ansible:
    echo ""
    echo "${yellow}Installing Ansible and it's components.${reset}"
    sudo apt install -y ansible-core
    sleep 5

    echo ""
    echo "${green}Installation is completed.${reset}"
    echo ""
    echo "${green}$(ansible --version).${reset}"
    echo ""
    echo "${green}$(python3 --version).${reset}"
    echo ""
    echo "${green}$(pip3 --version).${reset}"
    echo ""
fi
