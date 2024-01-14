FROM docker.io/paritytech/ci-linux:production as builder

WORKDIR /Django-Petsboard
COPY ./Django-Petsboard

RUN cargo build --locked --release

FROM docker.io/library/ubuntu:20.04

RUN pip install -r requirements.txt

RUN ls -a

CMD [ "python", "./manage.py", "runserver", "0.0.0.0:8000", "--settings=mysite.settings.prod" ]
