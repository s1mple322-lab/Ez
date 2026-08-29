-- ════════════════════════════════════════════
--   HOOK DE DEBUG — Basta (solo para diagnóstico)
--   Loguea el payload REAL que manda el juego
--   cuando VOS contestás a mano (sin bot).
-- ════════════════════════════════════════════
-- Cómo usarlo:
-- 1. Ejecutá este script SOLO (no el bot).
-- 2. Jugá una ronda normal, escribí tus respuestas
--    a mano y tocá "Basta" / enviar como siempre.
-- 3. Mirá la consola de output (F9 o el log del
--    executor): vas a ver exactamente qué tabla y
--    qué argumentos usa el juego real.
-- 4. Pasame ese output para ajustar el bot.

local RepStorage = game:GetService("ReplicatedStorage")

local bastaEvents = RepStorage:WaitForChild("BastaEvents", 20)
if not bastaEvents then
    warn("[Hook] BastaEvents no encontrado")
    return
end

local SubmitAnswers = bastaEvents:WaitForChild("SubmitAnswers", 20)
if not SubmitAnswers then
    warn("[Hook] SubmitAnswers no encontrado")
    return
end

-- Necesita hookfunction / hookmetamethod, disponible en
-- la mayoría de executors modernos.
local ok = pcall(function()
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)

    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}

        if self == SubmitAnswers and method == "FireServer" then
            warn("════ [Hook] FireServer detectado en SubmitAnswers ════")
            for i, v in ipairs(args) do
                if typeof(v) == "table" then
                    warn(("  arg[%d] = tabla:"):format(i))
                    for k, val in pairs(v) do
                        warn(("     %s = %s (%s)"):format(tostring(k), tostring(val), typeof(val)))
                    end
                else
                    warn(("  arg[%d] = %s (%s)"):format(i, tostring(v), typeof(v)))
                end
            end
            warn("════════════════════════════════════════════════════")
        end

        return old(self, ...)
    end)

    setreadonly(mt, true)
end)

if ok then
    print("[Hook] ✅ Activo. Contestá una ronda a mano y mirá el output.")
else
    warn("[Hook] ❌ Tu executor no soporta hookear __namecall (getrawmetatable/hookfunction).")
    warn("[Hook] Decime qué executor usás para darte un método alternativo.")
end
