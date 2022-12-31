# Installation of VMware ESXi using Ansible, Docker and PXE

This repository:
- builds PXE server with help of Ansible and Docker containers (ISC DHCP, TFTP and HTTP servers).
- is used for automated installation of VMware ESXi host boot mode - BIOS or UEFI.
- is used for custom installation of VMware ESXi host using kickstart file.
- has been tested on:
   * Ubuntu 20.04.3 LTS
   * Python 3.8.10
   * Pip 20.0.2
   * Ansible [core 2.12.1]
   * Docker version 20.10.12, build e91ed57

# Prerequisites

PXE Deployment server must have access to the Internet.

PXE Deployment server and ESXi host should be placed on the same network.

# How to use

1. Install Ubuntu on physical or virtual machine.

2. Update Ubuntu and Install Packages.
  * update Ubuntu: `sudo apt update && sudo apt upgrade`
  * install OpenSSH sever: `sudo apt install openssh-server`
  * install Unzip package: `sudo apt install unzip`
  * install Wget package: `sudo apt install wget`

3. Download this repository to the server.

`sudo wget https://github.com/vggitlab/esxi-Deploy_Ansible-Docker-PXE/archive/refs/heads/master.zip` 

4. Unzip repository.

`sudo unzip master.zip`

5. Make executable **install-Ansible.sh** file.

`sudo chmod u+x esxi-Deploy_Ansible-Docker-PXE-master/install-Ansible.sh`

6. Install Ansible using **install-Ansible.sh** bash script.

`sudo ./esxi-Deploy_Ansible-Docker-PXE-master/install-Ansible.sh`

7. Install Ansible following instructions from the link bellow:

https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

8. Enter custom values in **group_vars/all/main.yml file** file. Such as NAME; IP_ADDRESS; MAC_ADDRESS

`sudo nano esxi-Deploy_Ansible-Docker-PXE-master/group_vars/all/main.yml`

9. Insert VMware ESXi installation ISO file into CD-ROM.

10. Run ansible playbook to build PXE deployment infrastructure.

`cd esxi-Deploy_Ansible-Docker-PXE-master/`

`sudo ansible-playbook deploy.yml -vvv`

11. Wait for ansible playbook to finish execution.

12. Verify, that three Docker containers are UP and running.

`sudo docker ps`

13. Power On VMware ESXi host to begin OS installation process.

# Important to know

- Location of ISC DHCP server configuration file: `esxi-Deploy_Ansible-Docker-PXE/dhcp/templates/dhcpd.j2`
- Location of custom Boot file: `esxi-Deploy_Ansible-Docker-PXE/tftp/templates/default.j2`
- Location of Kickstart file: `esxi-Deploy_Ansible-Docker-PXE/http/templates/ks.j2`
