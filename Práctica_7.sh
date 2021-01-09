#!/bin/bash
#Eduardo Alonso Gaytan Valadez    Grupo: 063
#Practica 7 - script bash
#Profesor: Jose Anastacio Hernández Saldaña

host=$1
firstport=$2
lastport=$3

function portscan {

for ((counter=$firstport; counter<=$lastport; counter++))
do
	(echo >/dev/tcp/$host/$counter) > /dev/null 2>&1 &&
	  echo "$counter puerto abierto" >> resultadosip.txt || echo "$counter puerto cerrado" >> resultadosip.txt
done

}

portscan
