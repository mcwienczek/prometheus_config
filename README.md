# Cluster as code example

This is very simple cluster-as-code example that illustrate how simply you can start with having cluster configuration inside git repository. This setup is what I use in my home single-node cluster and it works really well. 

Cluster as code gives you and your organization a lot of benefits. Some of them include enabling review process to be applied to the cluster configuration, history, auditing and easy reverse in case of failure.

## Repository contents

This repository contains almost everything I use and deploy to my cluster. However, it is not intended to be used as-is. It is only an example for your future work. You can see grafana and prometheus deployments. This repository also contains tiller deployment, so if you have tiller in your cluster, you should remove it beforehand.

In order to apply the configuration in this repository you also need a `basic-auth` secret created by yourself in monitoring namespace. I do not recommend, though, commiting the secret to any repository.

Link to the guide on how to create such secret:

https://github.com/kubernetes/ingress-nginx/blob/master/docs/examples/auth/basic/README.md

The main part of this repo is `apply_cluster.sh` script. It is very simple script that you can use to apply configuration from git repository. Before you can use it, make sure you have kubectl and landscaper (https://github.com/Eneco/landscaper) installed and that *your kubeconfig is pointing at the proper cluster!.*

## Grafana

There is monitorning namespace with prometheus and grafana. Grafana is deployed manually by using kubectl. I've been struggling really hard to have grafana configuration (including data sources and dashboards) in yaml file, so that I can re-apply them to various clusters.

## Prometheus

I have created prometheus landscaper config to show how I have configured prometheus in order to run it on 1.9 cluster. Unfortunately by default there were a few things to tweak before prometheus was fully operational on 1.9 kubernetes.

The customizations that I've made compared to the default values.yaml:

1. Changed cAdvisor job as the default one does not work with new clusters. You can track the fix here: https://github.com/kubernetes/charts/pull/3684
2. Enabled RBAC for Prometheus
3. Created ingressed that are password-protected, so that I can verify prometheus scrape status
4. Upgraded prometheus to 2.1.0

The whole issue with cAdvisor is described here: https://cwienczek.com/prometheus-problem-container-metrics-cadvisor/
