

https://roadmap.sh/projects/multi-container-service


# 🚀 Multi-Container Todo Application on Azure

![Node.js](https://img.shields.io/badge/Node.js-20-green)
![Docker](https://img.shields.io/badge/Docker-Compose-blue)
![MongoDB](https://img.shields.io/badge/MongoDB-7-green)
![Terraform](https://img.shields.io/badge/Terraform-IaC-purple)
![Ansible](https://img.shields.io/badge/Ansible-Automation-red)
![GitHub Actions](https://img.shields.io/badge/GitHub-Actions-black)
![Azure](https://img.shields.io/badge/Microsoft-Azure-0078D4)

A production-ready Todo REST API built with **Node.js**, **MongoDB**, and **Docker Compose**, deployed automatically to an **Azure Virtual Machine** using **Terraform**, **Ansible**, and **GitHub Actions**.

---

## 📌 Overview

This project demonstrates a complete DevOps workflow:

- Develop a containerized Node.js application
- Provision infrastructure with Terraform
- Configure servers using Ansible
- Deploy containers with Docker Compose
- Automate deployments through GitHub Actions
- Expose services through an Nginx reverse proxy

---

## 🏗️ Architecture

```text
┌───────────────────┐
│      GitHub       │
└─────────┬─────────┘
          │ Push
          ▼
┌───────────────────┐
│ GitHub Actions    │
│ CI/CD Pipeline    │
└─────────┬─────────┘
          │
          ▼
┌───────────────────┐
│    Docker Hub     │
└─────────┬─────────┘
          │ Pull Image
          ▼
┌──────────────────────────────────────┐
│              Azure VM                │
│                                      │
│  ┌──────────────┐                    │
│  │    Nginx     │ Port 80            │
│  └──────┬───────┘                    │
│         │                            │
│         ▼                            │
│  ┌──────────────┐                    │
│  │  Node.js API │ Port 3000          │
│  └──────┬───────┘                    │
│         │                            │
│         ▼                            │
│  ┌──────────────┐                    │
│  │   MongoDB    │                    │
│  └──────────────┘                    │
└──────────────────────────────────────┘
```

---

## ✨ Features

### REST API

| Method | Endpoint | Description |
|----------|----------|-------------|
| GET | `/todos` | Retrieve all todos |
| POST | `/todos` | Create a todo |
| GET | `/todos/:id` | Retrieve a todo |
| PUT | `/todos/:id` | Update a todo |
| DELETE | `/todos/:id` | Delete a todo |

### Infrastructure

- Azure Virtual Machine
- Virtual Network
- Public IP Address
- Network Security Groups
- Terraform Infrastructure as Code

### Automation

- Ansible Configuration Management
- Docker Compose Deployment
- GitHub Actions Continuous Deployment

---

## 📂 Project Structure

```text
multi-container-todo-app/
│
├── api/
│   ├── models/
│   ├── routes/
│   ├── package.json
│   ├── server.js
│   └── Dockerfile
│
├── terraform/
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
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
```

---

# 🐳 Containerization

The application consists of three containers:

| Container | Purpose |
|------------|----------|
| Node.js API | Backend service |
| MongoDB | Database |
| Nginx | Reverse proxy |

Docker Compose manages networking and service orchestration.

---

# ☁️ Infrastructure Provisioning

Infrastructure is provisioned using Terraform.

## Resources Created

- Resource Group (existing)
- Virtual Network
- Subnet
- Network Security Group
- Public IP
- Ubuntu Virtual Machine

### Deploy Infrastructure

```bash
terraform init
terraform plan
terraform apply
```

---

# ⚙️ Server Configuration

Ansible automatically configures the VM:

- Docker installation
- Docker Compose installation
- Docker service configuration
- User permissions
- Application deployment
- Container startup

### Run Playbook

```bash
ansible-playbook -i inventory.ini playbook.yml
```

---

# 🔄 CI/CD Pipeline

The deployment process is fully automated.

### Workflow

```text
Developer Push
      │
      ▼
GitHub Actions
      │
      ▼
Build Docker Image
      │
      ▼
Push to Docker Hub
      │
      ▼
SSH into Azure VM
      │
      ▼
docker compose pull
docker compose up -d
```

### Trigger

```yaml
on:
  push:
    branches:
      - main
```

---

# 🌐 Reverse Proxy

Nginx acts as the public entry point.

### Before

```text
http://SERVER_IP:3000/todos
```

### After

```text
http://SERVER_IP/todos
```

Benefits:

- Cleaner URLs
- Single entry point
- Easier SSL integration
- Better scalability

---

# 💾 Persistent Storage

MongoDB data is stored using Docker volumes.

```yaml
volumes:
  mongo_data:
```

Data remains available after:

- Container restart
- Docker restart
- VM reboot

---

# 🧪 API Examples

### Create Todo

```bash
curl -X POST http://SERVER_IP/todos \
-H "Content-Type: application/json" \
-d '{"title":"Learn Docker"}'
```

### Get Todos

```bash
curl http://SERVER_IP/todos
```

### Update Todo

```bash
curl -X PUT http://SERVER_IP/todos/<id>
```

### Delete Todo

```bash
curl -X DELETE http://SERVER_IP/todos/<id>
```

---

# 🔐 GitHub Secrets

Required repository secrets:

| Secret | Description |
|----------|-------------|
| DOCKER_USERNAME | Docker Hub username |
| DOCKER_PASSWORD | Docker Hub access token |
| SERVER_IP | Azure VM public IP |
| SSH_KEY | Private SSH key |

---

# 🎯 Learning Outcomes

Through this project I gained hands-on experience with:

- Docker & Docker Compose
- Infrastructure as Code (Terraform)
- Configuration Management (Ansible)
- CI/CD Automation (GitHub Actions)
- Azure Cloud Infrastructure
- Reverse Proxy Configuration (Nginx)
- Production-style Application Deployment

---

# 🚀 Future Improvements

- HTTPS with Let's Encrypt
- Azure Container Registry (ACR)
- Monitoring with Prometheus & Grafana
- Logging with ELK Stack
- Kubernetes Deployment
- Blue/Green Deployments

---

## 👨‍💻 Author

**Iheb**
DevOps & Cloud Engineering Project
