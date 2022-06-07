#! /bin/bash

TOKEN=$(echo Token super secreto do Lab | base64)
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.11:6443 K3S_TOKEN=$TOKEN sh -
yum install -y iscsi-initiator-utils.x86_64 libiscsi.x86_64 libiscsi-utils.x86_64 nfs-utils.x86_64