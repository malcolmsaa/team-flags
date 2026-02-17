#!/bin/bash
set -e

minikube start
eval $(minikube docker-env)

docker build -t frontend:latest .
docker build -t backend:latest . || true

kubectl apply -f k8s/
kubectl wait --for=condition=ready pod -l app=mongo --timeout=180s
kubectl wait --for=condition=ready pod -l app=backend --timeout=180s
kubectl wait --for=condition=ready pod -l app=frontend --timeout=180s

minikube service frontend-service
