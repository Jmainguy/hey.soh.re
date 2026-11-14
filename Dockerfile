# Minimal, non-root image pinned for reproducible builds and Renovate updates.
FROM cgr.dev/chainguard/nginx@sha256:3efdf56b9730d56a9bc88edf268ab72ee965cbb7d116291a8679cd89ef67e0c5

# Copy files to the correct location and set appropriate permissions
COPY --chown=nginx:nginx  index.html favicon.ico hey.mp4 /usr/share/nginx/html/

EXPOSE 8080
