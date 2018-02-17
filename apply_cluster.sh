#!/bin/bash

# Apply kubectl/yaml files first
kubectl apply --recursive --prune --all -f kubectl 

# Initialize helm and wait for tiller to be ready
helm init --service-account tiller;kubectl rollout status -w deployment/tiller-deploy --namespace=kube-system;

# Update helm repo
helm repo update

# Apply all yaml files in folder landscaper
# NOTE! This setup won't work with nested folders as landscaper only applies top-level yaml files
landscaper apply landscaper