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
