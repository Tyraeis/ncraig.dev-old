FROM redis:buster
RUN apt-get update && \
    apt-get install -y libpq-dev libjpeg-dev zlib1g-dev libwebp-dev \
        build-essential python3-dev libffi-dev python3-pip

COPY mygpo/mygpo mygpo
WORKDIR mygpo

RUN pip3 install -r requirements.txt && \
    pip3 install -r requirements-setup.txt && \
    pip3 install gunicorn && \
    mkdir /var/mygpo-media

COPY mygpo/env envs/prod

CMD envdir envs/prod python3 manage.py migrate && \
    envdir envs/prod gunicorn mygpo.wsgi -b 0.0.0.0:8080
