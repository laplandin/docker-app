FROM node:10.15-alpine

WORKDIR /home/www/app

RUN npm install
CMD ["npm","run","start:dev"]
