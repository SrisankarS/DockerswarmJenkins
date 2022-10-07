# Selecting the base image to build our own customised node.js application microservice
FROM node:lts-alpine

# Working directory inside the container
WORKDIR /usr/src/app

# Copying dependencies
COPY package*.json ./

# Installing node package manager
RUN npm install

# Copying everything from current location to default location inside the container
COPY . .

EXPOSE 4200

# Starting the app with CMD - 
CMD ["npm", "start"]


