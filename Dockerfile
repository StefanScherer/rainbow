FROM node:16 AS build

WORKDIR /code
COPY package.json /code
RUN npm install --production
COPY . /code
CMD ["node", "app.js"]

FROM node:16-alpine

WORKDIR /code
COPY --from=build /code /code
CMD ["node", "bin/app.js"]
