# pull official base image
FROM node:13.12.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
RUN apk update
RUN apk add curl
# RUN apt-get update && apt-get install -y \
# RUN apt install -y curl
# RUN apt install -y wget
RUN curl -fsSL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN apt install -y nodejs
RUN apt install -y npm
COPY package.json ./
COPY package-lock.json ./
RUN npm install
RUN npm install react-scripts@3.4.1 -g --silent

# add app
COPY . ./

# start app
CMD ["npm", "start"]
