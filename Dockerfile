FROM python:3.9

WORKDIR /code

COPY . .

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

RUN rm -rf /code/*

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]

# If running behind a proxy like Nginx or Traefik add --proxy-headers
# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80", "--proxy-headers"]