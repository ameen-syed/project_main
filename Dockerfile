# Use an ARM64-compatible base image
FROM arm64v8/python:latest  

# Set the working directory
WORKDIR /app

# Copy obfuscated application files
COPY dist/ /app/

# Ensure runtime files are copied correctly
COPY dist/pyarmor_runtime_000000 /app/pyarmor_runtime_000000

# Copy requirements file
COPY requirements.txt /app/requirements.txt

# Install dependencies
RUN pip install -r requirements.txt

# Set environment variable to find shared libraries
ENV LD_LIBRARY_PATH=/app/pyarmor_runtime_000000

# Run the application
CMD ["python", "app.py"]


# # Use an ARM64-compatible base image
# FROM arm64v8/python:latest  

# # Set the working directory
# WORKDIR /app

# # Copy application files
# # COPY . .
# COPY dist/ /app/
# # COPY dist/pyarmor_runtime_000000 /app/pyarmor_runtime_000000
# COPY requirements.txt /app/requirements.txt

# # Install dependencies (if any)
# RUN pip install -r requirements.txt

# # Run the application
# CMD ["python", "app.py"]
# # CMD ["python", "pyarmor_runtime.py", "app.py"]
# # CMD ["python", "/app/app.py"]
