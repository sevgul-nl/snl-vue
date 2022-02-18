FROM node:latest
#RUN npm install -g http-server
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 6080
#CMD ["npm" ,"start"]
#CMD [ "http-server", "dist" ]
