# Use an official Ubuntu as a parent image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    openjdk-11-jdk \
    maven \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy local files to the container
COPY . /app

# Run Maven to build the project
RUN mvn clean package

# Define the command to run your application (example command)
CMD ["mvn", "spring-boot:run"]
