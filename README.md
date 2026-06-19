Multi-Container Todo Application

https://roadmap.sh/projects/multi-container-service

A production-ready Todo API built with Node.js, Express, and MongoDB, deployed on Microsoft Azure using Terraform, Ansible, Docker Compose, and GitHub Actions.

Architecture

GitHub
   |
   | Push to main
   v
GitHub Actions
   |
   | Build & Push Docker Image
   v
Docker Hub
   |
   | Deploy
   v
Azure VM
   |
   +--> Nginx Reverse Proxy (Port 80)
   |
   +--> Node.js API Container (Port 3000)
   |
   +--> MongoDB Container

   
Technologies Used
Technology	Purpose
Node.js + Express	REST API
MongoDB	Database
Mongoose	MongoDB ODM
Docker	Containerization
Docker Compose	Multi-container orchestration
Terraform	Infrastructure provisioning
Ansible	Server configuration
GitHub Actions	CI/CD pipeline
Azure VM	Hosting
Nginx	Reverse proxy


Features

Todo API
Method	Endpoint	Description
GET	/todos	Get all todos
POST	/todos	Create todo
GET	/todos/:id	Get single todo
PUT	/todos/:id	Update todo
DELETE	/todos/:id	Delete todo


Project Structure

multi-container-todo-app
│
├── api/
│   ├── Dockerfile
│   ├── package.json
│   ├── server.js
│   ├── models/
│   └── routes/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── ansible/
│   ├── inventory.ini
│   └── playbook.yml
│
├── nginx/
│   └── nginx.conf
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
└── docker-compose.yml

Docker Compose

The application consists of:

API Container
Node.js
Express
Mongoose
MongoDB Container
MongoDB 7
Persistent Docker volume
Nginx Container
Reverse proxy
Exposes port 80
Infrastructure Provisioning

Infrastructure is created using Terraform.

Resources provisioned:

Virtual Network
Subnet
Public IP
Network Security Group
Linux Virtual Machine (Ubuntu 22.04)
Deploy Infrastructure
terraform init
terraform plan
terraform apply
Server Configuration

Ansible is used to configure the VM.

Tasks performed:

Install Docker
Install Docker Compose
Enable Docker service
Configure Docker permissions
Copy Docker Compose configuration
Copy Nginx configuration
Pull Docker images
Start containers
Run Ansible
ansible-playbook -i inventory.ini playbook.yml
CI/CD Pipeline

GitHub Actions automates deployment.

Pipeline steps:

Checkout repository
Login to Docker Hub
Build Docker image
Push image to Docker Hub
SSH into Azure VM
Pull latest image
Restart containers
Trigger

Deployment is automatically triggered when code is pushed to:

main
GitHub Secrets

Required secrets:

Secret	Description
DOCKER_USERNAME	Docker Hub username
DOCKER_PASSWORD	Docker Hub access token
SERVER_IP	Azure VM public IP
SSH_KEY	Private SSH key
Reverse Proxy

Nginx is configured as a reverse proxy.

Internet
   |
 Port 80
   |
 Nginx
   |
 Node.js API
   |
 MongoDB

Benefits:

Single public entry point
Cleaner URLs
Easier SSL integration
Persistence

MongoDB data is stored in a Docker volume.

volumes:
  mongo_data:

This ensures data remains available after:

Container restart
Docker restart
VM reboot
API Testing

Create Todo:

curl -X POST http://<server-ip>/todos \
-H "Content-Type: application/json" \
-d '{"title":"Learn Docker"}'

Get Todos:

curl http://<server-ip>/todos
Lessons Learned

This project demonstrates:

Containerization with Docker
Multi-container applications with Docker Compose
Infrastructure as Code using Terraform
Configuration Management using Ansible
CI/CD using GitHub Actions
Cloud deployment on Azure
Reverse proxy configuration with Nginx
Future Improvements
HTTPS with Let's Encrypt
Custom domain name
Monitoring with Prometheus and Grafana
Container registry migration to Azure Container Registry
Kubernetes deployment
