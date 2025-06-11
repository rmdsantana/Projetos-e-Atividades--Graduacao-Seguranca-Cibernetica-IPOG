#!/bin/bash

#Instalação do Docker seguindo a documentação oficial
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

chmod +x script2.sh

#Rodar script 2
./script2.sh &

echo "Adicionando o usuário ao grupo 'docker'"
sudo usermod -aG docker $USER

# Garantir que o grupo Docker esteja ativo
echo "Docker Compose iniciará em alguns segundos"
newgrp docker
