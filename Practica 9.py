"""
Eduardo Alonso Gaytan Valadez    Grupo: 063
Práctica # 9 - Envío de correos con/sin imagen 
Profesor:  Jose Anastacio Hernández Saldaña
"""

#eduardo.gaytanvdz@uanl.edu.mx
#edvardheiter021@gmail.com


"""
Eduardo Alonso Gaytan Valadez    Grupo: 063
Ejercicio #7 - Envío de correos con adjuntos 
Profesor: Osvaldo Habib González González
"""

import os
import smtplib
import ssl
from email.mime.text import MIMEText
from email.mime.image import MIMEImage
from email.mime.multipart import MIMEMultipart

i = 0  
 
while i == 0:
	x = input("Desea enviar correo con o si imagen?\n|1| - Si\n|2| - No\n")
	if x == "1":
		try:   # Manejamos los errores
			port = 587  # para el startttls
			smtp_server = "smtp.office365.com"    #Servidor del correo universitario
			msg = MIMEMultipart()  #Creamos el objeto MIMEMultipart
			msg['From'] = input("Ingrese el correo remitente y presione enter: ")  # Remitente
			password = input("Ingrese contraseña y presione enter: ")   # Contraseña del correo remitente
			msg['To'] = input("Ingrese correo destinatario y presione enter: ") # Destinatario
			msg['Subject'] = input("Asunto del correo: ") #Asunto del correo
			text = MIMEText(input("Mensaje: ")) #Mensaje del correo
			msg.attach(text)
			ImgFileName = input("Ingrese nombre de la imagen: ") #En el mismo directorio
			img_data = open(ImgFileName, 'rb').read()     #Leemos la imagen de manera binaria
			image = MIMEImage(img_data, name=os.path.basename(ImgFileName))
			msg.attach(image)  # Adjuntamos la imagen al mensaje
			print("\n Su correo está listo para enviarse...")
			if input("\n Ingrese numero.... \n|1|- Enviar\n|2|- Regresar\n") == "1":
				i = 1
			else:
				i = 0
		except Exception as e:
			print(e)
			i = 0
	else:
		try:   # Manejamos los errores
			port = 587  # para el startttls
			smtp_server = "smtp.office365.com"    #Servidor del correo universitario
			msg = MIMEMultipart()  #Creamos el objeto MIMEMultipart
			msg['From'] = input("Ingrese el correo remitente y presione enter: ")  # Remitente
			password = input("Ingrese contraseña y presione enter: ")   # Contraseña del correo remitente
			msg['To'] = input("Ingrese correo destinatario y presione enter: ") # Destinatario
			msg['Subject'] = input("Asunto del correo: ") #Asunto del correo
			text = MIMEText(input("Mensaje: ")) #Mensaje del correo
			msg.attach(text)
			print("\n Su correo está listo para enviarse...")
			if input("\n Ingrese numero.... \n|1|- Enviar\n|2|- Regresar\n") == "1":
				i = 1
			else:
				i = 0
		except Exception as e:
			print(e)
			i = 0

context = ssl.create_default_context()

try:
	with smtplib.SMTP(smtp_server, port) as server:
		server.starttls(context=context)
		server.login(msg['From'], password)
		server.sendmail(msg['From'], msg['To'], msg.as_string())
	print("Mail sended!")
except Exception as e:
	print(e)
