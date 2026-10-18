# setup.ps1 - Automated Setup for Antigravity & Agent Tooling

$RepoRawUrl = "https://raw.githubusercontent.com/mtaufik84/startup-projects/main"

Write-Host ">>> Inisialisasi Ekosistem AI Agent..." -ForegroundColor Cyan

# 1. Unduh file aturan kerja (AGENTS.md) ke root proyek
# Di dalam setup.ps1, buat pengecekan sederhana ini:
try {
    Invoke-WebRequest -Uri "$RepoRawUrl/AGENTS.md" -OutFile "AGENTS.md" -ErrorAction Stop
    Write-Host "[1/5] Berhasil mengunduh AGENTS.md" -ForegroundColor Green
} catch {
    Write-Host "[1/5] AGENTS.md belum ada di repo, lewati langkah ini." -ForegroundColor Yellow
}

# 2. Pasang & Konfigurasi RTK (Token Optimization)
Write-Host "[2/5] Menyiapkan RTK (Rust Token Killer)..." -ForegroundColor Yellow
if (-not (Get-Command rtk -ErrorAction SilentlyContinue)) {
    winget install rtk-ai.rtk --accept-source-agreements --accept-package-agreements
}
if (Get-Command rtk -ErrorAction SilentlyContinue) {
    rtk init --agent antigravity
}

# 3. Pasang Plugin Ponytail ke Antigravity CLI
Write-Host "[3/5] Memasang plugin Ponytail untuk Antigravity..." -ForegroundColor Yellow
if (Get-Command agy -ErrorAction SilentlyContinue) {
    agy plugin install https://github.com/DietrichGebert/ponytail
} else {
    Write-Warning "Antigravity CLI ('agy') tidak ditemukan di active PATH."
}

# 4. Pasang Plugin Anti-Slop ke Antigravity CLI
Write-Host "[4/5] Memasang plugin Anti-Slop untuk Antigravity..." -ForegroundColor Yellow
if (Get-Command agy -ErrorAction SilentlyContinue) {
    agy plugin install https://github.com/miqdadbadjuber/anti-slop
} else {
    Write-Warning "Antigravity CLI ('agy') tidak ditemukan di active PATH."
}

# 5. Pasang UI/UX Pro Max CLI (npm global)
Write-Host "[5/5] Memastikan tool UI/UX CLI terpasang..." -ForegroundColor Yellow
if (-not (Get-Command ui-ux-pro-max-cli -ErrorAction SilentlyContinue)) {
    npm install -g ui-ux-pro-max-cli --registry=https://registry.npmjs.cf
}

Write-Host ">>> Setup selesai! Aturan aktif di ./AGENTS.md dan semua plugin terpasang." -ForegroundColor Green
