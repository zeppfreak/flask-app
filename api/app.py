from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/')
def hello():
    return "Hello, World!"

@app.route('/api/v1/users', methods=['GET'])
def get_users():
    users = [{'name': 'Alice', 'age': 25}, {'name': 'Bob', 'age': 30}]
    return jsonify({'users': users})

@app.route('/api/v1/chatbot', methods=['POST'])
def post_data():
    data = request.json
    # リクエストデータの処理
    response = {'message': 'Data received successfully.'}
    return jsonify(response)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)