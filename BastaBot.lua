-- ╔══════════════════════════════════════════════════════╗
-- ║              🎲 BASTA BOT - Mobile GUI               ║
-- ║         Compatible con ejecutores móviles            ║
-- ║      GUI arrastrable · Touch · ForceSubmit           ║
-- ╚══════════════════════════════════════════════════════╝

local Players       = game:GetService("Players")
local RepStorage    = game:GetService("ReplicatedStorage")
local UserInput     = game:GetService("UserInputService")
local RunService    = game:GetService("RunService")

local LocalPlayer   = Players.LocalPlayer
local PlayerGui     = LocalPlayer:WaitForChild("PlayerGui")

-- ════════════════════════════════════════════
--               BASE DE DATOS
-- ════════════════════════════════════════════
local DB = {
    A = {
        Nombre     = {"Alejandro", "Andrés", "Ana", "Adriana"},
        Objeto     = {"Avión", "Armario", "Aguja", "Auricular"},
        Color      = {"Amarillo", "Azul", "Añil", "Aguamarina"},
        CiudadPais = {"Argentina", "Amsterdam", "Atenas", "Angola"},
        Fruta      = {"Arándano", "Aguacate", "Anona", "Almendra"},
        Animal     = {"Águila", "Ardilla", "Avestruz", "Araña"},
    },
    B = {
        Nombre     = {"Bruno", "Beatriz", "Bernardo", "Bárbara"},
        Objeto     = {"Bicicleta", "Bolso", "Botella", "Bastón"},
        Color      = {"Blanco", "Beige", "Borgoña", "Bronce"},
        CiudadPais = {"Brasil", "Bolivia", "Bélgica", "Bangkok"},
        Fruta      = {"Banana", "Boysenberry", "Breva", "Berenjena"},
        Animal     = {"Ballena", "Búfalo", "Burro", "Boa"},
    },
    C = {
        Nombre     = {"Carlos", "Carmen", "Cristina", "César"},
        Objeto     = {"Cama", "Cuchillo", "Camisa", "Calculadora"},
        Color      = {"Celeste", "Carmesí", "Coral", "Cobre"},
        CiudadPais = {"Colombia", "Cuba", "Chile", "Canadá"},
        Fruta      = {"Cereza", "Ciruela", "Coco", "Carambola"},
        Animal     = {"Caballo", "Cocodrilo", "Conejo", "Cuervo"},
    },
    D = {
        Nombre     = {"Diego", "Diana", "Daniel", "Daniela"},
        Objeto     = {"Dado", "Destornillador", "Diario", "Disfraz"},
        Color      = {"Dorado", "Durazno", "Damasco", "Denim"},
        CiudadPais = {"Dubai", "Dinamarca", "Dominicana", "Dublín"},
        Fruta      = {"Durazno", "Dátil", "Dragonfruta", "Damasco"},
        Animal     = {"Delfín", "Dromedario", "Dingo", "Dugong"},
    },
    E = {
        Nombre     = {"Eduardo", "Elena", "Esteban", "Emilia"},
        Objeto     = {"Escalera", "Espejo", "Estante", "Estufa"},
        Color      = {"Esmeralda", "Escarlata", "Ébano", "Eléctrico"},
        CiudadPais = {"España", "Ecuador", "Egipto", "Eslovenia"},
        Fruta      = {"Escaramujo", "Endrina", "Emblica", "Endrino"},
        Animal     = {"Elefante", "Erizo", "Escorpión", "Espino"},
    },
    F = {
        Nombre     = {"Fernando", "Fernanda", "Felipe", "Fabiola"},
        Objeto     = {"Foco", "Flauta", "Folder", "Freidora"},
        Color      = {"Fucsia", "Frambuesa", "Fresa", "Flúor"},
        CiudadPais = {"Francia", "Finlandia", "Filipinas", "Fiji"},
        Fruta      = {"Fresa", "Frambuesa", "Feijoa", "Fruta del dragón"},
        Animal     = {"Flamenco", "Foca", "Faisán", "Felino"},
    },
    G = {
        Nombre     = {"Gabriel", "Gabriela", "Gustavo", "Gloria"},
        Objeto     = {"Guitarra", "Gafas", "Globo", "Guante"},
        Color      = {"Gris", "Granada", "Granate", "Grafito"},
        CiudadPais = {"Guatemala", "Grecia", "Ghana", "Ginebra"},
        Fruta      = {"Granada", "Guayaba", "Grosella", "Guanábana"},
        Animal     = {"Gorila", "Gato", "Gallina", "Golondrina"},
    },
    H = {
        Nombre     = {"Hugo", "Helena", "Héctor", "Hortensia"},
        Objeto     = {"Hacha", "Helicóptero", "Horno", "Hamaca"},
        Color      = {"Hueso", "Hierro", "Hollín", "Hielo"},
        CiudadPais = {"Honduras", "Hungría", "Haití", "Helsinki"},
        Fruta      = {"Higo", "Huckleberry", "Hawthorn", "Horchata"},
        Animal     = {"Hipopótamo", "Halcón", "Hormiga", "Hiena"},
    },
    I = {
        Nombre     = {"Ignacio", "Isabel", "Iván", "Irene"},
        Objeto     = {"Impresora", "Imán", "Interruptor", "Instrumento"},
        Color      = {"Índigo", "Ivory", "Iris", "Ígneo"},
        CiudadPais = {"Italia", "India", "Indonesia", "Irlanda"},
        Fruta      = {"Icaco", "Ilama", "Imbe", "Inga"},
        Animal     = {"Iguana", "Impala", "Ibis", "Isópodo"},
    },
    J = {
        Nombre     = {"Juan", "Julia", "Jorge", "Josefa"},
        Objeto     = {"Jarra", "Jaula", "Jersey", "Jabón"},
        Color      = {"Jade", "Jaspe", "Jengibre", "Jockey"},
        CiudadPais = {"Jamaica", "Japón", "Jordania", "Jakarta"},
        Fruta      = {"Jaca", "Jocote", "Jambolan", "Jobo"},
        Animal     = {"Jaguar", "Jabalí", "Jilguero", "Jerbo"},
    },
    L = {
        Nombre     = {"Luis", "Laura", "Leonardo", "Lucía"},
        Objeto     = {"Lámpara", "Libro", "Llave", "Lavadora"},
        Color      = {"Lavanda", "Lima", "Lila", "Limón"},
        CiudadPais = {"Lima", "Lisboa", "Londres", "Luxemburgo"},
        Fruta      = {"Limón", "Lima", "Lichí", "Longan"},
        Animal     = {"León", "Leopardo", "Lagarto", "Lobo"},
    },
    M = {
        Nombre     = {"Miguel", "María", "Marcos", "Mariana"},
        Objeto     = {"Mesa", "Mochila", "Martillo", "Micrófono"},
        Color      = {"Magenta", "Marrón", "Mostaza", "Malva"},
        CiudadPais = {"México", "Madrid", "Marruecos", "Manila"},
        Fruta      = {"Mango", "Manzana", "Melón", "Mora"},
        Animal     = {"Mono", "Mariposa", "Murciélago", "Medusa"},
    },
    N = {
        Nombre     = {"Nicolás", "Natalia", "Néstor", "Nadia"},
        Objeto     = {"Nevera", "Navaja", "Nube", "Notebook"},
        Color      = {"Negro", "Naranja", "Nácar", "Nogal"},
        CiudadPais = {"Nigeria", "Noruega", "Nepal", "Nicaragua"},
        Fruta      = {"Naranja", "Nectarina", "Níspero", "Nuez"},
        Animal     = {"Nutria", "Narval", "Nightingale", "Ñu"},
    },
    O = {
        Nombre     = {"Oscar", "Olivia", "Orlando", "Ofelia"},
        Objeto     = {"Olla", "Ordenador", "Orejera", "Overol"},
        Color      = {"Ocre", "Oliva", "Ópalo", "Óxido"},
        CiudadPais = {"Oslo", "Ontario", "Omán", "Osaka"},
        Fruta      = {"Oliva", "Orito", "Oca", "Opuntia"},
        Animal     = {"Oso", "Oveja", "Ornitorrinco", "Orangután"},
    },
    P = {
        Nombre     = {"Pedro", "Paula", "Pablo", "Patricia"},
        Objeto     = {"Paraguas", "Plato", "Pelota", "Pincel"},
        Color      = {"Púrpura", "Plateado", "Pino", "Pizarra"},
        CiudadPais = {"Perú", "Portugal", "Panamá", "París"},
        Fruta      = {"Papaya", "Pera", "Piña", "Plátano"},
        Animal     = {"Perro", "Pato", "Pingüino", "Pantera"},
    },
    R = {
        Nombre     = {"Roberto", "Rosa", "Rodrigo", "Raquel"},
        Objeto     = {"Radio", "Reloj", "Regla", "Refrigerador"},
        Color      = {"Rojo", "Rosa", "Rubí", "Rojizo"},
        CiudadPais = {"Rusia", "Roma", "Rumania", "Río de Janeiro"},
        Fruta      = {"Rambután", "Ruibarbo", "Rosa mosqueta", "Romero"},
        Animal     = {"Rana", "Ratón", "Rinoceronte", "Roedor"},
    },
    S = {
        Nombre     = {"Santiago", "Sara", "Sebastián", "Sofía"},
        Objeto     = {"Silla", "Sartén", "Sofá", "Serrucho"},
        Color      = {"Salmón", "Siena", "Sepia", "Safiro"},
        CiudadPais = {"Santiago", "Suecia", "Suiza", "Singapur"},
        Fruta      = {"Sandía", "Saúco", "Sapote", "Satsuma"},
        Animal     = {"Serpiente", "Sapo", "Salamandra", "Salmón"},
    },
    T = {
        Nombre     = {"Tomás", "Teresa", "Timoteo", "Tamara"},
        Objeto     = {"Televisor", "Tijeras", "Teléfono", "Taza"},
        Color      = {"Turquesa", "Tostado", "Tierra", "Topacio"},
        CiudadPais = {"Turquía", "Tailandia", "Tanzania", "Toronto"},
        Fruta      = {"Tomate", "Tamarindo", "Tangerina", "Tuna"},
        Animal     = {"Tigre", "Tortuga", "Toro", "Tucán"},
    },
    V = {
        Nombre     = {"Víctor", "Valentina", "Vicente", "Verónica"},
        Objeto     = {"Vaso", "Ventana", "Violín", "Vestido"},
        Color      = {"Violeta", "Verde", "Vino", "Vanilla"},
        CiudadPais = {"Venezuela", "Vietnam", "Varsovia", "Valencia"},
        Fruta      = {"Uva", "Vainilla", "Vaccinium", "Vitis"},
        Animal     = {"Vaca", "Víbora", "Venado", "Vampiro"},
    },
    Z = {
        Nombre     = {"Zacarías", "Zoe", "Zelda", "Zafira"},
        Objeto     = {"Zapato", "Zarcillo", "Zipper", "Zona"},
        Color      = {"Zafiro", "Zinc", "Zanahoria", "Zenith"},
        CiudadPais = {"Zimbabwe", "Zaragoza", "Zambia", "Zúrich"},
        Fruta      = {"Zapote", "Zarzamora", "Zarza", "Zumaque"},
        Animal     = {"Zorro", "Zebra", "Zorillo", "Zamuro"},
    },
}

-- ════════════════════════════════════════════
--         ESTADO GLOBAL DEL BOT
-- ════════════════════════════════════════════
local isActive     = false
local currentLetter = "A"
local autoConn     = nil -- Conexión a ForceSubmitAnswers

-- ════════════════════════════════════════════
--              REMOTES
-- ════════════════════════════════════════════
local BastaEvents       = RepStorage:WaitForChild("BastaEvents", 10)
local SubmitAnswers     = BastaEvents and BastaEvents:WaitForChild("SubmitAnswers", 10)
local ForceSubmitEvent  = BastaEvents and BastaEvents:WaitForChild("ForceSubmitAnswers", 10)

if not SubmitAnswers then
    warn("[BastaBot] ⚠️ No se encontró SubmitAnswers en BastaEvents.")
end
if not ForceSubmitEvent then
    warn("[BastaBot] ⚠️ No se encontró ForceSubmitAnswers en BastaEvents.")
end

-- ════════════════════════════════════════════
--           FUNCIÓN: OBTENER RESPUESTAS
-- ════════════════════════════════════════════
local function getAnswers(letter)
    local letter = string.upper(tostring(letter or "A"):sub(1,1))
    local data   = DB[letter]

    if not data then
        -- Fallback genérico si la letra no está en la DB
        return {
            Nombre     = letter .. "ombre",
            Objeto     = letter .. "bjeto",
            Color      = letter .. "olor",
            CiudadPais = letter .. "iudad",
            Fruta      = letter .. "ruta",
            Animal     = letter .. "nimal",
        }
    end

    return {
        Nombre     = data.Nombre    [math.random(#data.Nombre)],
        Objeto     = data.Objeto    [math.random(#data.Objeto)],
        Color      = data.Color     [math.random(#data.Color)],
        CiudadPais = data.CiudadPais[math.random(#data.CiudadPais)],
        Fruta      = data.Fruta     [math.random(#data.Fruta)],
        Animal     = data.Animal    [math.random(#data.Animal)],
    }
end

-- ════════════════════════════════════════════
--           FUNCIÓN: ENVIAR RESPUESTAS
-- ════════════════════════════════════════════
local function sendAnswers(infoLabel)
    if not SubmitAnswers then
        if infoLabel then infoLabel.Text = "❌ Remote no encontrado" end
        warn("[BastaBot] SubmitAnswers es nil")
        return
    end

    local answers = getAnswers(currentLetter)

    local ok, err = pcall(function()
        SubmitAnswers:FireServer(answers, 1)
    end)

    if ok then
        print(string.format("[BastaBot] ✅ Enviado [%s]: N=%s O=%s C=%s CP=%s F=%s A=%s",
            currentLetter,
            answers.Nombre, answers.Objeto, answers.Color,
            answers.CiudadPais, answers.Fruta, answers.Animal
        ))
        if infoLabel then
            infoLabel.Text = string.format("✅ [%s] %s / %s / %s",
                currentLetter, answers.Nombre, answers.Objeto, answers.Animal)
        end
    else
        warn("[BastaBot] Error al enviar: " .. tostring(err))
        if infoLabel then infoLabel.Text = "❌ Error: " .. tostring(err):sub(1, 30) end
    end
end

-- ════════════════════════════════════════════
--                  GUI
-- ════════════════════════════════════════════
-- Limpia instancias anteriores del mismo script
if PlayerGui:FindFirstChild("BastaBot_GUI") then
    PlayerGui.BastaBot_GUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name            = "BastaBot_GUI"
ScreenGui.ResetOnSpawn    = false
ScreenGui.IgnoreGuiInset  = true
ScreenGui.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent          = PlayerGui

-- ──────────────────────────────────────────
-- BOTÓN FLOTANTE (siempre visible)
-- ──────────────────────────────────────────
local FloatBtn = Instance.new("TextButton")
FloatBtn.Name              = "FloatBtn"
FloatBtn.Size              = UDim2.new(0, 46, 0, 46)
FloatBtn.Position          = UDim2.new(0, 8, 0.45, 0)
FloatBtn.BackgroundColor3  = Color3.fromRGB(28, 28, 50)
FloatBtn.TextColor3        = Color3.fromRGB(255, 255, 255)
FloatBtn.Text              = "🎲"
FloatBtn.Font              = Enum.Font.GothamBold
FloatBtn.TextSize          = 22
FloatBtn.BorderSizePixel   = 0
FloatBtn.ZIndex            = 20
FloatBtn.Parent            = ScreenGui

local fCorner = Instance.new("UICorner")
fCorner.CornerRadius = UDim.new(0, 14)
fCorner.Parent = FloatBtn

local fStroke = Instance.new("UIStroke")
fStroke.Color     = Color3.fromRGB(110, 110, 220)
fStroke.Thickness = 1.5
fStroke.Parent    = FloatBtn

-- ──────────────────────────────────────────
-- VENTANA PRINCIPAL (220 × 205)
-- ──────────────────────────────────────────
local W, H = 220, 205

local Frame = Instance.new("Frame")
Frame.Name             = "MainFrame"
Frame.Size             = UDim2.new(0, W, 0, H)
Frame.Position         = UDim2.new(0, 62, 0.35, 0)
Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 34)
Frame.BorderSizePixel  = 0
Frame.Visible          = false
Frame.Active           = true   -- consume eventos de input
Frame.ZIndex           = 10
Frame.Parent           = ScreenGui

local mCorner = Instance.new("UICorner")
mCorner.CornerRadius = UDim.new(0, 12)
mCorner.Parent = Frame

local mStroke = Instance.new("UIStroke")
mStroke.Color     = Color3.fromRGB(90, 90, 200)
mStroke.Thickness = 1.5
mStroke.Parent    = Frame

-- Barra de título / arrastre
local TitleBar = Instance.new("Frame")
TitleBar.Name             = "TitleBar"
TitleBar.Size             = UDim2.new(1, 0, 0, 32)
TitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
TitleBar.BorderSizePixel  = 0
TitleBar.ZIndex           = 11
TitleBar.Active           = true
TitleBar.Parent           = Frame

local tbCorner = Instance.new("UICorner")
tbCorner.CornerRadius = UDim.new(0, 12)
tbCorner.Parent = TitleBar

-- Parche para que las esquinas inferiores del TitleBar sean rectas
local tbPatch = Instance.new("Frame")
tbPatch.Size             = UDim2.new(1, 0, 0.5, 0)
tbPatch.Position         = UDim2.new(0, 0, 0.5, 0)
tbPatch.BackgroundColor3 = Color3.fromRGB(35, 35, 65)
tbPatch.BorderSizePixel  = 0
tbPatch.ZIndex           = 11
tbPatch.Parent           = TitleBar

local TitleLbl = Instance.new("TextLabel")
TitleLbl.Size               = UDim2.new(1, -8, 1, 0)
TitleLbl.Position           = UDim2.new(0, 8, 0, 0)
TitleLbl.BackgroundTransparency = 1
TitleLbl.Text               = "🎲  Basta Bot"
TitleLbl.TextColor3         = Color3.fromRGB(200, 200, 255)
TitleLbl.Font               = Enum.Font.GothamBold
TitleLbl.TextSize           = 13
TitleLbl.TextXAlignment     = Enum.TextXAlignment.Left
TitleLbl.ZIndex             = 12
TitleLbl.Parent             = TitleBar

-- ──────────────────────────────────────────
-- HELPER: crea un TextLabel dentro de Frame
-- ──────────────────────────────────────────
local function makeLabel(text, posY, size, color, align)
    local l = Instance.new("TextLabel")
    l.Size                  = UDim2.new(0, size or (W - 14), 0, 18)
    l.Position              = UDim2.new(0, 7, 0, posY)
    l.BackgroundTransparency = 1
    l.Text                  = text
    l.TextColor3            = color or Color3.fromRGB(170, 170, 210)
    l.Font                  = Enum.Font.Gotham
    l.TextSize              = 11
    l.TextXAlignment        = align or Enum.TextXAlignment.Left
    l.ZIndex                = 11
    l.Parent                = Frame
    return l
end

local function makeBtn(text, posY, bgColor)
    local b = Instance.new("TextButton")
    b.Size             = UDim2.new(0, W - 14, 0, 30)
    b.Position         = UDim2.new(0, 7, 0, posY)
    b.BackgroundColor3 = bgColor or Color3.fromRGB(55, 55, 100)
    b.TextColor3       = Color3.fromRGB(240, 240, 255)
    b.Text             = text
    b.Font             = Enum.Font.GothamBold
    b.TextSize         = 12
    b.BorderSizePixel  = 0
    b.ZIndex           = 11
    b.Parent           = Frame
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = b
    return b
end

-- ── Fila de estado ──────────────────────────
local StatusLbl = makeLabel("Estado: ⛔ INACTIVO", 36, W - 14,
    Color3.fromRGB(255, 75, 75))

-- ── Fila letra ──────────────────────────────
makeLabel("Letra de la ronda:", 60, 120)

local LetterBox = Instance.new("TextBox")
LetterBox.Size             = UDim2.new(0, 72, 0, 26)
LetterBox.Position         = UDim2.new(0, W - 80, 0, 58)
LetterBox.BackgroundColor3 = Color3.fromRGB(38, 38, 62)
LetterBox.TextColor3       = Color3.fromRGB(255, 255, 120)
LetterBox.PlaceholderText  = "Ej: B"
LetterBox.Text             = ""
LetterBox.Font             = Enum.Font.GothamBold
LetterBox.TextSize         = 16
LetterBox.ClearTextOnFocus = false
LetterBox.BorderSizePixel  = 0
LetterBox.ZIndex           = 12
LetterBox.Parent           = Frame

local lbCorner = Instance.new("UICorner")
lbCorner.CornerRadius = UDim.new(0, 6)
lbCorner.Parent = LetterBox

local lbStroke = Instance.new("UIStroke")
lbStroke.Color     = Color3.fromRGB(90, 90, 180)
lbStroke.Thickness = 1
lbStroke.Parent    = LetterBox

-- ── Botón Activar / Desactivar ──────────────
local ToggleBot = makeBtn("⚡  ACTIVAR  AUTO-BOT", 92, Color3.fromRGB(50, 50, 95))

-- ── Botón Envío Manual ──────────────────────
local ManualBtn = makeBtn("📤  ENVIAR AHORA  (manual)", 130, Color3.fromRGB(38, 88, 50))

-- ── Etiqueta de info / último envío ─────────
local InfoLbl = makeLabel("Esperando evento ForceSubmit...", 168,
    W - 14, Color3.fromRGB(100, 100, 150))
InfoLbl.TextSize = 10
InfoLbl.TextWrapped = true

-- ── Versión ─────────────────────────────────
makeLabel("v1.0  •  BastaBot", 188, W - 14,
    Color3.fromRGB(55, 55, 85), Enum.TextXAlignment.Right)

-- ════════════════════════════════════════════
--          DRAG (arrastre táctil)
-- ════════════════════════════════════════════
local dragging   = false
local dragInput  = nil
local dragStart  = nil
local startPos   = nil

TitleBar.InputBegan:Connect(function(input)
    local t = input.UserInputType
    if t == Enum.UserInputType.MouseButton1 or t == Enum.UserInputType.Touch then
        dragging  = true
        dragStart = input.Position
        startPos  = Frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    local t = input.UserInputType
    if t == Enum.UserInputType.MouseMovement or t == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInput.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- ════════════════════════════════════════════
--    ABRIR / CERRAR VENTANA (botón flotante)
-- ════════════════════════════════════════════
FloatBtn.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

-- ════════════════════════════════════════════
--        TEXTBOX: actualizar letra
-- ════════════════════════════════════════════
LetterBox:GetPropertyChangedSignal("Text"):Connect(function()
    -- Mantener solo la primera letra en mayúsculas
    local raw = LetterBox.Text
    local upper = string.upper(string.sub(raw, 1, 1))
    if raw ~= upper then
        LetterBox.Text = upper
    end
    if upper ~= "" then
        currentLetter = upper
    end
end)

-- ════════════════════════════════════════════
--      ACTUALIZAR INTERFAZ SEGÚN ESTADO
-- ════════════════════════════════════════════
local function refreshUI()
    if isActive then
        StatusLbl.Text       = "Estado: ✅ ACTIVO"
        StatusLbl.TextColor3 = Color3.fromRGB(60, 220, 80)
        ToggleBot.Text       = "🛑  DESACTIVAR  AUTO-BOT"
        ToggleBot.BackgroundColor3 = Color3.fromRGB(130, 35, 35)
        InfoLbl.Text         = "👂 Escuchando ForceSubmitAnswers..."
    else
        StatusLbl.Text       = "Estado: ⛔ INACTIVO"
        StatusLbl.TextColor3 = Color3.fromRGB(255, 75, 75)
        ToggleBot.Text       = "⚡  ACTIVAR  AUTO-BOT"
        ToggleBot.BackgroundColor3 = Color3.fromRGB(50, 50, 95)
        InfoLbl.Text         = "Bot desactivado."
    end
end

-- ════════════════════════════════════════════
--    BOTÓN ACTIVAR/DESACTIVAR AUTO-BOT
-- ════════════════════════════════════════════
ToggleBot.MouseButton1Click:Connect(function()
    isActive = not isActive
    refreshUI()

    if isActive then
        -- Suscribirse al evento del servidor
        if ForceSubmitEvent then
            autoConn = ForceSubmitEvent.OnClientEvent:Connect(function(_value)
                if not isActive then return end

                -- Delay aleatorio (0.4 – 1.6 s) para parecer más humano
                local delay = math.random(40, 160) / 100
                task.delay(delay, function()
                    if not isActive then return end
                    sendAnswers(InfoLbl)
                    -- Restaurar mensaje de espera tras 3 s
                    task.delay(3, function()
                        if isActive then
                            InfoLbl.Text = "👂 Escuchando ForceSubmitAnswers..."
                        end
                    end)
                end)
            end)
        else
            warn("[BastaBot] ForceSubmitAnswers no disponible; solo funciona envío manual.")
            InfoLbl.Text = "⚠️ ForceSubmit no encontrado"
        end
    else
        -- Desconectar listener
        if autoConn then
            autoConn:Disconnect()
            autoConn = nil
        end
    end
end)

-- ════════════════════════════════════════════
--          BOTÓN ENVÍO MANUAL
-- ════════════════════════════════════════════
ManualBtn.MouseButton1Click:Connect(function()
    local letter = string.upper(string.sub(LetterBox.Text, 1, 1))
    if letter == "" then
        InfoLbl.Text = "⚠️ Escribe la letra primero"
        return
    end
    currentLetter = letter
    sendAnswers(InfoLbl)
    -- Restaurar mensaje según estado activo
    task.delay(4, function()
        if Frame.Visible then
            InfoLbl.Text = isActive
                and "👂 Escuchando ForceSubmitAnswers..."
                or  "Esperando evento ForceSubmit..."
        end
    end)
end)

-- ════════════════════════════════════════════
print("[BastaBot] ✅ Cargado. Toca 🎲 para abrir el menú.")
