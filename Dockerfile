FROM balenalib/raspberrypi3-debian

WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-dev \
    build-essential gcc

# Copy application files
COPY app.py .

# Install required Python libraries (Add more if needed)
RUN pip3 install RPi.GPIO

# Run the application
CMD ["python3", "app.py"]
