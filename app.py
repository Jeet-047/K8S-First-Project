## Create a basic Flask application

from flask import Flask, render_template, request

# initialize the app
app = Flask(__name__)

# define the route for home page
@app.route("/", methods=["GET", "POST"])
def home():
    name = ""
    if request.method == "POST":
        name = request.form.get("name")
    return render_template("index.html", name=name)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=False)