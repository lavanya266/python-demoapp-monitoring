# Use the official Python image as the base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY src/requirements.txt ./

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project into the container
COPY src/. .

# Expose the port your Flask app is running on (default Flask port is 5000)
EXPOSE 5000

CMD ["pyhton", "run.py"]
