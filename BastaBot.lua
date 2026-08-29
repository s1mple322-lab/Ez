-- ╔══════════════════════════════════════════════════════╗
-- ║           🎲 BASTA BOT v2  —  Mobile GUI             ║
-- ║   Fix: DisplayOrder alto · Debug log · Remotes OK    ║
-- ╚══════════════════════════════════════════════════════╝

local Players    = game:GetService("Players")
local RepStorage = game:GetService("ReplicatedStorage")
local UserInput  = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")

-- ════════════════════════════════════════════
--               BASE DE DATOS
-- ════════════════════════════════════════════
local DB = {
    A = {
        Nombre     = {"Alejandro","Andrés","Ana","Adriana"},
        Objeto     = {"Avión","Armario","Aguja","Auricular"},
        Color      = {"Amarillo","Azul","Añil","Aguamarina"},
        CiudadPais = {"Argentina","Amsterdam","Atenas","Angola"},
        Fruta      = {"Arándano","Aguacate","Anona","Almendra"},
        Animal     = {"Águila","Ardilla","Avestruz","Araña"},
    },
    B = {
        Nombre     = {"Bruno","Beatriz","Bernardo","Bárbara"},
        Objeto     = {"Bicicleta","Bolso","Botella","Bastón"},
        Color      = {"Blanco","Beige","Borgoña","Bronce"},
        CiudadPais = {"Brasil","Bolivia","Bélgica","Bangkok"},
        Fruta      = {"Banana","Boysenberry","Breva","Berenjena"},
        Animal     = {"Ballena","Búfalo","Burro","Boa"},
    },
    C = {
        Nombre     = {"Carlos","Carmen","Cristina","César"},
        Objeto     = {"Cama","Cuchillo","Camisa","Calculadora"},
        Color      = {"Celeste","Carmesí","Coral","Cobre"},
        CiudadPais = {"Colombia","Cuba","Chile","Canadá"},
        Fruta      = {"Cereza","Ciruela","Coco","Carambola"},
        Animal     = {"Caballo","Cocodrilo","Conejo","Cuervo"},
    },
    D = {
        Nombre     = {"Diego","Diana","Daniel","Daniela"},
        Objeto     = {"Dado","Destornillador","Diario","Disfraz"},
        Color      = {"Dorado","Durazno","Damasco","Denim"},
        CiudadPais = {"Dubai","Dinamarca","Dominicana","Dublín"},
        Fruta      = {"Durazno","Dátil","Dragonfruta","Damasco"},
        Animal     = {"Delfín","Dromedario","Dingo","Dugong"},
    },
    E = {
        Nombre     = {"Eduardo","Elena","Esteban","Emilia"},
        Objeto     = {"Escalera","Espejo","Estante","Estufa"},
        Color      = {"Esmeralda","Escarlata","Ébano","Eléctrico"},
        CiudadPais = {"España","Ecuador","Egipto","Eslovenia"},
        Fruta      = {"Escaramujo","Endrina","Emblica","Inga"},
        Animal     = {"Elefante","Erizo","Escorpión","Espino"},
    },
    F = {
        Nombre     = {"Fernando","Fernanda","Felipe","Fabiola"},
        Objeto     = {"Foco","Flauta","Folder","Freidora"},
        Color      = {"Fucsia","Frambuesa","Fresa","Flúor"},
        CiudadPais = {"Francia","Finlandia","Filipinas","Fiji"},
        Fruta      = {"Fresa","Frambuesa","Feijoa","Fruta del dragón"},
        Animal     = {"Flamenco","Foca","Faisán","Felino"},
    },
    G = {
        Nombre     = {"Gabriel","Gabriela","Gustavo","Gloria"},
        Objeto     = {"Guitarra","Gafas","Globo","Guante"},
        Color      = {"Gris","Granada","Granate","Grafito"},
        CiudadPais = {"Guatemala","Grecia","Ghana","Ginebra"},
        Fruta      = {"Granada","Guayaba","Grosella","Guanábana"},
        Animal     = {"Gorila","Gato","Gallina","Golondrina"},
    },
    H = {
        Nombre     = {"Hugo","Helena","Héctor","Hortensia"},
        Objeto     = {"Hacha","Helicóptero","Horno","Hamaca"},
        Color      = {"Hueso","Hierro","Hollín","Hielo"},
        CiudadPais = {"Honduras","Hungría","Haití","Helsinki"},
        Fruta      = {"Higo","Huckleberry","Hawthorn","Horchata"},
        Animal     = {"Hipopótamo","Halcón","Hormiga","Hiena"},
    },
    I = {
        Nombre     = {"Ignacio","Isabel","Iván","Irene"},
        Objeto     = {"Impresora","Imán","Interruptor","Instrumento"},
        Color      = {"Índigo","Ivory","Iris","Ígneo"},
        CiudadPais = {"Italia","India","Indonesia","Irlanda"},
        Fruta      = {"Icaco","Ilama","Imbe","Inga"},
        Animal     = {"Iguana","Impala","Ibis","Isópodo"},
    },
    J = {
        Nombre     = {"Juan","Julia","Jorge","Josefa"},
        Objeto     = {"Jarra","Jaula","Jersey","Jabón"},
        Color      = {"Jade","Jaspe","Jengibre","Jockey"},
        CiudadPais = {"Jamaica","Japón","Jordania","Jakarta"},
        Fruta      = {"Jaca","Jocote","Jambolan","Jobo"},
        Animal     = {"Jaguar","Jabalí","Jilguero","Jerbo"},
    },
    K = {
        Nombre     = {"Karina","Kevin","Karla","Kenneth"},
        Objeto     = {"Kayak","Kimono","Kit","Ketchup"},
        Color      = {"Kaki","Khaki","Keniata","Kobicha"},
        CiudadPais = {"Kenia","Kuwait","Kioto","Kazajistán"},
        Fruta      = {"Kiwi","Kumquat","Karité","Kepel"},
        Animal     = {"Koala","Kudú","Katydid","Kiwi (ave)"},
    },
    L = {
        Nombre     = {"Luis","Laura","Leonardo","Lucía"},
        Objeto     = {"Lámpara","Lápiz","Llave","Libro"},
        Color      = {"Lila","Lavanda","Limón","Ladrillo"},
        CiudadPais = {"Londres","Líbano","Luxemburgo","Laos"},
        Fruta      = {"Limón","Lichi","Longan","Lima"},
        Animal     = {"León","Lobo","Lagartija","Liebre"},
    },
    M = {
        Nombre     = {"Miguel","María","Mateo","Marcela"},
        Objeto     = {"Mesa","Micrófono","Mochila","Martillo"},
        Color      = {"Magenta","Morado","Marrón","Marfil"},
        CiudadPais = {"México","Marruecos","Malta","Moscú"},
        Fruta      = {"Mango","Maracuyá","Manzana","Mora"},
        Animal     = {"Mono","Mapache","Murciélago","Medusa"},
    },
    N = {
        Nombre     = {"Nicolás","Natalia","Norberto","Norma"},
        Objeto     = {"Notebook","Navaja","Naipe","Nevera"},
        Color      = {"Naranja","Negro","Nácar","Neón"},
        CiudadPais = {"Nicaragua","Noruega","Nepal","Namibia"},
        Fruta      = {"Naranja","Níspero","Nuez","Nectarina"},
        Animal     = {"Nutria","Narval","Nandú","Náyade"},
    },
    O = {
        Nombre     = {"Oscar","Olivia","Octavio","Ofelia"},
        Objeto     = {"Olla","Ordenador","Órgano","Overol"},
        Color      = {"Ocre","Oro","Obsidiana","Óxido"},
        CiudadPais = {"Omán","Oceanía","Oslo","Orlando"},
        Fruta      = {"Olivo","Orejón","Opuntia","Ombú (fruto)"},
        Animal     = {"Oso","Oveja","Ornitorrinco","Orangután"},
    },
    P = {
        Nombre     = {"Pedro","Paula","Patricio","Patricia"},
        Objeto     = {"Puerta","Plato","Pelota","Peine"},
        Color      = {"Púrpura","Plateado","Perla","Pistacho"},
        CiudadPais = {"Perú","Panamá","Portugal","Praga"},
        Fruta      = {"Pera","Piña","Papaya","Pomelo"},
        Animal     = {"Pato","Perro","Pulpo","Pingüino"},
    },
    Q = {
        Nombre     = {"Quintín","Quiara","Quirino","Querubina"},
        Objeto     = {"Quemador","Quena","Queso (utensilio)","Quilla"},
        Color      = {"Quinoa","Quemado","Quartz","Quinacridona"},
        CiudadPais = {"Quito","Qatar","Queensland","Querétaro"},
        Fruta      = {"Quinoto","Quenepa","Quandong","Quisqualis"},
        Animal     = {"Quetzal","Quirquincho","Quokka","Quolls"},
    },
    R = {
        Nombre     = {"Roberto","Rosa","Ricardo","Renata"},
        Objeto     = {"Reloj","Radio","Regla","Raqueta"},
        Color      = {"Rojo","Rosado","Rubí","Rosa"},
        CiudadPais = {"Rusia","Rumania","Roma","República Dominicana"},
        Fruta      = {"Ruibarbo","Rambután","Racimo (uvas)","Reineta"},
        Animal     = {"Rana","Ratón","Rinoceronte","Reno"},
    },
    S = {
        Nombre     = {"Sergio","Sofía","Santiago","Silvia"},
        Objeto     = {"Silla","Sombrero","Sartén","Secador"},
        Color      = {"Salmón","Sepia","Siena","Smeraldo"},
        CiudadPais = {"Suecia","Suiza","Singapur","Sudáfrica"},
        Fruta      = {"Sandía","Saúco","Salak","Satsuma"},
        Animal     = {"Serpiente","Sapo","Salamandra","Suricata"},
    },
    T = {
        Nombre     = {"Tomás","Teresa","Tobías","Tania"},
        Objeto     = {"Taza","Tijeras","Teléfono","Tenedor"},
        Color      = {"Turquesa","Tostado","Terracota","Titanio"},
        CiudadPais = {"Turquía","Tailandia","Túnez","Tokio"},
        Fruta      = {"Tomate","Tamarindo","Toronja","Tuna"},
        Animal     = {"Tigre","Tortuga","Tiburón","Tucán"},
    },
    U = {
        Nombre     = {"Umberto","Úrsula","Ulises","Uxía"},
        Objeto     = {"Uniforme","Utensilio","Urna","Ukelele"},
        Color      = {"Ultramar","Uva (color)","Umbrío","Ubicuo (neutro)"},
        CiudadPais = {"Uruguay","Ucrania","Uganda","Utah"},
        Fruta      = {"Uva","Ugli","Uvilla","Uchuva"},
        Animal     = {"Urraca","Uapití","Uacarí","Urogallo"},
    },
    V = {
        Nombre     = {"Víctor","Valentina","Vicente","Verónica"},
        Objeto     = {"Vaso","Ventana","Violín","Vestido"},
        Color      = {"Violeta","Verde","Vino","Vanilla"},
        CiudadPais = {"Venezuela","Vietnam","Varsovia","Valencia"},
        Fruta      = {"Uva","Vainilla","Vaccinium","Vitis"},
        Animal     = {"Vaca","Víbora","Venado","Vampiro"},
    },
    W = {
        Nombre     = {"Walter","Wendy","Wilson","Wanda"},
        Objeto     = {"Walkie-talkie","Wafflera","Whisky","Webcam"},
        Color      = {"Wengué","Whisky (color)","Wisteria"},
        CiudadPais = {"Washington","Gales","Winnipeg","Wellington"},
        Fruta      = {"Wineberry","Wolfberry"},
        Animal     = {"Wombat","Weimaraner","Morsa (Walrus)"},
    },
    X = {
        Nombre     = {"Ximena","Xavier","Xiomara","Xander"},
        Objeto     = {"Xilófono","Xerocopiadora"},
        Color      = {"Xanadú"},
        CiudadPais = {"Xalapa","Xi'an"},
        Fruta      = {"Ximenia"},
        Animal     = {"Xoloitzcuintle","Xifóptero"},
    },
    Y = {
        Nombre     = {"Yamila","Yago","Yolanda","Yesenia"},
        Objeto     = {"Yate","Yesquero","Yunque","Yoyo"},
        Color      = {"Amarillo (tono Yellow)","Yema","Yeso"},
        CiudadPais = {"Yemen","Yakarta","Yucatán"},
        Fruta      = {"Yaca","Yuzu","Yerbamora","Yumberry"},
        Animal     = {"Yak","Yaguareté","Yacaré","Yegua"},
    },
    Z = {
        Nombre     = {"Zacarías","Zoe","Zelda","Zafira"},
        Objeto     = {"Zapato","Zarcillo","Zipper","Zona"},
        Color      = {"Zafiro","Zinc","Zanahoria","Zenith"},
        CiudadPais = {"Zimbabwe","Zaragoza","Zambia","Zúrich"},
        Fruta      = {"Zapote","Zarzamora","Zarza","Zumaque"},
        Animal     = {"Zorro","Zebra","Zorillo","Zamuro"},
    },
}

-- ════════════════════════════════════════════
--              ESTADO GLOBAL
-- ════════════════════════════════════════════
local isActive      = false
local currentLetter = "A"
local currentRound  = 1             -- roundId real, lo manda StartRound
local autoConn      = nil
local logLines      = {}            -- historial de 4 líneas para el mini-log
local minDelay      = 3             -- delay mínimo tipo humano (segundos)
local maxDelay      = 8             -- delay máximo tipo humano (segundos)

-- ════════════════════════════════════════════
--    BUSCAR REMOTES (sin timeout = sin nil)
-- ════════════════════════════════════════════
-- Usamos FindFirstChild en un loop breve para no bloquear
-- y no recibir nil por timeout.
local SubmitAnswers    = nil
local ForceSubmitEvent = nil
local StartRoundEvent  = nil

task.spawn(function()
    local bastaEvents = RepStorage:WaitForChild("BastaEvents", 20)
    if not bastaEvents then
        warn("[BastaBot] BastaEvents no encontrado en 20 s")
        return
    end
    SubmitAnswers    = bastaEvents:WaitForChild("SubmitAnswers",       20)
    ForceSubmitEvent = bastaEvents:WaitForChild("ForceSubmitAnswers", 20)
    StartRoundEvent  = bastaEvents:WaitForChild("StartRound",          20)

    if SubmitAnswers    then print("[BastaBot] ✅ SubmitAnswers encontrado")     else warn("[BastaBot] ❌ SubmitAnswers NO encontrado")     end
    if ForceSubmitEvent then print("[BastaBot] ✅ ForceSubmitAnswers encontrado") else warn("[BastaBot] ❌ ForceSubmitAnswers NO encontrado") end
    if StartRoundEvent  then print("[BastaBot] ✅ StartRound encontrado")         else warn("[BastaBot] ❌ StartRound NO encontrado")         end

    -- Listener pasivo: mantiene currentRound y currentLetter
    -- sincronizados desde el arranque, aunque el bot todavía
    -- no esté activado. Así, si activás el bot a mitad de
    -- partida, ya tiene la ronda correcta.
    if StartRoundEvent then
        StartRoundEvent.OnClientEvent:Connect(function(data)
            if typeof(data) == "table" then
                if typeof(data.roundId) == "number" then currentRound = data.roundId end
                if typeof(data.letter)  == "string" then currentLetter = data.letter  end
            end
        end)
    end
end)

-- ════════════════════════════════════════════
--          HELPER: LOG VISIBLE EN GUI
-- ════════════════════════════════════════════
local LogLabel  -- se define después de crear la GUI

local function addLog(msg)
    print("[BastaBot] " .. msg)
    table.insert(logLines, 1, msg)     -- más reciente arriba
    if #logLines > 4 then
        table.remove(logLines)
    end
    if LogLabel then
        LogLabel.Text = table.concat(logLines, "\n")
    end
end

-- ════════════════════════════════════════════
--            CONSTRUIR RESPUESTAS
-- ════════════════════════════════════════════
local function getAnswers(letter)
    local L    = string.upper(tostring(letter or "A"):sub(1,1))
    local data = DB[L]
    if not data then
        addLog("⚠️ Letra '"..L.."' sin DB → fallback")
        return {
            Nombre=L.."ombre", Objeto=L.."bjeto", Color=L.."olor",
            CiudadPais=L.."iudad", Fruta=L.."ruta", Animal=L.."nimal",
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
--            ENVIAR RESPUESTAS
-- ════════════════════════════════════════════
-- El juego real dispara SubmitAnswers:FireServer con la tabla
-- COMPLETA cada vez que el jugador termina de escribir un campo
-- (autosave incremental), no una sola vez al final. Repetimos
-- ese patrón: vamos completando los 6 campos en el orden real
-- de la tabla (Nombre, Fruta, Color, CiudadPais, Animal, Objeto)
-- y mandamos un FireServer después de cada uno.
local FIELD_ORDER = {"Nombre", "Fruta", "Color", "CiudadPais", "Animal", "Objeto"}

local function fireOne(partialAnswers, label)
    if not SubmitAnswers then
        local be = RepStorage:FindFirstChild("BastaEvents")
        SubmitAnswers = be and be:FindFirstChild("SubmitAnswers")
        if not SubmitAnswers then
            addLog("❌ Remote no disponible, abortando")
            return false
        end
    end
    local ok, err = pcall(function()
        SubmitAnswers:FireServer(partialAnswers, currentRound)
    end)
    if ok then
        addLog("✅ " .. label)
    else
        addLog("❌ Error: " .. tostring(err):sub(1,40))
    end
    return ok
end

local function sendAnswers()
    if not SubmitAnswers then
        local be = RepStorage:FindFirstChild("BastaEvents")
        SubmitAnswers = be and be:FindFirstChild("SubmitAnswers")
        if not SubmitAnswers then
            addLog("❌ SubmitAnswers = nil, abortando")
            return
        end
    end

    local full = getAnswers(currentLetter)
    addLog(string.format("📝 Escribiendo [%s] %s/%s/%s", currentLetter,
        full.Nombre, full.Fruta, full.Objeto))

    -- Tabla que se va llenando progresivamente. Los campos aún
    -- no "escritos" van vacíos, como en el TextBox real del juego.
    local partial = {Nombre="", Objeto="", Color="", CiudadPais="", Fruta="", Animal=""}

    for i, field in ipairs(FIELD_ORDER) do
        partial[field] = full[field]
        fireOne(partial, string.format("Campo %d/6: %s = %s", i, field, full[field]))
        -- Pausa corta tipo "tipeo" entre campo y campo. Solo
        -- esperamos si no es el último campo.
        if i < #FIELD_ORDER then
            task.wait(math.random(25, 70) / 100)  -- 0.25–0.7s entre campos
        end
    end

    -- Disparo final de confirmación con la tabla completa, por
    -- si el server usa el último FireServer recibido como el
    -- definitivo (igual que hace el juego real al final).
    task.wait(0.15)
    fireOne(full, "Envío final confirmado")
end

-- ════════════════════════════════════════════
--                GUI PRINCIPAL
-- ════════════════════════════════════════════
if PlayerGui:FindFirstChild("BastaBot_GUI") then
    PlayerGui.BastaBot_GUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name           = "BastaBot_GUI"
ScreenGui.ResetOnSpawn   = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder   = 9999   -- ← ENCIMA DE TODO, fix principal
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent         = PlayerGui

-- ── Botón flotante ────────────────────────────
local FloatBtn = Instance.new("TextButton")
FloatBtn.Name             = "FloatBtn"
FloatBtn.Size             = UDim2.new(0, 46, 0, 46)
FloatBtn.Position         = UDim2.new(0, 6, 0.44, 0)
FloatBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 48)
FloatBtn.TextColor3       = Color3.fromRGB(255, 255, 255)
FloatBtn.Text             = "🎲"
FloatBtn.Font             = Enum.Font.GothamBold
FloatBtn.TextSize         = 22
FloatBtn.BorderSizePixel  = 0
FloatBtn.ZIndex           = 50
FloatBtn.Parent           = ScreenGui
do
    local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0,14); c.Parent = FloatBtn
    local s = Instance.new("UIStroke"); s.Color = Color3.fromRGB(110,110,220); s.Thickness=1.5; s.Parent=FloatBtn
end

-- ── Ventana principal 225 × 270 ───────────────
local W, H = 225, 300

local Frame = Instance.new("Frame")
Frame.Name             = "MainFrame"
Frame.Size             = UDim2.new(0,W,0,H)
Frame.Position         = UDim2.new(0,60,0.32,0)
Frame.BackgroundColor3 = Color3.fromRGB(16,16,30)
Frame.BorderSizePixel  = 0
Frame.Visible          = false
Frame.Active           = true
Frame.ZIndex           = 40
Frame.Parent           = ScreenGui
do
    local c = Instance.new("UICorner"); c.CornerRadius=UDim.new(0,12); c.Parent=Frame
    local s = Instance.new("UIStroke"); s.Color=Color3.fromRGB(85,85,200); s.Thickness=1.5; s.Parent=Frame
end

-- ── Barra título / drag ───────────────────────
local TitleBar = Instance.new("Frame")
TitleBar.Name             = "TitleBar"
TitleBar.Size             = UDim2.new(1,0,0,32)
TitleBar.BackgroundColor3 = Color3.fromRGB(32,32,62)
TitleBar.BorderSizePixel  = 0
TitleBar.ZIndex           = 41
TitleBar.Active           = true
TitleBar.Parent           = Frame
do
    local c = Instance.new("UICorner"); c.CornerRadius=UDim.new(0,12); c.Parent=TitleBar
    -- parche esquinas inferiores
    local p = Instance.new("Frame")
    p.Size=UDim2.new(1,0,0.5,0); p.Position=UDim2.new(0,0,0.5,0)
    p.BackgroundColor3=Color3.fromRGB(32,32,62); p.BorderSizePixel=0; p.ZIndex=41; p.Parent=TitleBar
end

local TitleLbl = Instance.new("TextLabel")
TitleLbl.Size              = UDim2.new(1,-10,1,0)
TitleLbl.Position          = UDim2.new(0,10,0,0)
TitleLbl.BackgroundTransparency=1
TitleLbl.Text              = "🎲  Basta Bot  v2"
TitleLbl.TextColor3        = Color3.fromRGB(190,190,255)
TitleLbl.Font              = Enum.Font.GothamBold
TitleLbl.TextSize          = 13
TitleLbl.TextXAlignment    = Enum.TextXAlignment.Left
TitleLbl.ZIndex            = 42
TitleLbl.Parent            = TitleBar

-- ── Helpers ───────────────────────────────────
local function label(txt, y, w, col, align)
    local l = Instance.new("TextLabel")
    l.Size=UDim2.new(0,w or W-14,0,18); l.Position=UDim2.new(0,7,0,y)
    l.BackgroundTransparency=1; l.Text=txt
    l.TextColor3=col or Color3.fromRGB(165,165,210)
    l.Font=Enum.Font.Gotham; l.TextSize=11
    l.TextXAlignment=align or Enum.TextXAlignment.Left
    l.ZIndex=41; l.Parent=Frame; return l
end

local function btn(txt, y, bg)
    local b = Instance.new("TextButton")
    b.Size=UDim2.new(0,W-14,0,30); b.Position=UDim2.new(0,7,0,y)
    b.BackgroundColor3=bg or Color3.fromRGB(50,50,95)
    b.TextColor3=Color3.fromRGB(238,238,255)
    b.Text=txt; b.Font=Enum.Font.GothamBold; b.TextSize=12
    b.BorderSizePixel=0; b.ZIndex=41; b.Parent=Frame
    local c=Instance.new("UICorner"); c.CornerRadius=UDim.new(0,8); c.Parent=b
    return b
end

-- ── Widgets ──────────────────────────────────
local StatusLbl = label("Estado: ⛔ INACTIVO", 36, W-14, Color3.fromRGB(255,75,75))

label("Letra de la ronda:", 61)

-- TextBox letra
local LetterBox = Instance.new("TextBox")
LetterBox.Size            = UDim2.new(0,68,0,26)
LetterBox.Position        = UDim2.new(0,W-76,0,58)
LetterBox.BackgroundColor3= Color3.fromRGB(35,35,60)
LetterBox.TextColor3      = Color3.fromRGB(255,230,80)
LetterBox.PlaceholderText = "Ej: B"
LetterBox.Text            = ""
LetterBox.Font            = Enum.Font.GothamBold
LetterBox.TextSize        = 17
LetterBox.ClearTextOnFocus= false
LetterBox.BorderSizePixel = 0
LetterBox.ZIndex          = 42
LetterBox.Parent          = Frame
do
    local c=Instance.new("UICorner"); c.CornerRadius=UDim.new(0,7); c.Parent=LetterBox
    local s=Instance.new("UIStroke"); s.Color=Color3.fromRGB(90,90,180); s.Thickness=1; s.Parent=LetterBox
end

label("Delay antes de enviar (seg):", 88)

local function smallBox(x, placeholder, default)
    local tb = Instance.new("TextBox")
    tb.Size            = UDim2.new(0,40,0,24)
    tb.Position        = UDim2.new(0,x,0,110)
    tb.BackgroundColor3= Color3.fromRGB(35,35,60)
    tb.TextColor3      = Color3.fromRGB(255,230,80)
    tb.PlaceholderText = placeholder
    tb.Text            = tostring(default)
    tb.Font            = Enum.Font.GothamBold
    tb.TextSize        = 15
    tb.ClearTextOnFocus= false
    tb.BorderSizePixel = 0
    tb.ZIndex          = 42
    tb.Parent          = Frame
    local c=Instance.new("UICorner"); c.CornerRadius=UDim.new(0,7); c.Parent=tb
    local s=Instance.new("UIStroke"); s.Color=Color3.fromRGB(90,90,180); s.Thickness=1; s.Parent=tb
    return tb
end

local MinDelayBox = smallBox(7, "min", minDelay)
label("a", 116, 14, Color3.fromRGB(165,165,210), Enum.TextXAlignment.Center).Position = UDim2.new(0,52,0,116)
local MaxDelayBox = smallBox(64, "max", maxDelay)
label("Rango random tipo humano.", 138, W-14, Color3.fromRGB(120,120,150))

local ToggleBot = btn("⚡  ACTIVAR  AUTO-BOT",  159,  Color3.fromRGB(46,46,92))
local ManualBtn = btn("📤  ENVIAR AHORA (manual)", 197, Color3.fromRGB(35,82,44))
local TestBtn   = btn("🔍  TEST CONEXIÓN REMOTE",  235, Color3.fromRGB(75,55,20))

-- ── Mini-log (4 líneas) ───────────────────────
local logBg = Instance.new("Frame")
logBg.Size=UDim2.new(0,W-14,0,60); logBg.Position=UDim2.new(0,7,0,273)
logBg.BackgroundColor3=Color3.fromRGB(10,10,22); logBg.BorderSizePixel=0; logBg.ZIndex=41; logBg.Parent=Frame
do local c=Instance.new("UICorner"); c.CornerRadius=UDim.new(0,6); c.Parent=logBg end

LogLabel = Instance.new("TextLabel")
LogLabel.Size=UDim2.new(1,-6,1,-4); LogLabel.Position=UDim2.new(0,3,0,2)
LogLabel.BackgroundTransparency=1
LogLabel.Text="— log de eventos —"
LogLabel.TextColor3=Color3.fromRGB(110,180,110)
LogLabel.Font=Enum.Font.RobotoMono; LogLabel.TextSize=9
LogLabel.TextXAlignment=Enum.TextXAlignment.Left
LogLabel.TextYAlignment=Enum.TextYAlignment.Top
LogLabel.TextWrapped=true; LogLabel.ZIndex=42; LogLabel.Parent=logBg

-- ════════════════════════════════════════════
--       DRAG TÁCTIL (TitleBar)
-- ════════════════════════════════════════════
local dragging, dragInput, dragStart, startPos = false, nil, nil, nil

TitleBar.InputBegan:Connect(function(inp)
    local t = inp.UserInputType
    if t==Enum.UserInputType.MouseButton1 or t==Enum.UserInputType.Touch then
        dragging=true; dragStart=inp.Position; startPos=Frame.Position
        inp.Changed:Connect(function()
            if inp.UserInputState==Enum.UserInputState.End then dragging=false end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(inp)
    local t=inp.UserInputType
    if t==Enum.UserInputType.MouseMovement or t==Enum.UserInputType.Touch then
        dragInput=inp
    end
end)

UserInput.InputChanged:Connect(function(inp)
    if inp==dragInput and dragging then
        local d=inp.Position-dragStart
        Frame.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,
                                  startPos.Y.Scale,startPos.Y.Offset+d.Y)
    end
end)

-- ════════════════════════════════════════════
--         ABRIR / CERRAR MENÚ
-- ════════════════════════════════════════════
FloatBtn.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

-- ════════════════════════════════════════════
--          TEXTBOX → letra actual
-- ════════════════════════════════════════════
LetterBox:GetPropertyChangedSignal("Text"):Connect(function()
    local u = string.upper(LetterBox.Text:sub(1,1))
    if LetterBox.Text ~= u then LetterBox.Text = u end
    if u ~= "" then currentLetter = u end
end)

-- ════════════════════════════════════════════
--     TEXTBOX → delay min/max (rango humano)
-- ════════════════════════════════════════════
MinDelayBox:GetPropertyChangedSignal("Text"):Connect(function()
    local n = tonumber(MinDelayBox.Text)
    if n and n >= 0 then
        minDelay = n
        if maxDelay < minDelay then maxDelay = minDelay end
    end
end)

MaxDelayBox:GetPropertyChangedSignal("Text"):Connect(function()
    local n = tonumber(MaxDelayBox.Text)
    if n and n >= 0 then
        maxDelay = n
        if minDelay > maxDelay then minDelay = maxDelay end
    end
end)

-- ════════════════════════════════════════════
--          ACTUALIZAR UI
-- ════════════════════════════════════════════
local function refreshUI()
    if isActive then
        StatusLbl.Text      = "Estado: ✅ ACTIVO"
        StatusLbl.TextColor3= Color3.fromRGB(60,220,80)
        ToggleBot.Text      = "🛑  DESACTIVAR  AUTO-BOT"
        ToggleBot.BackgroundColor3=Color3.fromRGB(120,30,30)
    else
        StatusLbl.Text      = "Estado: ⛔ INACTIVO"
        StatusLbl.TextColor3= Color3.fromRGB(255,75,75)
        ToggleBot.Text      = "⚡  ACTIVAR  AUTO-BOT"
        ToggleBot.BackgroundColor3=Color3.fromRGB(46,46,92)
    end
end

-- ════════════════════════════════════════════
--     BOTÓN: TEST DE CONEXIÓN REMOTES
-- ════════════════════════════════════════════
TestBtn.MouseButton1Click:Connect(function()
    addLog("🔍 Buscando BastaEvents...")
    local be = RepStorage:FindFirstChild("BastaEvents")
    if not be then
        addLog("❌ BastaEvents no existe"); return
    end
    addLog("✅ BastaEvents OK")
    local sa = be:FindFirstChild("SubmitAnswers")
    local fs = be:FindFirstChild("ForceSubmitAnswers")
    local sr = be:FindFirstChild("StartRound")
    addLog(sa and "✅ SubmitAnswers OK" or "❌ SubmitAnswers FALTA")
    addLog(sr and "✅ StartRound OK"    or "❌ StartRound FALTA")
    addLog(fs and "✅ ForceSubmit OK"   or "❌ ForceSubmit FALTA")
    -- actualizar referencias
    SubmitAnswers    = sa
    ForceSubmitEvent = fs
    StartRoundEvent  = sr
end)

-- ════════════════════════════════════════════
--    BOTÓN: ACTIVAR / DESACTIVAR AUTO-BOT
-- ════════════════════════════════════════════
ToggleBot.MouseButton1Click:Connect(function()
    isActive = not isActive
    refreshUI()

    if isActive then
        -- Intentar obtener el remote si aún es nil
        if not StartRoundEvent then
            local be = RepStorage:FindFirstChild("BastaEvents")
            StartRoundEvent = be and be:FindFirstChild("StartRound")
        end

        if not StartRoundEvent then
            addLog("❌ StartRound nil; solo manual")
        else
            addLog("👂 Conectado a StartRound")
            autoConn = StartRoundEvent.OnClientEvent:Connect(function(data)
                -- Guardamos SIEMPRE ronda/letra reales, incluso si
                -- el bot está inactivo, para no desincronizarnos
                -- si se reactiva después.
                if typeof(data) == "table" then
                    if typeof(data.roundId) == "number" then currentRound  = data.roundId end
                    if typeof(data.letter)  == "string" then currentLetter = data.letter  end
                end

                if not isActive then return end
                addLog(string.format("🆕 Ronda %s, letra %s", tostring(currentRound), tostring(currentLetter)))

                -- Delay tipo humano ANTES de escribir: nadie
                -- contesta 6 campos en el instante 0 de la ronda.
                local wait = math.random(minDelay*10, maxDelay*10) / 10
                addLog(string.format("⏳ Esperando %.1fs antes de enviar", wait))
                task.delay(wait, function()
                    if isActive then sendAnswers() end
                end)
            end)
        end
    else
        if autoConn then autoConn:Disconnect(); autoConn=nil end
        addLog("🛑 Auto-bot desactivado")
    end
end)

-- ════════════════════════════════════════════
--        BOTÓN: ENVÍO MANUAL
-- ════════════════════════════════════════════
ManualBtn.MouseButton1Click:Connect(function()
    if currentLetter=="" then
        addLog("⚠️ Escribe la letra primero"); return
    end
    -- Rescate de remote en tiempo real
    if not SubmitAnswers then
        local be=RepStorage:FindFirstChild("BastaEvents")
        SubmitAnswers = be and be:FindFirstChild("SubmitAnswers")
    end
    task.spawn(sendAnswers)
end)

-- ════════════════════════════════════════════
print("[BastaBot] v2 ✅ Cargado. Toca 🎲 para abrir.")
addLog("Script cargado - presiona TEST primero")
