# 🚀 n8n Deploy (Docker Compose)

Deployment **n8n** (workflow automation) dengan **PostgreSQL** menggunakan Docker Compose. Siap untuk server kecil / STB / VPS.

## ✨ Fitur
- Persisten data (n8n & Postgres)
- Healthcheck & restart policy
- Konfigurasi lewat `.env`
- Siap reverse proxy (Caddy/Nginx/Traefik/Cloudflare Tunnel)

## 📂 Struktur Direktori
N8N/
├── docker-compose.yml
├── .env
├── init-data.sh
├── data/
│ ├── n8n/
│ └── postgres/
└── docs/
└── instalasi.md


## ⚙️ Prasyarat
- Docker & Docker Compose
- Port `5678` bebas (atau ubah di `.env`)
- Kunci enkripsi rahasia (`N8N_ENCRYPTION_KEY`)

## 🚀 Cara Jalankan

git clone https://github.com/<OWNER>/<REPO>.git
cd <REPO>
cp .env .env.local  # opsional simpan var lokal
# atau langsung edit .env
chmod +x init-data.sh
docker compose up -d

Akses: http://localhost:5678
 (atau domain kamu)

🔒 Production Notes
Letakkan di balik reverse proxy + TLS
Set N8N_PROTOCOL=https dan N8N_SECURE_COOKIE=true
Simpan .env di tempat aman (jangan commit kalau berisi rahasia!)
Backup rutin folder data/

🧰 Reverse Proxy (contoh Caddyfile)
your-domain.com {
  reverse_proxy n8n:5678
}

🧹 Operasional
# logs
docker compose logs -f n8n
docker compose logs -f db

# update image
docker compose pull
docker compose up -d

# backup data
tar czf backup-$(date +%F).tgz data/
