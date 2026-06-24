export default {
  async fetch(request, env) {
    const url = new URL(request.url);

    if (url.pathname === "/config.js") {
      return new Response(
        `window.BUHPULT_CONFIG = ${JSON.stringify({
          supabaseUrl: env.SUPABASE_URL || "",
          supabaseAnonKey: env.SUPABASE_ANON_KEY || ""
        })};`,
        {
          headers: {
            "content-type": "application/javascript; charset=utf-8",
            "cache-control": "no-store"
          }
        }
      );
    }

    return env.ASSETS.fetch(request);
  }
};
