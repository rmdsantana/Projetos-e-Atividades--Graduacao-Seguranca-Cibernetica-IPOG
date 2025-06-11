#!/bin/bash

#Pós instalação
echo "Adicionando o usuário ao grupo 'docker'..."
sudo usermod -aG docker $USER

# Garantir que o grupo Docker esteja ativo
newgrp docker

# Subir o docker
docker compose up -d
