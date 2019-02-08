FROM node:10.15.1-stretch-slim

WORKDIR /usr/src/app
COPY . .
RUN npm install

ENV PORT 8080
EXPOSE $PORT

ENTRYPOINT ["npm", "start"]