# Base image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install dependencies
COPY DjangoEcommerce/requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the rest of the Django project
COPY DjangoEcommerce /app/

# Run Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
