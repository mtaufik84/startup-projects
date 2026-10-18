# setup.ps1 - Automated Setup for Antigravity & Agent Tooling

$RepoRawUrl = "https://raw.githubusercontent.com/<USERNAME>/<REPO_NAME>/main"

Write-Host ">>> Inisialisasi Ekosistem AI Agent..." -ForegroundColor Cyan

# 1. Unduh AGENTS.md (jika sudah ada di repo)
try {
    Invoke-WebRequest -Uri "$RepoRawUrl/AGENTS.md" -OutFile "AGENTS.md" -ErrorAction Stop
    Write-Host "[1/5] Berhasil mengunduh AGENTS.md" -ForegroundColor Green
} catch {
    Write-Host "[1/5] AGENTS.md belum ada di repo, lewati langkah ini." -ForegroundColor Yellow
}

# 2. Pasang & Hubungkan RTK (Rust Token Killer)
Write-Host "[2/5] Menyiapkan RTK (Rust Token Killer)..." -ForegroundColor Yellow
if (-not (Get-Command rtk -ErrorAction SilentlyContinue)) {
    winget install rtk-ai.rtk --accept-source-agreements --accept-package-agreements
}
if (Get-Command rtk -ErrorAction SilentlyContinue) {
    rtk init --agent antigravity
}

# 3. Pasang Plugin Ponytail ke Antigravity CLI
Write-Host "[3/5] Memasang plugin Ponytail..." -ForegroundColor Yellow
if (Get-Command agy -ErrorAction SilentlyContinue) {
    agy plugin install https://github.com/DietrichGebert/ponytail
}

# 4. Pasang Plugin Anti-Slop ke Antigravity CLI
Write-Host "[4/5] Memasang plugin Anti-Slop..." -ForegroundColor Yellow
if (Get-Command agy -ErrorAction SilentlyContinue) {
    agy plugin install https://github.com/miqdadbadjuber/anti-slop
}

# 5. Pasang dan Inisialisasi UI/UX Pro Max untuk Antigravity
Write-Host "[5/5] Menyiapkan UI/UX Pro Max..." -ForegroundColor Yellow
if (-not (Get-Command uipro -ErrorAction SilentlyContinue)) {
    npm install -g ui-ux-pro-max-cli
}
if (Get-Command uipro -ErrorAction SilentlyContinue) {
    uipro init --ai antigravity
}

Write-Host ">>> Setup selesai! Semua plugin dan skill siap digunakan." -ForegroundColor Green
