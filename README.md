# skr1pts

Custom shell configuration and utility scripts by [@und1sk0](https://github.com/und1sk0).  

This repository provides a highly-opinionated `.zshrc` setup tailored for **macOS (Intel & Apple Silicon)** with useful defaults, security-minded git helpers, AWS shortcuts, and quality-of-life functions for everyday development and operations work.  

---

## ✨ Features

- **Oh-My-Zsh Base** with randomized themes, Git plugin, and `vi` mode.  
- **macOS Path Handling**  
  - Dynamically adjusts `$PATH` for macOS Sonoma (14.x) and Sequoia (15.x).  
  - Adds Apple Silicon support with `/opt/homebrew/bin`.  
- **Convenient Aliases**  
  - Shortcuts for Git, Terraform (`tfa`, `tfp`, etc.), Kubernetes (`k`, `kd`, `kp`), and system tools.  
  - `vz` to edit and reload `.zshrc` instantly.  
- **Git Safety Nets**  
  - `gp` and `gpsup` prevent accidental pushes to `main` or `master`.  
  - `prune` helper cleans up stale local branches (with optional `-f` for force delete).  
- **AWS Utilities**  
  - `ssm` helper for starting AWS SSM sessions.  
  - Default AWS profile set to `default`.  
- **System Enhancements**  
  - Syntax highlighting for `less` output.  
  - `fm` to extract ffmpeg metadata.  
  - Colorized diffs with `colordiff`.  
- **Plugin Support**  
  - Bundles [`zi`](https://github.com/z-shell/zi) plugin manager for Zsh.  
  - Auto-sources additional configs from `$HOME/.zshconfig/*.zsh`.  
- **Rancher Desktop Integration** — automatically manages its PATH.  

---

## 🚀 Installation

Clone this repo and link the `.zshrc` into your home directory:  

```bash
git clone https://github.com/und1sk0/skr1pts.git ~/skr1pts
cp ~/skr1pts/.zshrc ~/.zshrc
source ~/.zshrc
```

> ⚠️ This will override your existing `~/.zshrc`. Back it up first if you need to preserve custom settings.  

---

## 🛠 Usage Highlights

- **Safe Git Push**  
  ```bash
  gp     # push current branch (fails if on main/master)
  gpsup  # push and set upstream (fails if on main/master)
  prune  # delete local branches with no remote tracking
  ```

- **Terraform**  
  ```bash
  tfi   # terraform init
  tfp   # terraform plan
  tfa   # terraform apply
  tfd   # terraform destroy
  tff   # terraform fmt
  ```

- **Kubernetes Contexts**  
  ```bash
  k     # kubectl
  kd    # use dev context
  kp    # use prod context
  ```

- **AWS**  
  ```bash
  ssm i-1234567890abcdef0   # start SSM session
  ```

---

## 📂 Extending

Place custom Zsh configs in `~/.zshconfig/*.zsh` and they will be automatically sourced on startup.  

---

## 🧑‍💻 Maintainer

[**und1sk0**](https://github.com/und1sk0)  

---

## 📜 License

MIT License © und1sk0  
