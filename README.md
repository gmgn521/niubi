# 牛逼社区声场网站

## 先预览
打开 `index.html`。无后端设置时上传与声音库会显示未配置提示，不会播放合成语音。

## 启用 Supabase（一次性）
1. 登录 Supabase，打开项目 `czdunmaepyosbtiwhdvr`。
2. 左侧打开 **SQL Editor** → **New query**。
3. 打开本文件夹 `supabase/setup.sql`，全选复制，粘贴进 SQL Editor，点击 **Run**。
4. 上传本文件夹全部文件到 HTTPS 静态托管（如 GitHub Pages）。麦克风权限要求 HTTPS 或 localhost。
5. 部署成功后打开网站，允许麦克风；录音最多 5 秒。先试听，再点击确认上传。访客开启声场后听取已上传录音。

网站已经填入项目 URL 和 publishable key。该 key 是面向浏览器的公开密钥，权限受 RLS 策略限制；绝不可把 `sb_secret_...` 或数据库密码放入页面。

## 录音知情与管理
上传前页面告知录音会公开播放，并需用户主动同意、录制、试听及再次确认。录音公开可访问；网站访客可上传内容，维护者需定期检查并在 Storage → community-voices 删除不当或被请求删除的对象。SQL 允许任意访客上传，公开网站可能遭遇滥用或存储费用；如流量较大，应增加验证码/审核后发布流程与速率限制。

## 部署 GitHub Pages
1. 将本目录所有文件上传到 GitHub 仓库根目录。
2. 仓库 Settings → Pages → Build and deployment 选择 Deploy from a branch，分支选 main、目录选 /(root)，保存。
3. 等待 Pages 给出 HTTPS 网站地址。把地址发给我，我可继续帮你检查上线效果。

图片：`assets/x-artwork.webp` 为金色 X 参考图，`assets/origin-post.png` 为帖子截图。项目为非官方社区 meme，不代表 Elon Musk 或 X 背书；DYOR，风险自担。
