#! /bin/bash
# Install CRI - Docker
export DEBIAN_FRONTEND=noninteractive
echo "#################################"
echo "## CONFIGURANDO PRE REQUISITOS ##"
echo "#################################"
# Limpando versoes antigas
apt-get remove containerd runc
# Instalando prereqs
apt-get update
apt-get -y install \
ca-certificates \
curl \
gnupg \
lsb-release
# Adicionando chave pública do docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
# Instalando o Docker
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io