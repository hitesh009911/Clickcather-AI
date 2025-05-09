FROM python:3.11-slim

WORKDIR /app

COPY . /app

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
