#!/bin/bash

# Récupère l'adresse IP de la machine
IP_ADDRESS=$(hostname -I | cut -d' ' -f1)

# Écrit l'adresse IP dans un fichier .env
echo "IP_ADDRESS=$IP_ADDRESS" > .env

# Génère nginx.conf à partir du template en remplaçant le placeholder
sed "s/SERVER_IP/$IP_ADDRESS/g" ./conf/nginxTemplate.conf > ./conf/nginx.conf

# Affiche un message
echo "Fichier nginx.conf généré avec l'adresse IP: $IP_ADDRESS"

# Démarre les conteneurs
docker-compose up -d