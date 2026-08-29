-- ════════════════════════════════════════════
--   HOOK DE DEBUG v3 — Basta
--   Basado en el approach de Cobalt que ya usaste.
--   Loguea:
--   1) StartRound (OnClientEvent)      → arranque de ronda
--   2) ForceSubmitAnswers (OnClientEvent) → forzado de envío (fin de tiempo)
--   3) SubmitAnswers:FireServer()      → lo que se manda de verdad
-- ════════════════════════════════════════════
-- Cómo usarlo:
-- 1. Ejecutá esto SOLO (sin el bot).
-- 2. Jugá 2 rondas completas a mano, de punta a punta
--    (desde que arranca la ronda hasta que aparece "Comparing answers").
-- 3. Pasame TODO el output en orden, con horarios si se puede.

local RepStorage = game:GetService("ReplicatedStorage")
local bastaEvents = RepStorage:WaitForChild("BastaEvents", 20)
if not bastaEvents then
    warn("[Hook] BastaEvents no encontrado")
    return
end

local function dumpArgs(tag, args)
    warn(("════ [Hook] %s ════"):format(tag))
    if #args == 0 then warn("  (sin argumentos)") end
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
    warn("═══════════════════════════════════════")
end

-- ── StartRound ──
local StartRound = bastaEvents:FindFirstChild("StartRound")
if StartRound then
    StartRound.OnClientEvent:Connect(function(...)
        dumpArgs("StartRound → OnClientEvent", {...})
    end)
    print("[Hook] ✅ Escuchando StartRound")
else
    warn("[Hook] ❌ StartRound no encontrado")
end

-- ── ForceSubmitAnswers ──
local ForceSubmitEvent = bastaEvents:FindFirstChild("ForceSubmitAnswers")
if ForceSubmitEvent then
    ForceSubmitEvent.OnClientEvent:Connect(function(...)
        dumpArgs("ForceSubmitAnswers → OnClientEvent", {...})
    end)
    print("[Hook] ✅ Escuchando ForceSubmitAnswers")
else
    warn("[Hook] ❌ ForceSubmitAnswers no encontrado")
end

-- ── RoundResults / ShowComparison (por si dan pistas del round actual) ──
for _, name in ipairs({"RoundResults", "ShowComparison"}) do
    local ev = bastaEvents:FindFirstChild(name)
    if ev then
        ev.OnClientEvent:Connect(function(...)
            dumpArgs(name .. " → OnClientEvent", {...})
        end)
        print("[Hook] ✅ Escuchando " .. name)
    end
end

-- ── SubmitAnswers:FireServer (lo que se manda de verdad) ──
local SubmitAnswers = bastaEvents:FindFirstChild("SubmitAnswers")
if SubmitAnswers then
    local ok = pcall(function()
        local mt = getrawmetatable(game)
        local old = mt.__namecall
        setreadonly(mt, false)

        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if self == SubmitAnswers and method == "FireServer" then
                dumpArgs("SubmitAnswers:FireServer", {...})
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

print("[Hook] Listo. Jugá 2 rondas completas a mano y pasame el output ordenado.")
