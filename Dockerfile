# Use official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirement file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . .

# Expose Flask app port
EXPOSE 5000

# Set environment variables
ENV MONGO_HOST=mongo
ENV MONGO_PORT=27017
ENV FLASK_ENV=production
ENV PORT=5000

# Run the Flask app with Gunicorn (4 workers)
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
