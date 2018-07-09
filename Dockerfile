FROM python:2

RUN apt update -y && apt install python-pip -y

EXPOSE 80

ADD . /httpbin

RUN pip install --no-cache-dir gunicorn gevent /httpbin

CMD ["gunicorn", "-b", "0.0.0.0:80", "httpbin:app", "-k", "gevent"]
