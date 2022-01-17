# Installation of VMware ESXi using Ansible, Docker and PXE

Repository:
- builds PXE deployment server with help of Ansible and Docker containers (ISC DHCP, TFTP and HTTP servers).
- can be used for automated installation of VMware ESXi host(s) in Boot mode BIOS or UEFI.
- can be used for automated custom installation of VMware ESXi host(s) using kickstart file.
- has been tested on:
   * Ubuntu 20.04.3 LTS
   * Python 3.8.10
   * Pip 20.0.2
   * Ansible [core 2.12.1]
   * Docker version 20.10.12, build e91ed57

# Prerequisites

PXE Deployment server must have access to the Internet.

PXE Deployment server and ESXi host(s) must be placed on the same network.

# How to use

1. Install Ubuntu on physical or virtual machine.

2. Download repository to the server.

`wget https://github.com/vggitlab/esxi-Deploy_Ansible-Docker-PXE/archive/refs/heads/master.zip` 

3. Unzip repository.

`unzip master.zip`

4. Make executable **install-Ansible.sh** file.

`chmod u+x esxi-Deploy_Ansible-Docker-PXE-master/install-Ansible.sh`

5. Install Ansible using **install-Ansible.sh** bash script.

`sudo ./esxi-Deploy_Ansible-Docker-PXE-master/install-Ansible.sh`

5. Install Ansible following instructions from the link bellow:

https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

5. Enter custom values in **group_vars/all/main.yml file** file. Such as NAME; IP_ADDRESS; MAC_ADDRESS

`nano group_vars/all/main.yml`

6. Insert VMware ESXi installation ISO file into CD-ROM.

7. Run ansible playbook to build PXE deployment infrastructure.

`cd esxi-Deploy_Ansible-Docker-PXE-master/`

`sudo ansible-playbook deploy.yml -vvv`

8. Wait for ansible palybook to be finished.

9. Verify that 3 Docker container are up and running.

`sudo docker ps`

10. Power On VMware ESXi host(s) to begin installation.

# Important to know

- Location of ISC DHCP server configuration file: `esxi-Deploy_Ansible-Docker-PXE/dhcp/templates/dhcpd.j2`
- Location of custom Boot file: `esxi-Deploy_Ansible-Docker-PXE/tftp/templates/default.j2`
- Location of Kickstart file: `esxi-Deploy_Ansible-Docker-PXE/http/templates/ks.j2`
