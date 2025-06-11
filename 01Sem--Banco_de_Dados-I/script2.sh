#!/bin/bash

#Pós instalação
sudo usermod -aG docker $USER

# Garantir que o grupo Docker esteja ativo
newgrp docker

# Subir o docker
docker compose up -d
