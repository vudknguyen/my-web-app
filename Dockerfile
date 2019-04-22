FROM node:10-alpine

ADD package-lock.json /package-lock.jso
ADD package.json /package.json

ENV PORT=3000
ENV NODE_PATH=/node_modules
ENV PATH=$PATH:/node_modules/.bin

RUN npm install
RUN npm audit fix
RUN npm install -g serve

WORKDIR /app
COPY . /app

RUN npm run build

CMD ["serve","-s","build"]