#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=philstew/boston-housing-prediction

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy boston-housing-prediction --image=$dockerpath:latest

# Step 3:
# List kubernetes pods
kubectl get pods -l app=boston-housing-prediction
podname=$(kubectl get pods -l app=boston-housing-prediction -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo "Pod name: $podname"

# Step 4:
# Forward the container port to a host
# Running the port forward in the background so we can run additional commands in the script
kubectl port-forward pod/$podname --address 0.0.0.0 8000:80 &

# Follow the logs of the application pod so we can see the containers log output as per
# docker_out.txt in line with the port-forward output
kubectl logs -f -l app=boston-housing-prediction --all-containers=true
