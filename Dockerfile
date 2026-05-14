FROM nginx:1.27-alpine

COPY index.html /usr/share/nginx/html/index.html

RUN printf '%s\n' \
  'server {' \
  '    listen 80;' \
  '    server_name _;' \
  '    root /usr/share/nginx/html;' \
  '    index index.html;' \
  '    add_header X-Content-Type-Options "nosniff" always;' \
  '    add_header X-Frame-Options "DENY" always;' \
  '    add_header Referrer-Policy "strict-origin-when-cross-origin" always;' \
  '    add_header Permissions-Policy "geolocation=(), microphone=(), camera=()" always;' \
  '    location / {' \
  '        try_files $uri $uri/ /index.html;' \
  '    }' \
  '    location /health {' \
  '        access_log off;' \
  '        return 200 "ok\n";' \
  '        add_header Content-Type text/plain;' \
  '    }' \
  '    location ~ /\.ht {' \
  '        deny all;' \
  '    }' \
  '}' > /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD wget -q --spider http://localhost/health || exit 1
