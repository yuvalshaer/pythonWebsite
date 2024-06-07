from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "<h1>Welcome to My Basic Website</h1><p>This is a simple Flask web application.</p>"

@app.route('/about')
def about():
    return "<h1>About</h1><p>This page provides information about the website.</p>"

@app.route('/contact')
def contact():
    return "<h1>Contact</h1><p>You can contact us at contact@example.com.</p>"

if __name__ == '__main__':
    app.run(debug=True)
