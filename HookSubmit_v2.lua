-- ════════════════════════════════════════════
--   HOOK DE DEBUG v2 — Basta
--   Loguea:
--   1) Lo que el juego manda a SubmitAnswers (FireServer)
--   2) Lo que el SERVIDOR manda al cliente vía
--      ForceSubmitAnswers (OnClientEvent) — acá
--      probablemente venga el número de ronda.
-- ════════════════════════════════════════════
-- Cómo usarlo:
-- 1. Ejecutá este script SOLO (no el bot, no el hook viejo).
-- 2. Jugá 2-3 rondas normales, contestando a mano.
-- 3. Copiame TODO el output, en especial las líneas
--    que digan "[Hook] ForceSubmitAnswers → OnClientEvent".

local RepStorage = game:GetService("ReplicatedStorage")

local bastaEvents = RepStorage:WaitForChild("BastaEvents", 20)
if not bastaEvents then
    warn("[Hook] BastaEvents no encontrado")
    return
end

local SubmitAnswers    = bastaEvents:WaitForChild("SubmitAnswers", 20)
local ForceSubmitEvent = bastaEvents:WaitForChild("ForceSubmitAnswers", 20)

-- ── 1) Loguear lo que el server manda al cliente ──
if ForceSubmitEvent then
    ForceSubmitEvent.OnClientEvent:Connect(function(...)
        local args = {...}
        warn("════ [Hook] ForceSubmitAnswers → OnClientEvent ════")
        if #args == 0 then
            warn("  (sin argumentos)")
        end
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
        warn("═════════════════════════════════════════════════")
    end)
    print("[Hook] ✅ Escuchando ForceSubmitAnswers (OnClientEvent)")
else
    warn("[Hook] ❌ ForceSubmitAnswers no encontrado")
end

-- ── 2) Loguear lo que el juego manda a SubmitAnswers ──
if SubmitAnswers then
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
        print("[Hook] ✅ Escuchando FireServer en SubmitAnswers")
    else
        warn("[Hook] ❌ Tu executor no soporta hookear __namecall.")
    end
end

print("[Hook] Listo. Jugá 2-3 rondas normales a mano y pasame el output completo.")
