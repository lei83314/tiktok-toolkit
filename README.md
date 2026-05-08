# 🎬 tiktok-toolkit

> 我的 TikTok / 抖音素材一条龙处理工具集

把"下载 → 自动剪辑 → 转竖屏"这条流水线封装成几个一键脚本，
适合做**跨境内容营销**的人快速二次加工短视频素材。

## 🧰 依赖工具

| 工具 | 作用 | 安装 |
|---|---|---|
| [yt-dlp](https://github.com/yt-dlp/yt-dlp) | 从 2000+ 网站下载视频 | `brew install yt-dlp` |
| [auto-editor](https://github.com/WyattBlue/auto-editor) | 自动删除静音段 | `pipx install auto-editor` |
| [ffmpeg](https://ffmpeg.org/) | 视频转码 / 缩放 | `brew install ffmpeg` |

## 🚀 使用

```bash
# 1. 下载视频（支持抖音/TikTok/YouTube/B站等）
./scripts/download.sh "https://www.tiktok.com/@xxx/video/12345"

# 2. 自动剪辑 + 转 1080x1920 竖屏
./scripts/edit.sh raw.mp4
```

## 📂 目录结构

```
tiktok-toolkit/
├── README.md
├── scripts/
│   ├── download.sh    # 下载脚本
│   └── edit.sh        # 剪辑脚本
└── .gitignore         # 忽略下载的视频文件
```

## 📝 License

MIT
