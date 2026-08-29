local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Conexión a los eventos del juego
local bastaEvents = ReplicatedStorage:WaitForChild("BastaEvents", 5)
local submitAnswersEvent = bastaEvents and bastaEvents:WaitForChild("SubmitAnswers", 5)
local startRoundEvent = bastaEvents and bastaEvents:WaitForChild("StartRound", 5)

-- Base de datos completa (4 respuestas por categoría)
local db = {
    A = {n={"Agustín","Ana","Alejo","Alma"}, f={"Ananá","Arándano","Avellana","Almendra"}, c={"Amarillo","Azul","Añil","Arena"}, l={"Argentina","Alemania","Atenas","Angola"}, a={"Araña","Águila","Abeja","Alce"}, o={"Anillo","Auto","Armario","Arpa"}},
    B = {n={"Bruno","Bárbara","Bautista","Belén"}, f={"Banana","Bergamota","Batata","Brócoli"}, c={"Blanco","Bordó","Beige","Bronce"}, l={"Bolivia","Brasil","Bélgica","Bogotá"}, a={"Burro","Búho","Ballena","Buitre"}, o={"Barco","Botella","Bici","Bolsa"}},
    C = {n={"Carlos","Camila","Cristian","Carla"}, f={"Cereza","Coco","Ciruela","Castaña"}, c={"Celeste","Carmesí","Caqui","Cian"}, l={"Colombia","Canadá","Chile","Córdoba"}, a={"Caballo","Cocodrilo","Conejo","Cerdo"}, o={"Cama","Cuchara","Cuaderno","Copa"}},
    D = {n={"Diego","Daniela","Darío","Delfina"}, f={"Durazno","Dátil","Damasco","Durian"}, c={"Dorado","Desteñido","Diamante","Durazno"}, l={"Dinamarca","Dublín","Dakar","Denver"}, a={"Delfín","Dingo","Dromedario","Dragón"}, o={"Dado","Dedo","Disco","Diario"}},
    E = {n={"Esteban","Elena","Emilio","Ema"}, f={"Espinaca","Ejote","Endivia","Espárrago"}, c={"Esmeralda","Escarlata","Ébano","Estaño"}, l={"España","Ecuador","Egipto","Escocia"}, a={"Elefante","Erizo","Escarabajo","Estrella"}, o={"Escoba","Espejo","Escalera","Estufa"}},
    F = {n={"Facundo","Florencia","Federico","Fátima"}, f={"Frutilla","Frambuesa","Fresa","Frijol"}, c={"Fucsia","Fuego","Frambuesa","Fosforescente"}, l={"Francia","Finlandia","Filipinas","Florida"}, a={"Foca","Flamenco","Faisán","Fénec"}, o={"Foco","Fuego","Farol","Florero"}},
    G = {n={"Gastón","Gabriela","Gonzalo","Gisela"}, f={"Granada","Guayaba","Grosella","Guanábana"}, c={"Gris","Granate","Gualdo","Garbanzo"}, l={"Grecia","Guatemala","Ghana","Ginebra"}, a={"Gato","Gorila","Gusano","Gaviota"}, o={"Goma","Gorra","Guitarra","Globo"}},
    H = {n={"Hernán","Helena","Hugo","Hilda"}, f={"Higo","Haba","Hinojo","Hongo"}, c={"Hueso","Humo","Herrumbre","Hielo"}, l={"Honduras","Haití","Hungría","Holanda"}, a={"Hormiga","Hipopótamo","Halcón","Hiena"}, o={"Hacha","Hilo","Horno","Hamaca"}},
    I = {n={"Ignacio","Isabel","Iván","Inés"}, f={"Icaco","Ilama","Imbe","Iceberg"}, c={"Índigo","Ivory","Incoloro","Indio"}, l={"Italia","India","Indonesia","Irlanda"}, a={"Iguana","Impala","Insecto","Ibis"}, o={"Imán","Isla","Inodoro","Impresora"}},
    J = {n={"Juan","Julieta","Joaquín","Josefina"}, f={"Jalapeño","Jengibre","Judía","Jícama"}, c={"Jazmín","Jade","Junquillo","Jinicuil"}, l={"Japón","Jamaica","Jordania","Jerusalén"}, a={"Jirafa","Jabalí","Jaguar","Jilguero"}, o={"Jarra","Jabón","Jaula","Juguete"}},
    L = {n={"Lucas","Laura","Lautaro","Lucía"}, f={"Limón","Lima","Lichi","Lechuga"}, c={"Lila","Lima","Ladrillo","Lavanda"}, l={"Líbano","Letonia","Lituania","Lima"}, a={"León","Lobo","Loro","Liebre"}, o={"Lápiz","Libro","Lámpara","Lupa"}},
    M = {n={"Martín","María","Mateo","Martina"}, f={"Manzana","Mandarina","Mango","Melón"}, c={"Marrón","Morado","Magenta","Mostaza"}, l={"México","Marruecos","Mónaco","Madrid"}, a={"Mono","Mariposa","Murciélago","Mosca"}, o={"Mesa","Mochila","Mapa","Martillo"}},
    N = {n={"Nicolás","Natalia","Nahuel","Nadia"}, f={"Naranja","Nuez","Nabo","Nectarina"}, c={"Negro","Naranja","Nácar","Nieve"}, l={"Noruega","Nicaragua","Nigeria","Nápoles"}, a={"Nutria","Narval","Novillo","Nematodo"}, o={"Nave","Nudo","Navaja","Nube"}},
    O = {n={"Oscar","Olivia","Omar","Oriana"}, f={"Oliva","Orégano","Oca","Orejón"}, c={"Oro","Oscuro","Ocre","Oliva"}, l={"Omán","Orlando","Oslo","Ottawa"}, a={"Oso","Oveja","Oruga","Ostra"}, o={"Olla","Ojo","Oreja","Obelisco"}},
    P = {n={"Pablo","Paula","Pedro","Pilar"}, f={"Pera","Palta","Pomelo","Papaya"}, c={"Plateado","Púrpura","Pardo","Plomo"}, l={"Perú","Paraguay","Portugal","París"}, a={"Perro","Pato","Pez","Pingüino"}, o={"Puerta","Pelota","Plato","Piano"}},
    R = {n={"Ramiro","Romina","Rodrigo","Renata"}, f={"Repollo","Rábano","Remolacha","Rúcula"}, c={"Rojo","Rosa","Rubí","Rocío"}, l={"Rusia","Rumania","Roma","Ruanda"}, a={"Ratón","Rana","Rinoceronte","Ruiseñor"}, o={"Reloj","Rueda","Radio","Regla"}},
    S = {n={"Santiago","Sofía","Sebastián","Sandra"}, f={"Sandía","Soja","Sésamo","Sauco"}, c={"Salmón","Sepia","Siena","Sable"}, l={"Suecia","Suiza","Siria","Sevilla"}, a={"Sapo","Serpiente","Salmón","Sanguijuela"}, o={"Silla","Sombrero","Sartén","Sobre"}},
    T = {n={"Tomás","Teresa","Thiago","Tatiana"}, f={"Tomate","Tamarindo","Tuna","Trigo"}, c={"Turquesa","Tomate","Trigo","Terracota"}, l={"Turquía","Tailandia","Túnez","Tokio"}, a={"Tigre","Tiburón","Topo","Tortuga"}, o={"Taza","Tenedor","Tijera","Teléfono"}},
    V = {n={"Valentín","Victoria","Vicente","Valeria"}, f={"Vainilla","Vid","Verdolaga","Vainita"}, c={"Verde","Violeta","Vino","Vainilla"}, l={"Venezuela","Vietnam","Valencia","Venecia"}, a={"Vaca","Venado","Víbora","Vicuña"}, o={"Vaso","Ventana","Vela","Vestido"}},
    Z = {n={"Zacarías","Zoe","Zahir","Zaida"}, f={"Zanahoria","Zapallo","Zarzamora","Zapote"}, c={"Zafiro","Zinc","Zanahoria","Zafre"}, l={"Zambia","Zimbabue","Zaragoza","Zúrich"}, a={"Zorro","Zorrino","Zángano","Zebra"}, o={"Zapato","Zócalo","Zapatilla","Zarzo"}}
}

-- Configuración de GUI Chiquita
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BastaBotGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 45, 0, 45)
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 100)
toggleBtn.Text = "BOT"
toggleBtn.Font = Enum.Font.FredokaOne
toggleBtn.TextSize = 14
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Parent = screenGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 220, 0, 250) -- Tamaño bien compacto
mainFrame.Position = UDim2.new(0.5, -110, 0.5, -125)
mainFrame.BackgroundColor3 = Color3.fromRGB(245, 240, 225)
mainFrame.BorderSizePixel = 2
mainFrame.Visible = false
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "BASTA BOT"
title.Font = Enum.Font.FredokaOne
title.TextSize = 16
title.Parent = mainFrame

local autoToggle = Instance.new("TextButton")
autoToggle.Size = UDim2.new(0, 180, 0, 30)
autoToggle.Position = UDim2.new(0.5, -90, 0, 35)
autoToggle.BackgroundColor3 = Color3.fromRGB(50, 160, 90)
autoToggle.Text = "Auto-Submit: ON"
autoToggle.Font = Enum.Font.SourceSansBold
autoToggle.TextSize = 14
autoToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
autoToggle.Parent = mainFrame

local inputLetra = Instance.new("TextBox")
inputLetra.Size = UDim2.new(0, 50, 0, 30)
inputLetra.Position = UDim2.new(0.5, -85, 0, 72)
inputLetra.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
inputLetra.PlaceholderText = "Letra"
inputLetra.Text = ""
inputLetra.Font = Enum.Font.SourceSansBold
inputLetra.TextSize = 18
inputLetra.Parent = mainFrame

local searchBtn = Instance.new("TextButton")
searchBtn.Size = UDim2.new(0, 110, 0, 30)
searchBtn.Position = UDim2.new(0.5, -25, 0, 72)
searchBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
searchBtn.Text = "ENVIAR YA"
searchBtn.Font = Enum.Font.FredokaOne
searchBtn.TextSize = 14
searchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBtn.Parent = mainFrame

local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, -20, 0, 120)
statusText.Position = UDim2.new(0, 10, 0, 115)
statusText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
statusText.Text = "Esperando inicio de ronda..."
statusText.Font = Enum.Font.SourceSans
statusText.TextSize = 12
statusText.TextWrapped = true
statusText.TextYAlignment = Enum.TextYAlignment.Top
statusText.Parent = mainFrame

-- Variables de control
local autoEnabled = true
local lastRoundId = -1

-- Función para construir el paquete de respuestas (Prueba las dos variantes posibles)
local function construirRespuestas(letra)
    local data = db[letra]
    if not data then return nil end

    -- Formato 1: Diccionario usando las claves estándar del juego
    local formatoDict = {
        Name = data.n[1],
        Fruit = data.f[1],
        Color = data.c[1],
        ["City/Country"] = data.l[1],
        CityCountry = data.l[1],
        Animal = data.a[1],
        Object = data.o[1]
    }

    -- Formato 2: Lista ordenada
    local formatoArray = {
        data.n[1],
        data.f[1],
        data.c[1],
        data.l[1],
        data.a[1],
        data.o[1]
    }

    return formatoDict, formatoArray
end

-- Función principal para enviar al servidor
local function mandarRespuestasAlServidor(letra, roundId)
    if not submitAnswersEvent then
        statusText.Text = "Error: Evento SubmitAnswers no encontrado."
        return
    end

    local dict, array = construirRespuestas(letra)
    if not dict then
        statusText.Text = "No hay datos cargados para la letra: " .. tostring(letra)
        return
    end

    local idUsar = roundId or 1

    -- Enviamos la estructura de diccionario (la más común en Roblox)
    submitAnswersEvent:FireServer(dict, idUsar)
    
    -- También enviamos por backup el formato lista en caso de que use orden por índice
    submitAnswersEvent:FireServer(array, idUsar)

    statusText.Text = string.format(" Enviado para letra '%s' (Ronda %s):\n• %s\n• %s\n• %s\n• %s\n• %s\n• %s",
        letra, tostring(idUsar), dict.Name, dict.Fruit, dict.Color, dict.CityCountry, dict.Animal, dict.Object)
end

-- Escuchar evento automático de inicio de ronda
if startRoundEvent then
    startRoundEvent.OnClientEvent:Connect(function(data)
        if not autoEnabled then return end
        
        -- Evitamos duplicados en la misma ronda
        if data and data.roundId and data.roundId == lastRoundId then return end
        if data and data.roundId then lastRoundId = data.roundId end

        local letra = data and data.letter and string.upper(data.letter)
        local roundId = data and (data.roundId or data.round) or 1

        if letra then
            task.wait(1.2) -- Pequeño delay de red para simular tipeo humano
            mandarRespuestasAlServidor(letra, roundId)
        end
    end)
end

-- Botones manuales de la GUI
autoToggle.MouseButton1Click:Connect(function()
    autoEnabled = not autoEnabled
    autoToggle.Text = autoEnabled and "Auto-Submit: ON" or "Auto-Submit: OFF"
    autoToggle.BackgroundColor3 = autoEnabled and Color3.fromRGB(50, 160, 90) or Color3.fromRGB(180, 60, 60)
end)

searchBtn.MouseButton1Click:Connect(function()
    local letra = inputLetra.Text:upper():match("%a")
    if letra then
        mandarRespuestasAlServidor(letra, lastRoundId > 0 and lastRoundId or 1)
    else
        statusText.Text = "Ingresá una letra válida."
    end
end)

toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Sistema para arrastrar la ventana con Touch/Mouse
local UserInputService = game:GetService("UserInputService")
local dragging, dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

