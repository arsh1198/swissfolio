# Buid
FROM node:23-alpine AS build
WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

#Serve
FROM joseluisq/static-web-server:2-alpine

WORKDIR /app

COPY --from=build /app/dist ./

CMD [ "-p", "8080", "-a", "0.0.0.0", "--root", "." ]

EXPOSE 8080  
