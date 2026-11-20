# Minimal, non-root image pinned for reproducible builds and Renovate updates.
FROM cgr.dev/chainguard/nginx@sha256:c1642395cc75f39c931d66d939f7e78cbdf671d6cfd821616632b0639c3c6d63

# Copy files to the correct location and set appropriate permissions
COPY --chown=nginx:nginx  index.html favicon.ico hey.mp4 /usr/share/nginx/html/

EXPOSE 8080
