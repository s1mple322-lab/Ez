local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local bastaEvents = ReplicatedStorage:WaitForChild("BastaEvents", 5)
local startRoundEvent = bastaEvents and bastaEvents:WaitForChild("StartRound", 5)

-- Base de datos completa
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

-- Configuración GUI Chiquita
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BastaBotGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local toggleBtn = Instance.new("TextButton", screenGui)
toggleBtn.Size = UDim2.new(0, 45, 0, 45)
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 100)
toggleBtn.Text = "BOT"
toggleBtn.Font = Enum.Font.FredokaOne
toggleBtn.TextSize = 14
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 220, 0, 180)
mainFrame.Position = UDim2.new(0.5, -110, 0.5, -90)
mainFrame.BackgroundColor3 = Color3.fromRGB(245, 240, 225)
mainFrame.BorderSizePixel = 2
mainFrame.Visible = false

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "BASTA BOT (Interceptor)"
title.Font = Enum.Font.FredokaOne
title.TextSize = 14

local autoToggle = Instance.new("TextButton", mainFrame)
autoToggle.Size = UDim2.new(0, 180, 0, 30)
autoToggle.Position = UDim2.new(0.5, -90, 0, 35)
autoToggle.BackgroundColor3 = Color3.fromRGB(50, 160, 90)
autoToggle.Text = "Auto-Inyectar: ON"
autoToggle.Font = Enum.Font.SourceSansBold
autoToggle.TextSize = 14
autoToggle.TextColor3 = Color3.fromRGB(255, 255, 255)

local statusText = Instance.new("TextLabel", mainFrame)
statusText.Size = UDim2.new(1, -20, 0, 100)
statusText.Position = UDim2.new(0, 10, 0, 75)
statusText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
statusText.Text = "Esperando que empiece la ronda..."
statusText.Font = Enum.Font.SourceSansBold
statusText.TextSize = 14
statusText.TextWrapped = true
statusText.TextYAlignment = Enum.TextYAlignment.Top

-- Lógica central
local autoEnabled = true
local letraActual = ""

-- 1. Capturamos la letra apenas arranca la ronda
if startRoundEvent then
    startRoundEvent.OnClientEvent:Connect(function(data)
        if data and data.letter then
            -- Limpiamos espacios y aseguramos mayúscula
            letraActual = string.upper(data.letter:match("%a")) 
            statusText.Text = "Ronda Iniciada.\nLetra detectada: " .. letraActual .. "\n\nDejá que el tiempo termine solo o tocá BASTA."
        end
    end)
end

-- 2. EL INTERCEPTOR MAGICO (Hook)
local viejoNamecall
viejoNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    
    -- Si el juego intenta mandar algo al servidor por los eventos SubmitAnswers o ForceSubmitAnswers
    if tostring(method) == "FireServer" and (self.Name == "SubmitAnswers" or self.Name == "ForceSubmitAnswers") then
        if autoEnabled and letraActual ~= "" and db[letraActual] then
            
            local data = db[letraActual]
            local rng = math.random(1, 4)
            
            -- Armamos el paquete que queremos que vea el servidor
            local tablaInyectada = {
                Nombre = data.n[rng],
                Objeto = data.o[rng],
                Color = data.c[rng],
                CiudadPais = data.l[rng],
                Fruta = data.f[rng],
                Animal = data.a[rng]
            }
            
            -- Reemplazamos el primer argumento (la tabla original vacía) por nuestra tabla llena
            local argumentos = {...}
            argumentos[1] = tablaInyectada
            
            statusText.Text = "¡BOOM! El juego intentó mandar vacío y lo inyectamos con respuestas con '" .. letraActual .. "'"
            
            -- Dejamos que el envío siga, pero con nuestra data alterada
            return viejoNamecall(self, unpack(argumentos))
        end
    end
    
    return viejoNamecall(self, ...)
end)

-- Botón para activar/desactivar
autoToggle.MouseButton1Click:Connect(function()
    autoEnabled = not autoEnabled
    autoToggle.Text = autoEnabled and "Auto-Inyectar: ON" or "Auto-Inyectar: OFF"
    autoToggle.BackgroundColor3 = autoEnabled and Color3.fromRGB(50, 160, 90) or Color3.fromRGB(180, 60, 60)
end)

toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Soporte Táctil
local UserInputService = game:GetService("UserInputService")
local dragging, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
