export async function onRequest(context) {
  const supabaseUrl = context.env.SUPABASE_URL || "";
  const supabaseAnonKey = context.env.SUPABASE_ANON_KEY || "";

  return new Response(
    `window.BUHPULT_CONFIG = ${JSON.stringify({ supabaseUrl, supabaseAnonKey })};`,
    {
      headers: {
        "content-type": "application/javascript; charset=utf-8",
        "cache-control": "no-store"
      }
    }
  );
}
