-- Pegá esto en un LocalScript dentro de StarterPlayerScripts o StarterCharacterScripts
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Base de datos completa (categorías: Nombre, Fruta/Verdura, Color, Lugar, Animal, Objeto)
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
    Z = {n={"Zacarías","Zoe","Zahir","Zaida"}, f={"Zanahoria","Zapallo","Zarzamora","Zapote"}, c={"Zafiro","Zinc","Zanahoria","Zafre"}, l={"Zambia","Zimbabue","Zaragoza","Zúrich"}, a={"Zorro","Zorrino","Zángano","Zebra"}, o={"Zapato","Zócalo","Zapatilla","Zarzo"}},
}

-- Construcción de la GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BastaGui"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 450, 0, 350)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(250, 245, 230) -- Estilo papel
mainFrame.BorderSizePixel = 2
mainFrame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "¡BASTA! - Generador de Respuestas"
titleLabel.Font = Enum.Font.FredokaOne
titleLabel.TextSize = 24
titleLabel.Parent = mainFrame

local resultText = Instance.new("TextLabel")
resultText.Size = UDim2.new(1, -20, 1, -120)
resultText.Position = UDim2.new(0, 10, 0, 60)
resultText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
resultText.Text = "Presioná el botón para generar respuestas aleatorias."
resultText.Font = Enum.Font.SourceSansBold
resultText.TextSize = 18
resultText.TextXAlignment = Enum.TextXAlignment.Left
resultText.TextYAlignment = Enum.TextYAlignment.Top
resultText.Parent = mainFrame

local generateButton = Instance.new("TextButton")
generateButton.Size = UDim2.new(0, 200, 0, 40)
generateButton.Position = UDim2.new(0.5, -100, 1, -50)
generateButton.BackgroundColor3 = Color3.fromRGB(85, 170, 127)
generateButton.Text = "GENERAR LETRA"
generateButton.Font = Enum.Font.FredokaOne
generateButton.TextSize = 20
generateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
generateButton.Parent = mainFrame

-- Lógica para seleccionar aleatoriamente
local function generarBasta()
    local letras = {"A","B","C","D","E","F","G","H","I","J","L","M","N","O","P","R","S","T","V","Z"}
    local letraElegida = letras[math.random(1, #letras)]
    local data = db[letraElegida]
    
    local rng = math.random(1, 4) -- Selecciona 1 de los 4 ejemplos disponibles
    
    local texto = string.format(
        " Letra: %s\n\n - Nombre: %s\n - Fruta: %s\n - Color: %s\n - Ciudad/País: %s\n - Animal: %s\n - Objeto: %s",
        letraElegida, data.n[rng], data.f[rng], data.c[rng], data.l[rng], data.a[rng], data.o[rng]
    )
    resultText.Text = texto
end

generateButton.MouseButton1Click:Connect(generarBasta)
