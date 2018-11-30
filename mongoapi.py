from flask import Flask
from flask import jsonify
from flask import request
from flask_pymongo import PyMongo
import os


app = Flask(__name__)

app.config['MONGO_DBNAME'] = 'test-atlas'
app.config['MONGO_URI'] = os.environ['CONNECTION_URL']
mongo = PyMongo(app)


@app.route('/policy', methods=['GET'])
def get_all_policiy():
    policy = mongo.db.policy
    output = []
    for s in policy.find():
        output.append({'name': s['name'], 'surname': s['surname']})
    return jsonify({'result': output})


@app.route('/policy', methods=['POST'])
def add_policy():
    policy = mongo.db.policy
    name = request.json['name']
    surname = request.json['surname']
    policy_id = policy.insert({'name': name, 'surname': surname})
    new_policy = policy.find_one({'_id': policy_id})
    output = {'name': new_policy['name'], 'surname': new_policy['surname']}
    return jsonify({'result': output})


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
