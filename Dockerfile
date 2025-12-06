FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .
RUN . /app/venv/bin/activate && pip install --upgrade setuptools
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python3", "app.py"]