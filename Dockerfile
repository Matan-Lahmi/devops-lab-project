FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN apt-get update && apt-get upgrade -y && apt-get clean
RUN pip install --upgrade setuptools wheel --break-system-packages
COPY . .
CMD ["python", "main.py"]
