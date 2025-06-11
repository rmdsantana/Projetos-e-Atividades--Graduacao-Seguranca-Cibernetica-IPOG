#!/bin/bash

# Adiciona o usuário ao grupo docker
echo "Adicionando o usuário ao grupo 'docker'..."
sudo usermod -aG docker $USER

# Exibe uma mensagem sugerindo que o usuário saia e logue novamente
echo "Usuário adicionado ao grupo 'docker'. Por favor, saia e entre novamente na sessão ou reinicie o terminal."

# Teste rápido do Docker sem sudo
echo "Testando se o Docker está funcionando sem sudo..."
docker --version || { echo "Erro ao acessar o Docker. Certifique-se de sair e entrar novamente."; exit 1; }

# Teste do Docker Compose
echo "Testando o Docker Compose..."
docker compose version || { echo "Erro ao acessar o Docker Compose. Certifique-se de sair e entrar novamente."; exit 1; }

# Subir os containers com Docker Compose
echo "Subindo containers com Docker Compose..."
docker compose up -d || { echo "Erro ao subir os containers. Verifique o arquivo docker-compose.yml."; exit 1; }

echo "Tudo pronto! Docker e Docker Compose estão funcionando corretamente."
