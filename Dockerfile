# Base image should contain NodeJS published with the tag 10.16.3
# Tag in NodeJS images means the version of NodeJS installed in the image
# alpine is a very light weight linux distro
FROM node:10.16.3-alpine

# Create a new directory where we will move our code
RUN mkdir -p /docker-app

# Set the created directory as the default directory for future commands
WORKDIR /docker-app

# Copy the package.json package-lock.json into the Workdir
COPY package.json package-lock.json ./

# Run npm install to install all dependencies
RUN npm install

# Copy rest of the sorce code folders into the Workdir
COPY . ./

# Expose port 4200 to make it available to be bound on the host machine
#EXPOSE 4200

# Define an Entrypoint from where the commands can be executed
ENTRYPOINT ["./node_modules/.bin/ng"]

# Define a command to execute from the Entrypoint
CMD ["serve", "--host","0.0.0.0"]
