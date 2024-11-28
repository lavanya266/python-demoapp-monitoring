FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy only the requirements file initially
COPY src/requirements.txt ./

# Install necessary build tools and Python headers
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    --no-install-recommends && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get remove -y gcc python3-dev && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Copy the application code
COPY src/ .

# Expose the application port
EXPOSE 5000

# Define the entrypoint
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
