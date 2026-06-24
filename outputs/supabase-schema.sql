create table if not exists public.clients (
  id text primary key,
  user_id uuid default auth.uid(),
  date date,
  name text not null,
  bin_iin text default '',
  registration_date date,
  director_name text default '',
  legal_address text default '',
  actual_address text default '',
  phone text default '',
  email text default '',
  activity_sphere text default '',
  oked text default '',
  taxpayer_type text default '',
  vat_info text default '',
  bank_name text default '',
  bik text default '',
  account_number text default '',
  bank_contact text default '',
  license_info text default '',
  import_export text default '',
  passwords text default '',
  ecp text default '',
  is_esf text default '',
  enbek text default '',
  bank_access text default '',
  cloud_1c text default '',
  tax_reporting text default '',
  statistics text default '',
  contract_info text default '',
  payment_terms text default '',
  note text default '',
  created_at timestamptz not null default now()
);

alter table public.clients add column if not exists date date;
alter table public.clients add column if not exists user_id uuid default auth.uid();
alter table public.clients add column if not exists bin_iin text default '';
alter table public.clients add column if not exists registration_date date;
alter table public.clients add column if not exists director_name text default '';
alter table public.clients add column if not exists legal_address text default '';
alter table public.clients add column if not exists actual_address text default '';
alter table public.clients add column if not exists activity_sphere text default '';
alter table public.clients add column if not exists oked text default '';
alter table public.clients add column if not exists taxpayer_type text default '';
alter table public.clients add column if not exists vat_info text default '';
alter table public.clients add column if not exists bank_name text default '';
alter table public.clients add column if not exists bik text default '';
alter table public.clients add column if not exists account_number text default '';
alter table public.clients add column if not exists bank_contact text default '';
alter table public.clients add column if not exists license_info text default '';
alter table public.clients add column if not exists import_export text default '';
alter table public.clients add column if not exists passwords text default '';
alter table public.clients add column if not exists ecp text default '';
alter table public.clients add column if not exists is_esf text default '';
alter table public.clients add column if not exists enbek text default '';
alter table public.clients add column if not exists bank_access text default '';
alter table public.clients add column if not exists cloud_1c text default '';
alter table public.clients add column if not exists tax_reporting text default '';
alter table public.clients add column if not exists statistics text default '';
alter table public.clients add column if not exists contract_info text default '';
alter table public.clients add column if not exists payment_terms text default '';

create table if not exists public.firms (
  id text primary key,
  user_id uuid default auth.uid(),
  client_id text not null references public.clients(id) on delete cascade,
  date date,
  name text not null,
  inn text default '',
  bin_iin text default '',
  registration_date date,
  director_name text default '',
  legal_address text default '',
  actual_address text default '',
  regime text not null default 'УСН доходы',
  status text not null default 'ok',
  phone text default '',
  email text default '',
  activity_sphere text default '',
  oked text default '',
  taxpayer_type text default '',
  vat_info text default '',
  bank_name text default '',
  bik text default '',
  account_number text default '',
  bank_contact text default '',
  license_info text default '',
  import_export text default '',
  passwords text default '',
  ecp text default '',
  is_esf text default '',
  enbek text default '',
  bank_access text default '',
  cloud_1c text default '',
  tax_reporting text default '',
  statistics text default '',
  contract_info text default '',
  payment_terms text default '',
  note text default '',
  created_at timestamptz not null default now()
);

alter table public.firms add column if not exists date date;
alter table public.firms add column if not exists user_id uuid default auth.uid();
alter table public.firms add column if not exists bin_iin text default '';
alter table public.firms add column if not exists registration_date date;
alter table public.firms add column if not exists director_name text default '';
alter table public.firms add column if not exists legal_address text default '';
alter table public.firms add column if not exists actual_address text default '';
alter table public.firms add column if not exists phone text default '';
alter table public.firms add column if not exists email text default '';
alter table public.firms add column if not exists activity_sphere text default '';
alter table public.firms add column if not exists oked text default '';
alter table public.firms add column if not exists taxpayer_type text default '';
alter table public.firms add column if not exists vat_info text default '';
alter table public.firms add column if not exists bank_name text default '';
alter table public.firms add column if not exists bik text default '';
alter table public.firms add column if not exists account_number text default '';
alter table public.firms add column if not exists bank_contact text default '';
alter table public.firms add column if not exists license_info text default '';
alter table public.firms add column if not exists import_export text default '';
alter table public.firms add column if not exists passwords text default '';
alter table public.firms add column if not exists ecp text default '';
alter table public.firms add column if not exists is_esf text default '';
alter table public.firms add column if not exists enbek text default '';
alter table public.firms add column if not exists bank_access text default '';
alter table public.firms add column if not exists cloud_1c text default '';
alter table public.firms add column if not exists tax_reporting text default '';
alter table public.firms add column if not exists statistics text default '';
alter table public.firms add column if not exists contract_info text default '';
alter table public.firms add column if not exists payment_terms text default '';
alter table public.firms add column if not exists note text default '';

create table if not exists public.tasks (
  id text primary key,
  user_id uuid default auth.uid(),
  firm_id text not null references public.firms(id) on delete cascade,
  title text not null,
  due date,
  status text not null default 'open',
  created_at timestamptz not null default now()
);

alter table public.tasks add column if not exists user_id uuid default auth.uid();

create table if not exists public.docs (
  id text primary key,
  user_id uuid default auth.uid(),
  firm_id text not null references public.firms(id) on delete cascade,
  title text not null,
  period text default '',
  status text not null default 'new',
  created_at timestamptz not null default now()
);

alter table public.docs add column if not exists user_id uuid default auth.uid();

alter table public.clients enable row level security;
alter table public.firms enable row level security;
alter table public.tasks enable row level security;
alter table public.docs enable row level security;

grant usage on schema public to anon, authenticated;
revoke all on public.clients from anon;
revoke all on public.firms from anon;
revoke all on public.tasks from anon;
revoke all on public.docs from anon;
grant select, insert, update, delete on public.clients to authenticated;
grant select, insert, update, delete on public.firms to authenticated;
grant select, insert, update, delete on public.tasks to authenticated;
grant select, insert, update, delete on public.docs to authenticated;

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

create policy "buhpult_clients_read" on public.clients for select to authenticated using (user_id = auth.uid());
create policy "buhpult_clients_insert" on public.clients for insert to authenticated with check (user_id = auth.uid());
create policy "buhpult_clients_update" on public.clients for update to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());
create policy "buhpult_clients_delete" on public.clients for delete to authenticated using (user_id = auth.uid());

create policy "buhpult_firms_read" on public.firms for select to authenticated using (user_id = auth.uid());
create policy "buhpult_firms_insert" on public.firms for insert to authenticated with check (user_id = auth.uid());
create policy "buhpult_firms_update" on public.firms for update to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());
create policy "buhpult_firms_delete" on public.firms for delete to authenticated using (user_id = auth.uid());

create policy "buhpult_tasks_read" on public.tasks for select to authenticated using (user_id = auth.uid());
create policy "buhpult_tasks_insert" on public.tasks for insert to authenticated with check (user_id = auth.uid());
create policy "buhpult_tasks_update" on public.tasks for update to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());
create policy "buhpult_tasks_delete" on public.tasks for delete to authenticated using (user_id = auth.uid());

create policy "buhpult_docs_read" on public.docs for select to authenticated using (user_id = auth.uid());
create policy "buhpult_docs_insert" on public.docs for insert to authenticated with check (user_id = auth.uid());
create policy "buhpult_docs_update" on public.docs for update to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());
create policy "buhpult_docs_delete" on public.docs for delete to authenticated using (user_id = auth.uid());

create index if not exists firms_client_id_idx on public.firms(client_id);
create index if not exists tasks_firm_id_idx on public.tasks(firm_id);
create index if not exists docs_firm_id_idx on public.docs(firm_id);
create index if not exists clients_user_id_idx on public.clients(user_id);
create index if not exists firms_user_id_idx on public.firms(user_id);
create index if not exists tasks_user_id_idx on public.tasks(user_id);
create index if not exists docs_user_id_idx on public.docs(user_id);
