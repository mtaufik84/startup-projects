# Antigravity & Agent Tooling Automated Setup

Skrip otomatisasi PowerShell (`setup.ps1`) untuk menginisialisasi dan mengonfigurasi ekosistem **Google Antigravity** dan AI Coding Agent secara optimal, hemat token, dan bebas redundansi.

---

## 🚀 Fitur Utama

Skrip ini menjalankan 6 langkah otomatisasi:

1. **Unduh `AGENTS.md`**: Mengambil file konfigurasi dan pedoman aturan proyek tingkat root langsung dari repositori GitHub.
2. **Pasang & Konfigurasi RTK (*Rust Token Killer*)**:
   - Mengunduh dan memasang `rtk` via `winget`.
   - Mengaitkan hook otomatis ke Antigravity (`rtk init --agent antigravity`) untuk memangkas output terminal yang tidak perlu sehingga menghemat kuota token AI.
3. **Pasang Plugin Ponytail**:
   - Mengintegrasikan plugin *lazy senior dev mode* (YAGNI, arsitektur minimalis, dan pencegahan *over-engineering*).
4. **Pasang Plugin Anti-Slop**:
   - Memasang guardrail kualitas teks dan antarmuka untuk mencegah hasil desain dan kode yang generik/klise khas AI.
5. **Pasang & Inisialisasi UI/UX Pro Max**:
   - Memasang tool CLI `ui-ux-pro-max-cli` secara global via npm.
   - Menginisialisasi katalog intelijen UI/UX (79 style, 192 palet warna, stack tips) ke Antigravity (`uipro init --ai antigravity`).
6. **Pembersihan Sub-Skill Redundan (Optimasi Context Window)**:
   - Secara otomatis menghapus pecahan sub-skill terduplikasi di `.agents/skills/` (`banner-design`, `slides`, `brand`, `design-system`, `ui-styling`).
   - Menyisakan master skill **`design`** dan **`ui-ux-pro-max`** agar context prompt AI tidak boros.

---

## 📋 Prasyarat Sistem

Sebelum menjalankan skrip, pastikan sistem Anda memenuhi persyaratan berikut:

- **Sistem Operasi**: Windows 10 / 11
- **PowerShell**: PowerShell 5.1 atau PowerShell 7 Core
- **Package Manager**:
  - [Winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/) (bawaan Windows 10/11)
  - [Node.js & npm](https://nodejs.org/) (diperlukan untuk UI/UX Pro Max CLI)
- **Antigravity CLI**: Perintah `agy` sudah terpasang dan dapat diakses dari terminal.

---

## 💻 Cara Menjalankan

### 1. Jalankan Skrip Lokal
Buka PowerShell di direktori proyek, lalu jalankan:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\setup.ps1
```

> [!TIP]
> Jika `setup.ps1` belum ada di direktori lokal, simpan kode skrip tersebut dengan nama `setup.ps1` di root proyek Anda.

### 2. Jalankan Langsung dari URL (Remote Execution)
Jika skrip sudah di-push ke repositori GitHub Anda:

```powershell
irm https://raw.githubusercontent.com/mtaufik84/startup-projects/main/setup.ps1 | iex
```

---

## 📁 Struktur Setelah Setup Berjalan

Setelah skrip selesai dieksekusi, struktur folder agent Anda akan menjadi seperti berikut:

```text
proyek-anda/
├── AGENTS.md                  # Aturan & pedoman proyek (jika diunduh)
├── setup.ps1                  # Skrip setup otomatis
├── README.md                  # Dokumentasi ini
└── .agents/
    ├── rules/
    │   └── antigravity-rtk-rules.md   # Aturan otomatis untuk RTK
    └── skills/
        ├── design/            # Master skill desain, branding, logo, banner & slides
        └── ui-ux-pro-max/     # Intelijen desain sistem, komponen & UX guidelines
```

---

## 🛠️ Catatan & Troubleshooting

- **Binary belum terbaca setelah instalasi**:
  Skrip sudah dilengkapi fitur auto-refresh environment `$env:Path`. Namun jika perintah seperti `rtk` atau `uipro` masih tidak dikenali, tutup dan buka kembali jendela PowerShell Anda.
- **Izin Eksekusi Skrip Ditolak**:
  Jalankan perintah berikut sebelum mengeksekusi skrip:
  ```powershell
  Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
  ```
- **Repositori Target**:
  Variabel `$RepoRawUrl` di baris atas `setup.ps1` dapat Anda sesuaikan ke repositori dan branch pribadi Anda.
