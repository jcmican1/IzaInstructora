from Flaskr import create_app
from .Modelos import db, Cancion, Album, Usuario, Medio, AlbumSchema
from flask_restful import Api
from .Vistas import VistaCanciones, VistaCancion


app = create_app('default')
app.context = app.app_context()
app.context.push()

db.init_app(app)
db.create_all()

api=Api(app)
api.add_resource(VistaCanciones,'/canciones')
api.add_resource(VistaCanciones,'/canciones/<int:id_cancion>')

with app.app_context():
    Album_Schema = AlbumSchema()
    A=Album(titulo='Prueba',anio=1999,descripcion='texto',medio=Medio.CD)
    db.session.add(A)
    db.session.commit()
    print([Album_Schema.dumps(album) for album in Album.query.all()])