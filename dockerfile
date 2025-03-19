# Use the official Node.js image from Docker Hub
FROM node:latest

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to container
COPY package*.json ./

# # Copy all to container (don't need if mounted volume)
# COPY . .

# Install project dependencies (package.json)
RUN npm install

# Expose port 8080
EXPOSE 8080

# Run server (when container starts)
CMD ["npm", "run", "serve"]
# Note that the "serve" refers to the "scripts" self-defined in package.json