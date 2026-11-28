# Minimal, non-root image pinned for reproducible builds and Renovate updates.
FROM cgr.dev/chainguard/nginx@sha256:07295c9284f8db3f8ed77b74ee8ee5284e4372e05851aa2288bcbc881ebf8acf

# Copy files to the correct location and set appropriate permissions
COPY --chown=nginx:nginx  index.html favicon.ico hey.mp4 /usr/share/nginx/html/

EXPOSE 8080
