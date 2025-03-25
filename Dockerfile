FROM python:3.4

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		mysql-client \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /Django-Petsboard
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
