FROM python:3.11

WORKDIR /usr/src/

RUN apt-get update

COPY ./api /usr/src/respons_flaskapi/api
COPY ./data /usr/src/respons_flaskapi/data
COPY ./tmp_data /usr/src/respons_flaskapi/tmp_data
COPY ./__init__.py /usr/src/respons_flaskapi/__init__.py
COPY ./requirements.txt /usr/src/respons_flaskapi/requirements.txt
COPY ./run.py /usr/src/respons_flaskapi/run.py

RUN pip install --upgrade pip

RUN pip install -r ./respons_flaskapi/requirements.txt

RUN echo "building..."

ENV FLASK_APP "run.py"

EXPOSE 8000

CMD ["gunicorn", "respons_flaskapi.run:app"]
