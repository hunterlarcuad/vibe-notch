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

👉 **[Releases 页面](https://github.com/hunterlarcuad/vibe-notch/releases)**

### 一键安装

1. 下载 `Vibe-Notch-*-arm64-with-installer.zip`
2. 解压后双击 `install.command`
3. 完成

### 手动安装

```bash
# 解压 zip
unzip Vibe-Notch-*.zip
# 复制到应用程序
cp -R "Vibe Notch.app" /Applications/
# 移除安全隔离
xattr -dr com.apple.quarantine "/Applications/Vibe Notch.app"
```

### 从源码构建

```bash
git clone https://github.com/hunterlarcuad/vibe-notch.git
cd vibe-notch
xcodebuild -scheme ClaudeIsland -configuration Release build
```

## 使用说明

详细使用说明请参考：[docs/MAC_USER_GUIDE.md](docs/MAC_USER_GUIDE.md)

## Privacy

本 fork 版本已**完全移除** Mixpanel 数据上报，不采集任何使用数据。

## License

Apache 2.0
