# Use jdk base image
FROM openjdk:8-jdk-alpine

# Set working directory
WORKDIR "/opt/app"

# Creating argument to use target jar file
ARG JAR_FILE=target/*.jar

# Copy the jar file into the container
COPY ${JAR_FILE} app.jar

# Run the application from the jar file
ENTRYPOINT ["java","-jar","app.jar"]