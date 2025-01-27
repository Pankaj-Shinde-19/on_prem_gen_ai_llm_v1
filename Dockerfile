# Base image
FROM python:3.12-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY api ./api

RUN pip install --no-cache-dir -r ./api/requirements.txt

# Expose port for app
EXPOSE 8000

# Set the entrypoint
CMD ["fastapi", "run", "api/app.py"]
