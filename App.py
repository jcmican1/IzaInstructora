from flaskr import create.app
app = create_app{'default'}
app.context = app.app_context()
app_context.push()