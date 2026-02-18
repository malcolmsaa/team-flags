#!/usr/bin/env bash
set -euo pipefail

NS=boiler-room

kubectl get ns "$NS" >/dev/null 2>&1 || kubectl create ns "$NS"

kubectl apply -n "$NS" -f k8s/mongo-service.yaml
kubectl apply -n "$NS" -f k8s/mongo-statefulset.yaml
kubectl apply -n "$NS" -f k8s/backend-config.yaml
kubectl apply -n "$NS" -f k8s/backend-deployment.yaml
kubectl apply -n "$NS" -f k8s/backend-service.yaml
kubectl apply -n "$NS" -f k8s/frontend-config.yaml
kubectl apply -n "$NS" -f k8s/frontend-deployment.yaml
kubectl apply -n "$NS" -f k8s/frontend-service.yaml
kubectl apply -n "$NS" -f k8s/nginx-config.yaml
kubectl apply -n "$NS" -f k8s/nginx-deployment.yaml
kubectl apply -n "$NS" -f k8s/nginx-service.yaml

kubectl rollout status -n "$NS" deploy/backend
kubectl rollout status -n "$NS" deploy/frontend
kubectl rollout status -n "$NS" deploy/nginx
kubectl rollout status -n "$NS" statefulset/mongo

kubectl get all -n "$NS"
kubectl get pvc -n "$NS"
