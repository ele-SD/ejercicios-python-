from flask import Flask, render_template, request, session, redirect, url_for
import pymysql
import random

app = Flask(__name__)
app.secret_key = "cambia-esta-clave"


def conectar():
    return pymysql.connect(
        host="localhost",
        user="root",
        password="",
        database="ejercicios_python",
        cursorclass=pymysql.cursors.DictCursor,
        autocommit=True,
    )


def consultar(sql, params=()):
    with conectar() as con, con.cursor() as cur:
        cur.execute(sql, params)
        return cur.fetchall()


def ejecutar(sql, params=()):
    with conectar() as con, con.cursor() as cur:
        cur.execute(sql, params)
        return cur.lastrowid


@app.route("/")
def inicio():
    return render_template("inicio.html")


# Ejercicio 1: par o impar
@app.route("/par-impar", methods=["GET", "POST"])
def par_impar():
    resultado = None
    if request.method == "POST":
        n = int(request.form["numero"])
        if n % 2 == 0:
            resultado = "par"
        else:
            resultado = "impar"
        ejecutar(
            "INSERT INTO par_impar (numero, resultado) VALUES (%s, %s)",
            (n, resultado),
        )
    historial = consultar("SELECT * FROM par_impar ORDER BY id DESC LIMIT 10")
    return render_template("par_impar.html", resultado=resultado, historial=historial)


# Ejercicio 2: tabla de multiplicar
@app.route("/tabla", methods=["GET", "POST"])
def tabla():
    filas = []
    if request.method == "POST":
        n = int(request.form["numero"])
        for i in range(1, 11):
            filas.append(f"{n} x {i} = {n * i}")
        ejecutar("INSERT INTO tablas (numero) VALUES (%s)", (n,))
    historial = consultar("SELECT * FROM tablas ORDER BY id DESC LIMIT 10")
    return render_template("tabla.html", filas=filas, historial=historial)


# Ejercicio 3: adivina el número
def nueva_partida():
    secreto = random.randint(1, 100)
    session["partida"] = ejecutar("INSERT INTO partidas (secreto) VALUES (%s)", (secreto,))


def evaluar(intento, secreto):
    if intento == secreto:
        return "¡Adivinaste!", True
    elif intento < secreto:
        return "El número secreto es mayor", False
    else:
        return "El número secreto es menor", False


@app.route("/adivina", methods=["GET", "POST"])
def adivina():
    if "partida" not in session:
        nueva_partida()
    mensaje = None
    if request.method == "POST":
        intento = int(request.form["numero"])
        secreto = consultar(
            "SELECT secreto FROM partidas WHERE id = %s", (session["partida"],)
        )[0]["secreto"]
        mensaje, ganada = evaluar(intento, secreto)
        ejecutar(
            "UPDATE partidas SET intentos = intentos + 1, ganada = %s WHERE id = %s",
            (ganada, session["partida"]),
        )
        if ganada:
            session.pop("partida")
    historial = consultar("SELECT * FROM partidas ORDER BY id DESC LIMIT 10")
    return render_template("adivina.html", mensaje=mensaje, historial=historial)


# Borrar el historial de un ejercicio
@app.route("/borrar/<ejercicio>", methods=["POST"])
def borrar(ejercicio):
    tablas_permitidas = {
        "par_impar": "par_impar",
        "tabla": "tablas",
        "adivina": "partidas",
    }
    if ejercicio in tablas_permitidas:
        ejecutar(f"TRUNCATE TABLE {tablas_permitidas[ejercicio]}")
        if ejercicio == "adivina":
            session.pop("partida", None)
    return redirect(url_for(ejercicio))


if __name__ == "__main__":
    app.run(debug=True)