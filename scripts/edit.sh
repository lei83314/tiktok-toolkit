#!/usr/bin/env bash
# 一键剪辑：自动去静音 + 转 1080x1920 竖屏（TikTok/抖音/Reels 标准比例）
#
# 用法:
#   ./scripts/edit.sh <input.mp4>
#
# 输出:
#   <input>_final.mp4  (1080x1920 竖屏, H.264, 适合直接上传)

set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "用法: $0 <input.mp4>"
  exit 1
fi

INPUT="$1"
BASE="${INPUT%.*}"
TRIMMED="${BASE}_trimmed.mp4"
FINAL="${BASE}_final.mp4"

echo "✂️  Step 1/2: 自动剪掉静音段..."
auto-editor "$INPUT" --output "$TRIMMED" --no-open

echo "📐  Step 2/2: 转 1080x1920 竖屏..."
ffmpeg -y -i "$TRIMMED" \
  -vf "scale=1080:1920:force_original_aspect_ratio=decrease,pad=1080:1920:(ow-iw)/2:(oh-ih)/2:black" \
  -c:v libx264 -crf 20 -preset fast \
  -c:a aac -b:a 192k \
  "$FINAL"

rm -f "$TRIMMED"
echo "✅ 完成: $FINAL"
