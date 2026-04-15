Automated CI/CD Pipeline: EKS Deployment with AWS CodePipeline.

This project demonstrates a production-ready CI/CD workflow. It automates the process of containerizing an application, storing it in a private registry, and deploying it to a managed Kubernetes cluster (Amazon EKS) with full monitoring via CloudWatch.

🏗️ Pipeline Architecture:

The pipeline follows a "Commit-to-Cloud" flow:

Source: Developer pushes code to GitHub.

Trigger: AWS CodePipeline detects the change and triggers a build.

Build & Registry: AWS CodeBuild executes the Dockerfile, builds the image, and pushes it to Amazon ECR.

Deploy: CodeBuild uses kubectl to apply Kubernetes manifests to the Amazon EKS cluster.

Expose: The app is made accessible via a Classic/Application Load Balancer.

Monitor: All logs are streamed to Amazon CloudWatch.

🛠️ Prerequisites :

AWS CLI configured with Admin permissions.

kubectl installed and configured for EKS.

Docker installed locally for testing.

An active Amazon EKS cluster.

📂 Project Structure

├── k8s/                  # Kubernetes Manifests
│   ├── deployment.yaml   # Defines pods, replicas, and container images
│   └── service.yaml      # Defines the LoadBalancer access
├── Dockerfile            # Instructions to containerize the app
├── buildspec.yml         # AWS CodeBuild instructions (Build & Deploy)
├── app/                  # Application source code
└── README.md             # Documentation

Since you need a comprehensive README.md that covers the entire technical workflow—from Dockerization to EKS deployment—here is a professional template. You can copy this directly into your GitHub repository.

🚀 Automated CI/CD Pipeline: EKS Deployment with AWS CodePipeline
This project demonstrates a production-ready CI/CD workflow. It automates the process of containerizing an application, storing it in a private registry, and deploying it to a managed Kubernetes cluster (Amazon EKS) with full monitoring via CloudWatch.

🏗️ Pipeline Architecture
The pipeline follows a "Commit-to-Cloud" flow:

Source: Developer pushes code to GitHub.

Trigger: AWS CodePipeline detects the change and triggers a build.

Build & Registry: AWS CodeBuild executes the Dockerfile, builds the image, and pushes it to Amazon ECR.

Deploy: CodeBuild uses kubectl to apply Kubernetes manifests to the Amazon EKS cluster.

Expose: The app is made accessible via a Classic/Application Load Balancer.

Monitor: All logs are streamed to Amazon CloudWatch.

🛠️ Prerequisites
AWS CLI configured with Admin permissions.

kubectl installed and configured for EKS.

Docker installed locally for testing.

An active Amazon EKS cluster.

📂 Project Structure
Plaintext
├── k8s/                  # Kubernetes Manifests
│   ├── deployment.yaml   # Defines pods, replicas, and container images
│   └── service.yaml      # Defines the LoadBalancer access
├── Dockerfile            # Instructions to containerize the app
├── buildspec.yml         # AWS CodeBuild instructions (Build & Deploy)
├── app/                  # Application source code
└── README.md             # Documentation

⚙️ Setup & Installation

1. Containerization

Build the image locally to ensure the Dockerfile is valid:

docker build -t vite-app:latest .

⚙️ Registry Setup: Docker Hub
Create Repository: Create a public or private repository on Docker Hub.

1. Local Authentication:

docker login --username dugyalaravali28

2. Pushing the Image:

docker tag vite-app:latest dugyalaravali28/vite-app:latest
docker push dugyalaravali28/vite-app:latest

EKS RBAC Configuration :

To allow CodeBuild to deploy to EKS, update the aws-auth ConfigMap:

kubectl edit -n kube-system configmap/aws-auth

Add the CodeBuild service role ARN under mapRoles.

Buildspec & Deployment :

The buildspec.yml handles the authentication and deployment logic.

Pre-Build: Login to ECR and set variables.

Build: Execute docker build.

Post-Build: Push image to ECR and run kubectl apply -f k8s/

📊 Monitoring :

All logs are tracked via Amazon CloudWatch:

Build/Deploy Logs: /aws/codebuild/vite-project

Application Logs: /aws/containerinsights/vite-cluster/application

🔗 Application Access :

Once deployed, retrieve the LoadBalancer URL:

kubectl get svc -o wide

http://a2525a7d3f0084e3faa273ca87ba6cb4-958280048.ap-south-1.elb.amazonaws.com/

