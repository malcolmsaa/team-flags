#!/usr/bin/env bash
set -e

kubectl apply -f k8s/namespace.yaml

kubectl apply -n boiler-room -f k8s/backend-config.yaml
kubectl apply -n boiler-room -f k8s/backend-deployment.yaml
kubectl apply -n boiler-room -f k8s/backend-service.yaml

kubectl apply -n boiler-room -f k8s/mongo-service.yaml
kubectl apply -n boiler-room -f k8s/mongo-statefulset.yaml

kubectl apply -n boiler-room -f k8s/nginx-config.yaml
kubectl apply -n boiler-room -f k8s/nginx-deployment.yaml
kubectl apply -n boiler-room -f k8s/nginx-service.yaml

kubectl rollout status deploy/backend -n boiler-room
kubectl rollout status deploy/nginx -n boiler-room

minikube service nginx -n boiler-room
