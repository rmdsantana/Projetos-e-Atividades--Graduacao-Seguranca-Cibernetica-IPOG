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

echo "Adicionando o usuário ao grupo 'docker'"
sleep 1
sudo usermod -aG docker $USER

# Garantir que o grupo Docker esteja ativo
sleep 1

# Garantir que o grupo Docker esteja ativo, usando o 'newgrp' de forma síncrona
newgrp docker << EOF
echo "Docker Compose iniciará em alguns segundos"
sleep 2
docker compose up -d
EOF

sleep 1
newgrp docker
