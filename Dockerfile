# Use Ubuntu as the base image
FROM ubuntu:latest

# Install Python3, pip, and Flask
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install flask

# Copy application.py to /opt/app
COPY application.py /opt/app/application.py

# Set environment variable and command to run the Flask app
ENV FLASK_APP=/opt/app/application.py
CMD ["flask", "run", "--host=0.0.0.0"]