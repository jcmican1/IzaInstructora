from Flaskr import create_app
from .Modelos import db, Cancion

app = create_app('default')
app.context = app.app_context()
app.context.push()

db.init_app(app)
db.create_all()

with app.app_context():
    c=Cancion(titulo='prueba',minutos=2,segundos=25,interprete="Juan")
    db.session.add(c)
    db.session.commit()
    print(Cancion.query.all())

    A = Cancion(titulo='prueba', minutos=2, segundos=25, interprete="Juan")
    db.session.add(c)
    db.session.commit()
    print(Cancion.query.all())

    U = Cancion(titulo='prueba', minutos=2, segundos=25, interprete="Juan")
    db.session.add(c)
    db.session.commit()
    print(Cancion.query.all())