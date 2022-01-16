# Installation of VMware ESXi using Ansible, Docker and PXE

This repository can be used for automated installation of VMware ESXi hosts in BIOS or UEFI mode.

Repository has been tested on:

- Ubuntu 20.04.3 LTS
- Python 3.8.10
- Pip 20.0.2
- Ansible [core 2.12.1]
- Docker version 20.10.12, build e91ed57

# How to use

1. Download repository to the server:

`wget https://github.com/vggitlab/esxi-Deploy_Ansible-Docker-PXE/archive/refs/heads/master.zip` 

2. Unzip repository:

`unzip master.zip`

3. Make executable file **install-Ansible.sh**

`chmod u+x esxi-Deploy_Ansible-Docker-PXE-master/install-Ansible.sh`

4. Install Ansible using **install-Ansible.sh** bash script

`sudo ./esxi-Deploy_Ansible-Docker-PXE-master/install-Ansible.sh`

or follow instruction from the link bellow:

https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

5. Enter custom values

nano group_vars/all/main.yml

6. Insert VMware ESXi ISO file into CD-ROM

7. Run ansible playbook to provision deployment infrastructure

`cd esxi-Deploy_Ansible-Docker-PXE-master/`

`sudo ansible-playbook deploy.yml -vvv`

