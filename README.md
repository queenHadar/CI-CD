
# AKS CI/CD with Terraform & GitHub Actions
<img width="1336" height="1063" alt="Untitled Diagram drawio (3)" src="https://github.com/user-attachments/assets/d5bc8a66-c052-44d4-b3dc-8cfd59e7d7e7" />

### Overview
The purpose of this project is to design and implement a complete end-to-end infrastructure and deployment workflow for a containerized application. It covers the provisioning of cloud resources, container image management, and automated deployment to Kubernetes, demonstrating a modern DevOps approach from infrastructure as code to continuous delivery.

### Project Structure
```
.
├── server/                # FastAPI application code
├── helm/                  # Helm chart for Kubernetes deployment
├── terraform/             # Terraform IaC for AKS, ACR, and networking
└── .github/workflows/     # GitHub Actions workflows
```

### Infrastructure Setup
Provisioned with Terraform:
* AKS Cluster
* Azure Container Registry (ACR)
* Virtual Network & Subnets

Steps
``` 
terraform init
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars"
```
Using prod.tfvars ensures environment-specific variables are applied consistently.

### Application
* FastAPI service located in the /server directory.
* Dockerized for deployment to AKS.

### CI/CD Workflow
The pipeline is configured using GitHub Actions:

#### Trigger Conditions
The pipeline is triggered based on changes in the server/ directory

#### Pipeline Behavior
On any branch:
* Build a Docker image for FastAPI
* Run unit tests (using pytest for FastAPI app)
* Push the image to ACR

On main branch:
* Update Helm values with the new image tag
* Deploy the updated application to AKS using Helm

#### Helm Charts
* A custom Helm chart is used to deploy the application to AKS
* The image repository and tag are dynamically updated by the GitHub Actions workflow

### Challenges & Resolutions
| Challenge | Resolution |
|-----------|------------|
| Managing secrets (kubeconfig, ACR creds) | Stored in GitHub Actions Secrets  (KUBE_CONFIG_DATA, AZURE_CREDENTIALS). 

### Future Improvements

#### GitOps with ArgoCD
Use ArgoCD to manage Helm values in a Git repository instead of deploying directly, enabling automated synchronization to AKS.

#### Terraform Remote State
Store Terraform state in an S3-compatible backend to enable:
- State locking
- Automated infrastructure updates
- Better team collaboration via CI/CD pipelines


