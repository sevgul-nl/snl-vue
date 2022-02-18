FROM node:lts-alpine
RUN npm install -g http-server
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 6080
CMD [ "http-server", "dist" ]