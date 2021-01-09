#!/bin/bash
#Script que muestra el sufijo del pais de origen de un direccion IP
#EAGV_1796603 - Laboratorio Programacion para ciberseguridad
# Eduardo Alonso Gaytan Valadez    Grupo: 063
# Practica 1 - archivo powershell
# Profesor: Jose Anastacio Hernández Saldaña

curl --request GET \
  --url "https://www.virustotal.com/vtapi/v2/ip-address/report?apikey=<por seguridad no lo pongo>&ip=221.131.2.1" > resultados1.txt

echo " "
echo "Sufijo del pais: "
cat resultados1.txt | grep -o -i "\"country\": \"[a-zA-Z]*\"" 