"""
Eduardo Alonso Gaytan Valadez    Grupo: 063
Práctica # 6 - webscry.py 
Profesor: Jose Anastacio Hernández Saldaña
"""

import requests
from bs4 import BeautifulSoup as bs
import os


def get_data(url):
    response = requests.get(url)
    content = bs(response.content, 'html.parser')
    search = content.find_all('table', class_='wikitable')
    name = input('Nombre del archivo de resultados obtenidos: ')
    Validar(name)
    with open (name, 'r+') as file:
        for i in search:
            file.write(i.text)


def Validar(archivo): 
 
  if os.path.exists(archivo):
    archivo = open(archivo, "a")
  else:
    archivo = open(archivo, "w")

if __name__ == "__main__":

    host = 'https://www.ecured.cu/Anexo:Presidentes_de_los_Estados_Unidos'
    get_data(host)