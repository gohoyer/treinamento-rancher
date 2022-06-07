#! /bin/bash

TOKEN=$(echo Token super secreto do Lab | base64)
curl -sfL https://get.k3s.io | \
K3S_TOKEN=$TOKEN \
sh -s - server \
--node-taint CriticalAddonsOnly=true:NoExecute
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null