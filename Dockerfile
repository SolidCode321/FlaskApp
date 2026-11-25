# Small official Python base image
FROM python:3.13-slim

# Working directory inside the container
WORKDIR /app

# 1. Install the dependencies first (cached layer if requirements.txt doesn't change)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 2. Copy the application code
COPY . .

# 3. The Flask app listens on port 5000
EXPOSE 5000

# 4. Start the application
CMD ["python", "app.py"]
