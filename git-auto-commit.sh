#!/usr/bin/env bash
set -euo pipefail

# --- Konfigurasi ---
BRANCH="main"
REMOTE="origin"

# Ambil timestamp sekarang
TS="$(date '+%Y-%m-%d %H:%M:%S')"

# Pesan commit otomatis
MSG="Auto commit on ${TS}"

echo "🔄 Commit & Push otomatis dimulai..."
echo "📌 Pesan commit: ${MSG}"

# Tambahkan semua perubahan
git add .

# Commit (jika ada perubahan)
if git diff --cached --quiet; then
  echo "⚠️  Tidak ada perubahan untuk di-commit."
else
  git commit -m "${MSG}"
fi

# Pastikan branch benar
git branch -M "${BRANCH}"

# Push ke remote
git push "${REMOTE}" "${BRANCH}"

echo "✅ Selesai! Commit & Push berhasil pada ${TS}"
