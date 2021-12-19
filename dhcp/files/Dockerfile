# Download base image ubuntu 20.04
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="hlamazda@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker Image for \
the ISC DHCP Server."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
# Install ISC DHCP server from ubuntu repository
# Once installation is completed, remove all packages cache to reduce the size of the custom image.
RUN apt update && apt install -y isc-dhcp-server && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean

# Expose Port for the Application
EXPOSE 67/udp 67/tcp

# Create DHCP lease database file
RUN touch /var/lib/dhcp/dhcpd.leases

# Start DHCP service
CMD ["/usr/sbin/dhcpd", "-f", "-d", "--no-pid", "-cf", "/etc/dhcp/dhcpd.conf"]
