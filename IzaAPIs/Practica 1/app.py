from flask import Flask, request

app = Flask(__name__)

@app.route("/")
def home():
    #app.logger.debug('Iniciando el debug')
    #app.logger.info('Iniciando info')
    #app.logger.warning('Iniciando a nivel warning')
    #app.logger.error('Iniciando a nivel de error')
    app.logger.info(f'solicitud en la ruta {request.path}')
    return "<p>Hello, World! desde pycharm<p>"

@app.route("/saludar/<nombre>")
def saludar (nombre):
    app.logger.info(f'solicitud en la ruta {request.path}')
    return f"hola {nombre}"

@app.route ("/edad/<int:edad>")

def edad(edad):
    app.logger.info (f'solicitud en la ruta {request.path}')
    return f"Tu edad es {edad}"

#REST

@app.get("/api/user/<user>")
def user(user):
    valores = {'user':user}
    return valores