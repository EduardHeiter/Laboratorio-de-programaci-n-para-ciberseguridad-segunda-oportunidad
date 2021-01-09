  
#!/bin/bash
#EAGV_1796603 - Laboratorio Programacion para ciberseguridad
#Consulta a API para obtener informacion de la url que quieres consultar
#Devuelve el numero de archivos de la url, asi como cuantos contienen malware
# Eduardo Alonso Gaytan Valadez    Grupo: 063
# Practica 1 - archivo powershell
# Profesor: Jose Anastacio Hernández Saldaña

curl --request GET \
  --url 'https://www.virustotal.com/vtapi/v2/url/report?apikey=f00daf6cc91c9591838757d16144cb3852d0281834ea5e18b39de69a11778986&resource=www.uanl.mx' > resultados.txt

echo " "
cat resultados.txt | grep -o -i "\"positives\": [0-9]*" 
cat resultados.txt | grep -o -i "\"total\": [0-9]*"

echo "Detectados limpios: " 
cat resultados.txt | grep -o -i "\"detected\": false" resultados.txt | wc -l


#API KEY: f00daf6cc91c9591838757d16144cb3852d0281834ea5e18b39de69a11778986
# resource: www.uanl.mx