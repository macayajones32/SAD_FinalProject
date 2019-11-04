import os
import sqlite3
import time
from flask import Flask, request, session, g, redirect, url_for, abort, \
     render_template, flash
##import database 

app = Flask(__name__)

# Load default config and override config from an environment variable
app.config.update(dict(
    DATABASE=os.path.join(app.root_path, 'flaskr.db'),
    SECRET_KEY='development key',
))

app.config.from_envvar('FLASKR_SETTINGS', silent=True) 


def connect_db():
    """Connects to the specific database."""
    rv = sqlite3.connect(app.config['DATABASE'])
    rv.row_factory = sqlite3.Row
    return rv


def get_db():
    """Opens a new database connection if there is none yet for the
    current application context.
    """
    if not hasattr(g, 'sqlite_db'):
        g.sqlite_db = connect_db()
    return g.sqlite_db


@app.teardown_appcontext
def close_db(error):
    """Closes the database again at the end of the request."""
    if hasattr(g, 'sqlite_db'):
        g.sqlite_db.close()


def init_db():
    db = get_db()
    with app.open_resource('tables.sql', mode='r') as f:
        db.cursor().executescript(f.read())
    db.commit()



@app.cli.command('initdb')
def initdb_command():
    """Initializes the database."""
    init_db()
    print('Initialized the database.')




@app.route('/')
def index():
    db = get_db()
    cur = db.execute('SELECT * FROM COURSE')
    courses = cur.fetchall()
    return render_template("index.html", courses=courses) 


@app.route('/totallyreallogin', methods=['POST'])
def reallogin():
    return redirect(url_for('home')) 

    
@app.route('/homepage')
def home():
    db = get_db()
    cur = db.execute('SELECT * FROM COURSE')
    courses = cur.fetchall()
    return render_template("homepage.html", courses=courses)
    



@app.route('/Registration.html')
def registration():
    db = get_db()
    cur = db.execute('SELECT * FROM COURSE')
    courses = cur.fetchall()
    return render_template("Registration.html", courses=courses)


@app.route('/Schedule1')
def schedule():
    db = get_db()
    cur = db.execute('SELECT REGISTRATION.SEM_ID, REGISTRATION.STU_ID, COURSE.CRS_ID, COURSE.CRS_NAME FROM REGISTRATION INNER JOIN COURSE ON COURSE.CRS_ID = REGISTRATION.CRS_ID WHERE REGISTRATION.SEM_ID = "FA2020" AND REGISTRATION.STU_ID = 02837732;') 
    courses = cur.fetchall()
    return render_template("Registration.html", courses=courses)
















if __name__ == '__main__':
    app.run()
    
