FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
    pkg-config \
    default-libmysqlclient-dev \
    libpq-dev \
    gcc \
    && apt-get clean


# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Скопируем файл с зависимостями и установим их
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Копируем все остальные файлы проекта
COPY . .

# Открываем порт 8000 для Django
EXPOSE 8000

# Команда запуска сервера Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
