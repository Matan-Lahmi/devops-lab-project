# 1. מאיזה תשתית אנחנו מתחילים
FROM python:3.11-slim

# 2. איפה הקוד שלנו יישב בתוך הקונטיינר
WORKDIR /app

# 3. העתקת הקבצים מהמחשב לתוך הקונטיינר
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# 4. הפקודה שתריץ את האפליקציה
CMD ["python", "main.py"]