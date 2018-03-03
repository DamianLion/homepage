#!/bin/bash
docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD";
docker push blimpify/web

eval "echo \"$(cat k8n/kube.yaml)\"" > k8n/kube.conf
export KUBECONFIG=k8n/kube.conf
kubectl apply -f "k8n/deployment.yaml"
kubectl apply -f "k8n/service.yaml"
kubectl apply -f "k8n/ingress.yaml"