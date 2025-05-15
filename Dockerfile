# Base image with OpenJDK
FROM openjdk:17-jdk-slim

# Install Docker CLI (optional: only if needed for inner docker calls)
USER root
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean

# Create a volume for logs or temp files
VOLUME /tmp

# Add the application's jar to the container
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# Set the entry point
ENTRYPOINT ["java", "-jar", "/app.jar"]

