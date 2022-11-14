#!/bin/bash
# Script simplificado para provisionamento de servidor Web Apache juntamente com aplicação
echo "Atualizando o servidor e instalando o servidor Apache"
apt-get update
apt-get upgrade -y
apt-get install apache2 unzip -y

echo "Download e deploy da aplicação..."
cd /tmp
wget https://github.com/jefersonlops/linux-site/archive/refs/heads/main.zip
unzip main.zip
cp -R /tmp/linux-site-main/* /var/www/html

echo "Teste serviço e deploy..."
curl http://127.0.0.1/

echo "The end... enjoy =)"
