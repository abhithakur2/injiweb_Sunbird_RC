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
