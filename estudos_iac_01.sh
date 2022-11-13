#!/bin/bash
# Autor: Jeferson Lopes
#
# Script para criação de usuário, diretórios e inserção de permissões.
# É um exemplo prático para uma atividade de estudos de Linux para um bootcamp com foco em AWS ministrada pela DIO.
#
# Os diretórios que serão criados são:
# /publico
# /adm
# /ven
# /sec
#
# Grupos:
#  GRP_ADM
#  GRP_VEN
#  GRP_SEC
#
# Usuários x Grupos:
# GRP_ADM
#   carlos
#   maria
#   joao
#
# GRP_VEN
#   debora
#   sebastiana
#   roberto
#
# GRP_SEC
#   josefina
#   amanda
#   rogerio
# Obedecendo as regras pré-definidas:
# * Excluir diretórios, arquivos, grupos e usuários criados anteriormente em seu ambiente de estudos (Não em seu sistema principal);
# * Todo provisionamneto deve ser feito em um arquivo do tipo Bash Script;
# * O dono de todos os diretórios criados será o usuário root;
# * Todos os usuários terão permissão total dentro do diretório publico;
# * Os usuários de cada grupo terão permissão total dentro de seu respectivo diretório;
# * Os usuários não poderão ter permissão de leitura, escreita e execução em diretórios de departamentos que eles não pertencem;
# * Subir arquivo de script criado para a sua conta no GitHub;


echo "Criando diretórios"
mkdir -p {/publico,/adm,/ven,/sec}

echo "Criando grupos"
for i in GRP_ADM GRP_VEN GRP_SEC; do groupadd $i; done

echo "Adicionando usuários"
# Aqui não foi utilizado o "openssl passwd -crypt Senha123" devido a mudança de parâmetro na versão instalada do openssl no Ubuntu Server 22.04.1 LTS, pois, não há a necessidade do parâmetro '-crypt'.

for i in carlos maria joao; do useradd $i -m -s /bin/bash -p $(openssl passwd Senha123) -G  GRP_ADM; done
for i in debora sebastiana roberto; do useradd $i -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_VEN; done
for i in josefina amanda rogerio; do useradd $i -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_SEC; done

echo "Setando permissões"

chown root:GRP_ADM /adm && chmod 770 /adm
chown root:GRP_VEN /ven && chmod 770 /ven
chown root:GRP_SEC /sec && chmod 770 /sec
chmod 777 /publico

echo "The end... enjoy :)"
