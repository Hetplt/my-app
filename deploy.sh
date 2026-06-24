#!/bin/bash

echo "Pulling latest code..."
git pull origin main

echo "Stopping old container..."
docker stop myweb || true
docker rm myweb || true

echo "Building image..."
docker build -t het-app:v1 .

echo "Running container..."
docker run -d -p 8081:80 --name myweb het-app:v1

echo "Deployment Successful"
