#!/usr/bin/env bash
# 一键下载视频（支持 TikTok / 抖音 / YouTube / B站 / Instagram 等 2000+ 网站）
#
# 用法:
#   ./scripts/download.sh "<视频链接>"
#   ./scripts/download.sh "<链接1>" "<链接2>" ...
#
# 输出: ./downloads/<上传日期>_<标题>.mp4

set -euo pipefail

if [ "$#" -eq 0 ]; then
  echo "用法: $0 <视频链接> [更多链接...]"
  exit 1
fi

OUTDIR="./downloads"
mkdir -p "$OUTDIR"

# 默认从 Chrome 借 cookies（抖音/小红书等中文站点必需）
# 可用环境变量切换浏览器: BROWSER=safari ./scripts/download.sh ...
BROWSER="${BROWSER:-chrome}"

for url in "$@"; do
  echo "⬇️  下载: $url  (cookies from $BROWSER)"
  yt-dlp \
    --cookies-from-browser "$BROWSER" \
    -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
    --merge-output-format mp4 \
    --write-thumbnail \
    --convert-thumbnails jpg \
    -o "$OUTDIR/%(upload_date)s_%(title).80s.%(ext)s" \
    "$url"
done

echo "✅ 全部完成，文件在 $OUTDIR/"
