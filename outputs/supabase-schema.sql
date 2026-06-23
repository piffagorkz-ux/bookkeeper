create table if not exists public.clients (
  id text primary key,
  name text not null,
  phone text default '',
  email text default '',
  note text default '',
  created_at timestamptz not null default now()
);

create table if not exists public.firms (
  id text primary key,
  client_id text not null references public.clients(id) on delete cascade,
  name text not null,
  inn text default '',
  regime text not null default 'УСН доходы',
  status text not null default 'ok',
  created_at timestamptz not null default now()
);

create table if not exists public.tasks (
  id text primary key,
  firm_id text not null references public.firms(id) on delete cascade,
  title text not null,
  due date,
  status text not null default 'open',
  created_at timestamptz not null default now()
);

create table if not exists public.docs (
  id text primary key,
  firm_id text not null references public.firms(id) on delete cascade,
  title text not null,
  period text default '',
  status text not null default 'new',
  created_at timestamptz not null default now()
);

alter table public.clients enable row level security;
alter table public.firms enable row level security;
alter table public.tasks enable row level security;
alter table public.docs enable row level security;

drop policy if exists "buhpult_clients_read" on public.clients;
drop policy if exists "buhpult_clients_insert" on public.clients;
drop policy if exists "buhpult_clients_update" on public.clients;
drop policy if exists "buhpult_clients_delete" on public.clients;

drop policy if exists "buhpult_firms_read" on public.firms;
drop policy if exists "buhpult_firms_insert" on public.firms;
drop policy if exists "buhpult_firms_update" on public.firms;
drop policy if exists "buhpult_firms_delete" on public.firms;

drop policy if exists "buhpult_tasks_read" on public.tasks;
drop policy if exists "buhpult_tasks_insert" on public.tasks;
drop policy if exists "buhpult_tasks_update" on public.tasks;
drop policy if exists "buhpult_tasks_delete" on public.tasks;

drop policy if exists "buhpult_docs_read" on public.docs;
drop policy if exists "buhpult_docs_insert" on public.docs;
drop policy if exists "buhpult_docs_update" on public.docs;
drop policy if exists "buhpult_docs_delete" on public.docs;

create policy "buhpult_clients_read" on public.clients for select to anon using (true);
create policy "buhpult_clients_insert" on public.clients for insert to anon with check (true);
create policy "buhpult_clients_update" on public.clients for update to anon using (true) with check (true);
create policy "buhpult_clients_delete" on public.clients for delete to anon using (true);

create policy "buhpult_firms_read" on public.firms for select to anon using (true);
create policy "buhpult_firms_insert" on public.firms for insert to anon with check (true);
create policy "buhpult_firms_update" on public.firms for update to anon using (true) with check (true);
create policy "buhpult_firms_delete" on public.firms for delete to anon using (true);

create policy "buhpult_tasks_read" on public.tasks for select to anon using (true);
create policy "buhpult_tasks_insert" on public.tasks for insert to anon with check (true);
create policy "buhpult_tasks_update" on public.tasks for update to anon using (true) with check (true);
create policy "buhpult_tasks_delete" on public.tasks for delete to anon using (true);

create policy "buhpult_docs_read" on public.docs for select to anon using (true);
create policy "buhpult_docs_insert" on public.docs for insert to anon with check (true);
create policy "buhpult_docs_update" on public.docs for update to anon using (true) with check (true);
create policy "buhpult_docs_delete" on public.docs for delete to anon using (true);

create index if not exists firms_client_id_idx on public.firms(client_id);
create index if not exists tasks_firm_id_idx on public.tasks(firm_id);
create index if not exists docs_firm_id_idx on public.docs(firm_id);
