# Helm chart prometheus config

This is my helm chart prometheus config. I have created this file to show how I have configured prometheus in order to run it on 1.9 cluster. Unfortunately by default there were a few things to tweak before prometheus was fully operational on 1.9 kubernetes.

The customizations that I've made compared to the default values.yaml:

1. Changed cAdvisor job as the default one does not work with new clusters. You can track the fix here: https://github.com/kubernetes/charts/pull/3684
2. Enabled RBAC for Prometheus
3. Created ingressed that are password-protected, so that I can verify prometheus scrape status

The whole issue with cAdvisor is described here: https://cwienczek.com/prometheus-problem-container-metrics-cadvisor/
