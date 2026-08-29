-- ╔══════════════════════════════════════════════════════════╗
-- ║             🎲 BASTA BOT v4  —  Anti-Anticheat          ║
-- ║  Escribe en los TextBoxes REALES del juego +            ║
-- ║  clickea el botón BASTA real → el LocalScript           ║
-- ║  legítimo hace el FireServer con contexto correcto      ║
-- ╚══════════════════════════════════════════════════════════╝

local Players    = game:GetService("Players")
local RepStorage = game:GetService("ReplicatedStorage")
local UserInput  = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")
local OUR_GUI     = "BastaBot_GUI"   -- nombre de nuestra GUI, para excluirla

-- ════════════════════════════════════════════
--              BASE DE DATOS
-- ════════════════════════════════════════════
local DB = {
    A={Nombre={"Alejandro","Andrés","Ana","Adriana"},Objeto={"Avión","Armario","Aguja","Auricular"},Color={"Amarillo","Azul","Añil","Aguamarina"},CiudadPais={"Argentina","Amsterdam","Atenas","Angola"},Fruta={"Arándano","Aguacate","Anona","Almendra"},Animal={"Águila","Ardilla","Avestruz","Araña"}},
    B={Nombre={"Bruno","Beatriz","Bernardo","Bárbara"},Objeto={"Bicicleta","Bolso","Botella","Bastón"},Color={"Blanco","Beige","Borgoña","Bronce"},CiudadPais={"Brasil","Bolivia","Bélgica","Bangkok"},Fruta={"Banana","Boysenberry","Breva","Berenjena"},Animal={"Ballena","Búfalo","Burro","Boa"}},
    C={Nombre={"Carlos","Carmen","Cristina","César"},Objeto={"Cama","Cuchillo","Camisa","Calculadora"},Color={"Celeste","Carmesí","Coral","Cobre"},CiudadPais={"Colombia","Cuba","Chile","Canadá"},Fruta={"Cereza","Ciruela","Coco","Carambola"},Animal={"Caballo","Cocodrilo","Conejo","Cuervo"}},
    D={Nombre={"Diego","Diana","Daniel","Daniela"},Objeto={"Dado","Destornillador","Diario","Disfraz"},Color={"Dorado","Durazno","Damasco","Denim"},CiudadPais={"Dubai","Dinamarca","Dominicana","Dublín"},Fruta={"Durazno","Dátil","Dragonfruta","Damasco"},Animal={"Delfín","Dromedario","Dingo","Dugong"}},
    E={Nombre={"Eduardo","Elena","Esteban","Emilia"},Objeto={"Escalera","Espejo","Estante","Estufa"},Color={"Esmeralda","Escarlata","Ébano","Eléctrico"},CiudadPais={"España","Ecuador","Egipto","Eslovenia"},Fruta={"Escaramujo","Endrina","Emblica","Endrino"},Animal={"Elefante","Erizo","Escorpión","Estrella de mar"}},
    F={Nombre={"Fernando","Fernanda","Felipe","Fabiola"},Objeto={"Foco","Flauta","Folder","Freidora"},Color={"Fucsia","Frambuesa","Fresa","Flúor"},CiudadPais={"Francia","Finlandia","Filipinas","Fiji"},Fruta={"Fresa","Frambuesa","Feijoa","Fruta del dragón"},Animal={"Flamenco","Foca","Faisán","Felino"}},
    G={Nombre={"Gabriel","Gabriela","Gustavo","Gloria"},Objeto={"Guitarra","Gafas","Globo","Guante"},Color={"Gris","Granada","Granate","Grafito"},CiudadPais={"Guatemala","Grecia","Ghana","Ginebra"},Fruta={"Granada","Guayaba","Grosella","Guanábana"},Animal={"Gorila","Gato","Gallina","Golondrina"}},
    H={Nombre={"Hugo","Helena","Héctor","Hortensia"},Objeto={"Hacha","Helicóptero","Horno","Hamaca"},Color={"Hueso","Hierro","Hollín","Hielo"},CiudadPais={"Honduras","Hungría","Haití","Helsinki"},Fruta={"Higo","Huckleberry","Hawthorn","Horchata"},Animal={"Hipopótamo","Halcón","Hormiga","Hiena"}},
    I={Nombre={"Ignacio","Isabel","Iván","Irene"},Objeto={"Impresora","Imán","Interruptor","Instrumento"},Color={"Índigo","Ivory","Iris","Ígneo"},CiudadPais={"Italia","India","Indonesia","Irlanda"},Fruta={"Icaco","Ilama","Imbe","Inga"},Animal={"Iguana","Impala","Ibis","Isópodo"}},
    J={Nombre={"Juan","Julia","Jorge","Josefa"},Objeto={"Jarra","Jaula","Jersey","Jabón"},Color={"Jade","Jaspe","Jengibre","Jockey"},CiudadPais={"Jamaica","Japón","Jordania","Jakarta"},Fruta={"Jaca","Jocote","Jambolan","Jobo"},Animal={"Jaguar","Jabalí","Jilguero","Jerbo"}},
    K={Nombre={"Kevin","Karen","Karina","Kiko"},Objeto={"Karate","Kayak","Kiosco","Kit"},Color={"Kaki","Kermes","Kiwi verde","Kelp"},CiudadPais={"Kenia","Kuwait","Kazajistán","Kyoto"},Fruta={"Kiwi","Kumquat","Kakis","Kaffir lime"},Animal={"Koala","Krill","Kudu","Kinkajou"}},
    L={Nombre={"Luis","Laura","Leonardo","Lucía"},Objeto={"Lámpara","Libro","Llave","Lavadora"},Color={"Lavanda","Lima","Lila","Limón"},CiudadPais={"Lima","Lisboa","Londres","Luxemburgo"},Fruta={"Limón","Lima","Lichí","Longan"},Animal={"León","Leopardo","Lagarto","Lobo"}},
    M={Nombre={"Miguel","María","Marcos","Mariana"},Objeto={"Mesa","Mochila","Martillo","Micrófono"},Color={"Magenta","Marrón","Mostaza","Malva"},CiudadPais={"México","Madrid","Marruecos","Manila"},Fruta={"Mango","Manzana","Melón","Mora"},Animal={"Mono","Mariposa","Murciélago","Medusa"}},
    N={Nombre={"Nicolás","Natalia","Néstor","Nadia"},Objeto={"Nevera","Navaja","Nube","Notebook"},Color={"Negro","Naranja","Nácar","Nogal"},CiudadPais={"Nigeria","Noruega","Nepal","Nicaragua"},Fruta={"Naranja","Nectarina","Níspero","Nuez"},Animal={"Nutria","Narval","Ñu","Nightingale"}},
    O={Nombre={"Oscar","Olivia","Orlando","Ofelia"},Objeto={"Olla","Ordenador","Orejera","Overol"},Color={"Ocre","Oliva","Ópalo","Óxido"},CiudadPais={"Oslo","Ontario","Omán","Osaka"},Fruta={"Oliva","Orito","Oca","Opuntia"},Animal={"Oso","Oveja","Ornitorrinco","Orangután"}},
    P={Nombre={"Pedro","Paula","Pablo","Patricia"},Objeto={"Paraguas","Plato","Pelota","Pincel"},Color={"Púrpura","Plateado","Pino","Pizarra"},CiudadPais={"Perú","Portugal","Panamá","París"},Fruta={"Papaya","Pera","Piña","Plátano"},Animal={"Perro","Pato","Pingüino","Pantera"}},
    Q={Nombre={"Quique","Quintín","Queila","Quirino"},Objeto={"Queso","Quilombo","Quimono","Quiosco"},Color={"Quetzal verde","Quemado","Quermes","Quieto gris"},CiudadPais={"Quebec","Qatar","Querétaro","Quito"},Fruta={"Quenepa","Quepa","Quinoto","Quetzalfruta"},Animal={"Quetzal","Quirquincho","Quoll","Quahog"}},
    R={Nombre={"Roberto","Rosa","Rodrigo","Raquel"},Objeto={"Radio","Reloj","Regla","Refrigerador"},Color={"Rojo","Rosa","Rubí","Rojizo"},CiudadPais={"Rusia","Roma","Rumania","Río de Janeiro"},Fruta={"Rambután","Ruibarbo","Rosa mosqueta","Romero"},Animal={"Rana","Ratón","Rinoceronte","Roedor"}},
    S={Nombre={"Santiago","Sara","Sebastián","Sofía"},Objeto={"Silla","Sartén","Sofá","Serrucho"},Color={"Salmón","Siena","Sepia","Safiro"},CiudadPais={"Santiago","Suecia","Suiza","Singapur"},Fruta={"Sandía","Saúco","Sapote","Satsuma"},Animal={"Serpiente","Sapo","Salamandra","Salmón"}},
    T={Nombre={"Tomás","Teresa","Timoteo","Tamara"},Objeto={"Televisor","Tijeras","Teléfono","Taza"},Color={"Turquesa","Tostado","Tierra","Topacio"},CiudadPais={"Turquía","Tailandia","Tanzania","Toronto"},Fruta={"Tomate","Tamarindo","Tangerina","Tuna"},Animal={"Tigre","Tortuga","Toro","Tucán"}},
    V={Nombre={"Víctor","Valentina","Vicente","Verónica"},Objeto={"Vaso","Ventana","Violín","Vestido"},Color={"Violeta","Verde","Vino","Vanilla"},CiudadPais={"Venezuela","Vietnam","Varsovia","Valencia"},Fruta={"Uva","Vainilla","Vaccinium","Vitis"},Animal={"Vaca","Víbora","Venado","Vampiro"}},
    W={Nombre={"Walter","Wanda","Wilson","Wendy"},Objeto={"Walkie-talkie","Wifi","Webcam","Waffle"},Color={"Wengué","Whiskey","Watermelon pink","Wine"},CiudadPais={"Washington","Windhoek","Wellington","Wuhan"},Fruta={"Watermelon","Wampee","Wineberry","Wolfberry"},Animal={"Wombat","Walrus","Woodpecker","Wolverine"}},
    X={Nombre={"Xochitl","Xerxes","Xiomara","Xóchitl"},Objeto={"Xilófono","Xbox","Xerografía","Xenón"},Color={"Xanadu","Xanthic","Xikrin rojo","Xenon azul"},CiudadPais={"Xalapa","Xochimilco","Xian","Xilitla"},Fruta={"Xoconostle","Ximenia","Xigua","Xuanhua"},Animal={"Xenops","Xerus","Xantusia","Xiphias"}},
    Y={Nombre={"Yamile","Yolanda","Yago","Yesenia"},Objeto={"Yate","Yeso","Yogur","Yunque"},Color={"Yema","Yellow","Yodo naranja","Yerba verde"},CiudadPais={"Yemen","Yucatán","Yereván","Yokohama"},Fruta={"Yuzu","Yaca","Yangmei","Yumberry"},Animal={"Yak","Yacaré","Yapok","Yellowfin"}},
    Z={Nombre={"Zacarías","Zoe","Zelda","Zafira"},Objeto={"Zapato","Zarcillo","Zipper","Zona"},Color={"Zafiro","Zinc","Zanahoria","Zenith"},CiudadPais={"Zimbabwe","Zaragoza","Zambia","Zúrich"},Fruta={"Zapote","Zarzamora","Zarza","Zumaque"},Animal={"Zorro","Zebra","Zorillo","Zamuro"}},
}

-- ════════════════════════════════════════════
--         ESTADO GLOBAL
-- ════════════════════════════════════════════
local isActive      = false
local currentLetter = ""
local autoConn      = nil
local logLines      = {}
local LogLabel      = nil   -- asignado tras crear GUI

-- Patrones para identificar cada categoría en el contexto de un widget
local CAT_PATTERNS = {
    Nombre     = {"name","nombre","nom","nام"},
    Fruta      = {"fruit","fruta","fru"},
    CiudadPais = {"city","ciudad","country","pais","país","location"},
    Animal     = {"animal","ani"},
    Objeto     = {"object","objeto","obj","item","cosa","thing"},
    Color      = {"color","colour","col"},
}

-- ════════════════════════════════════════════
--         MINI-LOG
-- ════════════════════════════════════════════
local function addLog(msg)
    print("[BastaBot] " .. msg)
    table.insert(logLines, 1, msg)
    if #logLines > 5 then table.remove(logLines) end
    if LogLabel then LogLabel.Text = table.concat(logLines, "\n") end
end

-- ════════════════════════════════════════════
--         HELPERS DE BÚSQUEDA EN GUI
-- ════════════════════════════════════════════

-- Devuelve true si 'obj' pertenece a nuestra GUI
local function isOurs(obj)
    local node = obj
    while node and node ~= PlayerGui do
        if node.Name == OUR_GUI then return true end
        node = node.Parent
    end
    return false
end

-- Extrae texto contextual de un objeto y sus vecinos cercanos
local function getContext(obj)
    local parts = {}
    local function addText(o)
        if o:IsA("TextLabel") or o:IsA("TextButton") or o:IsA("TextBox") then
            parts[#parts+1] = o.Text:lower()
        end
        if o:IsA("TextBox") then
            parts[#parts+1] = o.PlaceholderText:lower()
        end
    end
    addText(obj)
    if obj.Parent then
        addText(obj.Parent)
        for _, sib in ipairs(obj.Parent:GetChildren()) do addText(sib) end
        if obj.Parent.Parent then
            for _, cousin in ipairs(obj.Parent.Parent:GetChildren()) do
                addText(cousin)
                for _, c2 in ipairs(cousin:GetChildren()) do addText(c2) end
            end
        end
    end
    return table.concat(parts, " ")
end

-- Identifica la categoría de un TextBox a partir de su contexto
local function identifyCategory(box)
    local ctx = getContext(box)
    for cat, patterns in pairs(CAT_PATTERNS) do
        for _, p in ipairs(patterns) do
            if ctx:find(p, 1, true) then return cat end
        end
    end
    return nil
end

-- ════════════════════════════════════════════
--   BUSCAR TEXTBOXES DEL JUEGO Y MAPEAR
-- ════════════════════════════════════════════
local function findGameTextBoxes()
    local mapped  = {}   -- { Nombre=box, Fruta=box, ... }
    local unmatched = {} -- cajas que no se pudieron identificar

    for _, obj in ipairs(PlayerGui:GetDescendants()) do
        if isOurs(obj) then continue end
        if not (obj:IsA("TextBox") and obj.Visible) then continue end

        local cat = identifyCategory(obj)
        if cat and not mapped[cat] then
            mapped[cat] = obj
        else
            table.insert(unmatched, obj)
        end
    end
    return mapped, unmatched
end

-- ════════════════════════════════════════════
--   BUSCAR EL BOTÓN BASTA / SUBMIT DEL JUEGO
-- ════════════════════════════════════════════
local BASTA_KEYWORDS = {
    "basta","stop","submit","enviar","parar","done","finish","listo"
}
local function findBastaButton()
    -- Primero busca en TextButton visibles
    for _, obj in ipairs(PlayerGui:GetDescendants()) do
        if isOurs(obj) then continue end
        if not obj.Visible then continue end
        if obj:IsA("TextButton") or obj:IsA("ImageButton") then
            local t = (obj:IsA("TextButton") and obj.Text or obj.Name):lower()
            for _, kw in ipairs(BASTA_KEYWORDS) do
                if t:find(kw, 1, true) then
                    return obj
                end
            end
        end
    end
    return nil
end

-- ════════════════════════════════════════════
--   ESCRIBIR EN UN TEXTBOX COMO SI FUERA REAL
--   CaptureFocus → .Text → ReleaseFocus(true)
--   Esto dispara los eventos Focus / FocusLost
--   del LocalScript del juego correctamente
-- ════════════════════════════════════════════
local function typeInBox(box, text)
    box:CaptureFocus()
    task.wait(0.04)
    box.Text = text
    task.wait(0.04)
    box:ReleaseFocus(true)   -- true = como si el usuario presionó Enter
    task.wait(0.05)
end

-- ════════════════════════════════════════════
--   STRATÉGIA PRINCIPAL: UI INJECTION
--   Llena los TextBoxes reales del juego y
--   hace clic en el botón BASTA real.
--   El LocalScript del juego se encarga del
--   FireServer con todo el contexto correcto.
-- ════════════════════════════════════════════
local function getAnswers(letter)
    local L = string.upper(tostring(letter or "A"):sub(1,1))
    local data = DB[L]
    if not data then
        addLog("⚠️ '"..L.."' sin DB → fallback")
        return {Nombre=L.."ombre",Objeto=L.."bjeto",Color=L.."olor",
                CiudadPais=L.."iudad",Fruta=L.."ruta",Animal=L.."nimal"}
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

-- Intento A: UI real (anti-anticheat)
local function injectViaUI(answers)
    local mapped, unmatched = findGameTextBoxes()
    local filled = 0

    -- Llenar cajas identificadas por categoría
    for cat, box in pairs(mapped) do
        if answers[cat] then
            typeInBox(box, answers[cat])
            filled = filled + 1
            addLog(string.format("✏️ %s → %s", cat, answers[cat]))
        end
    end

    -- Si hay cajas sin identificar, llenarlas en orden posicional
    -- con las categorías que faltan
    local FALLBACK_ORDER = {"Nombre","Fruta","CiudadPais","Animal","Objeto","Color"}
    if #unmatched > 0 then
        local missingCats = {}
        for _, cat in ipairs(FALLBACK_ORDER) do
            if not mapped[cat] then table.insert(missingCats, cat) end
        end
        for i, box in ipairs(unmatched) do
            local cat = missingCats[i]
            if cat and answers[cat] then
                typeInBox(box, answers[cat])
                filled = filled + 1
                addLog(string.format("✏️ [pos%d≈%s] → %s", i, cat, answers[cat]))
            end
        end
    end

    return filled, (filled > 0 and #unmatched + (function() local n=0 for _ in pairs(mapped) do n=n+1 end return n end)() or 0)
end

-- Intento B: Clic en botón BASTA real
local function clickBasta()
    local btn = findBastaButton()
    if btn then
        addLog("🖱️ Clic en botón: " .. btn.Name)
        -- Disparar como input real (ejecutores soportan esto)
        local ok = pcall(function()
            btn:Activate()         -- método oficial Roblox
        end)
        if not ok then
            -- Fallback: firesignal del ejecutor
            pcall(function() firesignal(btn.MouseButton1Click) end)
        end
        return true
    end
    return false
end

-- Intento C: FireServer directo como respaldo final
local SubmitAnswers    = nil
local ForceSubmitEvent = nil
task.spawn(function()
    local be = RepStorage:WaitForChild("BastaEvents", 25)
    if not be then return end
    SubmitAnswers    = be:WaitForChild("SubmitAnswers",       25)
    ForceSubmitEvent = be:WaitForChild("ForceSubmitAnswers",  25)
end)

local function fireServerDirect(answers)
    if not SubmitAnswers then
        local be = RepStorage:FindFirstChild("BastaEvents")
        SubmitAnswers = be and be:FindFirstChild("SubmitAnswers")
    end
    if not SubmitAnswers then addLog("❌ Remote nil"); return false end
    local ok, err = pcall(function() SubmitAnswers:FireServer(answers, 1) end)
    addLog(ok and "🔁 Backup FireServer OK" or "❌ "..tostring(err):sub(1,38))
    return ok
end

-- ════════════════════════════════════════════
--   RUTINA COMPLETA DE SUBMIT
-- ════════════════════════════════════════════
local function doSubmit()
    local L = (currentLetter ~= "") and currentLetter or "A"
    local answers = getAnswers(L)

    addLog(string.format("--- Ronda [%s] ---", L))

    -- 1. Llenar TextBoxes reales
    local filled, total = injectViaUI(answers)
    addLog(string.format("✏️ Cajas llenadas: %d/%d", filled, total))

    task.wait(0.15)   -- pausa para que el juego procese el input

    -- 2. Intentar clic en botón BASTA
    local clicked = clickBasta()
    if not clicked then
        addLog("⚠️ Botón BASTA no encontrado")
    end

    -- 3. Si no encontró ninguna caja de input Y no encontró botón
    --    → respaldo: FireServer directo
    if filled == 0 and not clicked then
        addLog("🔁 UI no encontrada → respaldo directo")
        fireServerDirect(answers)
    end
end

-- ════════════════════════════════════════════
--   DETECCIÓN AUTOMÁTICA DE LETRA
-- ════════════════════════════════════════════
local function detectGameLetter()
    for _, obj in ipairs(PlayerGui:GetDescendants()) do
        if isOurs(obj) then continue end
        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            local t = obj.Text:gsub("%s","")
            local found = t:match("[Ll]etter:?(%u)") or t:match("[Ll]etra:?(%u)")
            if found then return found end
            if t:match("^%u$") and obj.TextSize >= 14 then return t end
        end
    end
    return nil
end

-- ════════════════════════════════════════════
--               GUI
-- ════════════════════════════════════════════
if PlayerGui:FindFirstChild(OUR_GUI) then PlayerGui[OUR_GUI]:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name="BastaBot_GUI"; ScreenGui.ResetOnSpawn=false
ScreenGui.IgnoreGuiInset=true; ScreenGui.DisplayOrder=9999
ScreenGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
ScreenGui.Parent=PlayerGui

-- Botón flotante
local FloatBtn=Instance.new("TextButton")
FloatBtn.Name="FloatBtn"; FloatBtn.Size=UDim2.new(0,46,0,46)
FloatBtn.Position=UDim2.new(0,6,0.44,0)
FloatBtn.BackgroundColor3=Color3.fromRGB(20,20,42)
FloatBtn.TextColor3=Color3.fromRGB(255,255,255)
FloatBtn.Text="🎲"; FloatBtn.Font=Enum.Font.GothamBold
FloatBtn.TextSize=22; FloatBtn.BorderSizePixel=0; FloatBtn.ZIndex=50
FloatBtn.Parent=ScreenGui
do local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,14);c.Parent=FloatBtn
   local s=Instance.new("UIStroke");s.Color=Color3.fromRGB(100,100,220);s.Thickness=1.5;s.Parent=FloatBtn end

-- Ventana 225×295
local W,H=225,295
local Frame=Instance.new("Frame")
Frame.Name="MainFrame"; Frame.Size=UDim2.new(0,W,0,H)
Frame.Position=UDim2.new(0,58,0.28,0)
Frame.BackgroundColor3=Color3.fromRGB(13,13,26)
Frame.BorderSizePixel=0; Frame.Visible=false; Frame.Active=true; Frame.ZIndex=40
Frame.Parent=ScreenGui
do local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,12);c.Parent=Frame
   local s=Instance.new("UIStroke");s.Color=Color3.fromRGB(78,78,195);s.Thickness=1.5;s.Parent=Frame end

-- TitleBar
local TitleBar=Instance.new("Frame")
TitleBar.Name="TitleBar"; TitleBar.Size=UDim2.new(1,0,0,32)
TitleBar.BackgroundColor3=Color3.fromRGB(28,28,56)
TitleBar.BorderSizePixel=0; TitleBar.ZIndex=41; TitleBar.Active=true; TitleBar.Parent=Frame
do local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,12);c.Parent=TitleBar
   local p=Instance.new("Frame");p.Size=UDim2.new(1,0,0.5,0);p.Position=UDim2.new(0,0,0.5,0)
   p.BackgroundColor3=Color3.fromRGB(28,28,56);p.BorderSizePixel=0;p.ZIndex=41;p.Parent=TitleBar end
local TitleLbl=Instance.new("TextLabel")
TitleLbl.Size=UDim2.new(1,-8,1,0);TitleLbl.Position=UDim2.new(0,8,0,0)
TitleLbl.BackgroundTransparency=1;TitleLbl.Text="🎲  Basta Bot  v4"
TitleLbl.TextColor3=Color3.fromRGB(180,180,255);TitleLbl.Font=Enum.Font.GothamBold
TitleLbl.TextSize=13;TitleLbl.TextXAlignment=Enum.TextXAlignment.Left
TitleLbl.ZIndex=42;TitleLbl.Parent=TitleBar

-- Helper constructores
local function lbl(txt,y,w,col)
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(0,w or W-14,0,18);l.Position=UDim2.new(0,7,0,y)
    l.BackgroundTransparency=1;l.Text=txt
    l.TextColor3=col or Color3.fromRGB(155,155,205)
    l.Font=Enum.Font.Gotham;l.TextSize=11
    l.TextXAlignment=Enum.TextXAlignment.Left;l.ZIndex=41;l.Parent=Frame;return l
end
local function mkbtn(txt,y,bg)
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(0,W-14,0,29);b.Position=UDim2.new(0,7,0,y)
    b.BackgroundColor3=bg or Color3.fromRGB(44,44,86)
    b.TextColor3=Color3.fromRGB(232,232,255);b.Text=txt
    b.Font=Enum.Font.GothamBold;b.TextSize=11;b.BorderSizePixel=0;b.ZIndex=41;b.Parent=Frame
    local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,8);c.Parent=b;return b
end

-- Widgets
local StatusLbl = lbl("Estado: ⛔ INACTIVO", 36, W-14, Color3.fromRGB(255,75,75))
lbl("Letra:", 62, 46)

local LetterBox=Instance.new("TextBox")
LetterBox.Size=UDim2.new(0,44,0,25);LetterBox.Position=UDim2.new(0,50,0,60)
LetterBox.BackgroundColor3=Color3.fromRGB(30,30,54)
LetterBox.TextColor3=Color3.fromRGB(255,230,55)
LetterBox.PlaceholderText="?";LetterBox.Text=""
LetterBox.Font=Enum.Font.GothamBold;LetterBox.TextSize=17
LetterBox.ClearTextOnFocus=false;LetterBox.BorderSizePixel=0
LetterBox.ZIndex=42;LetterBox.Parent=Frame
do local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,7);c.Parent=LetterBox
   local s=Instance.new("UIStroke");s.Color=Color3.fromRGB(85,85,175);s.Thickness=1;s.Parent=LetterBox end

local AutoLetterBtn=Instance.new("TextButton")
AutoLetterBtn.Size=UDim2.new(0,W-14-50-6,0,25);AutoLetterBtn.Position=UDim2.new(0,100,0,60)
AutoLetterBtn.BackgroundColor3=Color3.fromRGB(28,60,40)
AutoLetterBtn.TextColor3=Color3.fromRGB(100,245,140)
AutoLetterBtn.Text="🎯 Auto-detectar letra";AutoLetterBtn.Font=Enum.Font.GothamBold
AutoLetterBtn.TextSize=10;AutoLetterBtn.BorderSizePixel=0;AutoLetterBtn.ZIndex=42;AutoLetterBtn.Parent=Frame
do local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,7);c.Parent=AutoLetterBtn end

local ToggleBot = mkbtn("⚡  ACTIVAR  AUTO-BOT",        93, Color3.fromRGB(40,40,82))
local ScanBtn   = mkbtn("🔎  ESCANEAR CAJAS DEL JUEGO", 130, Color3.fromRGB(55,40,12))
local ManualBtn = mkbtn("📤  LLENAR + ENVIAR (manual)",  167, Color3.fromRGB(30,75,38))

-- Mini-log 5 líneas
local logBg=Instance.new("Frame")
logBg.Size=UDim2.new(0,W-14,0,72);logBg.Position=UDim2.new(0,7,0,204)
logBg.BackgroundColor3=Color3.fromRGB(7,7,18);logBg.BorderSizePixel=0;logBg.ZIndex=41;logBg.Parent=Frame
do local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,6);c.Parent=logBg end

LogLabel=Instance.new("TextLabel")
LogLabel.Size=UDim2.new(1,-6,1,-4);LogLabel.Position=UDim2.new(0,3,0,2)
LogLabel.BackgroundTransparency=1;LogLabel.Text="— log de eventos —"
LogLabel.TextColor3=Color3.fromRGB(95,175,95)
LogLabel.Font=Enum.Font.RobotoMono;LogLabel.TextSize=9
LogLabel.TextXAlignment=Enum.TextXAlignment.Left
LogLabel.TextYAlignment=Enum.TextYAlignment.Top
LogLabel.TextWrapped=true;LogLabel.ZIndex=42;LogLabel.Parent=logBg

-- ════════════════════════════════════════════
--   DRAG TÁCTIL
-- ════════════════════════════════════════════
local dragging,dragInput,dragStart,startPos=false,nil,nil,nil
TitleBar.InputBegan:Connect(function(inp)
    local t=inp.UserInputType
    if t==Enum.UserInputType.MouseButton1 or t==Enum.UserInputType.Touch then
        dragging=true;dragStart=inp.Position;startPos=Frame.Position
        inp.Changed:Connect(function()
            if inp.UserInputState==Enum.UserInputState.End then dragging=false end
        end)
    end
end)
TitleBar.InputChanged:Connect(function(inp)
    local t=inp.UserInputType
    if t==Enum.UserInputType.MouseMovement or t==Enum.UserInputType.Touch then dragInput=inp end
end)
UserInput.InputChanged:Connect(function(inp)
    if inp==dragInput and dragging then
        local d=inp.Position-dragStart
        Frame.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,
                                  startPos.Y.Scale,startPos.Y.Offset+d.Y)
    end
end)

-- ════════════════════════════════════════════
--   EVENTOS DE UI
-- ════════════════════════════════════════════
FloatBtn.MouseButton1Click:Connect(function() Frame.Visible=not Frame.Visible end)

LetterBox:GetPropertyChangedSignal("Text"):Connect(function()
    local u=string.upper(LetterBox.Text:sub(1,1))
    if LetterBox.Text~=u then LetterBox.Text=u end
    if u~="" then currentLetter=u end
end)

AutoLetterBtn.MouseButton1Click:Connect(function()
    local found=detectGameLetter()
    if found then
        currentLetter=found; LetterBox.Text=found
        addLog("🎯 Letra detectada: "..found)
    else
        addLog("⚠️ No se detectó letra")
    end
end)

-- ESCANEAR CAJAS: muestra cuántas encontró y qué identificó
ScanBtn.MouseButton1Click:Connect(function()
    addLog("🔎 Escaneando GUI del juego...")
    local mapped, unmatched = findGameTextBoxes()
    local btn = findBastaButton()
    local n=0; for _ in pairs(mapped) do n=n+1 end
    addLog(string.format("Cajas ID: %d | Sin ID: %d", n, #unmatched))
    for cat,box in pairs(mapped) do
        addLog(string.format("  ✅ %s → '%s'", cat, box.Name))
    end
    addLog(btn and ("🔘 Botón: "..btn.Name) or "⚠️ Botón BASTA no hallado")
end)

-- Actualizar UI
local function refreshUI()
    if isActive then
        StatusLbl.Text="Estado: ✅ ACTIVO"
        StatusLbl.TextColor3=Color3.fromRGB(50,215,70)
        ToggleBot.Text="🛑  DESACTIVAR  AUTO-BOT"
        ToggleBot.BackgroundColor3=Color3.fromRGB(110,25,25)
    else
        StatusLbl.Text="Estado: ⛔ INACTIVO"
        StatusLbl.TextColor3=Color3.fromRGB(255,75,75)
        ToggleBot.Text="⚡  ACTIVAR  AUTO-BOT"
        ToggleBot.BackgroundColor3=Color3.fromRGB(40,40,82)
    end
end

-- ACTIVAR / DESACTIVAR
ToggleBot.MouseButton1Click:Connect(function()
    isActive=not isActive; refreshUI()
    if isActive then
        if not ForceSubmitEvent then
            local be=RepStorage:FindFirstChild("BastaEvents")
            ForceSubmitEvent=be and be:FindFirstChild("ForceSubmitAnswers")
        end
        if not ForceSubmitEvent then
            addLog("❌ ForceSubmitAnswers nil")
        else
            addLog("👂 Escuchando ForceSubmit...")
            autoConn=ForceSubmitEvent.OnClientEvent:Connect(function(val)
                if not isActive then return end
                addLog("📡 ForceSubmit! val="..tostring(val))
                -- Auto-detectar letra en el momento del evento
                local det=detectGameLetter()
                if det and det~="" then
                    currentLetter=det; LetterBox.Text=det
                end
                -- Delay humano 0.3-1.2s
                task.delay(math.random(30,120)/100, function()
                    if isActive then doSubmit() end
                end)
            end)
        end
    else
        if autoConn then autoConn:Disconnect(); autoConn=nil end
        addLog("🛑 Bot OFF")
    end
end)

-- MANUAL
ManualBtn.MouseButton1Click:Connect(function()
    if currentLetter=="" then
        local det=detectGameLetter()
        if det then currentLetter=det; LetterBox.Text=det
        else addLog("⚠️ Escribe la letra"); return end
    end
    doSubmit()
end)

-- ════════════════════════════════════════════
print("[BastaBot] v4 ✅ Cargado")
addLog("v4 OK — Usa 🔎 para escanear primero")
