# Use a minimal, secure base image
FROM nginx:alpine

# Set a non-root user with limited privileges
RUN addgroup -S web && adduser -S web -G web

# Create required directories and adjust permissions
RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx && \
    chown -R web:web /var/cache/nginx /var/run /var/log/nginx

# chmod 777 /var/run
RUN chmod 777 /var/run

# Create a directory for your app and set ownership
RUN mkdir -p /usr/share/nginx/html && chown -R web:web /usr/share/nginx/html

# Copy files to the correct location and set appropriate permissions
COPY --chown=web:web index.html favicon.ico /usr/share/nginx/html/
COPY --chown=web:web hey.mp4 /usr/share/nginx/html/

# Update the nginx.conf to remove user directive if running as non-root
RUN sed -i '/^user/d' /etc/nginx/nginx.conf

# Modify nginx.conf to listen on port 8080 instead of 80
RUN sed -i 's/listen\s*80;/listen 8080;/' /etc/nginx/conf.d/default.conf

# Expose the port nginx will serve on
EXPOSE 8080

# Switch to non-root user
USER web

# Optional: Set healthcheck to ensure server availability
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/ || exit 1

# Run nginx (or the custom run.sh script if needed)
CMD ["nginx", "-g", "daemon off;"]
