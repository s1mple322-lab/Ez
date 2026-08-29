-- ════════════════════════════════════════════
--   HOOK DE DEBUG v4 — Basta
--   Objetivo: confirmar si hay que avisar "basta_pressed"
--   por UpdateGameStatus ANTES/JUNTO a SubmitAnswers para
--   que el servidor acepte la respuesta.
--
--   Loguea:
--   1) UpdateGameStatus:FireServer()   → lo que el CLIENTE manda
--   2) UpdateGameStatus.OnClientEvent  → lo que el SERVER manda
--   3) StartRound.OnClientEvent        → arranque de ronda
--   4) SubmitAnswers:FireServer()      → el submit de respuestas
-- ════════════════════════════════════════════
-- Cómo usarlo:
-- 1. Corré esto SOLO (sin el bot).
-- 2. Jugá 1 ronda completa a mano: completá los 6 campos y
--    TOCÁ EL BOTÓN "BASTA" vos mismo (no dejes que se acabe
--    el tiempo).
-- 3. Pasame TODO el output en el orden que aparece.

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
end

-- ── UpdateGameStatus: dirección server → cliente ──
local UpdateGameStatus = bastaEvents:FindFirstChild("UpdateGameStatus")
if UpdateGameStatus then
    UpdateGameStatus.OnClientEvent:Connect(function(...)
        dumpArgs("UpdateGameStatus → OnClientEvent (SERVER manda)", {...})
    end)
    print("[Hook] ✅ Escuchando UpdateGameStatus (OnClientEvent)")
else
    warn("[Hook] ❌ UpdateGameStatus no encontrado")
end

-- ── FireServer hook genérico para SubmitAnswers Y UpdateGameStatus ──
local targets = {}
if UpdateGameStatus then targets[UpdateGameStatus] = "UpdateGameStatus" end
local SubmitAnswers = bastaEvents:FindFirstChild("SubmitAnswers")
if SubmitAnswers then targets[SubmitAnswers] = "SubmitAnswers" end

local ok = pcall(function()
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)

    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "FireServer" and targets[self] then
            dumpArgs(targets[self] .. ":FireServer (CLIENTE manda)", {...})
        end
        return old(self, ...)
    end)

    setreadonly(mt, true)
end)

if ok then
    print("[Hook] ✅ Escuchando FireServer en SubmitAnswers y UpdateGameStatus")
else
    warn("[Hook] ❌ Tu executor no soporta hookear __namecall.")
end

print("[Hook] Listo. Jugá 1 ronda completa a mano, TOCANDO 'Basta' vos mismo, y pasame el output ordenado.")
