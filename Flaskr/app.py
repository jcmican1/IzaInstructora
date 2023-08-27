from Flaskr import create_app
from .Modelos import db, Cancion, Album, Usuario, Medio, AlbumSchema
from flask_restful import Api
from .Vistas import VistaCanciones, VistaCancion, VistaAlbumes, VistaAlbum, VistaUsuarios, VistaUsuario
import sqlalchemy

app = create_app('default')
app.context = app.app_context()
app.context.push()

db.init_app(app)
db.create_all()

api = Api(app)
api.add_resource(VistaCanciones, '/canciones')
api.add_resource(VistaCancion, '/canciones/<int:id_cancion>')
api.add_resource(VistaAlbumes, '/albumes')
api.add_resource(VistaAlbum, '/albumes/<int:id_album>')
api.add_resource(VistaUsuarios, '/usuarios')
api.add_resource(VistaUsuario, '/usuarios/<int:id_usuario>')