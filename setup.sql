-- À coller dans Supabase > SQL Editor, puis « Run »
create table public.classement (
  pseudo text primary key check (char_length(pseudo) between 1 and 24),
  score int not null check (score between 0 and 100),
  updated_at timestamptz not null default now()
);

alter table public.classement enable row level security;

create policy "lecture" on public.classement for select to anon using (true);
create policy "ajout"   on public.classement for insert to anon with check (true);
create policy "maj"     on public.classement for update to anon using (true) with check (true);
