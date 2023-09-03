FROM node:18-alpine

ENV NODE_ENV=development

# Create working directory. This is where the app will run from within the container.
# The WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile.
WORKDIR /app

# Copy package.json to the working directory.
COPY ["package.json", "./"]

# Install dependencies
RUN yarn install --include=dev

# Copy the rest of the app's source code from your host to your image filesystem.
COPY . .

# Expose port 3333 to the outside world
EXPOSE 3333

# Run the app
CMD ["node", "server.js"]
