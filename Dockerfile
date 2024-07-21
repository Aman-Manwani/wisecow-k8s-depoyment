# Use an official lightweight base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    dos2unix \
    netcat-openbsd

# Set the working directory inside the container
WORKDIR /app

# Copy the shell script into the container at /app
COPY wisecow.sh .

# Convert line endings from DOS to Unix
RUN dos2unix wisecow.sh

# Export the path to the prerequisite packages
ENV PATH=$PATH:/usr/games

# Ensure the script is executable
RUN chmod +x wisecow.sh

# Expose port 4499 to the outside world for the server
EXPOSE 4499

# Define the command to run the script
CMD ["./wisecow.sh"]
