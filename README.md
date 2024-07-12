This repository includes oidc_ui, inji-certify, mimoto, and esignet components and provides scripts for installing the setup on a Linux VM on Azure.

------------------
Azure VM Creation
------------------
Azure VM Creation First, run the Terraform script to create the VM: Navigate to the vm_creation directory. Add your username and password to the script. before it we have to give permission:

chmod +x .sh then run by ./install.sh

Run the script by executing ./install.

Installation Process prerequisites
Installation Process

--------------------------
Set up the prerequisites:
--------------------------
Make the prerequisite.sh script executable:

chmod +x prerequisite.sh Run the script:

./prerequisite.sh

-----------------------------
Install the application setup
-----------------------------
This apllication has three steps to done



Install the application setup:

cd locate the install.sh 

Make the install.sh script executable:

chmod +x install.sh Run the script:

./install.sh


-----------
Nginx Setup
-----------

Nginx Setup Configure Nginx: Navigate to /etc/nginx/sites-enabled.

Create a file named eSignet

sudo touch /etc/nginx/sites-enabled/sunbird Copy the contents of your nginx.conf file into the eSignet file.

Update the configuration to replace any placeholders with your domain name.

Restart Nginx to apply the changes:

sudo systemctl restart nginx By following these steps, you will set up the VM, install the necessary prerequisites, deploy your application, and configure Nginx.


-----------
NOTE !
-----------

We need to change the URLs in  the Application .env oidc_ui, Inji_web, and Inji_verify  before running the install.sh
