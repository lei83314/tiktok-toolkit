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

> 💡 默认从 Chrome 借 cookies。换浏览器：`BROWSER=safari ./scripts/download.sh ...`

## ✅ 测试状态

| 脚本 | 状态 | 备注 |
|---|---|---|
| `edit.sh` | ✅ 通过 | 在 10s 测试视频上验证：自动剪掉 5.8s 静音段，转 1080×1920 竖屏 |
| `download.sh` (YouTube) | 🟡 未测 | 理论可用，TODO 加测试 |
| `download.sh` (TikTok 国际版) | 🟡 未测 | 理论可用 |
| `download.sh` (抖音) | ⚠️ 受限 | yt-dlp `2026.3.17` 当前被抖音反爬卡，见下方 |

## ⚠️ 已知问题

### 抖音下载失败：`Fresh cookies (not necessarily logged in) are needed`

**原因**：抖音 2026 年初升级了反爬策略，yt-dlp 当前 master 分支（`2026.3.17`）尚未跟进修复。

**临时绕过尝试**：
1. 完全退出 Chrome（`Cmd+Q`，确保后台进程也退）
2. `yt-dlp --update-to nightly` 检查是否有新版
3. 用 TikTok 国际版（`tiktok.com`）或 YouTube 替代源

**长期方案**：关注 https://github.com/yt-dlp/yt-dlp/issues 抖音相关 issue，等社区修复后 `brew upgrade yt-dlp` 即可。

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
