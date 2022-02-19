
FROM node:16
RUN npm install -g http-server
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

EXPOSE 8010
CMD [ "http-server", "dist" ]
