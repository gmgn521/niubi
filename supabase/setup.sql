-- 在 Supabase Dashboard → SQL Editor → New query 中粘贴并运行。
-- 录音最多 5 秒，前端限制；存储桶限制为 2MB，仅接收 audio/webm。
insert into storage.buckets (id,name,public,file_size_limit,allowed_mime_types)
values ('community-voices','community-voices',true,2097152,array['audio/webm'])
on conflict (id) do update set public=true,file_size_limit=2097152,allowed_mime_types=array['audio/webm'];

-- 允许访客上传新录音；文件名由浏览器随机生成，禁止覆盖已有录音。
create policy "Anyone can upload a community voice"
on storage.objects for insert to anon
with check (bucket_id='community-voices' and name ~ '^voice-[a-f0-9-]+[.]webm$');

-- 允许访客列出本桶录音以便页面播放。
create policy "Anyone can list community voices"
on storage.objects for select to anon
using (bucket_id='community-voices');
