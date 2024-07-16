#!/bin/bash

echo "123" | sudo -S /usr/local/bin/kubectl delete deployment tomcat-deployment --kubeconfig /home/thanhnga/.kube/config
echo "123" | sudo -S /usr/local/bin/kubectl apply -f /var/lib/jenkins/workspace/project/k8s/app.yaml --kubeconfig /home/thanhnga/.kube/config