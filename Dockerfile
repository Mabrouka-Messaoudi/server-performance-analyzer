# Use a lightweight Debian base image
FROM debian:bullseye-slim

# Prevent interactive dialogs during package install
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages for your script
RUN apt-get update && apt-get install -y \
    procps \      
    util-linux \  
    grep \         
    coreutils \    
    gawk \         
    sed \                
    systemd \      
    && apt-get clean

# Copy your script into the container
COPY server-stats.sh /usr/local/bin/server-stats.sh

# Make the script executable
RUN chmod +x /usr/local/bin/server-stats.sh

# Run the script by default when the container starts
CMD ["/usr/local/bin/server-stats.sh"]
