FROM django

EXPOSE 8000

ADD Django-Petsboard
WORKDIR Django-Petsboard

RUN pip install -r requirements.txt

RUN ls -a

CMD [ "python", "./manage.py", "runserver", "0.0.0.0:8000", "--settings=mysite.settings.prod" ]
