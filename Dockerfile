FROM nginx:1.27-alpine

COPY index.html /usr/share/nginx/html/index.html

RUN printf '%s\n' \
  'server {' \
  '    listen 80 default_server;' \
  '    listen [::]:80 default_server;' \
  '    server_name _;' \
  '    root /usr/share/nginx/html;' \
  '    index index.html;' \
  '    add_header X-Content-Type-Options "nosniff" always;' \
  '    add_header X-Frame-Options "DENY" always;' \
  '    add_header Referrer-Policy "strict-origin-when-cross-origin" always;' \
  '    location / {' \
  '        try_files $uri $uri/ /index.html;' \
  '    }' \
  '    location = /health {' \
  '        access_log off;' \
  '        return 200 "ok\n";' \
  '        add_header Content-Type text/plain;' \
  '    }' \
  '}' > /etc/nginx/conf.d/default.conf

EXPOSE 80
