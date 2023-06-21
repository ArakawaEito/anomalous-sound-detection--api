from respons_flaskapi.api.config.base import Config


class LocalConfig(Config):
    TESTING = True
    DEBUG = True
