local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

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

-- Construcción de la GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MacheteBasta"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Botón para abrir/cerrar (ideal para celu)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 50, 0, 50)
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
toggleBtn.Text = "BASTA"
toggleBtn.Font = Enum.Font.FredokaOne
toggleBtn.TextSize = 14
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Parent = screenGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 320, 0, 380)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -190)
mainFrame.BackgroundColor3 = Color3.fromRGB(250, 245, 230)
mainFrame.BorderSizePixel = 2
mainFrame.Visible = false -- Arranca oculto
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Poné la letra:"
title.Font = Enum.Font.FredokaOne
title.TextSize = 20
title.Parent = mainFrame

local inputLetra = Instance.new("TextBox")
inputLetra.Size = UDim2.new(0, 80, 0, 40)
inputLetra.Position = UDim2.new(0.5, -40, 0, 40)
inputLetra.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
inputLetra.Text = ""
inputLetra.PlaceholderText = "Ej: A"
inputLetra.Font = Enum.Font.SourceSansBold
inputLetra.TextSize = 25
inputLetra.Parent = mainFrame

local searchBtn = Instance.new("TextButton")
searchBtn.Size = UDim2.new(0, 140, 0, 40)
searchBtn.Position = UDim2.new(0.5, -70, 0, 90)
searchBtn.BackgroundColor3 = Color3.fromRGB(85, 170, 127)
searchBtn.Text = "BUSCAR"
searchBtn.Font = Enum.Font.FredokaOne
searchBtn.TextSize = 18
searchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBtn.Parent = mainFrame

local resultText = Instance.new("TextLabel")
resultText.Size = UDim2.new(1, -20, 1, -150)
resultText.Position = UDim2.new(0, 10, 0, 140)
resultText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
resultText.Text = "Acá van a aparecer las 4 opciones de cada categoría."
resultText.Font = Enum.Font.SourceSansBold
resultText.TextScaled = true -- Se adapta a pantallas chicas
resultText.TextXAlignment = Enum.TextXAlignment.Left
resultText.TextYAlignment = Enum.TextYAlignment.Top
resultText.Parent = mainFrame

-- Lógica de búsqueda eficaz
searchBtn.MouseButton1Click:Connect(function()
    -- Agarra la letra, saca espacios y la pasa a mayúscula
    local letra = inputLetra.Text:upper():match("%a") 
    
    if not letra then
        resultText.Text = "Che, poné una letra válida."
        return
    end

    local data = db[letra]
    if data then
        resultText.Text = string.format(
            " RESPUESTAS CON '%s'\n\n Nombre: %s, %s, %s, %s\n Fruta: %s, %s, %s, %s\n Color: %s, %s, %s, %s\n Lugar: %s, %s, %s, %s\n Animal: %s, %s, %s, %s\n Objeto: %s, %s, %s, %s",
            letra,
            data.n[1], data.n[2], data.n[3], data.n[4],
            data.f[1], data.f[2], data.f[3], data.f[4],
            data.c[1], data.c[2], data.c[3], data.c[4],
            data.l[1], data.l[2], data.l[3], data.l[4],
            data.a[1], data.a[2], data.a[3], data.a[4],
            data.o[1], data.o[2], data.o[3], data.o[4]
        )
    else
        resultText.Text = "Todavía no cargué datos para la letra " .. letra
    end
end)

-- Lógica para abrir y cerrar el menú
toggleBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Lógica para arrastrar en celulares (Touch) y PC
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

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

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
