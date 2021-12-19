# Download base image ubuntu 20.04
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="hlamazda@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker Image for the TFTP HPA Server."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
# Install TFTP server from ubuntu repository
# Once installation is completed, remove all packages cache to reduce the size of the custom image.
RUN apt update && apt install -y tftpd-hpa && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean

# Expose Port for the Application
EXPOSE 69/udp

# Start TFTP service
CMD ["/usr/sbin/in.tftpd", "--foreground", "--user tftp", "--address 0.0.0.0:69", "--secure", "--blocksize 1468", "/var/lib/tftpboot"]
