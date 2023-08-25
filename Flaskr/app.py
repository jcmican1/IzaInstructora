from Flaskr import create_app
from .Modelos import db, Cancion, Album, Usuario, Medio

app = create_app('default')
app.context = app.app_context()
app.context.push()

db.init_app(app)
db.create_all()

with app.app_context():
    u=Usuario(nombre='juan',contrasena='12345')
    a=Album(titulo='prueba',anio=1999,descripcion='texto',medio=Medio.CD)
    c = Cancion(titulo='mi cancion',minutos=1, segundos=15, interprete='el jojos')
    u.albumes.append(a)
    a.canciones.append(c)
    db.session.add(u)
    db.session.add(c)
    db.session.commit()
    print(Usuario.query.all())
    print(Album.query.all())
    print(Album.query.all()[0].canciones)
    print(Cancion.query.all())
    db.session.delete(a)
    print(Album.query.all())
    print(Cancion.query.all())
