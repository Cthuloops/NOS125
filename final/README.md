# NOS125 Final - Harley Coughlin
This repo contains the final Ansible Automation project for NOS-125

## Overview
This ansible project automates the configuration of web servers in a red hat
linux environment.
It streamlines the installation and management of services and user accounts.

### Project structure
This project strives to follow modular design to improve maintainability
while trying to not be too generalized.

final/
├── ansible.cfg             # Configuration settings for Ansible
├── inventory               # List of target servers
├── main.yml                # Main playbook that organizes all the tasks
├── tests                   # Test playbooks for verification
│   ├── test_users.yml      # Verifies user creation
│   ├── test_webservice.yml # Checks web service functionality
│   └── test.yml            # Coordinates test files
├── README.md               # This documentation file
├── tasks                   # Individual task files organized by function
│   ├── environment.yml     # Handles package installation and service startup
│   ├── firewall.yml        # Configures firewall settings
│   ├── user_management.yml # Creates and manages user accounts
│   ├── verify_services.yml # Checks and recovers services if needed
│   └── web_content.yml     # Sets up web server content
└── vars                    # Variable definitions
    ├── packages.yml        # Defines packages to install and services to run
    ├── firewall_rules.yml  # Defines rules for firewall configuration
    ├── user_groups.yml     # Defines admin groups
    └── users.yml           # Defines user accounts

## Key Components

### 1. Package Management
The playbook automatically installs packages and ensures their related services
are running. Variables make it easy to add or modify packages.

### 2. Service Verification
After installation, an automagic verification step checks that the services are
running. If any service failed to start, the system will attempt to restart the
service.

### 3. User Accounts
The automation creates admin accounts and assigns them to the appropriate
groups.

### 4. Web Content Deployment
Basic web content is automagically deployed to each server to provide
verification that the web service is functioning.

### 5. Testing and Validation
Built-in tests verify that all configurations have been applied successfully.

## Execution Instructions

### Prerequisites
- Ansible needs to be installed on the control node
- Network connectivity to all target hosts
- Appropriate SSH access with privilege escalation capabilities

### Running the Playbook

#### Assumptions
This playbook makes some assumptions:
- devops is the user account with sudo permissions
- server[a:b].lab.example.com are valid hosts
- external internet connectivity to run dnf commands

#### Command to run
`ansible-navigator run -m stdout main.yml`

### Verification
After execution, the playbook automagically runs tests to verify:
1. Services are properly enabled and started
2. All user accounts and groups are created correctly
3. Web services are running and accessible

## Customization
The use of variables and var files allows for simple customization of user
accounts, packages, and firewall settings:
- Update variables in the `vars/` directory to change packages, users, or groups
- Target different hosts using the inventory file
