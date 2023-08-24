from flask_sqlalchemy import SQLAlchemy

db=SQLAlchemy()


class Album(db.Model):
    tablename = db.Column(db.String(128))
    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String(128))
    year = db.Column(db.Integer)
    descripcion = db.Column(db.String(128))
    medio = db.Column(db.Medio)


    def __repr__(self):
        return "{}-{}-{}-{}-{}-{}".format(self.tablename, self.id, self.titulo, self.year, self.descripcion, self.medio)

class Cancion(Album,db.Model):
    id = db.Column(db.Integer, primary_key = True)
    titulo = db.Column(db.String(128))
    minutos = db.Column(db.Integer)
    segundos = db.Column(db.Integer)
    interprete = db.Column(db.String(128))

    def __repr__(self):
        return "{}-{}-{}-{}".format(self.titulo,self.minutos,self.segundos,self.interprete)

class Usuario(db.Model):
    tablename = db.Column(db.String(128))
    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(128))
    contrasena = db.Column(db.String(128))

    def __repr__(self):
        return "{}-{}-{}-{}".format(self.tablename, self.id, self.nombre, self.contrasena)
