#webapp.py

from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysql_connector import MySQL
import bcrypt

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'toor01'
app.config['MYSQL_DB'] = 'flaskdb'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
mysql = MySQL(app)
nama_db = 'use flaskdb'

@app.route('/')
def home():
    return render_template("home.html")

@app.route('/register', methods=["GET", "POST"])
def register():
    if request.method == 'GET':
        return render_template("register.html")
    else:
        name = request.form['name']
        email = request.form['email']
        password = request.form['password'].encode('utf-8')
        hash_password = bcrypt.hashpw(password, bcrypt.gensalt())

        cur = mysql.connection.cursor()
        cur.execute(nama_db)
        cur.execute("INSERT INTO users (name, email, password) VALUES (%s,%s,%s)",(name,email,hash_password,))
        mysql.connection.commit()
        session['name'] = request.form['name']
        session['email'] = request.form['email']
        return redirect(url_for('home'))


@app.route('/login',methods=["GET","POST"])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password'].encode('utf-8')
        #print(password)
        #curl = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        curl = mysql.connection.cursor(dictionary=True)
        curl.execute(nama_db)
        curl.execute("SELECT * FROM users WHERE isaktif=1 AND email=%s",(email,))
        user = curl.fetchone()
        #print(user)
        curl.close()

        if user !=None and len(user) > 0:
            if bcrypt.hashpw(password, user["password"].encode('utf-8')) == user["password"].encode('utf-8'):
                session['name'] = user['name']
                session['email'] = user['email']
                session['role'] = user['role']
                
                return render_template("home.html")
            else:
                return "Error password and email not match"
        else:
            return "Error user not found"
    else:
        return render_template("login.html")


@app.route('/logout')
def logout():
    session.clear()
    return render_template("home.html")


if __name__ == '__main__':
    app.secret_key = "^A%DJAJU^JJ123"
    app.run(debug=False)
