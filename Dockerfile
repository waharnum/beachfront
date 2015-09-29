FROM nginx
COPY handbook.floeproject.local.conf /etc/nginx/conf.d/handbook.floeproject.local.conf
COPY fluidproject.local.conf /etc/nginx/conf.d/fluidproject.local.conf
