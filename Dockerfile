# Base image
FROM debian:stable-slim

# Install dependencies
RUN apt update && apt upgrade -y && apt install -y wget wine iputils-ping dnsutils curl net-tools && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Download AstroTuxLauncher
RUN wget https://github.com/JoeJoeTV/AstroTuxLauncher/releases/latest/download/AstroTuxLauncher

# Apply executable permissions to the downloaded file
RUN chmod +x AstroTuxLauncher

# Install Server
RUN ./AstroTuxLauncher install

# Expose
EXPOSE 8777

# Start the server
CMD [ "./AstroTuxLauncher", "start" ]