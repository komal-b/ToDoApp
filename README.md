# Flask ToDo App – Docker, Minikube & AWS EKS Deployment

This project demonstrates how to **containerize a Flask + MongoDB application** using Docker, test it locally with Docker Compose, and deploy it to **Kubernetes** using both **Minikube** and **AWS EKS**.

---

##  1. Containerizing the Application with Docker

### Step 1: Install Docker
Download and install Docker from the [official website](https://www.docker.com/).

Verify installation:
```bash
 docker --version
```

###  Step 2: Build the Docker Image

Run the following command in the same directory as your Dockerfile:
```bash
  docker build -t flask-todo-app:latest .
```

Verify that the image was built successfully:
```bash
  docker images
 ```
### Step 3: Test Locally with Docker Compose

To run both the Flask app and MongoDB locally:
``` bash
docker-compose up
```
---

## 2. Push Docker Image to Docker Hub
### Step 1: Log in to Docker Hub
docker login

### Step 2: Tag the Image

```bash
docker tag flask-todo-app:latest komalbagwe31/flask-todo-app:latest
```

### Step 3: Push the Image

```bash
docker push komalbagwe31/flask-todo-app:latest
```


Image will now be available publicly on Docker Hub for use in deployments.

---
## 3. Deploying on Minikube
### Step 1: Install and Start Minikube

Install Minikube from 

Start Minikube and verify:
```bash
minikube start
kubectl get nodes
```

### Step 2: Deploy MongoDB
```bash
kubectl apply -f mongo-deployment.yaml
```

### Step 3: Deploy Flask App
```bash
kubectl apply -f deployment.yaml
```

### Step 4: Expose the Service
```bash
minikube service flask-todo-service --url
```

A URL to access the Flask ToDo app running on Minikube.

----
## 4. Deploying on AWS EKS
### Step 1: Create SSH Key (if not present)

Check for existing SSH keys:
```bash
ls ~/.ssh/
```


If not found, create a new one:

```bash
ssh-keygen -t rsa -b 4096 -C "eks-key" -f ~/.ssh/eks_key
```

Import the key into the AWS EC2 Console → Key Pairs → Import key pair and name it eks-key.

### Step 2: Create an EKS Cluster

Create the cluster using eksctl:
```bash
eksctl create cluster \
--name flask-eks-cluster \
--region us-east-1 \
--nodes 2 \
--node-type t3.medium \
--with-oidc \
--ssh-access \
--ssh-public-key eks-key \
--managed
```

### Step 3: Deploy Application on EKS

Note: For AWS EKS, use LoadBalancer type instead of NodePort.

Apply the deployments:
```bash
kubectl apply -f eks-deployment.yaml
kubectl apply -f mongo-deployment.yaml
```

Step 4: Get the External URL
```bash
kubectl get service flask-app-service
```

This will display the external Load Balancer URL where your Flask app is


## Useful Kubernetes Commands
```bash
# Check running pods
kubectl get pods

# Check services
kubectl get svc

# View logs of a pod
kubectl logs <pod-name>

# Delete deployments
kubectl delete -f <deployment-file>.yaml

```

---
## Author:
Komal Bagwe (knb4003)
Tejaswini Pradip Srivastava (tps7866)

