#! /bin/bash
export DEBIAN_FRONTEND=noninteractive
echo "###############################"
echo "## CONFIGURANDO O K3S MASTER ##"
echo "###############################"
TOKEN=$(echo Token super secreto do Lab | base64)
# From https://superuser.com/questions/1670418/k3s-slave-agents-dont-join-kubernetes-cluster-in-vagrantbox-setup
masterIP="192.168.56.11"
flags="--tls-san $masterIP --node-external-ip $masterIP"
curl -sfL https://get.k3s.io | \
K3S_TOKEN=$TOKEN \
INSTALL_K3S_EXEC="$flags" \
sh -s - server \
--node-taint CriticalAddonsOnly=true:NoExecute
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null