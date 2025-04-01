from flask import Flask, request, jsonify
import pandas as pd
from flask_cors import CORS

app = Flask(__name__)

# Allow CORS for all routes and origins
CORS(app)

# Load the CSV
data = pd.read_csv('C:/Users/Public/Relatorio_cadop.csv')

@app.route('/api/search', methods=['POST', 'OPTIONS'])
def search():
    if request.method == 'OPTIONS':
        # Handle preflight request
        return '', 200

    query = request.json.get('query', '')
    # Filter the data based on the search query
    results = data[data['Razao_Social'].str.contains(query, case=False, na=False)]
    return jsonify(results.to_dict(orient='records'))

if __name__ == '__main__':
    app.run(debug=True)