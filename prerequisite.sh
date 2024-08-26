#!/bin/bash

# Exit immediately if a command exits with a non-zero status
#set -e

# Update and install prerequisites
#echo "Updating system and installing prerequisites..."
#sudo apt-get update
#sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Install Docker
#echo "Installing Docker..."
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#sudo apt-get update
#sudo apt-get install -y docker-ce

# Verify Docker installation
#if [[ $(docker --version) ]]; then
#    echo "Docker installed successfully: $(docker --version)"
#else
#    echo "Docker installation failed."
#    exit 1
#fi

# Install Docker Compose
#echo "Installing Docker Compose..."
#sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose

# Verify Docker Compose installation
#if [[ $(docker-compose --version) ]]; then
#    echo "Docker Compose installed successfully: $(docker-compose --version)"
#else
#    echo "Docker Compose installation failed."
#    exit 1
#fi

# Install Nginx
# echo "Installing Nginx..."
#sudo apt-get install -y nginx

# Verify Nginx installation
#if [[ $(nginx -v 2>&1) ]]; then
#    echo "Nginx installed successfully: $(nginx -v 2>&1)"
#else
#    echo "Nginx installation failed."
#    exit 1
#fi

#echo "All installations completed successfully."



#############################################

set -e

# Function to install Node.js
install_node() {
    echo "Updating package list..."
    sudo apt-get update -y

    echo "Installing prerequisites..."
    sudo apt-get install -y curl

    echo "Adding NodeSource repository..."
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -

    echo "Installing Node.js..."
    sudo apt-get install -y nodejs

    echo "Verifying Node.js installation..."
    if node -v && npm -v; then
        echo "Node.js and npm installed successfully."
    else
        echo "Node.js installation failed."
        exit 1
    fi
}

# Function to install PM2
install_pm2() {
    echo "Installing PM2 globally..."
    sudo npm install -g pm2

    echo "Verifying PM2 installation..."
    if pm2 --version; then
        echo "PM2 installed successfully."
    else
        echo "PM2 installation failed."
        exit 1
    fi
}

#install_JAVA() {
#    sudo apt install openjdk-11-jdk -y

#    echo "Verifying java installation..."
#    if java --version; then
#        echo "java installed successfully."
#    else
#        echo "java installation failed."
#        exit 1
#    fi
#}
# Install Node.js
install_node

# Install PM2
install_pm2
# Install java
#install_JAVA

echo "Node.js, java, and PM2 have been installed successfully."




