FROM nginx:1.27-alpine
RUN apk update && apk upgrade --no-cache
COPY index.html /usr/share/nginx/html/
EXPOSE 80