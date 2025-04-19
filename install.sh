#!/bin/bash

# Colors for better output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting deployment of WordPress stack to Scaleway...${NC}"

# Check if ansible is installed
if ! command -v ansible &> /dev/null; then
    echo -e "${RED}Ansible is not installed. Installing...${NC}"
    sudo apt update
    sudo apt install -y ansible
fi

# Run the main playbook
echo -e "${GREEN}Running Ansible playbook...${NC}"
ansible-playbook -i hosts.ini site.yml

# Check if deployment was successful
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Deployment completed successfully!${NC}"
    echo -e "Your WordPress site should now be available at: https://${domain_name}"
    echo -e "Please make sure your DNS settings point to the Scaleway IP address."
else
    echo -e "${RED}Deployment failed. Please check the error messages above.${NC}"
fi