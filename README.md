# PMTL-VN-DEPLOY

## 4GB VPS Notes

- `docker-compose.prod.yml` is tuned for a 4GB VPS (higher Node heap + localhost-only ports for `backend`/`frontend`).
- Optional Meilisearch local:
  - Start: `docker compose -f docker-compose.prod.yml --profile search up -d`
  - Set `.env`: `MEILISEARCH_ENABLED=true`, `MEILISEARCH_HOST=http://meilisearch:7700`, `MEILISEARCH_API_KEY=...`
