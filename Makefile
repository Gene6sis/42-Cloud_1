# Makefile to deploy Inception with Ansible

DOMAIN_NAME := adbenmc.works
ANSIBLE := $(shell command -v ansible 2>/dev/null)
APT := $(shell command -v apt 2>/dev/null)
SUDO := $(shell command -v sudo 2>/dev/null)

.PHONY: all check_ansible install_ansible deploy

all: check_ansible deploy

check_ansible:
ifeq ($(ANSIBLE),)
	@echo "Ansible is not installed. Installing..."
	$(SUDO) $(APT) update
	$(SUDO) $(APT) install -y ansible
else
	@echo "Ansible is already installed."
endif

deploy:
	@echo "Starting deployment of WordPress stack to Scaleway..."
	ansible-playbook -i hosts.ini site.yml -v ; \
	if [ $$? -eq 0 ]; then \
		echo "Deployment completed successfully!"; \
		echo "Your WordPress site should now be available at: https://$(DOMAIN_NAME)"; \
	else \
		echo "Deployment failed. Please check the error messages above."; \
	fi

fclean:
	@echo "Cleaning up /opt/inception and Docker environment..."
	ansible-playbook -i hosts.ini playbooks/cleanup_inception.yml -v

restart:
	@echo "Restarting Docker Compose in /opt/inception..."
	ansible-playbook -i hosts.ini playbooks/restart_inception.yml -v

start:
	@echo "Starting Docker Compose in /opt/inception..."
	ansible-playbook -i hosts.ini playbooks/start_inception.yml -v

stop:
	@echo "Stopping Docker Compose in /opt/inception..."
	ansible-playbook -i hosts.ini playbooks/stop_inception.yml -v

re : fclean all