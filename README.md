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
  docker build -t flask-todo-app:latest .


Verify that the image was built successfully:
 -- docker images
