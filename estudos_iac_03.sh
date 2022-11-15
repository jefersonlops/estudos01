#!/bin/bash
echo "Download website..."
cd /tmp && wget https://github.com/devradwawed/Template-food/archive/refs/heads/main.zip
echo "Descompactando arquivos..."
unzip main.zip
echo "Criando estrutura..."
mkdir -p ~/websites/food/
chmod 775 ~/websites/food/
cp -R /tmp/Template-food-main/* ~/websites/food/
echo "Removendo arquivos temporários..."
cd ~ && rm -rf /tmp/Template-food-main/ /tmp/main.zip
#wget 
echo "Docker-compose: Iniciando services..."
docker-compose -f docker-compose.yaml up -d
echo "Container iniciado"
echo "Enjoy ... =) "

