FROM nginx:mainline-alpine
RUN rm /etc/nginx/conf.d/*
ADD nginx.conf /etc/nginx/conf.d/
COPY scripts /usr/share/nginx/html/scripts
COPY css /usr/share/nginx/html/css
COPY index.html /usr/share/nginx/html/
EXPOSE 80