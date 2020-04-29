from flask import Flask, request, render_template_string

# A template string
# In a real app, render from a file in the templates directory
TEMPLATE = """
<h1>Hello world!</h1>
<p>Your IP is {{ip_address}}</p>
<img src='static/earth.gif'>
"""

# Instatiate an app object
app = Flask(__name__)

@app.route('/')
def hello_world():
    # Render the "template" string with an ip address and a spinning earth
    return render_template_string(
        TEMPLATE,
        ip_address=request.headers['X-Real-IP'])

if __name__ == "__main__":
    # Launch flask
    # Be sure to turn off debug in prod!
    print("Starting flask...")
    app.run(
        debug=True,
        host='0.0.0.0',
        port=8888)
