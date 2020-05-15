# Use NodeJS base image TBD
FROM agileek/ionic-framework AS ionic

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy app source
COPY . .
RUN ionic build

EXPOSE 8100
CMD ["ionic", "serve"]