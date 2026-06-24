export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    const fallbackSupabaseUrl = "https://gycdsbsceosfewjonluf.supabase.co";
    const fallbackSupabaseAnonKey = "sb_publishable_yBlfdP0V-beHLtydbodiOA_t4ywrLWu";

    if (url.pathname === "/config.js") {
      return new Response(
        `window.BUHPULT_CONFIG = ${JSON.stringify({
          supabaseUrl: env.SUPABASE_URL || fallbackSupabaseUrl,
          supabaseAnonKey: env.SUPABASE_ANON_KEY || fallbackSupabaseAnonKey
        })};`,
        {
          headers: {
            "content-type": "application/javascript; charset=utf-8",
            "cache-control": "no-store"
          }
        }
      );
    }

    if (url.pathname === "/") {
      url.pathname = "/accountant-mobile.html";
      return env.ASSETS.fetch(new Request(url, request));
    }

    return env.ASSETS.fetch(request);
  }
};
