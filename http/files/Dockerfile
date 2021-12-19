# Download base image ubuntu 20.04
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="hlamazda@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker Image for the Apache Web Server."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
# Install Nginx Web server from ubuntu repository
# Once installation is completed, remove all packages cache to reduce the size of the custom image.
RUN apt update && apt-get install -y apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Expose Port for the Application
EXPOSE 80/tcp

# Start Nginx Web Server
CMD ["apache2ctl", "-D", "FOREGROUND"]
