FROM nginx

COPY nginx.conf /etc/nginx/conf.d/myapp.conf

COPY ./dist /var/www/myapp
