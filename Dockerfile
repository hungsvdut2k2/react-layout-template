# Use an official Node.js runtime as a parent image
FROM node:16-alpine AS build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Production image
FROM node:16-alpine AS production
WORKDIR /app

# Install serve to serve the build folder
RUN npm install -g serve

# Copy built assets from the build stage
COPY --from=build /app/build ./build

# Expose port 3000
EXPOSE 3000

# Start the app
CMD ["serve", "-s", "build", "-l", "3000"] 