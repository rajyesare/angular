### STAGE 1: Build ###
FROM node:14-alpine AS build
WORKDIR /app
COPY ./Angular/package*.json ./
RUN npm install
COPY ./Angular .
RUN npm run build --prod
### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist/myWebsite /usr/share/nginx/html
