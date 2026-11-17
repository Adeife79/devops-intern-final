FROM nginx:1.28-alpine

RUN rm /etc/nginx/conf.d/default.conf

ARG BUILD_SHA=unknown

COPY nginx.conf /etc/nginx/nginx.conf

RUN sed -i "s/BUILD_SHA_PLACEHOLDER/${BUILD_SHA}/g" /usr/share/nginx/html/index.html

COPY index.html /usr/share/nginx/html/

RUN mkdir -p /tmp/client_temp \
    /tmp/proxy_temp \
    /tmp/fastcgi_temp \
    /tmp/uwsgi_temp \
    /tmp/scgi_temp \
    && chown -R nginx:nginx /tmp /var/cache/nginx \
    && chown -R nginx:nginx /usr/share/nginx/html 

USER nginx

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget -qO- /dev/null http://127.0.0.1:8080/healthz || exit 1

CMD ["nginx", "-g", "daemon off;"]
