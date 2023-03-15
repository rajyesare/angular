# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY ./Angular/package*.json ./

# Install the project dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY ./Angular .

# Build the application
RUN npm run build --prod

# Expose the port on which the application will run
EXPOSE 8084

# Start the application
CMD ["npm", "run", "start"]
