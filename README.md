**[中文](README_CN.md) | English**

<div align="center">
  <img src="ClaudeIsland/Assets.xcassets/AppIcon.appiconset/icon_128x128.png" alt="Logo" width="100" height="100">
  <h3 align="center">Vibe Notch (previously Claude Island)</h3>
  <p align="center">
    A macOS menu bar app that brings Dynamic Island-style notifications to Claude Code CLI sessions.
    <br />
    <br />
    <a href="https://github.com/farouqaldori/vibe-notch/releases/latest" target="_blank" rel="noopener noreferrer">
      <img src="https://img.shields.io/github/v/release/farouqaldori/vibe-notch?style=rounded&color=white&labelColor=000000&label=release" alt="Release Version" />
    </a>
    <a href="#" target="_blank" rel="noopener noreferrer">
      <img alt="GitHub Downloads" src="https://img.shields.io/github/downloads/farouqaldori/vibe-notch/total?style=rounded&color=white&labelColor=000000">
    </a>
  </p>
</div>

> **🟢 Actively maintained**
>
> Launched v1.2 in December 2025, then took a 4-month break. v1.3 (April 2026) works through the backlog of contributor PRs and bug reports and kicks off a regular cadence again. Open PRs and issues are being reviewed — thanks for your patience.

## Features

- **Notch UI** — Animated overlay that expands from the MacBook notch
- **Live Session Monitoring** — Track multiple Claude Code sessions in real-time
- **Permission Approvals** — Approve or deny tool executions directly from the notch
- **Chat History** — View full conversation history with markdown rendering
- **Auto-Setup** — Hooks install automatically on first launch

## Requirements

- macOS 15.6+
- Claude Code CLI

## Install

Download the latest release:

👉 **[Releases Page](https://github.com/hunterlarcuad/vibe-notch/releases)**

### One-Click Install

1. Download `Vibe-Notch-*-arm64-with-installer.zip`
2. Unzip and double-click `install.command`
3. Done!

### Manual Install

```bash
# Unzip
unzip Vibe-Notch-*.zip
# Copy to Applications
cp -R "Vibe Notch.app" /Applications/
# Remove quarantine attribute
xattr -dr com.apple.quarantine "/Applications/Vibe Notch.app"
```

### Build from Source

```bash
git clone https://github.com/hunterlarcuad/vibe-notch.git
cd vibe-notch
xcodebuild -scheme ClaudeIsland -configuration Release build
```

## Usage

For detailed usage instructions, see: [docs/MAC_USER_GUIDE.md](docs/MAC_USER_GUIDE.md)

## Privacy

This fork has **completely removed** Mixpanel analytics. No usage data is collected.

## License

Apache 2.0
