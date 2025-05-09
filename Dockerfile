# Use Python 3.10 (not 3.12)
FROM python:3.10-slim

WORKDIR /app

# Install build tools for scikit-learn
RUN apt-get update && apt-get install -y build-essential python3-dev

COPY requirements.txt requirements.txt

# Upgrade pip/setuptools & install requirements
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt

COPY . .

CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
