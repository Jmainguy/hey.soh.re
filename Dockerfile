# Minimal, non-root image pinned for reproducible builds and Renovate updates.
FROM cgr.dev/chainguard/nginx@sha256:a0a6cc87a5a02b27ac0bf10b7a108ff825e8cb832f25952bbc04c69605a98b35

# Copy files to the correct location and set appropriate permissions
COPY --chown=nginx:nginx  index.html favicon.ico hey.mp4 /usr/share/nginx/html/

EXPOSE 8080
