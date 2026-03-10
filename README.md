# PMTL-VN-DEPLOY

## 4GB VPS Notes

- `docker-compose.prod.yml` is tuned for a 4GB VPS.
- `backend` runs with a 1536 MB heap and `frontend` runs with a 768 MB heap.
- `backend`, `frontend`, and `meilisearch` are bound to `127.0.0.1` and exposed only through `nginx`.
- Meilisearch is part of the default production stack and is expected to run locally on the VPS.

## Production Bring-up

1. Copy `.env.example` to `.env` and replace all placeholder secrets.
2. Pull the latest deploy, backend, and frontend repos.
3. Rebuild everything:

```bash
docker compose -f docker-compose.prod.yml build --no-cache backend frontend
docker compose -f docker-compose.prod.yml up -d
```

4. Verify:

```bash
docker compose -f docker-compose.prod.yml ps
docker compose -f docker-compose.prod.yml logs --tail=80 backend
docker compose -f docker-compose.prod.yml logs --tail=80 frontend
curl -I https://phapmontamlinh-quantheambotat.vn/admin
curl -sSf http://127.0.0.1:7700/health
```
