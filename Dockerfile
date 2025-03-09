# # Base image
# FROM python:3.12-slim

# WORKDIR /app

# # Copy the obfuscated Python files instead of the raw source code
# COPY obf/ /app/
# COPY requirements.txt /app/requirements.txt

# # Install dependencies (if applicable)
# RUN pip install -r requirements.txt

# # Start the application
# CMD ["python", "app.py"]

# Use an ARM64-compatible base image
FROM arm64v8/python:latest  

# Set the working directory
WORKDIR /app

# Copy application files
# COPY . .
COPY dist/ /app/
COPY requirements.txt /app/requirements.txt

# Install dependencies (if any)
RUN pip install -r requirements.txt

# Run the application
CMD ["python", "app.py"]
