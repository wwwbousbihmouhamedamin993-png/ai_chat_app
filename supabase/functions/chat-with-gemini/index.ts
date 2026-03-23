import "@supabase/functions-js/edge-runtime.d.ts"

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

Deno.serve(async (req) => {
  // Handle preflight request
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  const { message } = await req.json()
  const apiKey = Deno.env.get("GEMINI_API_KEY")

  const url = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=${apiKey}`
  
  const geminiResponse = await fetch(url, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      contents: [{ parts: [{ text: message }] }]
    })
  })

  const geminiData = await geminiResponse.json()
  const geminiText = geminiData.candidates[0].content.parts[0].text

  return new Response(
    JSON.stringify({ reply: geminiText }),
    { headers: { ...corsHeaders, "Content-Type": "application/json" } }
  )
})