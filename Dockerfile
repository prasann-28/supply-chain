# Use the official Node.js image as a base
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Expose the port Hardhat uses (default is 8545)
EXPOSE 8545

# Command to run the Hardhat node
CMD ["npx", "hardhat", "node"]
