FROM alpine
MAINTAINER Andy Truong "thehongtt@gmail.com"

COPY app /app/app
COPY entrypoint.sh /app/entrypoint.sh
COPY supervisord.conf /etc/supervisord.conf

RUN apk add --no-cache supervisor && \
    chmod a+x /app/entrypoint.sh && \
    chmod a+x /app/app


WORKDIR /app
EXPOSE 80
CMD ["/app/entrypoint.sh"]
