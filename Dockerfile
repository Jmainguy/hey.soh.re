# Use a minimal, secure base image
FROM cgr.dev/chainguard/nginx

# Copy files to the correct location and set appropriate permissions
COPY --chown=nginx:nginx  index.html favicon.ico hey.mp4 /usr/share/nginx/html

EXPOSE 8080
