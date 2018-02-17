kubectl apply --recursive --prune --all -f kubectl 
helm init --service-account tiller;kubectl rollout status -w deployment/tiller-deploy --namespace=kube-system;
helm repo update
landscaper apply landscaper