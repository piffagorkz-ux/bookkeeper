# БухПульт

Мобильное web-приложение для бухгалтера: клиенты, фирмы, задачи и документы.

## Supabase

1. Создайте проект в Supabase.
2. Откройте SQL Editor.
3. Выполните `supabase-schema.sql`.
4. Скопируйте Project URL и anon public key.
5. Заполните `config.js`:

```js
window.BUHPULT_CONFIG = {
  supabaseUrl: "https://your-project-ref.supabase.co",
  supabaseAnonKey: "your-public-anon-key"
};
```

## Cloudflare Pages

В Cloudflare Pages укажите:

- build command: пусто
- build output directory: `outputs`

## Локальный запуск

Откройте `accountant-mobile.html` через локальный сервер или деплойте папку `outputs`.

Важно: текущая SQL-схема разрешает доступ через anon key. Для публичного продакшена добавьте Supabase Auth и политики по пользователю.

## Обновление базы

Если приложение уже было запущено раньше, повторно выполните `supabase-schema.sql` в SQL Editor. Скрипт добавит недостающие поля карточки клиента через `alter table ... add column if not exists` и не удалит существующие записи.
