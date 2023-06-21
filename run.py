import os
from flask import Flask
from respons_flaskapi.api import api
from respons_flaskapi.api.config import config


config_name = os.environ.get("CONFIG", "local")

app = Flask(__name__)
# print("name:", __name__)
app.config.from_object(config[config_name])
# Blueprintをアプリケーションに登録
app.register_blueprint(api)
# print(app.config)
