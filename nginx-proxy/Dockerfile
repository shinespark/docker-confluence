FROM jwilder/nginx-proxy
RUN { \
      echo 'client_max_body_size 20m;'; \
      echo 'gzip on;'; \
      echo 'gzip_min_length 1k;'; \
      echo 'gzip_disable "msie6";'; \
    } > /etc/nginx/conf.d/my_proxy.conf
