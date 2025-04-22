# Stage 1: Build Vue app
FROM node:18-alpine AS builder

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

