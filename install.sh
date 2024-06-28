#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Run the docker-compose file in the current directory
echo "Running docker-compose in the current directory..."
docker-compose up --build -d

# Run the docker-compose file in sunbirds /docs/docker-compose/
echo "Running docker-compose in esignet and subbirds RC/ directory..."
cd inji-certify/
chmod +x install.sh
sudo ./install.sh

echo "Both docker-compose files have been executed."


# Navigate to the project directory
cd ./mimoto/mimoto

# Build the project using Maven
echo "Building the project with Maven..."
mvn clean package

# Check if the build was successful
if [ $? -ne 0 ]; then
  echo "Maven build failed!"
  exit 1
fi

# Run the application with PM2 and set the environment variable
echo "Running the application with PM2..."
pm2 start target/*.jar --name mimoto-app --interpreter none -- -Dspring.profiles.active=local

# Check if the application started successfully
if [ $? -ne 0 ]; then
  echo "Failed to start the application with PM2!"
  exit 1
fi

echo "Application is running with PM2."


# Navigate to the Node.js project directory
cd ./mimoto/inji-web

# Install the dependencies using npm
echo "Installing dependencies with npm..."
npm install

# Check if npm install was successful
if [ $? -ne 0 ]; then
  echo "npm install failed!"
  exit 1
fi

# Start the application with PM2
echo "Starting the application with PM2..."
pm2 start app.js --name inji-web --env local

# Check if the application started successfully
if [ $? -ne 0 ]; then
  echo "Failed to start the application with PM2!"
  exit 1
fi

echo "Node.js application is running with PM2."
