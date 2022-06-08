#!/bin/bash
echo "###############################"
echo "## CONFIGURANDO O /ETC/HOSTS ##"
echo "###############################"
set -e
IFNAME=$1
ADDRESS="$(ip -4 addr show "$IFNAME" | grep "inet" | head -1 |awk '{print $2}' | cut -d/ -f1)"
sed -e "s/^.*${HOSTNAME}.*/${ADDRESS} ${HOSTNAME} ${HOSTNAME}.local/" -i /etc/hosts

# remove ubuntu-bionic entry
sed -e '/^.*ubuntu-focal.*/d' -i /etc/hosts

# Update /etc/hosts about other hosts
if ! grep -q "192.168.56.11  master-1" /etc/hosts; then echo "192.168.56.11  master-1" >> /etc/hosts; fi
if ! grep -q "192.168.56.21  worker-1" /etc/hosts; then echo "192.168.56.21  worker-1" >> /etc/hosts; fi
if ! grep -q "192.168.56.22  worker-2" /etc/hosts; then echo "192.168.56.22  worker-2" >> /etc/hosts; fi