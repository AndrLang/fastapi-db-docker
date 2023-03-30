# Pull base image
FROM python:3.11

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code/

# Install dependencies
RUN python -m pip install --upgrade pip
RUN apt-get update && apt-get -y install libpq-dev gcc && pip install psycopg2
COPY requirements.txt /code/
RUN pip3 install -r requirements.txt

COPY . /code/

EXPOSE 8000