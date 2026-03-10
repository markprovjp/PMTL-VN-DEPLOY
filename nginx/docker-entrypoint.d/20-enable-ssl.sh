#!/usr/bin/env sh
set -eu

DOMAIN="phapmontamlinh-quantheambotat.vn"

CERT="/etc/letsencrypt/live/${DOMAIN}/fullchain.pem"
KEY="/etc/letsencrypt/live/${DOMAIN}/privkey.pem"

DISABLED_CONF="/etc/nginx/conf.d/ssl/pmtl-ssl.conf.disabled"
ENABLED_CONF="/etc/nginx/conf.d/pmtl-ssl.conf"

if [ -f "${CERT}" ] && [ -f "${KEY}" ] && [ -f "${DISABLED_CONF}" ]; then
  cp -f "${DISABLED_CONF}" "${ENABLED_CONF}"
  echo "[pmtl] SSL enabled"
else
  rm -f "${ENABLED_CONF}" || true
  echo "[pmtl] SSL not enabled"
fi

exit 0
