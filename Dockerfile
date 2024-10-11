FROM python:3.12

WORKDIR /app

COPY ./src/matricula-online-newsfeed-mailer.py .
COPY ./requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

VOLUME /data

ENV DATA_DIR=/data

ENTRYPOINT [ "python", "matricula-online-newsfeed-mailer.py" ]
