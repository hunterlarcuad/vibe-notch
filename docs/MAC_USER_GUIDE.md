**[中文](MAC_USER_GUIDE_CN.md) | English**

# Vibe Notch - Mac User Guide

## Introduction

Vibe Notch is a macOS menu bar app that provides Dynamic Island-style notch notifications for Claude Code CLI sessions. Once launched, it stays in the menu bar, allowing you to monitor session status and approve tool permissions without switching windows.

---

## Requirements

| Item | Requirement |
|------|-------------|
| OS | macOS 15.6 or later |
| Hardware | MacBook (with notch design) |
| Dependency | [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) installed |

---

## Installation

### Method 1: Download Pre-built Release (Recommended)

1. Go to the [Releases page](https://github.com/hunterlarcuad/vibe-notch/releases)
2. Download `Vibe-Notch-*-arm64-with-installer.zip`
3. Unzip and double-click `install.command` for one-click install

### Method 2: Manual Install

```bash
# Unzip
unzip Vibe-Notch-*.zip

# Copy to Applications
cp -R "Vibe Notch.app" /Applications/

# Remove quarantine attribute
xattr -dr com.apple.quarantine "/Applications/Vibe Notch.app"
```

### Method 3: Build from Source

```bash
# 1. Clone the repository
git clone https://github.com/hunterlarcuad/vibe-notch.git
cd vibe-notch

# 2. Build the app
xcodebuild -scheme ClaudeIsland -configuration Release build

# 3. Copy to Applications
cp -R "$(find ~/Library/Developer/Xcode/DerivedData -name 'Vibe Notch.app' -path '*/Release/*' | head -1)" /Applications/

# 4. Remove quarantine attribute
xattr -dr com.apple.quarantine "/Applications/Vibe Notch.app"
```

### First Launch After Installation

```bash
# Launch the app
open -a "Vibe Notch"
```

---

## Launch & Quit

### Launch Methods

- **Spotlight**: `Cmd + Space`, search for `Vibe Notch` and press Enter
- **Launchpad**: Find and click it in Launchpad
- **Terminal**: `open -a "Vibe Notch"`
- **Login Item**: Add it in System Settings → General → Login Items & Extensions

### App Behavior

- Does **NOT appear in Dock** after launch (LSUIElement mode)
- Only shows a status icon in the **menu bar**
- Click the menu bar icon to open the settings panel

### Quit Methods

- Click the menu bar icon → Select "Quit"
- Or force quit `Vibe Notch` process in Activity Monitor

---

## Auto Configuration

On first launch, the app automatically sets up:

```
~/.claude/hooks/
├── hook.sh          # Main hook script
└── ...              # Related config files
```

These hooks communicate with the app via Unix socket — **no manual configuration needed**.

To reinstall hooks, delete the directory above and restart the app.

---

## Core Features

### 1. Notch Notifications

After launching, a compact status indicator appears in the MacBook notch area. When Claude Code has activity, the notification area smoothly expands to show current session information.

### 2. Session Monitoring

| Status | Display | Description |
|--------|---------|-------------|
| Idle | Gray/Silent | No active Claude sessions |
| Processing | Animated indicator | Claude is executing an action |
| Waiting | Expanded notification | User approval needed for tool execution |
| Ended | Auto-dismiss | Session has closed |

Supports **monitoring multiple** `claude` sessions simultaneously, each with independent status display.

### 3. Permission Approval

When Claude Code needs to execute a tool (e.g., writing files, running commands) and requires permission:

1. The notch area **auto-expands**, showing the tool name and input parameters
2. Click **"Approve"** → Tool executes
3. Click **"Deny"** → Tool is skipped

No need to switch to the terminal window — complete the operation directly from the notch area.

### 4. Chat History

Click the notification area to view the full conversation history of the current session:

- Supports **Markdown rendering** (code blocks, headings, lists, etc.)
- Shows tool call processes and results
- Real-time scrolling updates

### 5. Multi-Session Management

When running multiple `claude` instances simultaneously (different terminal windows), Vibe Notch automatically detects and monitors them separately:

- Each session displays its project name independently
- Click to switch between different sessions
- Sorted by project name

---

## Daily Usage Flow

```
1. Launch Vibe Notch
      ↓
2. Open terminal, run claude command as usual
      ↓
3. Notch area automatically shows session status
      ↓
4. When approval is needed, notch expands → Click action
      ↓
5. When done, exit Claude or close the app
```

---

## FAQ

### Q: The notch doesn't show after launching?

- Confirm you're using a MacBook with a notch design
- Confirm Claude Code CLI is installed and you've run `claude` in the terminal at least once
- Check if hook files exist under `~/.claude/hooks/`

### Q: Permission approvals don't work?

- Confirm the Claude session in the terminal is still running (not exited)
- Restart the app and try again

### Q: App won't launch, shows security warning?

```bash
xattr -dr com.apple.quarantine "/Applications/Vibe Notch.app"
open -a "Vibe Notch"
```

### Q: How to completely uninstall?

```bash
# 1. Quit the app
osascript -e 'tell application "Vibe Notch" to quit'

# 2. Delete the app
rm -rf "/Applications/Vibe Notch.app"

# 3. Delete hooks
rm -rf ~/.claude/hooks/

# 4. Delete preferences
rm -rf ~/Library/Preferences/com.celestial.ClaudeIsland.plist
```

---

## Privacy

This fork (hunterlarcuad/vibe-notch) has **completely removed** the original project's Mixpanel analytics:

- No device identifiers collected
- No app usage events reported
- No Claude Code session files scanned
- No version information collected

All data processing is done locally with no network requests (except Sparkle auto-update checks).

---

## Project Info

- **Repository**: https://github.com/hunterlarcuad/vibe-notch
- **Upstream**: https://github.com/farouqaldori/vibe-notch
- **License**: Apache 2.0
