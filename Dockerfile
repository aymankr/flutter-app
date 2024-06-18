# Use an official Dart runtime as a parent image
FROM dart:stable

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Get dependencies
RUN dart pub get

# Build the application
RUN dart compile exe bin/server.dart -o /app/bin/server

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the executable
CMD ["./bin/server"]
