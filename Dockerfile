FROM nginx
COPY static-content /usr/share/nginx/html
EXPOSE 80