#!bin/bash
# Eduardo Alonso Gaytan Valadez    Grupo: 063
# Práctica 5 - Decodificar base 64 
# Profesor: Jose Anastacio Hernández Saldaña
# |  Forma de ejecucion  |
# bash Practica5.sh mystery-img1.txt
# NOTA: Todo debe ir en el mismo directorio

Imagen=$1
echo "Inserte nombre de imagen decodificada: " 
read Nombre
base64 -d $Imagen > "$Nombre.jpg"
