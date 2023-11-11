# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install server-side dependencies
RUN npm install

# Copy the server-side code to the container
COPY . .

# Change directory to the client folder
WORKDIR /app/client

# Copy client-side package.json and package-lock.json to the container
COPY client/package*.json ./

# Install client-side dependencies
RUN npm install

# Build the client-side code
RUN npm run build

# Move back to the main app directory
WORKDIR /app

# Expose the port that the app will run on
EXPOSE 8000

# Start the application
CMD ["npm", "run", "start"]

