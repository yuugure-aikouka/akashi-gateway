FROM nginx:alpine

# Install envsubst for variable substitution
RUN apk add --no-cache gettext

# Copy the NGINX template configuration
COPY nginx.conf /etc/nginx/nginx.conf.template

# Redirect logs to stdout and stderr (for viewing via Cloud Run)
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# Substitute environment variables and overwrite nginx.conf
CMD ["/bin/sh", "-c", "if [ -z \"$COMMON_URL\" ]; then echo 'Environment variable COMMON_URL must be set'; exit 1; fi; \
     envsubst '${COMMON_URL}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"]
