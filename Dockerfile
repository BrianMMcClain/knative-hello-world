FROM node:8.14.0-stretch-slim

WORKDIR /usr/src/app
COPY . .
RUN npm install

ENV PORT 8080
EXPOSE $PORT

ENTRYPOINT ["npm", "start"]