# Minimal, non-root image pinned for reproducible builds and Renovate updates.
FROM cgr.dev/chainguard/nginx@sha256:7b3bbe97d6ba4be0a00719e08abd483b7d18ae46b65f5c20b83a681691d9e691

# Copy files to the correct location and set appropriate permissions
COPY --chown=nginx:nginx  index.html favicon.ico hey.mp4 /usr/share/nginx/html/

EXPOSE 8080
