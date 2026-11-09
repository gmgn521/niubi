-- 可重复执行：创建/更新桶，并重建本项目的两条访问策略。
insert into storage.buckets (id,name,public,file_size_limit,allowed_mime_types)
values ('community-voices','community-voices',true,2097152,array['audio/webm'])
on conflict (id) do update set public=true,file_size_limit=2097152,allowed_mime_types=array['audio/webm'];

drop policy if exists "Anyone can upload a community voice" on storage.objects;
drop policy if exists "Anyone can list community voices" on storage.objects;

create policy "Anyone can upload a community voice"
on storage.objects for insert to anon
with check (bucket_id='community-voices' and name ~ '^voice-[a-f0-9-]+[.]webm$');

create policy "Anyone can list community voices"
on storage.objects for select to anon
using (bucket_id='community-voices');
