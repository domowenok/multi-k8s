# 1
FROM node:14-alpine3.14 as builder
WORKDIR '/app'

#2
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

#
FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html
