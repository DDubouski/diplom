FROM python:3
ENV PYTHONUNBUFFERED 1
RUN apt-get update

WORKDIR /App
RUN git clone https://github.com/DDubouski/django-docker.git
RUN pip install -r requirements.txt
