FROM nginx

COPY myapp.conf /etc/nginx/conf.d/myapp.conf

COPY ./dist /var/www/myapp
