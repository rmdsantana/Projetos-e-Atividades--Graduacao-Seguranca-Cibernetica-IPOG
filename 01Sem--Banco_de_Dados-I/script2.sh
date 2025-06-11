#!/bin/bash

#Pós instalação
sleep 5
exec $SHELL
#Subir o docker
sleep 10
docker compose up -d
