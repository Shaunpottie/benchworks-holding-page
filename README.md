# Benchworks — Holding Page

Single-page coming-soon site for `benchworks.app`. Deployed to Coolify on the Hetzner VPS, fronted by Traefik (auto Let's Encrypt SSL).

## What's here

- `index.html` — the page (Tailwind-free, vanilla CSS, dark mode, mobile-friendly)
- `Dockerfile` — nginx:alpine serving the static file on port 80

## Deploy

Pushes to `main` auto-deploy via Coolify webhook + API trigger.

## Updating the page

```bash
# Edit index.html locally, then:
git add index.html
git commit -m "update copy"
git push origin main
```

Coolify will rebuild within ~60 seconds.

## Replacing this with the real app

When Benchworks v1 is ready, replace this repo's contents with the actual product build, OR point the Coolify app at the new repo and decommission this one.
