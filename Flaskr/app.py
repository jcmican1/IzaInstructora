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
    c = Cancion(titulo='mi cancion',minutos=1, segundo=15, interprete='el jojos')
    u.albumes.append(a)
    a.Caciones.apped(c)
    db.session.add(u)
    db.session.add(c)
    db.session.commit()
    print(Usuario.query.all())
    print(Album.query.all()[0].canciones)
    db.session.delete(u)
    print(Usuario.query.all())
    print(Album.query.all())
