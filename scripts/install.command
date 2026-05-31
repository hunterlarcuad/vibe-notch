#!/bin/bash
# Vibe Notch 一键安装脚本
# 双击此文件即可安装

set -e

APP_NAME="Vibe Notch"
SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="/Applications"

echo "正在安装 $APP_NAME..."
echo ""

# 检查是否存在 .app 文件
if [ ! -d "$SOURCE_DIR/$APP_NAME.app" ]; then
    echo "错误：未找到 $APP_NAME.app"
    echo "请确保此脚本与 $APP_NAME.app 在同一目录"
    echo ""
    read -p "按回车键退出..."
    exit 1
fi

# 复制到 /Applications
if [ -d "$TARGET_DIR/$APP_NAME.app" ]; then
    echo "检测到已安装旧版本，正在更新..."
    rm -rf "$TARGET_DIR/$APP_NAME.app"
fi

cp -R "$SOURCE_DIR/$APP_NAME.app" "$TARGET_DIR/"
echo "✓ 已复制到 $TARGET_DIR"

# 移除隔离属性
xattr -dr com.apple.quarantine "$TARGET_DIR/$APP_NAME.app" 2>/dev/null || true
echo "✓ 已移除安全隔离"

# 启动应用
open -a "$APP_NAME"
echo "✓ 应用已启动"

echo ""
echo "安装完成！"
echo "可在启动台或 Spotlight 中找到 $APP_NAME"
echo ""
read -p "按回车键关闭此窗口..."
