import requests
import json


def generate_quote():
    response = requests.get("https://api.quotable.io/random")
    data = json.loads(response.text)
    quote = data["content"]
    author = data["author"]
    return f"{quote}-{ author}"

print(generate_quote())