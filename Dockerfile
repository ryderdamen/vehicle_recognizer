FROM python:3.6
WORKDIR /code
RUN mkdir /test && apt-get update && apt-get install -y \
    ffmpeg libsm6 libxext6
COPY src/requirements.txt .
RUN pip install -r requirements.txt
COPY src/ .
COPY test/ /test
CMD [ "gunicorn", "--workers", "1", "-b", "0.0.0.0:8000", "wsgi" ]
