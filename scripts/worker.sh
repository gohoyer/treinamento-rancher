#! /bin/bash
export DEBIAN_FRONTEND=noninteractive
echo "###############################"
echo "## CONFIGURANDO O K3S WORKER ##"
echo "###############################"
TOKEN=$(echo Token super secreto do Lab | base64)
curl -sfL https://get.k3s.io | K3S_URL=https://master-1:6443 K3S_TOKEN=$TOKEN sh -
apt-get -y install open-iscsi libiscsi7 libiscsi-bin nfs-common