-- =========================================================================
-- AKIRA MENU V2.2.1 — Bugs corrigidos
--  • Auto JJS: firesignal em pcalls separados + clica todas as bolhas
--  • Gerador IA: max_tokens alto + não usa reasoning como fallback
--  • Animação de andar: cacheada + detecta movimento por delta de posição
-- =========================================================================

_G.ZKY_OK = false
do
    local KEY_CORRETA = string.char(65,107,105,114,97,48,48,55)
    local LINK_DISCORD = string.char(104,116,116,112,115,58,47,47,100,105,115,99,111,114,100,46,103,103,47,78,89,50,82,102,67,55,75,120)

    local gui = Instance.new(string.char(83,99,114,101,101,110,71,117,105))
    gui.Name = string.char(90,75,89,75,101,121)
    gui.ResetOnSpawn = false
    pcall(function() gui.Parent = (gethui and gethui()) or game:GetService(string.char(67,111,114,101,71,117,105)) end)
    if not gui.Parent then
        gui.Parent = game:GetService(string.char(80,108,97,121,101,114,115)).LocalPlayer:WaitForChild(string.char(80,108,97,121,101,114,71,117,105))
    end

    local f = Instance.new(string.char(70,114,97,109,101), gui)
    f.Size = UDim2.new(0, 280, 0, 220)
    f.Position = UDim2.new(0.5, -140, 0.5, -110)
    f.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    Instance.new(string.char(85,73,67,111,114,110,101,114), f).CornerRadius = UDim.new(0, 10)

    local t = Instance.new(string.char(84,101,120,116,76,97,98,101,108), f)
    t.Size = UDim2.new(1, 0, 0, 36)
    t.BackgroundTransparency = 1
    t.Text = string.char(65,75,73,82,65,32,77,69,78,85,32,45,32,75,69,89)
    t.TextColor3 = Color3.new(1, 1, 1)
    t.Font = Enum.Font.GothamBold
    t.TextSize = 16

    local box = Instance.new(string.char(84,101,120,116,66,111,120), f)
    box.Size = UDim2.new(1, -30, 0, 34)
    box.Position = UDim2.new(0, 15, 0, 42)
    box.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    box.TextColor3 = Color3.new(1, 1, 1)
    box.PlaceholderText = string.char(67,111,108,101,32,97,32,107,101,121,32,97,113,117,105)
    box.Text = ""
    box.ClearTextOnFocus = false
    box.Font = Enum.Font.Gotham
    box.TextSize = 14
    Instance.new(string.char(85,73,67,111,114,110,101,114), box).CornerRadius = UDim.new(0, 8)

    local aviso = Instance.new(string.char(84,101,120,116,76,97,98,101,108), f)
    aviso.Size = UDim2.new(1, -30, 0, 40)
    aviso.Position = UDim2.new(0, 15, 0, 84)
    aviso.BackgroundTransparency = 1
    aviso.Text = string.char(80,114,97,32,112,101,103,97,114,32,97,32,107,101,121,44,32,101,110,116,114,101,32,110,111,32,68,105,115,99,111,114,100)
    aviso.TextColor3 = Color3.fromRGB(180, 180, 180)
    aviso.Font = Enum.Font.Gotham
    aviso.TextSize = 12
    aviso.TextWrapped = true

    local bPegar = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), f)
    bPegar.Size = UDim2.new(1, -30, 0, 34)
    bPegar.Position = UDim2.new(0, 15, 0, 128)
    bPegar.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    bPegar.Text = string.char(80,101,103,97,114,32,75,101,121)
    bPegar.TextColor3 = Color3.new(1, 1, 1)
    bPegar.Font = Enum.Font.GothamBold
    bPegar.TextSize = 14
    Instance.new(string.char(85,73,67,111,114,110,101,114), bPegar).CornerRadius = UDim.new(0, 8)

    local bChk = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), f)
    bChk.Size = UDim2.new(1, -30, 0, 34)
    bChk.Position = UDim2.new(0, 15, 0, 168)
    bChk.BackgroundColor3 = Color3.fromRGB(50, 170, 90)
    bChk.Text = string.char(67,104,101,99,107,32,75,101,121)
    bChk.TextColor3 = Color3.new(1, 1, 1)
    bChk.Font = Enum.Font.GothamBold
    bChk.TextSize = 14
    Instance.new(string.char(85,73,67,111,114,110,101,114), bChk).CornerRadius = UDim.new(0, 8)

    local st = Instance.new(string.char(84,101,120,116,76,97,98,101,108), f)
    st.Size = UDim2.new(1, -20, 0, 18)
    st.Position = UDim2.new(0, 10, 1, -20)
    st.BackgroundTransparency = 1
    st.Text = ""
    st.TextColor3 = Color3.fromRGB(200, 200, 200)
    st.Font = Enum.Font.Gotham
    st.TextSize = 11

    bPegar.MouseButton1Click:Connect(function()
        pcall(function() setclipboard(LINK_DISCORD) end)
        pcall(function() game:GetService(string.char(71,117,105,83,101,114,118,105,99,101)):OpenBrowserWindow(LINK_DISCORD) end)
        st.Text = string.char(76,105,110,107,32,100,111,32,68,105,115,99,111,114,100,32,99,111,112,105,97,100,111,33)
    end)

    bChk.MouseButton1Click:Connect(function()
        local digitada = box.Text:gsub(string.char(37,115), "")
        if digitada:lower() == KEY_CORRETA:lower() then
            _G.ZKY_OK = true
            gui:Destroy()
        else
            st.Text = string.char(75,101,121,32,105,110,118,195,161,108,105,100,97,46)
        end
    end)
end
repeat task.wait() until _G.ZKY_OK

-- =========================================================================
-- SERVIÇOS E ATALHOS
-- =========================================================================
local _I,_U2,_UO,_UD,_RGB,_V2,_GB,_GM,_XL,_XC = Instance.new,UDim2.new,UDim2.fromOffset,UDim.new,Color3.fromRGB,Vector2.new,Enum.Font.GothamBold,Enum.Font.GothamMedium,Enum.TextXAlignment.Left,Enum.TextXAlignment.Center
local P = game:GetService(string.char(80,108,97,121,101,114,115))
local T = game:GetService(string.char(84,119,101,101,110,83,101,114,118,105,99,101))
local U = game:GetService(string.char(85,115,101,114,73,110,112,117,116,83,101,114,118,105,99,101))
local R = game:GetService(string.char(82,117,110,83,101,114,118,105,99,101))
local HS = game:GetService(string.char(72,116,116,112,83,101,114,118,105,99,101))
local TCS = game:GetService(string.char(84,101,120,116,67,104,97,116,83,101,114,118,105,99,101))
local RS = game:GetService(string.char(82,101,112,108,105,99,97,116,101,100,83,116,111,114,97,103,101))
local Pl = P.LocalPlayer
local PG = Pl:WaitForChild(string.char(80,108,97,121,101,114,71,117,105))
local character,humanoid,rootPart

-- =========================================================================
-- CONFIGURAÇÃO
-- =========================================================================
local CONFIG = {
    LineThickness = .15,
    LineTransparency = .2,
    LineColor = _RGB(255,145,45),
    JumpCooldown = .28,
    PlaybackSpeed = 1,
    WalkToSpeed = 16,
    GroundOffset = 1.66
}
local MovementConfig = { Modo = string.char(68,117,109,109,121) }

-- ✅ CORRIGIDO: corretor com MaxTokens explícito (evita resposta vazia)
local IA_CONFIG = {
    ApiKey = string.char(103,115,107,95,84,121,103,115,76,99,54,112,85,105,77,72,116,109,98,57,71,114,50,101,87,71,100,121,98,51,70,89,89,99,110,48,56,82,71,121,81,50,110,52,113,118,109,82,51,52,71,81,75,55,81,48),
    Endpoint = string.char(104,116,116,112,115,58,47,47,97,112,105,46,103,114,111,113,46,99,111,109,47,111,112,101,110,97,105,47,118,49,47,99,104,97,116,47,99,111,109,112,108,101,116,105,111,110,115),
    Modelo = string.char(111,112,101,110,97,105,47,103,112,116,45,111,115,115,45,49,50,48,98),
    Timeout = 15,
    MaxTokens = 2048,
    SystemPrompt = string.char(86,111,99,195,170,32,195,169,32,117,109,32,99,111,114,114,101,116,111,114,32,103,114,97,109,97,116,105,99,97,108,32,101,120,116,114,101,109,97,109,101,110,116,101,32,114,105,103,111,114,111,115,111,32,100,101,32,112,111,114,116,117,103,117,195,170,115,32,100,111,32,66,114,97,115,105,108,46,32,67,111,114,114,105,106,97,32,84,79,68,79,83,32,111,115,32,101,114,114,111,115,32,100,97,32,109,101,110,115,97,103,101,109,32,100,111,32,117,115,117,195,161,114,105,111,44,32,115,101,109,32,100,101,105,120,97,114,32,112,97,115,115,97,114,32,110,101,110,104,117,109,44,32,105,110,99,108,117,105,110,100,111,58,32,108,101,116,114,97,115,32,109,97,105,195,186,115,99,117,108,97,115,32,110,111,32,105,110,195,173,99,105,111,32,100,101,32,102,114,97,115,101,115,32,101,32,101,109,32,110,111,109,101,115,32,112,114,195,179,112,114,105,111,115,59,32,116,111,100,111,115,32,111,115,32,97,99,101,110,116,111,115,32,103,114,195,161,102,105,99,111,115,32,40,97,103,117,100,111,44,32,99,105,114,99,117,110,102,108,101,120,111,44,32,116,105,108,44,32,99,114,97,115,101,41,32,101,32,97,32,99,101,100,105,108,104,97,59,32,116,111,100,97,32,97,32,112,111,110,116,117,97,195,167,195,163,111,44,32,99,111,109,111,32,118,195,173,114,103,117,108,97,115,44,32,112,111,110,116,111,115,32,102,105,110,97,105,115,44,32,112,111,110,116,111,115,32,100,101,32,105,110,116,101,114,114,111,103,97,195,167,195,163,111,32,101,32,100,101,32,101,120,99,108,97,109,97,195,167,195,163,111,59,32,99,111,110,99,111,114,100,195,162,110,99,105,97,32,118,101,114,98,97,108,32,101,32,110,111,109,105,110,97,108,59,32,111,114,116,111,103,114,97,102,105,97,32,101,32,115,101,112,97,114,97,195,167,195,163,111,32,100,101,32,112,97,108,97,118,114,97,115,46,32,78,195,163,111,32,100,101,105,120,101,32,110,101,110,104,117,109,97,32,112,97,108,97,118,114,97,32,115,101,109,32,97,99,101,110,116,111,32,111,117,32,115,101,109,32,109,97,105,195,186,115,99,117,108,97,32,111,110,100,101,32,102,111,114,32,110,101,99,101,115,115,195,161,114,105,111,44,32,110,101,109,32,110,101,110,104,117,109,97,32,102,114,97,115,101,32,115,101,109,32,112,111,110,116,117,97,195,167,195,163,111,32,102,105,110,97,108,46,32,78,195,163,111,32,114,101,115,117,109,97,44,32,110,195,163,111,32,114,101,101,115,99,114,101,118,97,32,111,32,101,115,116,105,108,111,44,32,110,195,163,111,32,109,117,100,101,32,111,32,115,105,103,110,105,102,105,99,97,100,111,44,32,111,32,116,111,109,32,110,101,109,32,111,32,116,97,109,97,110,104,111,32,100,97,32,109,101,110,115,97,103,101,109,58,32,97,112,101,110,97,115,32,99,111,114,114,105,106,97,32,97,32,103,114,97,109,195,161,116,105,99,97,44,32,97,32,111,114,116,111,103,114,97,102,105,97,32,101,32,97,32,112,111,110,116,117,97,195,167,195,163,111,44,32,109,97,110,116,101,110,100,111,32,97,115,32,109,101,115,109,97,115,32,112,97,108,97,118,114,97,115,32,115,101,109,112,114,101,32,113,117,101,32,112,111,115,115,195,173,118,101,108,46,32,82,101,115,112,111,110,100,97,32,65,80,69,78,65,83,32,99,111,109,32,97,32,109,101,110,115,97,103,101,109,32,99,111,114,114,105,103,105,100,97,44,32,115,101,109,32,101,120,112,108,105,99,97,195,167,195,181,101,115,44,32,97,115,112,97,115,44,32,99,111,109,101,110,116,195,161,114,105,111,115,32,101,120,116,114,97,115,32,111,117,32,113,117,97,108,113,117,101,114,32,116,101,120,116,111,32,97,100,105,99,105,111,110,97,108,46)
}

-- ✅ CORRIGIDO: gerador com MaxTokens alto (150 é pouco p/ reasoning model)
local IA_TEXTOS = {
    ApiKey = string.char(103,115,107,95,84,121,103,115,76,99,54,112,85,105,77,72,116,109,98,57,71,114,50,101,87,71,100,121,98,51,70,89,89,99,110,48,56,82,71,121,81,50,110,52,113,118,109,82,51,52,71,81,75,55,81,48),
    Endpoint = string.char(104,116,116,112,115,58,47,47,97,112,105,46,103,114,111,113,46,99,111,109,47,111,112,101,110,97,105,47,118,49,47,99,104,97,116,47,99,111,109,112,108,101,116,105,111,110,115),
    Modelo = string.char(111,112,101,110,97,105,47,103,112,116,45,111,115,115,45,49,50,48,98),
    Timeout = 20,
    MaxTokens = 2048,
    SystemPrompt = string.char(86,111,99,195,170,32,195,169,32,117,109,32,103,101,114,97,100,111,114,32,100,101,32,116,101,120,116,111,115,32,100,111,32,69,120,195,169,114,99,105,116,111,32,66,114,97,115,105,108,101,105,114,111,32,101,109,32,117,109,32,106,111,103,111,32,100,101,32,82,111,98,108,111,120,32,40,114,111,108,101,112,108,97,121,32,109,105,108,105,116,97,114,41,46,32,79,32,117,115,117,195,161,114,105,111,32,118,97,105,32,116,101,32,100,97,114,32,117,109,32,84,69,77,65,46,32,86,111,99,195,170,32,100,101,118,101,32,101,115,99,114,101,118,101,114,32,117,109,32,116,101,120,116,111,32,99,117,114,116,111,44,32,104,117,109,97,110,111,44,32,103,114,97,109,97,116,105,99,97,108,109,101,110,116,101,32,112,101,114,102,101,105,116,111,32,101,32,112,97,116,114,105,195,179,116,105,99,111,32,115,111,98,114,101,32,101,120,97,116,97,109,101,110,116,101,32,101,115,115,101,32,116,101,109,97,46,32,82,69,71,82,65,83,32,79,66,82,73,71,65,84,195,147,82,73,65,83,58,32,40,49,41,32,79,32,116,101,120,116,111,32,68,69,86,69,32,116,101,114,32,101,110,116,114,101,32,49,53,48,32,101,32,50,49,48,32,99,97,114,97,99,116,101,114,101,115,44,32,99,111,110,116,97,110,100,111,32,101,115,112,97,195,167,111,115,46,32,40,50,41,32,77,195,161,120,105,109,111,32,51,32,102,114,97,115,101,115,32,99,117,114,116,97,115,46,32,40,51,41,32,70,105,113,117,101,32,49,48,48,37,32,102,105,101,108,32,97,111,32,116,101,109,97,32,112,101,100,105,100,111,44,32,115,101,109,32,102,117,103,105,114,32,100,111,32,97,115,115,117,110,116,111,46,32,40,52,41,32,84,111,109,32,109,105,108,105,116,97,114,32,114,101,97,108,105,115,116,97,44,32,110,97,116,117,114,97,108,32,101,32,104,117,109,97,110,111,44,32,115,101,109,32,101,120,97,103,101,114,111,115,32,110,101,109,32,99,108,105,99,104,195,170,115,46,32,40,53,41,32,83,101,109,32,115,97,117,100,97,195,167,195,181,101,115,44,32,115,101,109,32,97,115,112,97,115,44,32,115,101,109,32,101,109,111,106,105,115,44,32,115,101,109,32,102,111,114,109,97,116,97,195,167,195,163,111,44,32,115,101,109,32,105,110,116,114,111,100,117,195,167,195,181,101,115,46,32,40,54,41,32,82,101,115,112,111,110,100,97,32,65,80,69,78,65,83,32,99,111,109,32,111,32,116,101,120,116,111,32,102,105,110,97,108,44,32,110,97,100,97,32,109,97,105,115,46)
}

local httpRequest = request or (syn and syn.request) or (http and http.request) or http_request

local Pastebins = {
    Lento = string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,77,55,68,118,82,103,84,99),
    [string.char(82,195,161,112,105,100,111)] = string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,112,66,107,56,118,89,88,69),
    [string.char(77,97,105,115,32,82,195,161,112,105,100,111)] = string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,121,122,55,103,90,109,89,114),
    [string.char(83,101,109,32,66,117,114,108,97)] = string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,78,49,106,48,105,82,68,65)
}
local CategoryOrder = {string.char(76,101,110,116,111),string.char(82,195,161,112,105,100,111),string.char(77,97,105,115,32,82,195,161,112,105,100,111),string.char(83,101,109,32,66,117,114,108,97)}
local TowerPastebins = {
    [string.char(84,111,114,114,101,32,49)] = {[string.char(195,154,110,105,99,97)]=string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,72,120,88,98,52,77,114,51)},
    [string.char(84,111,114,114,101,32,50)] = {
        Frente = string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,89,50,97,114,67,89,72,98),
        [string.char(65,116,114,195,161,115)] = string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,114,88,120,90,88,55,67,81),
        Esquerda = string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,70,116,112,84,72,104,71,116),
        Direita = string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,52,117,53,87,106,116,107,103)
    }
}
local Tower2RouteOrder = {string.char(70,114,101,110,116,101),string.char(65,116,114,195,161,115),string.char(69,115,113,117,101,114,100,97),string.char(68,105,114,101,105,116,97)}

local routes = {Lento={},[string.char(82,195,161,112,105,100,111)]={},[string.char(77,97,105,115,32,82,195,161,112,105,100,111)]={},[string.char(83,101,109,32,66,117,114,108,97)]={}}
local towerRoutes = {[string.char(84,111,114,114,101,32,49)]={},[string.char(84,111,114,114,101,32,50)]={Frente={},[string.char(65,116,114,195,161,115)]={},Esquerda={},Direita={}}}
local selectedCategory = {}
for i=1,4 do selectedCategory[i]=string.char(76,101,110,116,111) end
local selectedTower2Route = string.char(70,114,101,110,116,101)
local CurrentPage = string.char(69,66,68,101,108,116,97)
local lineFolder
local linesVisible = true
local mostrarLinhas = true
local desativarDummies = false

local Playback = {
    Running = false, Connection = nil, Route = nil, StartClock = 0,
    CurrentIndex = 1, LastJump = -math.huge, Category = nil, Parkour = nil,
    Tower = nil, TowerRoute = nil, WalkingToStart = false, WalkConnection = nil
}
local SavedDirection = nil
local Turning = false

local Old = PG:FindFirstChild(string.char(90,75,89,95,80,65,82,75,79,85,82))
if Old then Old:Destroy() end

local _K = {
    Background = _RGB(15,15,18), Panel = _RGB(20,20,25), Card = _RGB(24,24,30),
    CardHover = _RGB(32,32,40), Selected = _RGB(45,45,55), Stroke = _RGB(45,45,55),
    StrokeLight = _RGB(65,65,80), White = _RGB(240,240,245), Gray = _RGB(170,170,180),
    DarkGray = _RGB(115,115,125), Success = _RGB(80,210,125), Error = _RGB(230,85,85),
    Orange = _RGB(255,145,45), SelectionRed = _RGB(225,70,70), SelectionRedDark = _RGB(75,32,32),
    Primary = _RGB(185,185,185), Purple = _RGB(150,110,240), PurpleLight = _RGB(180,150,255)
}

local function Corner(o,r) local c=_I(string.char(85,73,67,111,114,110,101,114)) c.CornerRadius=_UD(0,r) c.Parent=o end
local function Stroke(o,c,t) local s=_I(string.char(85,73,83,116,114,111,107,101)) s.Color=c s.Thickness=t or 1 s.Parent=o return s end
local function Padding(o,t,b,l,rr)
    local p=_I(string.char(85,73,80,97,100,100,105,110,103))
    p.PaddingTop=_UD(0,t or 0) p.PaddingBottom=_UD(0,b or 0)
    p.PaddingLeft=_UD(0,l or 0) p.PaddingRight=_UD(0,rr or 0)
    p.Parent=o
end

-- =========================================================================
-- NOTIFICAÇÕES
-- =========================================================================
local NH = _I(string.char(70,114,97,109,101))
NH.Name=string.char(78,111,116,105,102,105,99,97,116,105,111,110,115) NH.AnchorPoint=_V2(1,1) NH.Position=_U2(1,-15,1,-15)
NH.Size=_UO(270,300) NH.BackgroundTransparency=1 NH.ZIndex=200 NH.Parent=PG
local NL = _I(string.char(85,73,76,105,115,116,76,97,121,111,117,116))
NL.VerticalAlignment=Enum.VerticalAlignment.Bottom
NL.HorizontalAlignment=Enum.HorizontalAlignment.Right
NL.Padding=_UD(0,7) NL.Parent=NH

local function Notify(tt,msg,nt)
    local c=_K.Gray
    if nt==string.char(83,117,99,99,101,115,115) then c=_K.Success
    elseif nt==string.char(69,114,114,111,114) then c=_K.Error
    elseif nt==string.char(79,114,97,110,103,101) then c=_K.Orange end
    local n=_I(string.char(70,114,97,109,101)) n.Size=_UO(250,64) n.BackgroundColor3=_K.Panel
    n.BorderSizePixel=0 n.BackgroundTransparency=1 n.ZIndex=201 n.Parent=NH
    Corner(n,10) local ns=Stroke(n,c) ns.Transparency=1
    local a=_I(string.char(70,114,97,109,101)) a.Size=_UO(3,38) a.AnchorPoint=_V2(0,.5)
    a.Position=_U2(0,7,.5,0) a.BackgroundColor3=c a.BorderSizePixel=0
    a.BackgroundTransparency=1 a.ZIndex=202 a.Parent=n Corner(a,5)
    local ttl=_I(string.char(84,101,120,116,76,97,98,101,108))
    ttl.BackgroundTransparency=1 ttl.Position=_UO(18,9) ttl.Size=_U2(1,-28,0,18)
    ttl.Text=tt ttl.TextColor3=_K.White ttl.TextSize=12 ttl.Font=_GB
    ttl.TextXAlignment=_XL ttl.ZIndex=203 ttl.Parent=n
    local msgL=_I(string.char(84,101,120,116,76,97,98,101,108))
    msgL.BackgroundTransparency=1 msgL.Position=_UO(18,30) msgL.Size=_U2(1,-28,0,25)
    msgL.Text=msg msgL.TextColor3=_K.Gray msgL.TextSize=9 msgL.Font=_GM
    msgL.TextWrapped=true msgL.TextXAlignment=_XL msgL.TextYAlignment=Enum.TextYAlignment.Center
    msgL.ZIndex=203 msgL.Parent=n
    n.Position=_U2(1,270,0,0)
    T:Create(n,TweenInfo.new(.35,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Position=_U2(),BackgroundTransparency=0}):Play()
    T:Create(ns,TweenInfo.new(.25),{Transparency=0}):Play()
    T:Create(a,TweenInfo.new(.25),{BackgroundTransparency=0}):Play()
    task.delay(2.8,function()
        if not n.Parent then return end
        local o=T:Create(n,TweenInfo.new(.3,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{Position=_U2(1,270),BackgroundTransparency=1})
        o:Play()
        T:Create(ns,TweenInfo.new(.2),{Transparency=1}):Play()
        T:Create(a,TweenInfo.new(.2),{BackgroundTransparency=1}):Play()
        o.Completed:Wait()
        if n.Parent then n:Destroy() end
    end)
end

-- =========================================================================
-- PERSONAGEM
-- =========================================================================
local function RefreshCharacter()
    character=Pl.Character
    if not character or not character.Parent then return false end
    humanoid=character:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
    rootPart=character:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
    return humanoid~=nil and rootPart~=nil
end

-- ✅ CORRIGIDO: animação cacheada (não recria toda hora) + detecta movimento por delta
local walkTrack
local walkAnimCache

Pl.CharacterAdded:Connect(function()
    task.wait(.2)
    RefreshCharacter()
    walkTrack = nil
    walkAnimCache = nil
end)
RefreshCharacter()

local function iniciarAnimacaoAndar()
    if not RefreshCharacter() then return end
    if walkTrack and walkTrack.IsPlaying then return end
    local animator = humanoid:FindFirstChildOfClass(string.char(65,110,105,109,97,116,111,114))
    if not animator then
        animator = _I(string.char(65,110,105,109,97,116,111,114))
        animator.Parent = humanoid
    end
    if not walkAnimCache then
        local animationId = nil
        local animate = character:FindFirstChild(string.char(65,110,105,109,97,116,101))
        if animate then
            local walkFolder = animate:FindFirstChild(string.char(119,97,108,107))
            if walkFolder then
                local anim = walkFolder:FindFirstChildOfClass(string.char(65,110,105,109,97,116,105,111,110))
                if anim then animationId = anim.AnimationId end
            end
        end
        if not animationId then
            local isR15 = humanoid.RigType == Enum.HumanoidRigType.R15
            animationId = isR15 and string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,53,48,55,55,55,55,56,50,54) or string.char(114,98,120,97,115,115,101,116,105,100,58,47,47,49,56,48,52,50,54,51,53,52)
        end
        local ok, track = pcall(function()
            local anim = _I(string.char(65,110,105,109,97,116,105,111,110))
            anim.AnimationId = animationId
            return animator:LoadAnimation(anim)
        end)
        if not ok or not track then return end
        track.Looped = true
        track.Priority = Enum.AnimationPriority.Movement
        walkAnimCache = track
    end
    walkTrack = walkAnimCache
    pcall(function() walkTrack:Play() end)
end

local function pararAnimacaoAndar()
    if walkTrack then
        pcall(function() walkTrack:Stop() end)
        walkTrack = nil
    end
end

-- ✅ CORRIGIDO: usa delta de posição em vez de GetState() (que não responde a PivotTo)
local ultimaPosAnim
local ultimoTempoMov = 0
task.spawn(function()
    while true do
        task.wait(0.08)
        if RefreshCharacter() then
            local pos = rootPart.Position
            if ultimaPosAnim then
                local delta = (pos - ultimaPosAnim).Magnitude
                if delta > 0.06 then
                    ultimoTempoMov = os.clock()
                end
            end
            ultimaPosAnim = pos

            local noChao = humanoid.FloorMaterial ~= Enum.Material.Air
            local aindaMovendo = (os.clock() - ultimoTempoMov) < 0.2
            local naRota = Playback.Running and not Playback.WalkingToStart

            if naRota and noChao and aindaMovendo then
                if not walkTrack or not walkTrack.IsPlaying then
                    iniciarAnimacaoAndar()
                end
            else
                if walkTrack and walkTrack.IsPlaying then
                    pararAnimacaoAndar()
                end
            end
        else
            ultimaPosAnim = nil
            if walkTrack and walkTrack.IsPlaying then
                pararAnimacaoAndar()
            end
        end
    end
end)

local function Number(v) return v and tonumber(v) end

local function ParseRoutes(raw)
    local parsed,blocks={},{} local sp=1
    while true do
        local s=string.find(raw,string.char(108,111,99,97,108,32,82,111,116,97,32,61,32,123),sp)
        if not s then break end
        local b,e=0
        for i=s,#raw do
            local ch=string.sub(raw,i,i)
            if ch==string.char(123) then b+=1
            elseif ch==string.char(125) then b-=1; if b==0 then e=i; break end end
        end
        if not e then break end
        table.insert(blocks,string.sub(raw,s,e))
        sp=e+1
    end
    for _,block in ipairs(blocks) do
        local frames,fs={},1
        while true do
            local p1,p2=string.find(block,string.char(123,40,46,45,41,125),fs)
            if not p1 then break end
            local f=string.sub(block,p1,p2)
            local t=string.match(f,string.char(116,37,115,42,61,37,115,42,40,91,37,100,37,46,37,45,93,43,41))
            local x=string.match(f,string.char(120,37,115,42,61,37,115,42,40,91,37,100,37,46,37,45,93,43,41))
            local y=string.match(f,string.char(121,37,115,42,61,37,115,42,40,91,37,100,37,46,37,45,93,43,41))
            local z=string.match(f,string.char(122,37,115,42,61,37,115,42,40,91,37,100,37,46,37,45,93,43,41))
            local j=string.match(f,string.char(106,37,115,42,61,37,115,42,40,91,37,119,93,43,41))
            local rx=string.match(f,string.char(114,120,37,115,42,61,37,115,42,40,91,37,100,37,46,37,45,93,43,41))
            local ry=string.match(f,string.char(114,121,37,115,42,61,37,115,42,40,91,37,100,37,46,37,45,93,43,41))
            local rz=string.match(f,string.char(114,122,37,115,42,61,37,115,42,40,91,37,100,37,46,37,45,93,43,41))
            if t and x and y and z then
                local q={t=Number(t),x=Number(x),y=Number(y),z=Number(z),j=j==string.char(116,114,117,101),
                    position=Vector3.new(Number(x),Number(y),Number(z)),
                    rx=Number(rx),ry=Number(ry),rz=Number(rz)}
                if q.rx and q.ry and q.rz then
                    q.rotation=CFrame.Angles(q.rx,q.ry,q.rz); q.hasRotation=true
                else q.hasRotation=false end
                table.insert(frames,q)
            end
            fs=p2+1
        end
        if #frames>=2 then
            table.sort(frames,function(a,b) return a.t<b.t end)
            table.insert(parsed,frames)
        end
    end
    return parsed
end

local function LoadCategory(cat)
    local url=Pastebins[cat]; if not url then return false end
    local ok,raw=pcall(function() return game:HttpGet(url) end)
    if not ok or not raw then return false end
    local p=ParseRoutes(raw); if #p==0 then return false end
    routes[cat]=p; return true
end
local function LoadTowerRoute(tower,route)
    local d=TowerPastebins[tower]; if not d then return false end
    local url=d[route]; if not url then return false end
    local ok,raw=pcall(function() return game:HttpGet(url) end)
    if not ok or not raw then return false end
    local p=ParseRoutes(raw); if #p==0 then return false end
    towerRoutes[tower]=towerRoutes[tower] or {}
    towerRoutes[tower][route]=p[1]
    return true
end

local function CreateLine(a,b)
    if not a or not b then return end
    local d=b-a; local dist=d.Magnitude; if dist<.01 then return end
    if not lineFolder then
        lineFolder=_I(string.char(70,111,108,100,101,114)); lineFolder.Name=string.char(90,75,89,95,82,111,117,116,101,76,105,110,101,115); lineFolder.Parent=workspace
    end
    local l=_I(string.char(80,97,114,116)) l.Name=string.char(82,111,117,116,101,83,101,103,109,101,110,116) l.Anchored=true l.CanCollide=false
    l.CanTouch=false l.CanQuery=false l.CastShadow=false
    l.Material=Enum.Material.Neon l.Color=CONFIG.LineColor
    l.Transparency=(linesVisible and mostrarLinhas) and CONFIG.LineTransparency or 1
    l.Size=Vector3.new(CONFIG.LineThickness,CONFIG.LineThickness,dist)
    l.CFrame=CFrame.lookAt((a+b)/2,b)
    l.Parent=lineFolder
end
local function ClearLines()
    if not lineFolder then return end
    for _,o in ipairs(lineFolder:GetChildren()) do o:Destroy() end
end
local function ShowRouteLines(data)
    ClearLines(); local last
    for _,f in ipairs(data) do
        local p=f.position
        if last then CreateLine(last,p) end
        last=p
    end
end
local function GetPosition(f)
    if not f then return end
    if f.position then return f.position end
    if f.x and f.y and f.z then return Vector3.new(f.x,f.y,f.z) end
end
local function GetRotation(f)
    if not f then return end
    if f.rotation then return f.rotation end
    if f.rx and f.ry and f.rz then return CFrame.Angles(f.rx,f.ry,f.rz) end
end

local function ApplyPosition(pos,rot)
    if not pos or not RefreshCharacter() then return false end
    local corrected=pos+Vector3.new(0,CONFIG.GroundOffset,0)
    local target
    if rot then
        target=CFrame.new(corrected)*rot
    else
        local look=rootPart.CFrame.LookVector
        local flat=Vector3.new(look.X,0,look.Z)
        if flat.Magnitude<.01 then flat=Vector3.new(0,0,-1) else flat=flat.Unit end
        target=CFrame.lookAt(corrected,corrected+flat)
    end
    pcall(function() character:PivotTo(target) end)
    return true
end

local function GetFrames(frames,elapsed)
    local count=#frames; if count<2 then return end
    if elapsed<=frames[1].t then Playback.CurrentIndex=1; return frames[1],frames[2],0 end
    if elapsed>=frames[count].t then return frames[count],frames[count],1 end
    local i=math.clamp(Playback.CurrentIndex,1,count-1)
    while i<count-1 and elapsed>frames[i+1].t do i+=1 end
    while i>1 and elapsed<frames[i].t do i-=1 end
    Playback.CurrentIndex=i
    local a,b=frames[i],frames[i+1]
    local d=b.t-a.t
    local alpha=d>0 and math.clamp((elapsed-a.t)/d,0,1) or 0
    return a,b,alpha
end
local function HandleJump(f,e)
    if not f or not f.j or e-Playback.LastJump<CONFIG.JumpCooldown or not RefreshCharacter() then return end
    Playback.LastJump=e
    humanoid.Jump=true
    pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end)
end

local function AndarAte(destino,estaCancelado,aoTerminar)
    if not RefreshCharacter() then aoTerminar(false) return end
    humanoid.WalkSpeed=CONFIG.WalkToSpeed
    humanoid:MoveTo(destino)
    local started=os.clock() local sucesso=false
    while not estaCancelado() do
        if not RefreshCharacter() then break end
        if (rootPart.Position-destino).Magnitude<=4 then sucesso=true break end
        if os.clock()-started>60 then break end
        task.wait()
    end
    if RefreshCharacter() then humanoid:Move(Vector3.zero,false) end
    aoTerminar(sucesso and not estaCancelado())
end

local DummyObj
local RemoverDummy
local function CriarDummy(pos,rot)
    RemoverDummy()
    local alvo = rot and (CFrame.new(pos)*(rot-rot.Position)) or CFrame.new(pos)
    local ok=false
    if RefreshCharacter() then
        local salvos={}
        for _,d in ipairs(character:GetDescendants()) do
            salvos[d]=d.Archivable
            pcall(function() d.Archivable=true end)
        end
        local cok,clone=pcall(function() return character:Clone() end)
        for inst,valor in pairs(salvos) do
            pcall(function() inst.Archivable=valor end)
        end
        if cok and clone then
            for _,d in ipairs(clone:GetDescendants()) do
                if d:IsA(string.char(83,99,114,105,112,116)) or d:IsA(string.char(76,111,99,97,108,83,99,114,105,112,116)) then pcall(function() d:Destroy() end)
                elseif d:IsA(string.char(83,104,105,114,116)) or d:IsA(string.char(80,97,110,116,115)) or d:IsA(string.char(83,104,105,114,116,71,114,97,112,104,105,99)) or d:IsA(string.char(68,101,99,97,108)) then pcall(function() d:Destroy() end)
                elseif d:IsA(string.char(66,97,115,101,80,97,114,116)) then
                    d.CanCollide=false d.CanQuery=false d.CanTouch=false d.Massless=true
                    d.Material=Enum.Material.ForceField d.Color=_RGB(0,255,140) d.Transparency=.35
                end
            end
            local hum=clone:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
            if hum then pcall(function() hum.WalkSpeed=0 hum.JumpPower=0 hum.PlatformStand=true end) end
            clone.PrimaryPart=clone.PrimaryPart or clone:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
            if clone.PrimaryPart then
                clone.Parent=workspace
                local pok=pcall(function() clone:PivotTo(alvo) end)
                if pok then
                    for _,d in ipairs(clone:GetDescendants()) do
                        if d:IsA(string.char(66,97,115,101,80,97,114,116)) then d.Anchored=true end
                    end
                    local hl=_I(string.char(72,105,103,104,108,105,103,104,116))
                    hl.FillColor=_RGB(0,255,140) hl.OutlineColor=_RGB(150,255,195)
                    hl.FillTransparency=.55 hl.OutlineTransparency=0
                    hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop hl.Parent=clone
                    clone.Name=string.char(90,75,89,95,68,117,109,109,121) DummyObj=clone ok=true
                else clone:Destroy() end
            else clone:Destroy() end
        end
    end
    if not ok then
        local marcador=_I(string.char(80,97,114,116))
        marcador.Name=string.char(90,75,89,95,68,117,109,109,121) marcador.Shape=Enum.PartType.Cylinder
        marcador.Size=Vector3.new(.4,6,6)
        marcador.CFrame=alvo*CFrame.Angles(0,0,math.rad(90))
        marcador.Color=_RGB(0,255,130) marcador.Material=Enum.Material.Neon
        marcador.Transparency=.35 marcador.Anchored=true
        marcador.CanCollide=false marcador.CanQuery=false marcador.CanTouch=false
        marcador.Parent=workspace DummyObj=marcador
    end
end
RemoverDummy=function() if DummyObj then pcall(function() DummyObj:Destroy() end) DummyObj=nil end end

local function StopPlayback(reason)
    if Playback.Connection then Playback.Connection:Disconnect(); Playback.Connection=nil end
    if Playback.WalkConnection then Playback.WalkConnection:Disconnect(); Playback.WalkConnection=nil end
    RemoverDummy()
    Playback.Running=false Playback.Route=nil Playback.CurrentIndex=1
    Playback.LastJump=-math.huge Playback.Category=nil Playback.Parkour=nil
    Playback.Tower=nil Playback.TowerRoute=nil Playback.WalkingToStart=false
    if RefreshCharacter() then
        humanoid:Move(Vector3.zero,false); humanoid.Jump=false
        pcall(function() humanoid.AutoRotate=true end)
    end
    pararAnimacaoAndar()
    ClearLines()
    if reason==string.char(99,111,109,112,108,101,116,101,100) then Notify(string.char(67,79,78,67,76,85,195,141,68,79),string.char(82,111,116,97,32,102,105,110,97,108,105,122,97,100,97,33),string.char(83,117,99,99,101,115,115))
    elseif reason==string.char(99,97,110,99,101,108,108,101,100) then Notify(string.char(80,65,82,65,68,79),string.char(82,101,112,114,111,100,117,195,167,195,163,111,32,105,110,116,101,114,114,111,109,112,105,100,97,46),string.char(69,114,114,111,114))
    elseif reason==string.char(101,114,114,111,114) then Notify(string.char(69,82,82,79),string.char(78,195,163,111,32,102,111,105,32,112,111,115,115,195,173,118,101,108,32,99,111,110,116,105,110,117,97,114,46),string.char(69,114,114,111,114)) end
end

local function IniciarExecucao(name)
    if not Playback.Running then return end
    Playback.WalkingToStart = false
    if RefreshCharacter() then
        humanoid:Move(Vector3.zero, false)
        pcall(function() humanoid.AutoRotate = false end)
    end
    Playback.StartClock = os.clock()
    Playback.CurrentIndex = 1
    Playback.LastJump = -math.huge
    Notify(string.char(69,88,69,67,85,84,65,78,68,79), name, string.char(83,117,99,99,101,115,115))
    task.spawn(function()
        while Playback.Running and not Playback.WalkingToStart do
            if not RefreshCharacter() then StopPlayback(string.char(101,114,114,111,114)); break end
            local frames = Playback.Route
            if not frames or #frames < 2 then StopPlayback(string.char(101,114,114,111,114)); break end
            local elapsed = (os.clock() - Playback.StartClock) * CONFIG.PlaybackSpeed
            local final = frames[#frames]
            if elapsed >= final.t then
                ApplyPosition(GetPosition(final), GetRotation(final))
                StopPlayback(string.char(99,111,109,112,108,101,116,101,100))
                break
            end
            local a, b, alpha = GetFrames(frames, elapsed)
            if not a or not b then break end
            local pa, pb = GetPosition(a), GetPosition(b)
            if not pa or not pb then StopPlayback(string.char(101,114,114,111,114)); break end
            local pos = pa:Lerp(pb, alpha)
            local ra, rb = GetRotation(a), GetRotation(b)
            local rot
            if ra and rb then rot = ra:Lerp(rb, alpha)
            elseif ra then rot = ra
            elseif rb then rot = rb end
            ApplyPosition(pos, rot)
            HandleJump(a, elapsed)
            R.Heartbeat:Wait()
        end
    end)
end

local function StartPlayback(data, cat, num, tower, towerRoute)
    if Playback.Running then
        Notify(string.char(69,77,32,69,88,69,67,85,195,135,195,131,79),string.char(80,97,114,101,32,97,32,114,111,116,97,32,97,116,117,97,108,32,97,110,116,101,115,32,100,101,32,105,110,105,99,105,97,114,32,111,117,116,114,97,46),string.char(69,114,114,111,114))
        return
    end
    if not data or #data < 2 then
        Notify(string.char(82,79,84,65,32,73,78,86,195,129,76,73,68,65),string.char(69,115,115,97,32,114,111,116,97,32,110,195,163,111,32,112,111,115,115,117,105,32,102,114,97,109,101,115,32,115,117,102,105,99,105,101,110,116,101,115,46),string.char(69,114,114,111,114))
        return
    end
    if not RefreshCharacter() then
        Notify(string.char(80,69,82,83,79,78,65,71,69,77),string.char(80,101,114,115,111,110,97,103,101,109,32,110,195,163,111,32,101,110,99,111,110,116,114,97,100,111,46),string.char(69,114,114,111,114))
        return
    end
    local first = data[1]
    local fp = GetPosition(first)
    if not fp then Notify(string.char(69,82,82,79),string.char(80,114,105,109,101,105,114,111,32,112,111,110,116,111,32,100,97,32,114,111,116,97,32,105,110,118,195,161,108,105,100,111,46),string.char(69,114,114,111,114)); return end
    local target = fp + Vector3.new(0, CONFIG.GroundOffset, 0)
    Playback.Running = true
    Playback.WalkingToStart = true
    Playback.Route = data
    Playback.Category = cat
    Playback.Parkour = num
    Playback.Tower = tower
    Playback.TowerRoute = towerRoute
    Playback.CurrentIndex = 1
    ShowRouteLines(data)

    local name
    if tower then
        name = tower == string.char(84,111,114,114,101,32,49) and string.char(84,111,114,114,101,32,49) or string.char(84,111,114,114,101,32,50,32,226,128,162,32) .. towerRoute
    else
        name = string.char(80,97,114,107,111,117,114,32) .. num .. string.char(32,226,128,162,32) .. cat
    end

    local usarDummy = MovementConfig.Modo == string.char(68,117,109,109,121) and not desativarDummies

    if usarDummy then
        Notify(string.char(77,65,82,67,65,68,79,82,32,67,82,73,65,68,79), string.char(65,110,100,101,32,97,116,195,169,32,111,32,109,97,114,99,97,100,111,114,32,118,101,114,100,101,32,112,97,114,97,32,105,110,105,99,105,97,114,58,32) .. name, string.char(79,114,97,110,103,101))
        CriarDummy(target, GetRotation(first))
        Playback.WalkConnection = R.Heartbeat:Connect(function()
            if not Playback.Running or not Playback.WalkingToStart then return end
            if not RefreshCharacter() then StopPlayback(string.char(101,114,114,111,114)); return end
            if (rootPart.Position - target).Magnitude <= 5 then
                if Playback.WalkConnection then
                    Playback.WalkConnection:Disconnect()
                    Playback.WalkConnection = nil
                end
                RemoverDummy()
                IniciarExecucao(name)
            end
        end)
    else
        Notify(string.char(73,78,68,79,32,80,65,82,65,32,79,32,73,78,195,141,67,73,79), name, string.char(79,114,97,110,103,101))
        task.spawn(function()
            AndarAte(target, function() return not Playback.Running end, function(sucesso)
                if not Playback.Running then return end
                if not sucesso then StopPlayback(string.char(101,114,114,111,114)) return end
                IniciarExecucao(name)
            end)
        end)
    end
end

local function SaveDirection()
    if not RefreshCharacter() then Notify(string.char(69,82,82,79),string.char(80,101,114,115,111,110,97,103,101,109,32,110,195,163,111,32,101,110,99,111,110,116,114,97,100,111,46),string.char(69,114,114,111,114)) return end
    local look=rootPart.CFrame.LookVector
    local flat=Vector3.new(look.X,0,look.Z)
    if flat.Magnitude<=0 then Notify(string.char(69,82,82,79),string.char(68,105,114,101,195,167,195,163,111,32,105,110,118,195,161,108,105,100,97,46),string.char(69,114,114,111,114)) return end
    SavedDirection=flat.Unit
    Notify(string.char(68,73,82,69,195,135,195,131,79,32,83,65,76,86,65),string.char(68,105,114,101,195,167,195,163,111,32,103,117,97,114,100,97,100,97,32,99,111,109,32,115,117,99,101,115,115,111,33),string.char(83,117,99,99,101,115,115))
end
local function Turn(command)
    if Turning then Notify(string.char(65,71,85,65,82,68,69),string.char(74,195,161,32,101,115,116,195,161,32,103,105,114,97,110,100,111,46),string.char(69,114,114,111,114)) return end
    if not RefreshCharacter() then Notify(string.char(69,82,82,79),string.char(80,101,114,115,111,110,97,103,101,109,32,110,195,163,111,32,101,110,99,111,110,116,114,97,100,111,46),string.char(69,114,114,111,114)) return end
    Turning=true
    local oldAutoRotate=humanoid.AutoRotate humanoid.AutoRotate=false
    local angle
    if command==string.char(68,73,82,69,73,84,65) then angle=math.rad(-90)
    elseif command==string.char(69,83,81,85,69,82,68,65) then angle=math.rad(90)
    elseif command==string.char(82,69,84,65,71,85,65,82,68,65) then angle=math.rad(180) end
    if angle then
        local pos=rootPart.Position
        local newCF=rootPart.CFrame*CFrame.Angles(0,angle,0)
        rootPart.CFrame=CFrame.new(pos)*(newCF-newCF.Position)
    end
    task.wait()
    humanoid.AutoRotate=oldAutoRotate
    Turning=false
    Notify(command..string.char(32,86,79,76,86,69,82,33),string.char(71,105,114,111,32,101,120,101,99,117,116,97,100,111,46),string.char(83,117,99,99,101,115,115))
end
local function VanguardaVolver()
    if not SavedDirection then Notify(string.char(69,82,82,79),string.char(83,97,108,118,101,32,117,109,97,32,100,105,114,101,195,167,195,163,111,32,112,114,105,109,101,105,114,111,46),string.char(69,114,114,111,114)) return end
    if not RefreshCharacter() then Notify(string.char(69,82,82,79),string.char(80,101,114,115,111,110,97,103,101,109,32,110,195,163,111,32,101,110,99,111,110,116,114,97,100,111,46),string.char(69,114,114,111,114)) return end
    local pos=rootPart.Position
    local oldAutoRotate=humanoid.AutoRotate humanoid.AutoRotate=false
    rootPart.CFrame=CFrame.lookAt(pos,pos+SavedDirection)
    task.wait()
    humanoid.AutoRotate=oldAutoRotate
    Notify(string.char(86,65,78,71,85,65,82,68,65,32,86,79,76,86,69,82,33),string.char(82,101,116,111,114,110,111,117,32,195,160,32,100,105,114,101,195,167,195,163,111,32,115,97,108,118,97,46),string.char(83,117,99,99,101,115,115))
end

local function EnviarNoChat(msg)
    msg=string.sub(msg,1,200)
    if TCS.ChatVersion==Enum.ChatVersion.TextChatService then
        local canais=TCS:FindFirstChild(string.char(84,101,120,116,67,104,97,110,110,101,108,115))
        local canal=canais and canais:FindFirstChild(string.char(82,66,88,71,101,110,101,114,97,108))
        if canal then canal:SendAsync(msg); return true end
    end
    local eventos=RS:FindFirstChild(string.char(68,101,102,97,117,108,116,67,104,97,116,83,121,115,116,101,109,67,104,97,116,69,118,101,110,116,115))
    local say=eventos and eventos:FindFirstChild(string.char(83,97,121,77,101,115,115,97,103,101,82,101,113,117,101,115,116))
    if say then say:FireServer(msg,string.char(65,108,108)); return true end
    return false
end

-- =========================================================================
-- FUNÇÕES IA
-- =========================================================================

-- ✅ CORRIGIDO: MaxTokens explícito + NÃO usa reasoning como fallback
local function CorrigirTexto(texto)
    if not httpRequest then return nil,string.char(69,120,101,99,117,116,111,114,32,115,101,109,32,115,117,112,111,114,116,101,32,97,32,72,84,84,80) end
    local corpo=HS:JSONEncode({
        model=IA_CONFIG.Modelo,
        messages={
            {role=string.char(115,121,115,116,101,109),content=IA_CONFIG.SystemPrompt},
            {role=string.char(117,115,101,114),content=texto}
        },
        temperature=.2,
        max_tokens=IA_CONFIG.MaxTokens or 2048
    })
    local resposta,terminou=nil,false
    task.spawn(function()
        local ok,res=pcall(function()
            return httpRequest({
                Url=IA_CONFIG.Endpoint, Method=string.char(80,79,83,84),
                Headers={[string.char(67,111,110,116,101,110,116,45,84,121,112,101)]=string.char(97,112,112,108,105,99,97,116,105,111,110,47,106,115,111,110),[string.char(65,117,116,104,111,114,105,122,97,116,105,111,110)]=string.char(66,101,97,114,101,114,32)..IA_CONFIG.ApiKey},
                Body=corpo
            })
        end)
        if ok then resposta=res end
        terminou=true
    end)
    local inicio=os.clock()
    while not terminou and (os.clock()-inicio)<IA_CONFIG.Timeout do task.wait(.1) end
    if not terminou then return nil,string.char(84,101,109,112,111,32,101,115,103,111,116,97,100,111) end
    if not resposta then return nil,string.char(70,97,108,104,97,32,110,97,32,114,101,113,117,105,115,105,195,167,195,163,111) end
    if not resposta.Body then return nil,string.char(82,101,115,112,111,115,116,97,32,118,97,122,105,97,32,100,111,32,115,101,114,118,105,100,111,114) end
    if resposta.StatusCode~=200 then return nil,string.char(72,84,84,80,32)..tostring(resposta.StatusCode) end
    local okJson,dados=pcall(function() return HS:JSONDecode(resposta.Body) end)
    if not okJson or not dados.choices or not dados.choices[1] then return nil,string.char(82,101,115,112,111,115,116,97,32,105,110,118,195,161,108,105,100,97) end
    local msg = dados.choices[1].message
    if not msg then return nil,string.char(82,101,115,112,111,115,116,97,32,118,97,122,105,97) end
    local txt = msg.content
    if not txt or txt=="" then return nil,string.char(82,101,115,112,111,115,116,97,32,118,97,122,105,97,32,40,97,117,109,101,110,116,101,32,77,97,120,84,111,107,101,110,115,41) end
    txt=txt:gsub(string.char(94,37,115,43),""):gsub(string.char(37,115,43,36),"")
    txt=txt:gsub(string.char(94,91,34,39,93,43),""):gsub(string.char(91,34,39,93,43,36),"")
    return txt
end

-- ✅ CORRIGIDO: max_tokens alto + não usa reasoning
local function GerarTextoIA(tema)
    if not httpRequest then return nil,string.char(69,120,101,99,117,116,111,114,32,115,101,109,32,115,117,112,111,114,116,101,32,97,32,72,84,84,80) end
    if not tema or tema=="" then return nil,string.char(84,101,109,97,32,118,97,122,105,111) end

    local corpo = HS:JSONEncode({
        model = IA_TEXTOS.Modelo,
        messages = {
            { role = string.char(115,121,115,116,101,109), content = IA_TEXTOS.SystemPrompt },
            { role = string.char(117,115,101,114), content = string.char(84,101,109,97,58,32) .. tema }
        },
        temperature = 0.85,
        max_tokens = IA_TEXTOS.MaxTokens or 2048
    })

    local resposta, terminou = nil, false
    task.spawn(function()
        local ok, res = pcall(function()
            return httpRequest({
                Url = IA_TEXTOS.Endpoint,
                Method = string.char(80,79,83,84),
                Headers = {
                    [string.char(67,111,110,116,101,110,116,45,84,121,112,101)] = string.char(97,112,112,108,105,99,97,116,105,111,110,47,106,115,111,110),
                    [string.char(65,117,116,104,111,114,105,122,97,116,105,111,110)] = string.char(66,101,97,114,101,114,32) .. IA_TEXTOS.ApiKey
                },
                Body = corpo
            })
        end)
        if ok then resposta = res end
        terminou = true
    end)

    local inicio = os.clock()
    while not terminou and (os.clock() - inicio) < IA_TEXTOS.Timeout do
        task.wait(0.1)
    end

    if not terminou then return nil, string.char(84,101,109,112,111,32,101,115,103,111,116,97,100,111) end
    if not resposta then return nil, string.char(70,97,108,104,97,32,110,97,32,114,101,113,117,105,115,105,195,167,195,163,111) end
    if not resposta.Body then return nil, string.char(82,101,115,112,111,115,116,97,32,118,97,122,105,97,32,100,111,32,115,101,114,118,105,100,111,114) end
    if resposta.StatusCode ~= 200 then return nil, string.char(72,84,84,80,32) .. tostring(resposta.StatusCode) end

    local okJson, dados = pcall(function()
        return HS:JSONDecode(resposta.Body)
    end)
    if not okJson or not dados.choices or not dados.choices[1] then
        return nil, string.char(82,101,115,112,111,115,116,97,32,105,110,118,195,161,108,105,100,97)
    end

    local msg = dados.choices[1].message
    if not msg then return nil, string.char(82,101,115,112,111,115,116,97,32,118,97,122,105,97) end

    -- ✅ NÃO usa reasoning (isso é o "pensamento" do modelo, não a resposta)
    local txt = msg.content
    if not txt or txt == "" then return nil, string.char(82,101,115,112,111,115,116,97,32,118,97,122,105,97,32,40,97,117,109,101,110,116,101,32,77,97,120,84,111,107,101,110,115,41) end

    txt = txt:gsub(string.char(94,37,115,43), ""):gsub(string.char(37,115,43,36), "")
    txt = txt:gsub(string.char(94,91,34,39,93,43), ""):gsub(string.char(91,34,39,93,43,36), "")
    txt = txt:gsub(string.char(94,84,101,109,97,58,37,115,42), "")
    txt = txt:gsub(string.char(94,84,101,120,116,111,58,37,115,42), "")

    if #txt > 220 then
        txt = txt:sub(1, 220)
    end

    return txt
end

-- =========================================================================
-- GUI PRINCIPAL
-- =========================================================================
local Gui=_I(string.char(83,99,114,101,101,110,71,117,105))
Gui.Name=string.char(90,75,89,95,80,65,82,75,79,85,82) Gui.ResetOnSpawn=false Gui.IgnoreGuiInset=true
Gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling Gui.Parent=PG

local Logo=_I(string.char(84,101,120,116,66,117,116,116,111,110))
Logo.Name=string.char(90,75,89,95,76,111,103,111) Logo.Size=_UO(58,58) Logo.Position=_UO(12,65)
Logo.BackgroundColor3=_RGB(10,10,10) Logo.BorderSizePixel=0 Logo.Text=string.char(239,191,189,239,191,189)
Logo.TextColor3=_K.White Logo.TextSize=26 Logo.Font=_GB
Logo.AutoButtonColor=false Logo.Parent=Gui Corner(Logo,29) Stroke(Logo,_K.StrokeLight)

local Main=_I(string.char(70,114,97,109,101))
Main.Name=string.char(77,97,105,110) Main.AnchorPoint=_V2(.5,.5) Main.Position=UDim2.fromScale(.5,.5)
Main.Size=UDim2.fromScale(.78,.65) Main.BackgroundColor3=_K.Background
Main.BorderSizePixel=0 Main.Visible=false Main.ClipsDescendants=true
Main.ZIndex=10 Main.Parent=Gui Corner(Main,14) Stroke(Main,_K.Stroke)

local Header=_I(string.char(70,114,97,109,101))
Header.Size=_U2(1,-16,0,54) Header.Position=_UO(8,8) Header.BackgroundColor3=_K.Panel
Header.BorderSizePixel=0 Header.ZIndex=20 Header.Parent=Main
Corner(Header,10) Stroke(Header,_K.Stroke)

local Title=_I(string.char(84,101,120,116,76,97,98,101,108))
Title.BackgroundTransparency=1 Title.Position=_UO(13,7) Title.Size=_U2(.55,0,0,23)
Title.Text=string.char(239,191,189,239,191,189,32,65,75,73,82,65,32,77,69,78,85) Title.TextColor3=_K.White Title.TextSize=17
Title.Font=_GB Title.TextXAlignment=_XL Title.ZIndex=22 Title.Parent=Header

local Subtitle=_I(string.char(84,101,120,116,76,97,98,101,108))
Subtitle.BackgroundTransparency=1 Subtitle.Position=_UO(14,31) Subtitle.Size=_U2(.65,0,0,15)
Subtitle.Text=string.char(65,117,116,111,32,80,97,114,107,111,117,114,32,226,128,162,32,65,107,105,114,97) Subtitle.TextColor3=_K.DarkGray
Subtitle.TextSize=9 Subtitle.Font=_GM Subtitle.TextXAlignment=_XL Subtitle.ZIndex=22 Subtitle.Parent=Header

local Version=_I(string.char(84,101,120,116,76,97,98,101,108))
Version.BackgroundColor3=_K.Card Version.AnchorPoint=_V2(.5,.5)
Version.Position=_U2(.5,0,.5,0) Version.Size=_UO(55,25) Version.Text=string.char(86,50,46,50,46,49)
Version.TextColor3=_K.Gray Version.TextSize=10 Version.Font=_GB
Version.ZIndex=22 Version.Parent=Header Corner(Version,8) Stroke(Version,_K.Stroke)

local Close=_I(string.char(84,101,120,116,66,117,116,116,111,110))
Close.Size=_UO(34,34) Close.Position=_U2(1,-42,.5,-17)
Close.BackgroundColor3=_K.Card Close.BorderSizePixel=0 Close.Text=string.char(195,151)
Close.TextColor3=_K.Gray Close.TextSize=22 Close.Font=_GM
Close.AutoButtonColor=false Close.ZIndex=25 Close.Parent=Header
Corner(Close,10) Stroke(Close,_K.Stroke)

local Sidebar=_I(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101))
Sidebar.Size=_U2(0,118,1,-78) Sidebar.Position=_UO(8,70)
Sidebar.BackgroundColor3=_K.Panel Sidebar.BorderSizePixel=0
Sidebar.ScrollBarThickness=2 Sidebar.ScrollBarImageColor3=_K.StrokeLight
Sidebar.AutomaticCanvasSize=Enum.AutomaticSize.Y Sidebar.ZIndex=20 Sidebar.Parent=Main
Corner(Sidebar,10) Stroke(Sidebar,_K.Stroke) Padding(Sidebar,7,7,6,6)
local SideLayout=_I(string.char(85,73,76,105,115,116,76,97,121,111,117,116))
SideLayout.Padding=_UD(0,5)
SideLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center
SideLayout.Parent=Sidebar

local function SideButton(text,selected)
    local b=_I(string.char(84,101,120,116,66,117,116,116,111,110))
    b.Size=_U2(1,0,0,39)
    b.BackgroundColor3=selected and _K.Selected or _K.Card
    b.BorderSizePixel=0 b.Text=text
    b.TextColor3=selected and _K.White or _K.Gray
    b.TextSize=9 b.Font=_GB b.TextXAlignment=_XL b.AutoButtonColor=false
    b.Parent=Sidebar Corner(b,7) Padding(b,0,0,8,2) Stroke(b,_K.Stroke)
    return b
end

local creditosButton = SideButton(string.char(239,191,189,239,191,189,32,67,82,195,137,68,73,84,79,83), false)
local ebDeltaButton  = SideButton(string.char(239,191,189,239,191,189,32,69,66,32,68,69,76,84,65), true)
local taffsButton    = SideButton(string.char(239,191,189,239,191,189,32,84,65,70,70,83))
local volversButton  = SideButton(string.char(226,134,170,32,86,79,76,86,69,82,83), false)
local iaButton       = SideButton(string.char(239,191,189,239,191,189,32,73,65,32,67,72,65,84), false)
local combateButton  = SideButton(string.char(239,191,189,239,191,189,32,67,79,77,66,65,84,69), false)
local textosButton   = SideButton(string.char(239,191,189,239,191,189,32,84,69,88,84,79,83,32,80,82,79,78,84,79,83), false)
local lojaButton     = SideButton(string.char(239,191,189,239,191,189,32,76,79,74,65), false)
local selectedButton = ebDeltaButton

local Content=_I(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101))
Content.Size=_U2(1,-134,1,-78) Content.Position=_U2(0,126,0,70)
Content.BackgroundColor3=_K.Panel Content.BorderSizePixel=0
Content.ScrollBarThickness=3 Content.ScrollBarImageColor3=_K.StrokeLight
Content.AutomaticCanvasSize=Enum.AutomaticSize.Y Content.ZIndex=20 Content.Parent=Main
Corner(Content,10) Stroke(Content,_K.Stroke)

local _CH=_I(string.char(70,114,97,109,101))
_CH.Size=_U2(1,0,0,0) _CH.AutomaticSize=Enum.AutomaticSize.Y
_CH.BackgroundTransparency=1 _CH.Parent=Content
Padding(_CH,9,9,9,9)
local ContentLayout=_I(string.char(85,73,76,105,115,116,76,97,121,111,117,116))
ContentLayout.Padding=_UD(0,7) ContentLayout.Parent=_CH

local function ClearContent()
    for _,c in ipairs(_CH:GetChildren()) do
        if c:IsA(string.char(71,117,105,79,98,106,101,99,116)) then c:Destroy() end
    end
end

-- =========================================================================
-- COMPONENTES
-- =========================================================================
local UI = {}

function UI.Help(parent)
    local h = _I(string.char(84,101,120,116,66,117,116,116,111,110), parent)
    h.Size = _UO(14,14)
    h.BackgroundColor3 = _RGB(35,35,45)
    h.BorderSizePixel = 0
    h.Text = string.char(63)
    h.TextColor3 = _K.DarkGray
    h.Font = _GB
    h.TextSize = 9
    h.AutoButtonColor = false
    h.ZIndex = 5
    Corner(h, 7)
    return h
end

function UI.Toggle(parent, ordem, texto, inicial, callback)
    local row = _I(string.char(70,114,97,109,101), parent)
    row.Size = _U2(1,0,0,28)
    row.BackgroundTransparency = 1
    row.LayoutOrder = ordem

    local lbl = _I(string.char(84,101,120,116,76,97,98,101,108), row)
    lbl.BackgroundTransparency = 1
    lbl.Position = _UO(0,0)
    lbl.Size = _U2(1,-90,1,0)
    lbl.Text = texto
    lbl.TextColor3 = _K.Gray
    lbl.Font = _GM
    lbl.TextSize = 10
    lbl.TextXAlignment = _XL

    local help = UI.Help(row)
    help.AnchorPoint = _V2(1,0.5)
    help.Position = _U2(1,-48,0.5,0)

    local sw = _I(string.char(84,101,120,116,66,117,116,116,111,110), row)
    sw.AnchorPoint = _V2(1,.5)
    sw.Position = _U2(1,0,.5,0)
    sw.Size = _UO(38,20)
    sw.BackgroundColor3 = _RGB(40,40,50)
    sw.BorderSizePixel = 0
    sw.Text = ""
    sw.AutoButtonColor = false
    Corner(sw, 10)

    local bol = _I(string.char(70,114,97,109,101), sw)
    bol.Size = _UO(14,14)
    bol.Position = _UO(3,3)
    bol.BackgroundColor3 = _RGB(120,120,130)
    bol.BorderSizePixel = 0
    Corner(bol, 7)

    local est = inicial
    local function aplicar(v)
        est = v
        if v then
            sw.BackgroundColor3 = _K.Purple
            bol.Position = _UO(21,3)
            bol.BackgroundColor3 = _RGB(255,255,255)
        else
            sw.BackgroundColor3 = _RGB(40,40,50)
            bol.Position = _UO(3,3)
            bol.BackgroundColor3 = _RGB(120,120,130)
        end
    end
    aplicar(est)
    sw.MouseButton1Click:Connect(function() aplicar(not est) callback(est) end)
    return row
end

function UI.Dropdown(parent, ordem, label, opcoes, atual, callback)
    local wrap = _I(string.char(70,114,97,109,101), parent)
    wrap.Size = _U2(1,0,0,0)
    wrap.AutomaticSize = Enum.AutomaticSize.Y
    wrap.BackgroundTransparency = 1
    wrap.LayoutOrder = ordem

    local lay = _I(string.char(85,73,76,105,115,116,76,97,121,111,117,116), wrap)
    lay.Padding = _UD(0,6)
    lay.SortOrder = Enum.SortOrder.LayoutOrder
    lay.Parent = wrap

    local row = _I(string.char(70,114,97,109,101), wrap)
    row.Size = _U2(1,0,0,14)
    row.BackgroundTransparency = 1
    row.LayoutOrder = 1

    local lbl = _I(string.char(84,101,120,116,76,97,98,101,108), row)
    lbl.BackgroundTransparency = 1
    lbl.Size = _U2(1,-20,1,0)
    lbl.Text = label
    lbl.TextColor3 = _K.Gray
    lbl.Font = _GM
    lbl.TextSize = 10
    lbl.TextXAlignment = _XL

    local help = UI.Help(row)
    help.AnchorPoint = _V2(1,.5)
    help.Position = _U2(1,0,.5,0)

    local box = _I(string.char(84,101,120,116,66,117,116,116,111,110), wrap)
    box.Size = _U2(1,0,0,30)
    box.BackgroundColor3 = _RGB(18,18,24)
    box.BorderSizePixel = 0
    box.Text = ""
    box.AutoButtonColor = false
    box.LayoutOrder = 2
    Corner(box, 6)
    Stroke(box, _K.Stroke, 1)

    local boxTxt = _I(string.char(84,101,120,116,76,97,98,101,108), box)
    boxTxt.BackgroundTransparency = 1
    boxTxt.Position = _UO(10,0)
    boxTxt.Size = _U2(1,-30,1,0)
    boxTxt.Text = atual
    boxTxt.TextColor3 = _K.White
    boxTxt.Font = _GB
    boxTxt.TextSize = 10
    boxTxt.TextXAlignment = _XL

    local arrow = _I(string.char(84,101,120,116,76,97,98,101,108), box)
    arrow.AnchorPoint = _V2(1,.5)
    arrow.Position = _U2(1,-10,.5,0)
    arrow.Size = _UO(14,14)
    arrow.BackgroundTransparency = 1
    arrow.Text = string.char(226,150,188)
    arrow.TextColor3 = _K.DarkGray
    arrow.Font = _GB
    arrow.TextSize = 9

    local lista = _I(string.char(70,114,97,109,101), wrap)
    lista.Size = _U2(1,0,0,0)
    lista.BackgroundColor3 = _RGB(16,16,22)
    lista.BorderSizePixel = 0
    lista.ClipsDescendants = true
    lista.LayoutOrder = 3
    lista.Visible = false
    Corner(lista, 6)
    Stroke(lista, _K.Stroke, 1)

    local listaLay = _I(string.char(85,73,76,105,115,116,76,97,121,111,117,116), lista)
    listaLay.Padding = _UD(0,1)
    listaLay.SortOrder = Enum.SortOrder.LayoutOrder
    listaLay.Parent = lista

    local alturaItem = 26
    local alturaTotal = #opcoes * alturaItem

    local estado = { aberto=false }
    local function fechar()
        estado.aberto = false
        lista.Visible = false
        lista.Size = _U2(1,0,0,0)
    end
    local function abrir()
        estado.aberto = true
        lista.Visible = true
        lista.Size = _U2(1,0,0,alturaTotal)
    end

    for i,op in ipairs(opcoes) do
        local b = _I(string.char(84,101,120,116,66,117,116,116,111,110), lista)
        b.Size = _U2(1,0,0,alturaItem)
        b.BackgroundColor3 = _RGB(16,16,22)
        b.BorderSizePixel = 0
        b.Text = string.char(32,32,32)..op
        b.TextColor3 = (op==atual) and _K.PurpleLight or _K.Gray
        b.Font = _GB
        b.TextSize = 10
        b.TextXAlignment = _XL
        b.AutoButtonColor = false
        b.LayoutOrder = i
        b.MouseEnter:Connect(function() b.BackgroundColor3 = _RGB(28,28,36) end)
        b.MouseLeave:Connect(function() b.BackgroundColor3 = _RGB(16,16,22) end)
        b.MouseButton1Click:Connect(function()
            boxTxt.Text = op
            callback(op)
            fechar()
        end)
    end

    box.MouseButton1Click:Connect(function()
        if estado.aberto then fechar() else abrir() end
    end)
end

function UI.Slider(parent, ordem, titulo, valor, min, max, isDec, callback)
    local wrap = _I(string.char(70,114,97,109,101), parent)
    wrap.Size = _U2(1,0,0,50)
    wrap.BackgroundTransparency = 1
    wrap.LayoutOrder = ordem

    local lbl = _I(string.char(84,101,120,116,76,97,98,101,108), wrap)
    lbl.BackgroundTransparency = 1
    lbl.Position = _UO(0,0)
    lbl.Size = _U2(1,-60,0,14)
    lbl.Text = titulo
    lbl.TextColor3 = _K.Gray
    lbl.Font = _GM
    lbl.TextSize = 10
    lbl.TextXAlignment = _XL

    local valLbl = _I(string.char(84,101,120,116,76,97,98,101,108), wrap)
    valLbl.AnchorPoint = _V2(1,0)
    valLbl.Position = _U2(1,-22,0,0)
    valLbl.Size = _UO(50,14)
    valLbl.BackgroundTransparency = 1
    valLbl.Text = isDec and string.format(string.char(37,46,50,102),valor) or tostring(valor)
    valLbl.TextColor3 = _K.White
    valLbl.Font = _GB
    valLbl.TextSize = 10
    valLbl.TextXAlignment = Enum.TextXAlignment.Right

    local help = UI.Help(wrap)
    help.AnchorPoint = _V2(1,0)
    help.Position = _U2(1,0,0,0)

    local barBg = _I(string.char(70,114,97,109,101), wrap)
    barBg.Position = _UO(0,24)
    barBg.Size = _U2(1,0,0,6)
    barBg.BackgroundColor3 = _RGB(35,35,45)
    barBg.BorderSizePixel = 0
    Corner(barBg, 3)

    local pct0 = (valor-min)/(max-min)
    local fill = _I(string.char(70,114,97,109,101), barBg)
    fill.Size = _U2(pct0,0,1,0)
    fill.BackgroundColor3 = _K.Purple
    fill.BorderSizePixel = 0
    Corner(fill, 3)

    local knob = _I(string.char(70,114,97,109,101), barBg)
    knob.AnchorPoint = _V2(.5,.5)
    knob.Position = _U2(pct0,0,.5,0)
    knob.Size = _UO(12,12)
    knob.BackgroundColor3 = _RGB(255,255,255)
    knob.BorderSizePixel = 0
    knob.ZIndex = 2
    Corner(knob, 6)

    local hit = _I(string.char(84,101,120,116,66,117,116,116,111,110), wrap)
    hit.Position = _UO(0,16)
    hit.Size = _U2(1,0,0,24)
    hit.BackgroundTransparency = 1
    hit.Text = ""
    hit.AutoButtonColor = false

    local dragging = false
    local function atualizar(x)
        local pct = math.clamp((x-barBg.AbsolutePosition.X)/math.max(barBg.AbsoluteSize.X,1),0,1)
        local v
        if isDec then
            v = min + (max-min)*pct
            valLbl.Text = string.format(string.char(37,46,50,102),v)
        else
            v = math.floor(min + (max-min)*pct + .5)
            valLbl.Text = tostring(v)
        end
        fill.Size = _U2(pct,0,1,0)
        knob.Position = _U2(pct,0,.5,0)
        callback(v)
    end
    hit.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            Content.ScrollingEnabled=false dragging=true
            atualizar(i.Position.X)
        end
    end)
    U.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
            atualizar(i.Position.X)
        end
    end)
    U.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            if dragging then dragging=false Content.ScrollingEnabled=true end
        end
    end)
end

function UI.TextBox(parent, ordem, label, placeholder, valor, callback)
    local wrap = _I(string.char(70,114,97,109,101), parent)
    wrap.Size = _U2(1,0,0,54)
    wrap.BackgroundTransparency = 1
    wrap.LayoutOrder = ordem

    local lbl = _I(string.char(84,101,120,116,76,97,98,101,108), wrap)
    lbl.BackgroundTransparency = 1
    lbl.Position = _UO(0,0)
    lbl.Size = _U2(1,-20,0,14)
    lbl.Text = label
    lbl.TextColor3 = _K.Gray
    lbl.Font = _GM
    lbl.TextSize = 10
    lbl.TextXAlignment = _XL

    local help = UI.Help(wrap)
    help.AnchorPoint = _V2(1,0)
    help.Position = _U2(1,0,0,0)

    local box = _I(string.char(84,101,120,116,66,111,120), wrap)
    box.Position = _UO(0,20)
    box.Size = _U2(1,0,0,30)
    box.BackgroundColor3 = _RGB(18,18,24)
    box.BorderSizePixel = 0
    box.Text = valor or ""
    box.PlaceholderText = placeholder or ""
    box.PlaceholderColor3 = _K.DarkGray
    box.TextColor3 = _K.White
    box.Font = _GM
    box.TextSize = 10
    box.TextXAlignment = _XL
    box.ClearTextOnFocus = false
    Corner(box, 6)
    Stroke(box, _K.Stroke, 1)
    Padding(box, 0,0,10,10)
    box.FocusLost:Connect(function() callback(box.Text) end)
    return box
end

function UI.ActionButton(parent, ordem, texto, corBg, callback)
    local b = _I(string.char(84,101,120,116,66,117,116,116,111,110), parent)
    b.Size = _U2(1,0,0,32)
    b.BackgroundColor3 = corBg or _RGB(30,30,40)
    b.BorderSizePixel = 0
    b.Text = texto
    b.TextColor3 = _K.White
    b.Font = _GB
    b.TextSize = 10
    b.AutoButtonColor = false
    b.LayoutOrder = ordem
    Corner(b, 6)
    Stroke(b, _K.Stroke, 1)
    b.MouseButton1Click:Connect(callback)
    return b
end

function UI.Card(parent, ordem, titulo)
    local card = _I(string.char(70,114,97,109,101), parent)
    card.Size = _U2(1,0,0,0)
    card.AutomaticSize = Enum.AutomaticSize.Y
    card.BackgroundColor3 = _RGB(22,22,28)
    card.BorderSizePixel = 0
    card.LayoutOrder = ordem
    Corner(card, 8)

    Padding(card, 14, 14, 14, 14)

    local lay = _I(string.char(85,73,76,105,115,116,76,97,121,111,117,116), card)
    lay.Padding = _UD(0,12)
    lay.SortOrder = Enum.SortOrder.LayoutOrder
    lay.Parent = card

    if titulo then
        local hwrap = _I(string.char(70,114,97,109,101), card)
        hwrap.Size = _U2(1,0,0,20)
        hwrap.BackgroundTransparency = 1
        hwrap.LayoutOrder = -1

        local h = _I(string.char(84,101,120,116,76,97,98,101,108), hwrap)
        h.BackgroundTransparency = 1
        h.Position = _UO(0,0)
        h.Size = _U2(1,0,0,16)
        h.Text = titulo
        h.TextColor3 = _K.White
        h.Font = _GB
        h.TextSize = 12
        h.TextXAlignment = _XL

        local line = _I(string.char(70,114,97,109,101), hwrap)
        line.Position = _UO(0,18)
        line.Size = _U2(0,36,0,2)
        line.BackgroundColor3 = _K.Purple
        line.BorderSizePixel = 0
        Corner(line, 1)
    end
    return card
end

local function CreateTwoColumns(parent, ordem)
    local container = _I(string.char(70,114,97,109,101), parent)
    container.Size = _U2(1,0,0,0)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundTransparency = 1
    container.LayoutOrder = ordem

    local lay = _I(string.char(85,73,76,105,115,116,76,97,121,111,117,116), container)
    lay.FillDirection = Enum.FillDirection.Horizontal
    lay.Padding = _UD(0, 10)
    lay.SortOrder = Enum.SortOrder.LayoutOrder
    lay.Parent = container

    local col1 = _I(string.char(70,114,97,109,101), container)
    col1.Size = _U2(0.5, -5, 0, 0)
    col1.AutomaticSize = Enum.AutomaticSize.Y
    col1.BackgroundTransparency = 1
    col1.LayoutOrder = 1
    local c1lay = _I(string.char(85,73,76,105,115,116,76,97,121,111,117,116), col1)
    c1lay.Padding = _UD(0, 10)
    c1lay.SortOrder = Enum.SortOrder.LayoutOrder
    c1lay.Parent = col1

    local col2 = _I(string.char(70,114,97,109,101), container)
    col2.Size = _U2(0.5, -5, 0, 0)
    col2.AutomaticSize = Enum.AutomaticSize.Y
    col2.BackgroundTransparency = 1
    col2.LayoutOrder = 2
    local c2lay = _I(string.char(85,73,76,105,115,116,76,97,121,111,117,116), col2)
    c2lay.Padding = _UD(0, 10)
    c2lay.SortOrder = Enum.SortOrder.LayoutOrder
    c2lay.Parent = col2

    return col1, col2
end

-- =========================================================================
-- TAFFS
-- =========================================================================
local TAFFS_DATA = {
    { Name=string.char(84,65,70,32,40,67,73,71,83,41), Emoji=string.char(239,191,189,239,191,189), Color=_RGB(255, 180, 50), Fields={
        {string.char(239,191,189,239,191,189,32,84,65,70), string.char(84,101,115,116,101,32,100,101,32,65,112,116,105,100,195,163,111,32,70,195,173,115,105,99,97,58,32,67,73,71,83)},
        {string.char(239,191,189,239,191,189,239,184,143,32,67,111,109,97,110,100,97,110,116,101), string.char(83,97,103,97,115)},
        {string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101), string.char(68,101,115,101,108,101,103,97,110,116)},
        {string.char(239,191,189,239,191,189,32,76,101,109,97), string.char(84,114,101,105,110,97,114,32,112,97,114,97,32,114,101,115,105,115,116,105,114,32,38,32,67,111,109,98,97,116,101,114,32,112,97,114,97,32,118,101,110,99,101,114,46)},
        {string.char(239,191,189,239,191,189,32,80,114,111,110,111,109,101,115), string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,71,117,101,114,114,101,105,114,111,32,100,101,32,83,101,108,118,97,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,71,117,101,114,114,101,105,114,111,115,32,100,101,32,83,101,108,118,97,46)},
        {string.char(239,191,189,239,191,189,32,73,110,195,173,99,105,111), string.char(82,101,116,105,114,97,114,32,98,111,105,110,97,44,32,100,97,114,32,115,97,117,100,97,195,167,195,181,101,115,32,97,111,32,105,110,115,116,114,117,116,111,114,32,101,32,112,97,115,115,97,114,32,112,101,108,111,115,32,101,115,99,117,100,111,115,46)}
    }},
    { Name=string.char(67,73,69), Emoji=string.char(239,191,189,239,191,189,239,184,143,226,128,141,226,153,130,239,184,143), Color=_RGB(70,130,180), Fields={
        {string.char(239,191,189,239,191,189,239,184,143,226,128,141,226,153,130,239,184,143,32,67,73,69), string.char(65,103,101,110,116,101,46)},
        {string.char(239,191,189,239,191,189,32,67,114,105,97,100,111,114), string.char(118,105,99,111,102,106,103,102,104,102)},
        {string.char(239,191,189,239,191,189,32,83,117,98,32,99,114,105,97,100,111,114), string.char(82,73,80,95,100,97,98,102,106,56,119)},
        {string.char(239,191,189,239,191,189,239,184,143,32,67,111,109,97,110,100,97,110,116,101), string.char(101,114,105,113,117,114,114,114,46)},
        {string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101), string.char(82,111,100,114,105,103,111,112,97,111,56)},
        {string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,181,101,115), string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,65,103,101,110,116,101,115,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,70,97,110,116,97,115,109,97,115,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,65,103,101,110,116,101,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,70,97,110,116,97,115,109,97,46)},
        {string.char(239,191,189,239,191,189,32,76,101,109,97,32,67,73,69), string.char(73,110,116,101,108,105,103,195,170,110,99,105,97,32,112,97,114,97,32,86,105,116,195,179,114,105,97,32,38,32,83,97,98,101,114,32,112,97,114,97,32,80,114,101,118,101,114,46)}
    }},
    { Name=string.char(82,69,67,32,77,69,67), Emoji=string.char(239,191,189,239,191,189), Color=_RGB(220,180,60), Fields={
        {string.char(239,191,189,239,191,189,32,82,69,67,32,77,69,67), string.char(67,97,118,97,108,101,105,114,111,115,46)},
        {string.char(239,191,189,239,191,189,32,67,111,109,97,110,100,97,110,116,101), string.char(116,101,114,114,111,95,50,52,51,51,46)},
        {string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101), string.char(67,111,110,116,97,110,117,109,53,98,108)},
        {string.char(239,191,189,239,191,189,32,76,101,109,97), string.char(72,97,118,101,114,195,161,32,115,101,109,112,114,101,32,117,109,97,32,67,97,118,97,108,97,114,105,97,33,44,32,65,195,167,111,32,110,97,32,109,101,110,116,101,44,32,109,111,116,111,114,32,110,111,32,112,101,105,116,111,32,101,32,104,111,110,114,97,32,110,97,32,109,105,115,115,195,163,111,33)},
        {string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,181,101,115), string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,67,97,118,97,108,101,105,114,111,115,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,67,97,118,97,108,101,105,114,111,46)},
        {string.char(239,191,189,239,191,189,239,184,143,32,76,105,99,101,110,195,167,97), string.char(76,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,101,115,32,67,97,118,97,108,101,105,114,111,115,46,32,47,32,76,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,32,67,97,118,97,108,101,105,114,111,46)},
        {string.char(239,191,189,239,191,189,32,67,111,109,32,108,105,99,101,110,195,167,97), string.char(67,111,109,32,108,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,101,115,32,67,97,118,97,108,101,105,114,111,115,46,32,47,32,67,111,109,32,108,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,32,67,97,118,97,108,101,105,114,111,46)},
        {string.char(239,191,189,239,191,189,32,67,111,109,97,110,100,111,115), string.char(65,84,69,78,195,135,195,131,79,32,84,85,82,78,79,44,32,80,82,69,80,65,82,65,82,32,80,65,82,65,32,77,65,82,67,72,65,82,33,32,47,32,65,84,69,78,195,135,195,131,79,32,84,85,82,78,79,44,32,77,65,82,67,72,69,77,33,32,47,32,65,84,69,78,195,135,195,131,79,32,80,69,76,79,84,195,131,79,44,32,80,82,69,80,65,82,65,82,32,80,65,82,65,32,77,65,82,67,72,65,82,33,32,47,32,65,84,69,78,195,135,195,131,79,32,80,69,76,79,84,195,131,79,44,32,77,65,82,67,72,69,77,33)}
    }},
    { Name=string.char(66,80,69), Emoji=string.char(239,191,189,239,191,189,239,184,143), Color=_RGB(60,180,120), Fields={
        {string.char(239,191,189,239,191,189,239,184,143,32,66,80,69), string.char(80,111,108,195,173,99,105,97,32,100,111,32,69,120,195,169,114,99,105,116,111)},
        {string.char(239,191,189,239,191,189,32,67,111,109,97,110,100,97,110,116,101), string.char(122,67,111,115,116,97,115,122,46)},
        {string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101), string.char(77,97,116,104,101,117,115,108,105,110,100,111,53,56,55,46)},
        {string.char(239,191,189,239,191,189,32,76,101,109,97), string.char(79,114,105,101,110,116,97,114,32,111,32,82,101,115,112,111,110,115,195,161,118,101,108,44,32,67,111,114,114,105,103,105,114,32,111,32,73,114,114,101,115,112,111,110,115,195,161,118,101,108,44,32,80,114,101,110,100,101,114,32,111,32,73,110,99,111,114,114,105,103,195,173,118,101,108,46)},
        {string.char(239,191,189,239,191,189,32,80,114,111,110,111,109,101,115,32,47,32,83,97,117,100,97,195,167,195,181,101,115), string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,80,111,108,105,99,105,97,105,115,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,80,111,108,105,99,105,97,108,46)}
    }},
    { Name=string.char(66,70,69,32,40,70,97,110,116,97,115,109,97,41), Emoji=string.char(239,191,189,239,191,189), Color=_RGB(200,70,70), Fields={
        {string.char(239,191,189,239,191,189,32,66,70,69), string.char(70,97,110,116,97,115,109,97,46)},
        {string.char(239,191,189,239,191,189,32,67,114,105,97,100,111,114), string.char(78,65,84,65,78,72,77,69,76,76,79,52,46)},
        {string.char(239,191,189,239,191,189,32,67,114,105,97,100,111), string.char(49,57,56,51,46)},
        {string.char(239,191,189,239,191,189,239,184,143,32,69,115,99,117,100,111), string.char(79,32,101,115,99,117,100,111,32,100,111,32,66,70,69,32,112,111,115,115,117,105,32,102,117,110,100,111,32,112,114,101,116,111,32,99,111,109,32,98,111,114,100,97,115,32,97,109,97,114,101,108,97,115,46,32,78,111,32,99,101,110,116,114,111,44,32,104,195,161,32,117,109,32,112,97,114,97,113,117,101,100,97,115,32,98,114,97,110,99,111,32,106,117,110,116,111,32,100,101,32,117,109,97,32,102,97,99,97,32,118,101,114,109,101,108,104,97,44,32,115,105,109,98,111,108,105,122,97,110,100,111,32,111,112,101,114,97,195,167,195,181,101,115,32,101,115,112,101,99,105,97,105,115,32,101,32,99,111,109,98,97,116,101,46,32,78,97,32,112,97,114,116,101,32,105,110,102,101,114,105,111,114,44,32,97,112,97,114,101,99,101,32,97,32,102,97,105,120,97,32,100,101,32,70,111,114,195,167,97,115,32,69,115,112,101,99,105,97,105,115,46)},
        {string.char(239,191,189,239,191,189,32,67,111,109,97,110,100,97,110,116,101), string.char(82,101,110,97,110,70,111,120,105,121,46)},
        {string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101), string.char(84,73,76,65,80,73,65,95,80,82,79,70,73,83,83,73,79,78,65,76,46)},
        {string.char(239,191,189,239,191,189,32,76,101,109,97), string.char(81,117,97,108,113,117,101,114,32,109,105,115,115,195,163,111,44,32,101,109,32,113,117,97,108,113,117,101,114,32,108,117,103,97,114,44,32,97,32,113,117,97,108,113,117,101,114,32,104,111,114,97,44,32,100,101,32,113,117,97,108,113,117,101,114,32,109,97,110,101,105,114,97,46)},
        {string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,181,101,115), string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,70,97,110,116,97,115,109,97,115,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,70,97,110,116,97,115,109,97,46)},
        {string.char(239,191,189,239,191,189,239,184,143,32,76,105,99,101,110,195,167,97), string.char(67,111,109,32,108,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,101,115,32,70,97,110,116,97,115,109,97,115,46,32,47,32,67,111,109,32,108,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,32,70,97,110,116,97,115,109,97,46)}
    }},
    { Name=string.char(66,73,80), Emoji=string.char(239,191,189,239,191,189), Color=_RGB(200, 200, 100), Fields={
        {string.char(239,191,189,239,191,189,32,66,73,80), string.char(66,97,116,97,108,104,195,163,111,32,100,101,32,73,110,102,97,110,116,97,114,105,97,32,80,97,114,97,113,117,101,100,105,115,116,97,46)},
        {string.char(239,191,189,239,191,189,32,67,111,109,97,110,100,97,110,116,101), ""},
        {string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101), ""},
        {string.char(239,191,189,239,191,189,32,76,101,109,97), string.char(80,97,114,97,113,117,101,100,105,115,116,97,115,44,32,115,101,109,112,114,101,32,112,114,111,110,116,111,115,32,112,97,114,97,32,97,32,109,105,115,115,195,163,111,44,32,100,111,32,99,195,169,117,32,97,111,32,99,104,195,163,111,46)},
        {string.char(239,191,189,239,191,189,32,77,105,115,115,195,163,111), string.char(77,97,110,116,101,114,32,97,32,116,114,111,112,97,32,112,114,111,110,116,97,32,112,97,114,97,32,97,116,117,97,114,32,101,109,32,109,105,115,115,195,181,101,115,32,97,101,114,111,116,101,114,114,101,115,116,114,101,115,44,32,99,111,109,32,100,105,115,99,105,112,108,105,110,97,44,32,99,111,114,97,103,101,109,32,101,32,112,114,111,110,116,105,100,195,163,111,46)},
        {string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,181,101,115), string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,80,97,114,97,113,117,101,100,105,115,116,97,115,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,80,97,114,97,113,117,101,100,105,115,116,97,46)},
        {string.char(239,191,189,239,191,189,239,184,143,32,76,105,99,101,110,195,167,97), string.char(67,111,109,32,108,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,101,115,32,80,97,114,97,113,117,101,100,105,115,116,97,115,46,32,47,32,67,111,109,32,108,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,32,80,97,114,97,113,117,101,100,105,115,116,97,46)},
        {string.char(239,191,189,239,191,189,32,71,114,105,116,111,32,100,101,32,71,117,101,114,114,97), string.char(80,65,82,65,81,85,69,68,73,83,84,65,33)}
    }},
    { Name=string.char(66,83,69), Emoji=string.char(239,191,189,239,191,189), Color=_RGB(100, 150, 200), Fields={
        {string.char(239,191,189,239,191,189,32,66,83,69), string.char(66,97,116,97,108,104,195,163,111,32,83,101,110,116,105,110,101,108,97,32,68,101,32,69,108,105,116,101)},
        {string.char(239,191,189,239,191,189,32,67,111,109,97,110,100,97,110,116,101), string.char(97,105,122,101,100,97,109,97,110,103,97,57,49,52,57)},
        {string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101), string.char(100,97,118,105,115,105,108,118,97,48,49,57,52)},
        {string.char(239,191,189,239,191,189,32,76,101,109,97), string.char(83,101,110,116,105,110,101,108,97,32,100,101,32,69,108,105,116,101,44,32,102,105,114,109,101,115,32,110,97,32,109,105,115,115,195,163,111,59,32,104,111,110,114,97,32,101,32,100,105,115,99,105,112,108,105,110,97,44,32,110,111,115,115,97,32,116,114,97,100,105,195,167,195,163,111,33)},
        {string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,181,101,115), string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,115,101,110,116,105,110,101,108,97,115,33,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,115,101,110,116,105,110,101,108,97,33,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,110,111,98,114,101,115,32,115,101,110,116,105,110,101,108,97,115,33,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,110,111,98,114,101,32,115,101,110,116,105,110,101,108,97,33)},
        {string.char(239,191,189,239,191,189,239,184,143,32,67,111,109,32,108,105,99,101,110,195,167,97), string.char(67,111,109,32,108,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,32,115,101,110,116,105,110,101,108,97,33,32,47,32,67,111,109,32,108,105,99,101,110,195,167,97,44,32,110,111,98,114,101,115,32,115,101,110,116,105,110,101,108,97,115,33,32,47,32,67,111,109,32,108,105,99,101,110,195,167,97,44,32,110,111,98,114,101,32,115,101,110,116,105,110,101,108,97,33)}
    }},
    { Name=string.char(66,65,67), Emoji=string.char(239,191,189,239,191,189), Color=_RGB(220,100,50), Fields={
        {string.char(239,191,189,239,191,189,32,73,78,70,79,82,77,65,195,135,195,149,69,83,32,66,65,67), string.char(66,97,116,97,108,104,195,163,111,32,100,101,32,65,195,167,195,181,101,115,32,100,101,32,67,111,109,97,110,100,111,115)},
        {string.char(239,191,189,239,191,189,32,68,111,110,111), string.char(77,97,116,101,117,115,72,103,122)},
        {string.char(239,191,189,239,191,189,239,184,143,32,67,111,109,97,110,100,97,110,116,101), string.char(83,97,115,117,107,101,101,80,114,111,50,48,50,46)},
        {string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101), string.char(68,97,110,105,101,108,83,120,83,50,46)},
        {string.char(239,191,189,239,191,189,32,76,101,109,97,32,100,97,32,66,65,67), string.char(79,32,109,195,161,120,105,109,111,32,100,101,32,99,111,110,102,117,115,195,163,111,44,32,109,111,114,116,101,32,101,32,100,101,115,116,114,117,105,195,167,195,163,111,32,110,97,32,114,101,116,97,103,117,97,114,100,97,32,100,111,32,105,110,105,109,105,103,111,46)},
        {string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,181,101,115), string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,67,111,109,97,110,100,111,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,67,111,109,97,110,100,111,115,46)}
    }},
    { Name=string.char(67,89,66,69,82), Emoji=string.char(239,191,189,239,191,189), Color=_RGB(150,100,200), Fields={
        {string.char(239,191,189,239,191,189,32,67,89,66,69,82), string.char(67,111,109,97,110,100,111,32,100,101,32,68,101,102,101,115,97,32,67,105,98,101,114,110,195,169,116,105,99,97,46)},
        {string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,181,101,115), string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,65,110,97,108,105,115,116,97,115,46)},
        {string.char(239,191,189,239,191,189,32,67,114,105,97,100,111,114), string.char(119,65,110,84,101,101,49,54,106,53,49,53,54,46)},
        {string.char(239,191,189,239,191,189,32,68,111,110,111), string.char(77,97,120,84,104,101,74,112,49,46,32,47,32,73,116,115,77,101,76,121,114,105,111,46,32,47,32,71,97,98,114,105,101,108,50,52,52,52,113,46)},
        {string.char(239,191,189,239,191,189,239,184,143,32,67,111,109,97,110,100,97,110,116,101), string.char(104,105,103,104,97,110,100,100,114,121,57,56)},
        {string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101), string.char(78,195,163,111,32,116,101,109,46)},
        {string.char(239,191,189,239,191,189,32,76,101,109,97), string.char(83,101,103,117,114,97,110,195,167,97,32,110,111,32,99,105,98,101,114,101,115,112,97,195,167,111,44,32,115,111,98,101,114,97,110,105,97,32,112,97,114,97,32,97,32,78,97,195,167,195,163,111,46)},
        {string.char(239,191,189,239,191,189,239,184,143,32,74,85,82,65,77,69,78,84,79), string.char(74,85,82,79,32,71,85,65,82,68,65,82,32,83,73,71,73,76,79,32,83,79,66,82,69,32,84,85,68,79,32,81,85,69,32,86,69,82,32,69,32,79,85,86,82,73,82,32,78,79,32,67,79,77,68,67,73,66,69,82,33)}
    }},
    { Name=string.char(67,65,65,84,73,78,71,65), Emoji=string.char(239,191,189,239,191,189), Color=_RGB(50,150,80), Fields={
        {string.char(239,191,189,239,191,189,32,67,65,65,84,73,78,71,65), string.char(71,117,97,114,100,105,195,181,101,115,32,100,97,32,67,97,97,116,105,110,103,97,46)},
        {string.char(239,191,189,239,191,189,32,67,111,109,97,110,100,97,110,116,101), string.char(71,97,98,114,105,101,108,99,109,48,52)},
        {string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101), string.char(80,108,107,95,76,110,49,55)},
        {string.char(239,191,189,239,191,189,32,76,101,109,97), string.char(79,32,112,97,105,32,99,114,105,97,44,32,97,32,109,195,163,101,32,101,100,117,99,97,32,101,32,97,32,67,97,97,116,105,110,103,97,32,101,108,105,109,105,110,97,46)},
        {string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,163,111), string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,103,117,97,114,100,105,195,181,101,115,32,100,97,32,67,97,97,116,105,110,103,97,46)}
    }}
}

local function CreateTAFFSCard(label,value,order,parent,color)
    local card=_I(string.char(70,114,97,109,101))
    card.Size=_U2(1,0,0,48) card.BackgroundColor3=_K.Card
    card.BorderSizePixel=0 card.LayoutOrder=order card.Parent=parent
    Corner(card,8) Stroke(card,_K.Stroke,1)
    local text=_I(string.char(84,101,120,116,76,97,98,101,108))
    text.BackgroundTransparency=1 text.Position=_UO(10,5) text.Size=_U2(1,-82,1,-10)
    text.Text=label..string.char(58,32)..value text.TextColor3=_K.White
    text.TextSize=10 text.Font=_GM text.TextWrapped=true
    text.TextXAlignment=_XL text.TextYAlignment=Enum.TextYAlignment.Center text.Parent=card
    local copy=_I(string.char(84,101,120,116,66,117,116,116,111,110))
    copy.AnchorPoint=_V2(1,.5) copy.Position=_U2(1,-7,.5,0)
    copy.Size=_UO(58,29) copy.BackgroundColor3=_K.Success copy.BorderSizePixel=0
    copy.Text=string.char(67,111,112,105,97,114) copy.TextColor3=_K.White copy.TextSize=9
    copy.Font=_GB copy.AutoButtonColor=false copy.Parent=card
    Corner(copy,7) Stroke(copy,_K.StrokeLight,1)
    copy.Activated:Connect(function()
        if typeof(setclipboard)~=string.char(102,117,110,99,116,105,111,110) then
            Notify(string.char(67,79,80,73,65,82),string.char(83,101,117,32,101,120,101,99,117,116,111,114,32,110,195,163,111,32,112,111,115,115,117,105,32,115,101,116,99,108,105,112,98,111,97,114,100,46),string.char(69,114,114,111,114))
            return
        end
        local ok=pcall(function() setclipboard(value) end)
        if ok then
            copy.Text=string.char(226,156,147) copy.BackgroundColor3=_K.Success
            Notify(string.char(67,79,80,73,65,68,79),string.char(73,110,102,111,114,109,97,195,167,195,163,111,32,99,111,112,105,97,100,97,46),string.char(83,117,99,99,101,115,115))
            task.delay(.9,function()
                if copy.Parent then copy.Text=string.char(67,111,112,105,97,114) copy.BackgroundColor3=_K.Success end
            end)
        end
    end)
end

local function ShowTAFFS()
    CurrentPage=string.char(84,65,70,70,83)
    ClearContent()
    local warningCard=_I(string.char(70,114,97,109,101))
    warningCard.Size=_U2(1,0,0,70) warningCard.BackgroundColor3=_RGB(45,35,20)
    warningCard.BorderSizePixel=0 warningCard.LayoutOrder=0 warningCard.Parent=_CH
    Corner(warningCard,8) Stroke(warningCard,_K.Orange,1.5)
    local warnIcon=_I(string.char(84,101,120,116,76,97,98,101,108))
    warnIcon.BackgroundTransparency=1 warnIcon.Position=_UO(12,8) warnIcon.Size=_UO(30,30)
    warnIcon.Text=string.char(226,154,160,239,184,143) warnIcon.TextSize=20 warnIcon.TextColor3=_K.White
    warnIcon.Font=_GB warnIcon.TextXAlignment=_XC
    warnIcon.TextYAlignment=Enum.TextYAlignment.Center warnIcon.Parent=warningCard
    local warnText=_I(string.char(84,101,120,116,76,97,98,101,108))
    warnText.BackgroundTransparency=1 warnText.Position=_UO(48,8)
    warnText.Size=_U2(1,-130,0,35)
    warnText.Text=string.char(68,101,115,101,106,97,32,97,100,105,99,105,111,110,97,114,32,97,115,32,105,110,102,111,114,109,97,195,167,195,181,101,115,32,84,65,70,70,83,32,101,109,32,117,109,32,109,101,110,117,32,115,101,99,117,110,100,195,161,114,105,111,63)
    warnText.TextColor3=_K.White warnText.TextSize=10 warnText.Font=_GB
    warnText.TextWrapped=true warnText.TextXAlignment=_XL
    warnText.TextYAlignment=Enum.TextYAlignment.Top warnText.Parent=warningCard
    local simBtn=_I(string.char(84,101,120,116,66,117,116,116,111,110))
    simBtn.AnchorPoint=_V2(1,.5) simBtn.Position=_U2(1,-12,.5,0)
    simBtn.Size=_UO(70,34) simBtn.BackgroundColor3=_K.Success
    simBtn.BorderSizePixel=0 simBtn.Text=string.char(226,150,182,32,83,73,77) simBtn.TextColor3=_K.White
    simBtn.TextSize=10 simBtn.Font=_GB simBtn.AutoButtonColor=false simBtn.Parent=warningCard
    Corner(simBtn,8)
    simBtn.MouseButton1Click:Connect(function()
        local ok = pcall(function()
            loadstring(game:HttpGet(string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,121,121,112,56,117,52,88,116)))()
        end)
        if ok then Notify(string.char(77,69,78,85,32,83,69,67,85,78,68,195,129,82,73,79),string.char(84,65,70,70,83,32,97,100,105,99,105,111,110,97,100,111,32,99,111,109,32,115,117,99,101,115,115,111,33),string.char(83,117,99,99,101,115,115))
        else Notify(string.char(69,82,82,79),string.char(70,97,108,104,97,32,97,111,32,99,97,114,114,101,103,97,114,32,111,32,109,101,110,117,32,115,101,99,117,110,100,195,161,114,105,111,46),string.char(69,114,114,111,114)) end
    end)
    local header=_I(string.char(70,114,97,109,101))
    header.Size=_U2(1,0,0,58) header.BackgroundColor3=_K.Card header.BorderSizePixel=0
    header.LayoutOrder=1 header.Parent=_CH Corner(header,9) Stroke(header,_K.StrokeLight,1)
    local title=_I(string.char(84,101,120,116,76,97,98,101,108))
    title.BackgroundTransparency=1 title.Position=_UO(12,7) title.Size=_U2(1,-24,0,25)
    title.Text=string.char(239,191,189,239,191,189,32,84,65,70,70,83) title.TextColor3=_K.White title.TextSize=16
    title.Font=_GB title.TextXAlignment=_XL title.Parent=header
    local sub=_I(string.char(84,101,120,116,76,97,98,101,108))
    sub.BackgroundTransparency=1 sub.Position=_UO(13,34) sub.Size=_U2(1,-26,0,15)
    sub.Text=string.char(73,110,102,111,114,109,97,195,167,195,181,101,115,32,100,97,115,32,111,114,103,97,110,105,122,97,195,167,195,181,101,115,32,109,105,108,105,116,97,114,101,115) sub.TextColor3=_K.DarkGray
    sub.TextSize=9 sub.Font=_GM sub.TextXAlignment=_XL sub.Parent=header
    for idx,div in ipairs(TAFFS_DATA) do
        local section=_I(string.char(70,114,97,109,101))
        section.Size=_U2(1,0,0,0) section.AutomaticSize=Enum.AutomaticSize.Y
        section.BackgroundColor3=_K.Card section.BorderSizePixel=0
        section.LayoutOrder=idx+1 section.Parent=_CH
        Corner(section,8) Stroke(section,div.Color,2)
        local sectionLayout=_I(string.char(85,73,76,105,115,116,76,97,121,111,117,116))
        sectionLayout.FillDirection=Enum.FillDirection.Vertical
        sectionLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center
        sectionLayout.SortOrder=Enum.SortOrder.LayoutOrder
        sectionLayout.Padding=_UD(0,5) sectionLayout.Parent=section
        local headerDiv=_I(string.char(70,114,97,109,101))
        headerDiv.Size=_U2(1,0,0,38) headerDiv.BackgroundColor3=div.Color
        headerDiv.BackgroundTransparency=0.2 headerDiv.BorderSizePixel=0
        headerDiv.LayoutOrder=0 headerDiv.Parent=section Corner(headerDiv,8)
        local titleDiv=_I(string.char(84,101,120,116,76,97,98,101,108))
        titleDiv.BackgroundTransparency=1 titleDiv.Position=_UO(12,0)
        titleDiv.Size=_U2(1,-24,1,0) titleDiv.Text=div.Emoji..string.char(32,32)..div.Name
        titleDiv.TextColor3=_K.White titleDiv.TextSize=14 titleDiv.Font=_GB
        titleDiv.TextXAlignment=_XL titleDiv.TextYAlignment=Enum.TextYAlignment.Center
        titleDiv.Parent=headerDiv
        for i,field in ipairs(div.Fields) do
            CreateTAFFSCard(field[1],field[2],i,section,div.Color)
        end
    end
    Content.CanvasPosition=_V2()
end

-- =========================================================================
-- EB DELTA
-- =========================================================================
local EBDeltaSubPage = string.char(80,97,114,107,111,117,114)

local function ShowParkoursContent()
    local col1, col2 = CreateTwoColumns(_CH, 1)

    local function makeParkourCard(parent, num)
        local card = UI.Card(parent, num, string.char(80,97,114,107,111,117,114,32)..num)

        local catAtual = selectedCategory[num] or string.char(76,101,110,116,111)
        UI.Dropdown(card, 1, string.char(86,101,108,111,99,105,100,97,100,101), CategoryOrder, catAtual, function(op)
            selectedCategory[num] = op
        end)

        local running = Playback.Running and Playback.Parkour==num and not Playback.Tower
        UI.ActionButton(card, 2, running and string.char(80,97,114,97,114) or (string.char(73,110,105,99,105,97,114,32,80,97,114,107,111,117,114,32)..num),
            _RGB(28,28,36), function()
                if Playback.Running and Playback.Parkour==num and not Playback.Tower then
                    StopPlayback(string.char(99,97,110,99,101,108,108,101,100)); ShowEBDelta(); return
                end
                local cat = selectedCategory[num] or string.char(76,101,110,116,111)
                local rs = routes[cat]
                local route = rs and rs[num]
                if not route then
                    Notify(string.char(82,79,84,65,32,78,195,131,79,32,69,78,67,79,78,84,82,65,68,65),string.char(80,97,114,107,111,117,114,32)..num..string.char(32,226,128,162,32)..cat,string.char(69,114,114,111,114))
                    return
                end
                StartPlayback(route, cat, num)
                task.wait(.1) ShowEBDelta()
            end)
    end

    makeParkourCard(col1, 1)
    makeParkourCard(col2, 2)
    makeParkourCard(col1, 3)
    makeParkourCard(col2, 4)
end

local function ShowTowersContent()
    local col1, col2 = CreateTwoColumns(_CH, 1)

    do
        local card = UI.Card(col1, 1, string.char(84,111,114,114,101,32,49))
        UI.Dropdown(card, 1, string.char(86,101,114,115,195,163,111), {string.char(195,154,110,105,99,97)}, string.char(195,154,110,105,99,97), function(op) end)
        local running = Playback.Running and Playback.Tower==string.char(84,111,114,114,101,32,49)
        UI.ActionButton(card, 2, running and string.char(80,97,114,97,114) or string.char(73,110,105,99,105,97,114,32,84,111,114,114,101,32,49),
            _RGB(28,28,36), function()
                if Playback.Running and Playback.Tower==string.char(84,111,114,114,101,32,49) then
                    StopPlayback(string.char(99,97,110,99,101,108,108,101,100)); ShowEBDelta(); return
                end
                local route = towerRoutes[string.char(84,111,114,114,101,32,49)][string.char(195,154,110,105,99,97)]
                if not route then
                    Notify(string.char(82,79,84,65,32,78,195,131,79,32,67,65,82,82,69,71,65,68,65),string.char(65,32,114,111,116,97,32,100,97,32,84,111,114,114,101,32,49,32,110,195,163,111,32,102,111,105,32,101,110,99,111,110,116,114,97,100,97,46),string.char(69,114,114,111,114))
                    return
                end
                StartPlayback(route, nil, nil, string.char(84,111,114,114,101,32,49), string.char(195,154,110,105,99,97))
                task.wait(.1) ShowEBDelta()
            end)
    end

    do
        local card = UI.Card(col2, 1, string.char(84,111,114,114,101,32,50))
        UI.Dropdown(card, 1, string.char(86,101,114,115,195,163,111), Tower2RouteOrder, selectedTower2Route, function(op)
            selectedTower2Route = op
        end)
        local running = Playback.Running and Playback.Tower==string.char(84,111,114,114,101,32,50)
        UI.ActionButton(card, 2, running and string.char(80,97,114,97,114) or string.char(73,110,105,99,105,97,114,32,84,111,114,114,101,32,50),
            _RGB(28,28,36), function()
                if Playback.Running and Playback.Tower==string.char(84,111,114,114,101,32,50) then
                    StopPlayback(string.char(99,97,110,99,101,108,108,101,100)); ShowEBDelta(); return
                end
                local route = towerRoutes[string.char(84,111,114,114,101,32,50)][selectedTower2Route]
                if not route then
                    Notify(string.char(82,79,84,65,32,78,195,131,79,32,67,65,82,82,69,71,65,68,65),string.char(84,111,114,114,101,32,50,32,226,128,162,32)..selectedTower2Route,string.char(69,114,114,111,114))
                    return
                end
                StartPlayback(route, nil, nil, string.char(84,111,114,114,101,32,50), selectedTower2Route)
                task.wait(.1) ShowEBDelta()
            end)
    end
end

-- =========================================================================
-- ✅ AUTO JJS CORRIGIDO
--  - firesignal separado em pcalls individuais (um falhar não cancela os outros)
--  - não para de varrer as bolhas ao clicar (clicava só 1 por ciclo antes)
-- =========================================================================
local ShowAutomacaoContent
do
    local ativo,VELOCIDADE,MAX_CLIQUES,META,META_ATIVA=false,53,2,308,true
    local jjsFeitos,bolhasVistas,cliquesTotal,ultimaBolhaVista=0,{},0,0
    local btnToggleRef,infoLbl

    local function setBtnEstado(ligado)
        if not btnToggleRef or not btnToggleRef.Parent then return end
        btnToggleRef.Text = ligado and string.char(80,97,114,97,114,32,65,117,116,111,32,74,74,83) or string.char(73,110,105,99,105,97,114,32,65,117,116,111,32,74,74,83)
    end

    -- ✅ CORRIGIDO: cada firesignal no próprio pcall
    local function clicarFiresignal(obj)
        if firesignal then
            pcall(firesignal, obj.MouseButton1Down)
            pcall(firesignal, obj.MouseButton1Up)
            pcall(firesignal, obj.MouseButton1Click)
            return
        end
        pcall(function() obj.MouseButton1Down:Fire() end)
        pcall(function() obj.MouseButton1Up:Fire() end)
        pcall(function() obj.MouseButton1Click:Fire() end)
    end

    local function ehBolha(obj)
        if obj.ClassName~=string.char(73,109,97,103,101,66,117,116,116,111,110) then return false end
        if obj.Name~=string.char(73,110,112,117,116,84,101,109,112,108,97,116,101) then return false end
        if not obj.Visible then return false end
        local s=obj.AbsoluteSize
        if s.X<20 or s.Y<20 or s.X>200 or s.Y>200 then return false end
        local p=obj.AbsolutePosition
        if p.X<=0 or p.Y<=0 then return false end
        return true
    end

    local function gerarID(obj)
        local pos=obj.AbsolutePosition local size=obj.AbsoluteSize
        local cx=pos.X+size.X/2 local cy=pos.Y+size.Y/2
        return math.floor(cx/40)..string.char(95)..math.floor(cy/40)
    end

    -- ✅ CORRIGIDO: clica TODAS as bolhas visíveis, sem "break"
    task.spawn(function()
        while true do
            task.wait(0.08)
            if not ativo then continue end
            if META_ATIVA and jjsFeitos >= META then
                ativo = false
                setBtnEstado(false)
                Notify(string.char(65,85,84,79,32,74,74,83),string.char(77,101,116,97,32,97,116,105,110,103,105,100,97,58,32)..jjsFeitos..string.char(47)..META,string.char(83,117,99,99,101,115,115))
                continue
            end
            local delayAtual=VELOCIDADE/100
            local agora=tick()
            for id,dados in pairs(bolhasVistas) do
                if agora-dados.t>2.5 then bolhasVistas[id]=nil end
            end
            local clicouAlguma=false
            for _,gui in ipairs(PG:GetChildren()) do
                if gui:IsA(string.char(83,99,114,101,101,110,71,117,105)) and gui~=Gui then
                    for _,obj in ipairs(gui:GetDescendants()) do
                        if ehBolha(obj) then
                            ultimaBolhaVista=tick()
                            local id=gerarID(obj)
                            local dados=bolhasVistas[id]
                            if not dados then
                                bolhasVistas[id]={count=0,t=tick()}
                                dados=bolhasVistas[id]
                            end
                            dados.t=tick()
                            if dados.count<MAX_CLIQUES then
                                clicarFiresignal(obj)
                                dados.count=dados.count+1
                                cliquesTotal=cliquesTotal+1
                                clicouAlguma=true
                                if dados.count==1 then jjsFeitos=jjsFeitos+1 end
                            end
                        end
                    end
                end
            end
            if clicouAlguma then task.wait(delayAtual) else task.wait(0.02) end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.3)
            if infoLbl and infoLbl.Parent then
                if META_ATIVA then
                    infoLbl.Text=string.format(string.char(74,74,115,58,32,37,100,47,37,100),jjsFeitos,META)
                    infoLbl.TextColor3 = (jjsFeitos>=META) and _K.Success or _K.Orange
                else
                    infoLbl.Text=string.format(string.char(74,74,115,58,32,37,100,32,40,115,101,109,32,109,101,116,97,41),jjsFeitos)
                    infoLbl.TextColor3 = _K.PurpleLight
                end
            end
        end
    end)

    ShowAutomacaoContent=function()
        local card = UI.Card(_CH, 1, string.char(65,117,116,111,32,74,74,83))

        UI.Toggle(card, 1, string.char(65,116,105,118,97,114,32,65,117,116,111,32,74,74,83), ativo, function(v) ativo = v end)

        local metaBox
        local function updateMetaBoxState()
            if not metaBox then return end
            if META_ATIVA then
                metaBox.TextEditable = true
                metaBox.TextColor3 = _K.White
                metaBox.BackgroundColor3 = _RGB(18,18,24)
                metaBox.PlaceholderColor3 = _K.DarkGray
            else
                metaBox.TextEditable = false
                metaBox.TextColor3 = _K.DarkGray
                metaBox.BackgroundColor3 = _RGB(13,13,17)
                metaBox.PlaceholderColor3 = _RGB(70,70,80)
            end
        end

        UI.Toggle(card, 2, string.char(65,116,105,118,97,114,32,77,101,116,97), META_ATIVA, function(v)
            META_ATIVA = v
            updateMetaBoxState()
            if v then
                Notify(string.char(65,85,84,79,32,74,74,83),string.char(77,101,116,97,32,97,116,105,118,97,100,97,46,32,65,108,118,111,58,32)..META,string.char(83,117,99,99,101,115,115))
            else
                Notify(string.char(65,85,84,79,32,74,74,83),string.char(77,101,116,97,32,100,101,115,97,116,105,118,97,100,97,46,32,67,97,109,112,111,32,98,108,111,113,117,101,97,100,111,46),string.char(79,114,97,110,103,101))
            end
        end)

        metaBox = UI.TextBox(card, 3, string.char(81,117,97,110,116,105,100,97,100,101,32,76,105,109,105,116,101,32,69,120,97,116,97), string.char(69,120,58,32,51,48,56), tostring(META), function(txt)
            local v = tonumber(txt)
            if v and v>0 then META=v end
        end)
        updateMetaBoxState()

        UI.Slider(card, 4, string.char(68,101,108,97,121), VELOCIDADE, 1, 100, false, function(v) VELOCIDADE = v end)

        infoLbl = _I(string.char(84,101,120,116,76,97,98,101,108), card)
        infoLbl.Size = _U2(1,0,0,14)
        infoLbl.BackgroundTransparency = 1
        infoLbl.Text = META_ATIVA and (string.char(74,74,115,58,32,48,47)..META) or string.char(74,74,115,58,32,48,32,40,115,101,109,32,109,101,116,97,41)
        infoLbl.TextColor3 = _K.Orange
        infoLbl.Font = _GB
        infoLbl.TextSize = 10
        infoLbl.TextXAlignment = _XL
        infoLbl.LayoutOrder = 5

        btnToggleRef = UI.ActionButton(card, 6, string.char(73,110,105,99,105,97,114,32,65,117,116,111,32,74,74,83), _RGB(28,28,36), function()
            if not ativo and jjsFeitos >= META then
                jjsFeitos = 0
                cliquesTotal = 0
                bolhasVistas = {}
            end
            ativo = not ativo
            setBtnEstado(ativo)
            if ativo then ultimaBolhaVista=tick() end
        end)

        UI.ActionButton(card, 7, string.char(82,101,115,101,116,97,114,32,67,111,110,116,97,100,111,114), _RGB(24,24,30), function()
            jjsFeitos = 0
            cliquesTotal = 0
            bolhasVistas = {}
            Notify(string.char(65,85,84,79,32,74,74,83),string.char(67,111,110,116,97,100,111,114,32,114,101,115,101,116,97,100,111,46),string.char(83,117,99,99,101,115,115))
        end)
    end
end

local function ShowConfiguracaoContent()
    local card = UI.Card(_CH, 1, string.char(71,101,114,97,108))

    UI.Toggle(card, 1, string.char(68,101,115,97,116,105,118,97,114,32,68,117,109,109,105,101,115,32,40,73,114,32,68,105,114,101,116,111,47,77,111,118,101,84,111,41), desativarDummies, function(v)
        desativarDummies = v
        MovementConfig.Modo = v and string.char(68,105,114,101,116,111) or string.char(68,117,109,109,121)
    end)

    UI.Toggle(card, 2, string.char(77,111,115,116,114,97,114,32,76,105,110,104,97,115,32,40,65,112,101,110,97,115,32,80,97,114,107,111,117,114,41), mostrarLinhas, function(v)
        mostrarLinhas = v
        linesVisible = v
    end)

    UI.ActionButton(card, 3, string.char(76,105,109,112,97,114,32,68,117,109,109,105,101,115,32,101,32,82,111,116,97,115,32,80,101,110,100,101,110,116,101,115), _RGB(30,30,40), function()
        if Playback.Running then StopPlayback(string.char(99,97,110,99,101,108,108,101,100)) end
        RemoverDummy()
        ClearLines()
        Notify(string.char(76,73,77,80,69,90,65),string.char(68,117,109,109,105,101,115,32,101,32,114,111,116,97,115,32,112,101,110,100,101,110,116,101,115,32,114,101,109,111,118,105,100,111,115,46),string.char(83,117,99,99,101,115,115))
    end)
end

function ShowEBDelta()
    CurrentPage = string.char(69,66,68,101,108,116,97)
    ClearContent()

    local hotbar = _I(string.char(70,114,97,109,101), _CH)
    hotbar.Size = _U2(1,0,0,30)
    hotbar.BackgroundTransparency = 1
    hotbar.LayoutOrder = 0

    local hbLay = _I(string.char(85,73,76,105,115,116,76,97,121,111,117,116), hotbar)
    hbLay.FillDirection = Enum.FillDirection.Horizontal
    hbLay.Padding = _UD(0,18)
    hbLay.VerticalAlignment = Enum.VerticalAlignment.Center
    hbLay.Parent = hotbar

    local tabs = {
        {Nome=string.char(80,97,114,107,111,117,114,115), Id=string.char(80,97,114,107,111,117,114)},
        {Nome=string.char(84,111,114,114,101,115), Id=string.char(84,111,114,114,101,115)},
        {Nome=string.char(67,111,110,102,105,103,117,114,97,195,167,195,181,101,115), Id=string.char(67,111,110,102,105,103,117,114,97,99,97,111)},
        {Nome=string.char(65,117,116,111,109,97,195,167,195,181,101,115), Id=string.char(65,117,116,111,109,97,99,97,111)}
    }
    for _, tab in ipairs(tabs) do
        local sel = EBDeltaSubPage == tab.Id
        local b = _I(string.char(84,101,120,116,66,117,116,116,111,110), hotbar)
        b.Size = _UO(110, 28)
        b.BackgroundTransparency = 1
        b.Text = tab.Nome
        b.TextColor3 = sel and _K.White or _K.DarkGray
        b.Font = _GB
        b.TextSize = 12
        b.AutoButtonColor = false
        b.TextXAlignment = Enum.TextXAlignment.Center

        b.MouseButton1Click:Connect(function()
            EBDeltaSubPage = tab.Id
            ShowEBDelta()
        end)

        if sel then
            local line = _I(string.char(70,114,97,109,101), b)
            line.AnchorPoint = _V2(0.5,1)
            line.Position = _U2(0.5,0,1,-2)
            line.Size = _U2(0.6,0,0,2)
            line.BackgroundColor3 = _K.Purple
            line.BorderSizePixel = 0
            Corner(line,1)
        end
    end

    if EBDeltaSubPage==string.char(84,111,114,114,101,115) then
        ShowTowersContent()
    elseif EBDeltaSubPage==string.char(80,97,114,107,111,117,114) then
        ShowParkoursContent()
    elseif EBDeltaSubPage==string.char(65,117,116,111,109,97,99,97,111) then
        ShowAutomacaoContent()
    else
        ShowConfiguracaoContent()
    end

    Content.CanvasPosition=_V2()
end

-- =========================================================================
-- VOLVERS
-- =========================================================================
local function ShowVolvers()
    CurrentPage=string.char(86,111,108,118,101,114,115)
    ClearContent()
    local header=_I(string.char(70,114,97,109,101))
    header.Size=_U2(1,0,0,58) header.BackgroundColor3=_K.Card header.BorderSizePixel=0
    header.LayoutOrder=0 header.Parent=_CH Corner(header,9) Stroke(header,_K.StrokeLight,1)
    local title=_I(string.char(84,101,120,116,76,97,98,101,108))
    title.BackgroundTransparency=1 title.Position=_UO(12,7) title.Size=_U2(1,-24,0,25)
    title.Text=string.char(226,134,170,32,86,79,76,86,69,82,83) title.TextColor3=_K.White title.TextSize=16
    title.Font=_GB title.TextXAlignment=_XL title.Parent=header
    local sub=_I(string.char(84,101,120,116,76,97,98,101,108))
    sub.BackgroundTransparency=1 sub.Position=_UO(13,34) sub.Size=_U2(1,-26,0,15)
    sub.Text=string.char(67,111,109,97,110,100,111,115,32,100,101,32,102,111,114,109,97,195,167,195,163,111,32,226,128,147,32,90,65,89,75,32,86,79,76,86,69,82,83,32,86,50) sub.TextColor3=_K.DarkGray
    sub.TextSize=9 sub.Font=_GM sub.TextXAlignment=_XL sub.Parent=header

    local warningCard=_I(string.char(70,114,97,109,101))
    warningCard.Size=_U2(1,0,0,70) warningCard.BackgroundColor3=_RGB(45,35,20)
    warningCard.BorderSizePixel=0 warningCard.LayoutOrder=1 warningCard.Parent=_CH
    Corner(warningCard,8) Stroke(warningCard,_K.Orange,1.5)
    local warnIcon=_I(string.char(84,101,120,116,76,97,98,101,108))
    warnIcon.BackgroundTransparency=1 warnIcon.Position=_UO(12,8) warnIcon.Size=_UO(30,30)
    warnIcon.Text=string.char(226,154,160,239,184,143) warnIcon.TextSize=20 warnIcon.TextColor3=_K.White
    warnIcon.Font=_GB warnIcon.TextXAlignment=_XC
    warnIcon.TextYAlignment=Enum.TextYAlignment.Center warnIcon.Parent=warningCard
    local warnText=_I(string.char(84,101,120,116,76,97,98,101,108))
    warnText.BackgroundTransparency=1 warnText.Position=_UO(48,8)
    warnText.Size=_U2(1,-130,0,35)
    warnText.Text=string.char(68,101,115,101,106,97,32,101,120,101,99,117,116,97,114,32,111,115,32,99,111,109,97,110,100,111,115,32,86,111,108,118,101,114,115,32,101,109,32,117,109,32,109,101,110,117,32,115,101,99,117,110,100,195,161,114,105,111,63)
    warnText.TextColor3=_K.White warnText.TextSize=10 warnText.Font=_GB
    warnText.TextWrapped=true warnText.TextXAlignment=_XL
    warnText.TextYAlignment=Enum.TextYAlignment.Top warnText.Parent=warningCard
    local simBtn=_I(string.char(84,101,120,116,66,117,116,116,111,110))
    simBtn.AnchorPoint=_V2(1,.5) simBtn.Position=_U2(1,-12,.5,0)
    simBtn.Size=_UO(70,34) simBtn.BackgroundColor3=_K.Success
    simBtn.BorderSizePixel=0 simBtn.Text=string.char(226,150,182,32,83,73,77) simBtn.TextColor3=_K.White
    simBtn.TextSize=10 simBtn.Font=_GB simBtn.AutoButtonColor=false simBtn.Parent=warningCard
    Corner(simBtn,8)
    simBtn.MouseButton1Click:Connect(function()
        local ok = pcall(function()
            loadstring(game:HttpGet(string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,90,114,122,72,65,101,110,113)))()
        end)
        if ok then Notify(string.char(77,69,78,85,32,83,69,67,85,78,68,195,129,82,73,79),string.char(86,111,108,118,101,114,32,97,98,101,114,116,111,32,99,111,109,32,115,117,99,101,115,115,111,33),string.char(83,117,99,99,101,115,115))
        else Notify(string.char(69,82,82,79),string.char(70,97,108,104,97,32,97,111,32,99,97,114,114,101,103,97,114,32,111,32,109,101,110,117,32,115,101,99,117,110,100,195,161,114,105,111,46),string.char(69,114,114,111,114)) end
    end)

    local commands={
        { name=string.char(226,151,134,32,83,65,76,86,65,82,32,80,79,83,73,195,135,195,131,79), desc=string.char(83,97,108,118,97,32,115,111,109,101,110,116,101,32,112,97,114,97,32,111,110,100,101,32,111,32,112,101,114,115,111,110,97,103,101,109,32,101,115,116,195,161,32,111,108,104,97,110,100,111,46), highlight=true, action=SaveDirection },
        { name=string.char(68,73,82,69,73,84,65,32,86,79,76,86,69,82,33), desc=string.char(71,105,114,97,32,57,48,194,176,32,112,97,114,97,32,97,32,100,105,114,101,105,116,97,46), highlight=false, action=function() Turn(string.char(68,73,82,69,73,84,65)) end },
        { name=string.char(69,83,81,85,69,82,68,65,32,86,79,76,86,69,82,33), desc=string.char(71,105,114,97,32,57,48,194,176,32,112,97,114,97,32,97,32,101,115,113,117,101,114,100,97,46), highlight=false, action=function() Turn(string.char(69,83,81,85,69,82,68,65)) end },
        { name=string.char(82,69,84,65,71,85,65,82,68,65,32,86,79,76,86,69,82,33), desc=string.char(71,105,114,97,32,49,56,48,194,176,32,112,97,114,97,32,116,114,195,161,115,46), highlight=false, action=function() Turn(string.char(82,69,84,65,71,85,65,82,68,65)) end },
        { name=string.char(86,65,78,71,85,65,82,68,65,32,86,79,76,86,69,82,33), desc=string.char(82,101,116,111,114,110,97,32,195,160,32,100,105,114,101,195,167,195,163,111,32,115,97,108,118,97,32,115,101,109,32,97,108,116,101,114,97,114,32,115,117,97,32,112,111,115,105,195,167,195,163,111,46), highlight=false, action=VanguardaVolver }
    }
    for i,cmd in ipairs(commands) do
        local card=_I(string.char(70,114,97,109,101))
        card.Size=_U2(1,0,0,55)
        card.BackgroundColor3=cmd.highlight and _RGB(38,38,38) or _K.Card
        card.BorderSizePixel=0 card.LayoutOrder=i+2 card.Parent=_CH
        Corner(card,8)
        Stroke(card, cmd.highlight and _K.Primary or _K.Stroke, cmd.highlight and 1.7 or 1)
        local nameLabel=_I(string.char(84,101,120,116,76,97,98,101,108))
        nameLabel.BackgroundTransparency=1 nameLabel.Position=_UO(11,5)
        nameLabel.Size=_U2(1,-100,0,20) nameLabel.Text=cmd.name
        nameLabel.TextColor3=_K.White nameLabel.TextSize=10
        nameLabel.Font=Enum.Font.GothamBlack nameLabel.TextXAlignment=_XL nameLabel.Parent=card
        local descLabel=_I(string.char(84,101,120,116,76,97,98,101,108))
        descLabel.BackgroundTransparency=1 descLabel.Position=_UO(11,26)
        descLabel.Size=_U2(1,-100,0,17) descLabel.Text=cmd.desc
        descLabel.TextColor3=_K.Gray descLabel.TextSize=7 descLabel.Font=_GM
        descLabel.TextXAlignment=_XL descLabel.Parent=card
        local execBtn=_I(string.char(84,101,120,116,66,117,116,116,111,110))
        execBtn.AnchorPoint=_V2(1,.5) execBtn.Position=_U2(1,-8,.5,0)
        execBtn.Size=_UO(68,30)
        execBtn.BackgroundColor3=cmd.highlight and _K.Orange or _K.Success
        execBtn.BorderSizePixel=0 execBtn.Text=string.char(226,150,182,32,69,88,69,67,85,84,65,82) execBtn.TextColor3=_K.White
        execBtn.TextSize=8 execBtn.Font=_GB execBtn.AutoButtonColor=false execBtn.Parent=card
        Corner(execBtn,7)
        execBtn.MouseButton1Click:Connect(function() cmd.action() end)
    end
    Content.CanvasPosition=_V2()
end

-- =========================================================================
-- IA CHAT
-- =========================================================================
local iaOcupado=false
local function ShowAutoCorrecao()
    CurrentPage=string.char(65,117,116,111,67,111,114,114,101,99,97,111)
    ClearContent()
    local card = UI.Card(_CH, 1, string.char(239,191,189,239,191,189,32,73,65,32,67,72,65,84))

    local inputCard = _I(string.char(70,114,97,109,101), card)
    inputCard.Size = _U2(1,0,0,140)
    inputCard.BackgroundColor3 = _RGB(18,18,24)
    inputCard.BorderSizePixel = 0
    inputCard.LayoutOrder = 1
    Corner(inputCard, 6)
    Stroke(inputCard, _K.Stroke, 1)

    local box = _I(string.char(84,101,120,116,66,111,120), inputCard)
    box.Position = _UO(10,10)
    box.Size = _U2(1,-20,0,60)
    box.BackgroundColor3 = _RGB(14,14,18)
    box.BorderSizePixel = 0
    box.PlaceholderText = string.char(68,105,103,105,116,101,32,115,117,97,32,109,101,110,115,97,103,101,109,46,46,46)
    box.PlaceholderColor3 = _K.DarkGray
    box.Text = ""
    box.TextColor3 = _K.White
    box.TextSize = 11
    box.Font = _GM
    box.TextWrapped = true
    box.TextXAlignment = _XL
    box.TextYAlignment = Enum.TextYAlignment.Top
    box.ClearTextOnFocus = false
    box.MultiLine = false
    Corner(box, 6)
    Padding(box, 6,6,8,8)

    local send = _I(string.char(84,101,120,116,66,117,116,116,111,110), inputCard)
    send.Position = _UO(10,78)
    send.Size = _U2(1,-20,0,32)
    send.BackgroundColor3 = _K.Purple
    send.BorderSizePixel = 0
    send.Text = string.char(226,156,168,32,67,111,114,114,105,103,105,114,32,101,32,69,110,118,105,97,114)
    send.TextColor3 = _K.White
    send.TextSize = 10
    send.Font = _GB
    send.AutoButtonColor = false
    Corner(send, 6)

    local status = _I(string.char(84,101,120,116,76,97,98,101,108), inputCard)
    status.BackgroundTransparency = 1
    status.Position = _UO(10,116)
    status.Size = _U2(1,-20,0,18)
    status.Text = ""
    status.TextColor3 = _K.Gray
    status.TextSize = 10
    status.Font = _GM
    status.TextXAlignment = _XL

    local function setStatus(t,c) status.Text=t status.TextColor3=c end
    send.MouseButton1Click:Connect(function()
        if iaOcupado then return end
        local texto=box.Text:gsub(string.char(94,37,115,43),""):gsub(string.char(37,115,43,36),"")
        if texto=="" then setStatus(string.char(226,154,160,239,184,143,32,68,105,103,105,116,101,32,97,108,103,111,32,112,114,105,109,101,105,114,111),_K.Orange) return end
        iaOcupado=true send.Text=string.char(226,143,179,32,65,103,117,97,114,100,101,46,46,46) setStatus(string.char(239,191,189,239,191,189,32,80,101,110,115,97,110,100,111,46,46,46),_K.Gray)
        task.spawn(function()
            local corrigido,erro=CorrigirTexto(texto)
            if corrigido then
                if EnviarNoChat(corrigido) then
                    setStatus(string.char(226,156,133,32,67,111,114,114,105,103,105,100,111,32,101,32,101,110,118,105,97,100,111,33),_K.Success)
                    box.Text=""
                    Notify(string.char(73,65,32,67,72,65,84),string.char(77,101,110,115,97,103,101,109,32,101,110,118,105,97,100,97,46),string.char(83,117,99,99,101,115,115))
                else
                    setStatus(string.char(226,157,140,32,67,104,97,116,32,110,195,163,111,32,101,110,99,111,110,116,114,97,100,111),_K.Error)
                end
            else
                setStatus(string.char(226,157,140,32)..tostring(erro),_K.Error)
            end
            send.Text=string.char(226,156,168,32,67,111,114,114,105,103,105,114,32,101,32,69,110,118,105,97,114) iaOcupado=false
        end)
    end)
    Content.CanvasPosition=_V2()
end

-- =========================================================================
-- CRÉDITOS
-- =========================================================================
local function ShowCreditos()
    CurrentPage=string.char(67,114,101,100,105,116,111,115)
    ClearContent()
    local link=string.char(104,116,116,112,115,58,47,47,100,105,115,99,111,114,100,46,103,103,47,78,89,50,82,102,67,55,75,120)
    local card = UI.Card(_CH, 1, string.char(239,191,189,239,191,189,32,67,82,195,137,68,73,84,79,83))

    local dev = _I(string.char(70,114,97,109,101), card)
    dev.Size = _U2(1,0,0,50)
    dev.BackgroundColor3 = _RGB(18,18,24)
    dev.BorderSizePixel = 0
    dev.LayoutOrder = 1
    Corner(dev,6) Stroke(dev,_K.Stroke,1)

    local devT = _I(string.char(84,101,120,116,76,97,98,101,108), dev)
    devT.BackgroundTransparency = 1
    devT.Position = _UO(12,0)
    devT.Size = _U2(1,-24,1,0)
    devT.Text = string.char(69,115,115,101,32,115,99,114,105,112,116,32,102,111,105,32,100,101,115,101,110,118,111,108,118,105,100,111,32,112,101,108,111,32,97,107,105,114,97,48,48,55,112,32,239,191,189,239,191,189,32,100,105,115,99,111,114,100)
    devT.TextColor3 = _K.White
    devT.Font = _GB
    devT.TextSize = 11
    devT.TextWrapped = true
    devT.TextXAlignment = _XL
    devT.TextYAlignment = Enum.TextYAlignment.Center

    local srv = _I(string.char(70,114,97,109,101), card)
    srv.Size = _U2(1,0,0,60)
    srv.BackgroundColor3 = _RGB(18,18,24)
    srv.BorderSizePixel = 0
    srv.LayoutOrder = 2
    Corner(srv,6) Stroke(srv,_K.Orange,1)

    local srvT = _I(string.char(84,101,120,116,76,97,98,101,108), srv)
    srvT.BackgroundTransparency = 1
    srvT.Position = _UO(12,8)
    srvT.Size = _U2(1,-100,0,20)
    srvT.Text = string.char(239,191,189,239,191,189,32,83,101,114,118,105,100,111,114,32,100,111,32,68,105,115,99,111,114,100)
    srvT.TextColor3 = _K.White
    srvT.Font = _GB
    srvT.TextSize = 11
    srvT.TextXAlignment = _XL

    local srvL = _I(string.char(84,101,120,116,76,97,98,101,108), srv)
    srvL.BackgroundTransparency = 1
    srvL.Position = _UO(12,30)
    srvL.Size = _U2(1,-100,0,20)
    srvL.Text = link
    srvL.TextColor3 = _K.Gray
    srvL.TextSize = 9
    srvL.Font = _GM
    srvL.TextXAlignment = _XL

    local enter = _I(string.char(84,101,120,116,66,117,116,116,111,110), srv)
    enter.AnchorPoint = _V2(1,.5)
    enter.Position = _U2(1,-10,.5,0)
    enter.Size = _UO(75,32)
    enter.BackgroundColor3 = _RGB(88,101,242)
    enter.BorderSizePixel = 0
    enter.Text = string.char(226,150,182,32,69,78,84,82,65,82)
    enter.TextColor3 = _K.White
    enter.TextSize = 9
    enter.Font = _GB
    enter.AutoButtonColor = false
    Corner(enter,6)
    enter.MouseButton1Click:Connect(function()
        pcall(function() setclipboard(link) end)
        pcall(function() game:GetService(string.char(71,117,105,83,101,114,118,105,99,101)):OpenBrowserWindow(link) end)
        Notify(string.char(68,73,83,67,79,82,68),string.char(76,105,110,107,32,99,111,112,105,97,100,111,33,32,67,111,108,101,32,110,111,32,110,97,118,101,103,97,100,111,114,32,115,101,32,110,195,163,111,32,97,98,114,105,114,46),string.char(83,117,99,99,101,115,115))
    end)
    Content.CanvasPosition=_V2()
end

-- =========================================================================
-- TEXTOS PRONTOS + IA
-- =========================================================================
do
    local CARD_COLORS = {
        { Header = _RGB(59, 130, 246), Body = _RGB(35, 35, 35) },
        { Header = _RGB(239, 68, 68),  Body = _RGB(45, 30, 30) },
        { Header = _RGB(16, 185, 129), Body = _RGB(30, 40, 35) },
        { Header = _RGB(245, 158, 11), Body = _RGB(45, 40, 30) },
        { Header = _RGB(139, 92, 246), Body = _RGB(35, 30, 45) },
    }
    local C = {
        Fundo      = _RGB(25, 25, 25),
        Painel     = _RGB(35, 35, 35),
        Borda      = _RGB(50, 50, 50),
        Texto      = _RGB(255, 255, 255),
        TextoDim   = _RGB(160, 160, 160),
        Verde      = _RGB(16, 185, 129),
        VerdeHover = _RGB(52, 211, 153),
    }
    local TEXTOS = {
        { Titulo = string.char(80,79,82,32,81,85,69,32,79,32,69,66,32,195,137,32,73,77,80,79,82,84,65,78,84,69,32,80,82,65,32,83,79,67,73,69,68,65,68,69,63), Texto = string.char(79,32,69,66,32,110,195,163,111,32,195,169,32,97,112,101,110,97,115,32,102,97,114,100,97,32,101,32,97,114,109,97,58,32,195,169,32,111,32,98,114,97,195,167,111,32,102,111,114,116,101,32,113,117,101,32,103,117,97,114,100,97,32,97,32,112,195,161,116,114,105,97,44,32,115,111,99,111,114,114,101,32,101,109,32,116,114,97,103,195,169,100,105,97,115,44,32,102,111,114,109,97,32,99,105,100,97,100,195,163,111,115,32,100,101,32,104,111,110,114,97,32,101,32,100,101,102,101,110,100,101,32,97,32,115,111,98,101,114,97,110,105,97,46,32,83,101,109,32,101,108,101,44,32,110,195,163,111,32,104,195,161,32,112,97,122,32,115,111,99,105,97,108,32,110,101,109,32,102,117,116,117,114,111,32,115,101,103,117,114,111,32,112,114,97,32,110,105,110,103,117,195,169,109,46) },
        { Titulo = string.char(80,79,82,32,81,85,69,32,86,79,67,195,138,32,81,85,69,82,32,83,85,66,73,82,32,68,69,32,80,65,84,69,78,84,69,63), Texto = string.char(81,117,101,114,111,32,115,117,98,105,114,32,100,101,32,112,97,116,101,110,116,101,32,112,114,97,32,97,106,117,100,97,114,32,109,97,105,115,32,97,32,116,114,111,112,97,44,32,97,112,114,101,110,100,101,114,32,97,32,108,105,100,101,114,97,114,32,100,105,114,101,105,116,111,32,101,32,102,97,122,101,114,32,112,111,114,32,109,101,114,101,99,101,114,32,97,32,99,111,110,102,105,97,110,195,167,97,32,100,111,115,32,109,101,117,115,32,115,117,112,101,114,105,111,114,101,115,46,32,78,195,163,111,32,195,169,32,112,111,114,32,115,116,97,116,117,115,44,32,195,169,32,112,111,114,32,118,111,110,116,97,100,101,32,100,101,32,115,101,114,118,105,114,32,109,101,108,104,111,114,46) },
        { Titulo = string.char(80,79,82,32,81,85,69,32,83,69,82,86,73,82,32,65,79,32,69,88,195,137,82,67,73,84,79,32,66,82,65,83,73,76,69,73,82,79,63), Texto = string.char(83,105,114,118,111,32,97,111,32,69,120,195,169,114,99,105,116,111,32,112,111,114,113,117,101,32,97,99,114,101,100,105,116,111,32,110,111,32,66,114,97,115,105,108,32,101,32,113,117,101,114,111,32,102,97,122,101,114,32,112,97,114,116,101,32,100,101,32,97,108,103,111,32,109,97,105,111,114,32,113,117,101,32,101,117,46,32,195,137,32,111,110,100,101,32,97,112,114,101,110,100,111,32,100,105,115,99,105,112,108,105,110,97,44,32,104,111,110,114,97,32,101,32,111,32,118,97,108,111,114,32,100,101,32,112,114,111,116,101,103,101,114,32,113,117,101,109,32,110,195,163,111,32,112,111,100,101,32,115,101,32,112,114,111,116,101,103,101,114,32,115,111,122,105,110,104,111,46) },
        { Titulo = string.char(67,79,77,79,32,86,79,67,195,138,32,86,195,138,32,83,85,65,32,74,79,82,78,65,68,65,32,67,79,77,79,32,77,73,76,73,84,65,82,32,78,79,32,70,85,84,85,82,79,63), Texto = string.char(81,117,101,114,111,32,115,117,98,105,114,32,117,109,97,32,112,97,116,101,110,116,101,32,100,101,32,99,97,100,97,32,118,101,122,44,32,97,112,114,101,110,100,101,114,32,99,111,109,32,111,115,32,111,102,105,99,105,97,105,115,32,109,97,105,115,32,101,120,112,101,114,105,101,110,116,101,115,32,101,32,117,109,32,100,105,97,32,112,111,100,101,114,32,116,114,101,105,110,97,114,32,111,115,32,110,111,118,97,116,111,115,46,32,80,114,101,116,101,110,100,111,32,102,105,99,97,114,32,97,116,195,169,32,111,110,100,101,32,99,111,110,115,101,103,117,105,114,44,32,115,101,109,112,114,101,32,104,111,110,114,97,110,100,111,32,97,32,102,97,114,100,97,46) },
    }
    local function criarCard(tema, ordem, cor)
        local card = _I(string.char(70,114,97,109,101), _CH)
        card.Size = _U2(1, 0, 0, 0)
        card.AutomaticSize = Enum.AutomaticSize.Y
        card.BackgroundColor3 = cor.Body
        card.BorderSizePixel = 0
        card.LayoutOrder = ordem
        Corner(card, 8)
        Stroke(card, cor.Header, 0.5, 0.7)
        card.ClipsDescendants = true
        _I(string.char(85,73,76,105,115,116,76,97,121,111,117,116), card).SortOrder = Enum.SortOrder.LayoutOrder
        local cardHeader = _I(string.char(70,114,97,109,101), card)
        cardHeader.Size = _U2(1, 0, 0, 0)
        cardHeader.AutomaticSize = Enum.AutomaticSize.Y
        cardHeader.BackgroundColor3 = cor.Header
        cardHeader.BorderSizePixel = 0
        cardHeader.LayoutOrder = 1
        local padHeader = _I(string.char(85,73,80,97,100,100,105,110,103), cardHeader)
        padHeader.PaddingTop = _UD(0, 8) padHeader.PaddingBottom = _UD(0, 8)
        padHeader.PaddingLeft = _UD(0, 12) padHeader.PaddingRight = _UD(0, 12)
        local tituloCard = _I(string.char(84,101,120,116,76,97,98,101,108), cardHeader)
        tituloCard.Size = _U2(1, 0, 0, 0)
        tituloCard.AutomaticSize = Enum.AutomaticSize.Y
        tituloCard.BackgroundTransparency = 1
        tituloCard.Text = string.char(239,191,189,239,191,189,32) .. tema.Titulo
        tituloCard.TextColor3 = C.Texto tituloCard.Font = _GB
        tituloCard.TextSize = 12 tituloCard.TextXAlignment = _XL
        tituloCard.TextWrapped = true
        local cardBody = _I(string.char(70,114,97,109,101), card)
        cardBody.Size = _U2(1, 0, 0, 0)
        cardBody.AutomaticSize = Enum.AutomaticSize.Y
        cardBody.BackgroundColor3 = cor.Body
        cardBody.BorderSizePixel = 0 cardBody.LayoutOrder = 2
        local padBody = _I(string.char(85,73,80,97,100,100,105,110,103), cardBody)
        padBody.PaddingTop = _UD(0, 12) padBody.PaddingBottom = _UD(0, 12)
        padBody.PaddingLeft = _UD(0, 12) padBody.PaddingRight = _UD(0, 12)
        local bodyLayout = _I(string.char(85,73,76,105,115,116,76,97,121,111,117,116), cardBody)
        bodyLayout.Padding = _UD(0, 12) bodyLayout.SortOrder = Enum.SortOrder.LayoutOrder
        local textoCard = _I(string.char(84,101,120,116,76,97,98,101,108), cardBody)
        textoCard.Size = _U2(1, 0, 0, 0)
        textoCard.AutomaticSize = Enum.AutomaticSize.Y
        textoCard.BackgroundTransparency = 1
        textoCard.Text = tema.Texto textoCard.TextColor3 = C.TextoDim
        textoCard.Font = _GM textoCard.TextSize = 11
        textoCard.TextXAlignment = _XL textoCard.TextWrapped = true
        textoCard.LineHeight = 1.2
        local btnContainer = _I(string.char(70,114,97,109,101), cardBody)
        btnContainer.Size = _U2(1, 0, 0, 28)
        btnContainer.BackgroundTransparency = 1
        local btnCopiar = _I(string.char(84,101,120,116,66,117,116,116,111,110), btnContainer)
        btnCopiar.Size = _UO(75, 28) btnCopiar.Position = _U2(1, 0, 0, 0)
        btnCopiar.AnchorPoint = Vector2.new(1, 0)
        btnCopiar.BackgroundColor3 = C.Verde btnCopiar.Text = string.char(67,111,112,105,97,114)
        btnCopiar.TextColor3 = C.Texto btnCopiar.Font = _GB
        btnCopiar.TextSize = 11 btnCopiar.BorderSizePixel = 0
        btnCopiar.AutoButtonColor = false Corner(btnCopiar, 6)
        btnCopiar.MouseEnter:Connect(function() btnCopiar.BackgroundColor3 = C.VerdeHover end)
        btnCopiar.MouseLeave:Connect(function() btnCopiar.BackgroundColor3 = C.Verde end)
        btnCopiar.MouseButton1Click:Connect(function()
            if setclipboard then
                pcall(setclipboard, tema.Texto)
                btnCopiar.Text = string.char(67,111,112,105,97,100,111,33)
                btnCopiar.BackgroundColor3 = C.VerdeHover
                task.wait(1.5)
                btnCopiar.Text = string.char(67,111,112,105,97,114)
                btnCopiar.BackgroundColor3 = C.Verde
            end
        end)
    end
    function ShowTextosProntos()
        CurrentPage = string.char(84,101,120,116,111,115,80,114,111,110,116,111,115)
        ClearContent()
        local header = _I(string.char(70,114,97,109,101), _CH)
        header.Size = _U2(1, 0, 0, 58)
        header.BackgroundColor3 = C.Painel
        header.BorderSizePixel = 0
        header.LayoutOrder = 0
        Corner(header, 9) Stroke(header, C.Borda, 1)
        local title = _I(string.char(84,101,120,116,76,97,98,101,108), header)
        title.BackgroundTransparency = 1
        title.Position = _UO(12, 7) title.Size = _U2(1, -24, 0, 25)
        title.Text = string.char(239,191,189,239,191,189,32,84,69,88,84,79,83,32,80,82,79,78,84,79,83,32,43,32,73,65)
        title.TextColor3 = C.Texto title.TextSize = 16
        title.Font = _GB title.TextXAlignment = _XL
        local sub = _I(string.char(84,101,120,116,76,97,98,101,108), header)
        sub.BackgroundTransparency = 1
        sub.Position = _UO(13, 34) sub.Size = _U2(1, -26, 0, 15)
        sub.Text = string.char(73,110,102,111,114,109,97,195,167,195,181,101,115,32,109,105,108,105,116,97,114,101,115,32,101,32,103,101,114,97,100,111,114,32,100,101,32,116,101,120,116,111,32,105,110,116,101,108,105,103,101,110,116,101)
        sub.TextColor3 = C.TextoDim sub.TextSize = 9
        sub.Font = _GM sub.TextXAlignment = _XL
        for i, tema in ipairs(TEXTOS) do
            local corIndex = ((i - 1) % #CARD_COLORS) + 1
            criarCard(tema, i, CARD_COLORS[corIndex])
        end
        local aiCard = _I(string.char(70,114,97,109,101), _CH)
        aiCard.Size = _U2(1, 0, 0, 0)
        aiCard.AutomaticSize = Enum.AutomaticSize.Y
        aiCard.BackgroundColor3 = _RGB(30, 30, 40)
        aiCard.BorderSizePixel = 0
        aiCard.LayoutOrder = 999
        Corner(aiCard, 8)
        Stroke(aiCard, _RGB(139, 92, 246), 1, 0.5)
        aiCard.ClipsDescendants = true
        local aiLayout = _I(string.char(85,73,76,105,115,116,76,97,121,111,117,116), aiCard)
        aiLayout.SortOrder = Enum.SortOrder.LayoutOrder
        local aiHeader = _I(string.char(70,114,97,109,101), aiCard)
        aiHeader.Size = _U2(1, 0, 0, 35)
        aiHeader.BackgroundColor3 = _RGB(139, 92, 246)
        aiHeader.BorderSizePixel = 0
        aiHeader.LayoutOrder = 1
        Corner(aiHeader, 8)
        local aiMask = _I(string.char(70,114,97,109,101), aiHeader)
        aiMask.Size = _U2(1, 0, 0.5, 0)
        aiMask.Position = _U2(0, 0.5, 0, 0)
        aiMask.BackgroundColor3 = _RGB(139, 92, 246)
        aiMask.BorderSizePixel = 0
        local aiTitle = _I(string.char(84,101,120,116,76,97,98,101,108), aiHeader)
        aiTitle.Size = _U2(1, -20, 0, 20)
        aiTitle.Position = _UO(10, 8)
        aiTitle.BackgroundTransparency = 1
        aiTitle.Text = string.char(239,191,189,239,191,189,32,71,69,82,65,68,79,82,32,68,69,32,84,69,88,84,79,32,73,65,32,40,69,66,41)
        aiTitle.TextColor3 = C.Texto
        aiTitle.Font = _GB aiTitle.TextSize = 12 aiTitle.TextXAlignment = _XL
        local aiBody = _I(string.char(70,114,97,109,101), aiCard)
        aiBody.Size = _U2(1, 0, 0, 0)
        aiBody.AutomaticSize = Enum.AutomaticSize.Y
        aiBody.BackgroundColor3 = _RGB(30, 30, 40)
        aiBody.BorderSizePixel = 0
        aiBody.LayoutOrder = 2
        local aiPad = _I(string.char(85,73,80,97,100,100,105,110,103), aiBody)
        aiPad.PaddingTop = _UD(0, 10) aiPad.PaddingBottom = _UD(0, 10)
        aiPad.PaddingLeft = _UD(0, 10) aiPad.PaddingRight = _UD(0, 10)
        local aiBodyLayout = _I(string.char(85,73,76,105,115,116,76,97,121,111,117,116), aiBody)
        aiBodyLayout.Padding = _UD(0, 10)
        aiBodyLayout.SortOrder = Enum.SortOrder.LayoutOrder
        local inputBox = _I(string.char(84,101,120,116,66,111,120), aiBody)
        inputBox.Size = _U2(1, 0, 0, 30)
        inputBox.BackgroundColor3 = C.Fundo
        inputBox.PlaceholderText = string.char(68,105,103,105,116,101,32,111,32,116,101,109,97,32,40,101,120,58,32,80,111,114,32,113,117,101,32,115,101,114,118,105,114,32,97,111,32,69,66,63,41)
        inputBox.PlaceholderColor3 = C.TextoDim
        inputBox.Text = "" inputBox.TextColor3 = C.Texto
        inputBox.Font = _GM inputBox.TextSize = 11
        inputBox.TextXAlignment = _XL inputBox.BorderSizePixel = 0
        Corner(inputBox, 6)
        local btnGerar = _I(string.char(84,101,120,116,66,117,116,116,111,110), aiBody)
        btnGerar.Size = _U2(1, 0, 0, 35)
        btnGerar.BackgroundColor3 = _RGB(139, 92, 246)
        btnGerar.Text = string.char(226,154,161,32,71,69,82,65,82,32,84,69,88,84,79)
        btnGerar.TextColor3 = C.Texto btnGerar.Font = _GB
        btnGerar.TextSize = 12 btnGerar.BorderSizePixel = 0
        btnGerar.AutoButtonColor = false Corner(btnGerar, 8)
        Stroke(btnGerar, _RGB(167, 139, 250), 1, 0.2)
        local btnGrad = _I(string.char(85,73,71,114,97,100,105,101,110,116), btnGerar)
        btnGrad.Color = ColorSequence.new(_RGB(139, 92, 246), _RGB(109, 40, 217))
        btnGrad.Rotation = 90
        btnGerar.MouseEnter:Connect(function() btnGerar.BackgroundColor3 = _RGB(167, 139, 250) end)
        btnGerar.MouseLeave:Connect(function() btnGerar.BackgroundColor3 = _RGB(139, 92, 246) end)
        local outputLabel = _I(string.char(84,101,120,116,76,97,98,101,108), aiBody)
        outputLabel.Size = _U2(1, 0, 0, 0)
        outputLabel.AutomaticSize = Enum.AutomaticSize.Y
        outputLabel.BackgroundTransparency = 1
        outputLabel.Text = string.char(65,32,114,101,115,112,111,115,116,97,32,100,97,32,73,65,32,97,112,97,114,101,99,101,114,195,161,32,97,113,117,105,46,46,46)
        outputLabel.TextColor3 = C.TextoDim outputLabel.Font = _GM
        outputLabel.TextSize = 11 outputLabel.TextXAlignment = _XL
        outputLabel.TextWrapped = true outputLabel.LineHeight = 1.2
        local aiBtnContainer = _I(string.char(70,114,97,109,101), aiBody)
        aiBtnContainer.Size = _U2(1, 0, 0, 28)
        aiBtnContainer.BackgroundTransparency = 1
        aiBtnContainer.LayoutOrder = 4
        local btnCopiarIA = _I(string.char(84,101,120,116,66,117,116,116,111,110), aiBtnContainer)
        btnCopiarIA.Size = _UO(75, 28) btnCopiarIA.Position = _U2(1, 0, 0, 0)
        btnCopiarIA.AnchorPoint = Vector2.new(1, 0)
        btnCopiarIA.BackgroundColor3 = C.Painel btnCopiarIA.Text = string.char(67,111,112,105,97,114)
        btnCopiarIA.TextColor3 = C.TextoDim btnCopiarIA.Font = _GB
        btnCopiarIA.TextSize = 11 btnCopiarIA.BorderSizePixel = 0
        btnCopiarIA.AutoButtonColor = false Corner(btnCopiarIA, 6)
        btnCopiarIA.MouseEnter:Connect(function()
            if btnCopiarIA.BackgroundColor3 == C.Verde then btnCopiarIA.BackgroundColor3 = C.VerdeHover end
        end)
        btnCopiarIA.MouseLeave:Connect(function()
            if btnCopiarIA.BackgroundColor3 == C.VerdeHover then btnCopiarIA.BackgroundColor3 = C.Verde end
        end)
        local textoAtual = nil
        btnGerar.MouseButton1Click:Connect(function()
            local temaDigitado = inputBox.Text
            if temaDigitado == "" then
                outputLabel.Text = string.char(226,154,160,239,184,143,32,80,111,114,32,102,97,118,111,114,44,32,100,105,103,105,116,101,32,117,109,32,116,101,109,97,32,112,114,105,109,101,105,114,111,46)
                outputLabel.TextColor3 = _RGB(245, 158, 11)
                return
            end
            outputLabel.Text = string.char(226,143,179,32,71,101,114,97,110,100,111,32,116,101,120,116,111,46,46,46,32,97,103,117,97,114,100,101,46)
            outputLabel.TextColor3 = _RGB(245, 158, 11)
            btnCopiarIA.BackgroundColor3 = C.Painel
            btnCopiarIA.TextColor3 = C.TextoDim
            textoAtual = nil
            task.spawn(function()
                local textoGerado, erro = GerarTextoIA(temaDigitado)
                if textoGerado then
                    textoAtual = textoGerado
                    outputLabel.Text = textoGerado
                    outputLabel.TextColor3 = C.Texto
                    btnCopiarIA.BackgroundColor3 = C.Verde
                    btnCopiarIA.TextColor3 = C.Texto
                else
                    outputLabel.Text = string.char(226,157,140,32,69,114,114,111,58,32) .. tostring(erro)
                    outputLabel.TextColor3 = _RGB(239, 68, 68)
                end
            end)
        end)
        btnCopiarIA.MouseButton1Click:Connect(function()
            if not textoAtual then return end
            if setclipboard then
                pcall(setclipboard, textoAtual)
                btnCopiarIA.Text = string.char(67,111,112,105,97,100,111,33)
                btnCopiarIA.BackgroundColor3 = C.VerdeHover
                task.wait(1.5)
                btnCopiarIA.Text = string.char(67,111,112,105,97,114)
                btnCopiarIA.BackgroundColor3 = C.Verde
            end
        end)
        Content.CanvasPosition = _V2()
    end
end

-- =========================================================================
-- COMBATE — Aim (só mira) + Hitbox nos outros
-- =========================================================================
local Cam = workspace.CurrentCamera

local AIM_CONFIG = {
    Ativo=false, MostrarFOV=false, FOV=43, RingTransparency=0.3,
    Cor=Color3.fromRGB(150,80,255), Thickness=2,
    OffsetX=0, OffsetY=-47, ParteAlvo=string.char(67,97,98,101,195,167,97)
}
local HB_CONFIG = {
    Ativo=false, Visual=true, Tamanho=2, Transparencia=0.5,
    Cor=_RGB(255,0,0), Material=string.char(78,101,111,110)
}
local HB_Original = {}
local HB_Tok = os.clock()
PG:SetAttribute(string.char(90,75,89,72,105,116,98,111,120), HB_Tok)

local AimFOVring
pcall(function()
    AimFOVring = Drawing.new(string.char(67,105,114,99,108,101))
    AimFOVring.Visible=false
    AimFOVring.Thickness=AIM_CONFIG.Thickness
    AimFOVring.Color=AIM_CONFIG.Cor
    AimFOVring.Filled=false
    AimFOVring.Radius=AIM_CONFIG.FOV
end)

local function AIM_getCentro()
    return Vector2.new(
        Cam.ViewportSize.X/2 + AIM_CONFIG.OffsetX,
        Cam.ViewportSize.Y/2 + AIM_CONFIG.OffsetY
    )
end
local function AIM_pegarTronco(char)
    if not char then return nil end
    return char:FindFirstChild(string.char(84,111,114,115,111))
        or char:FindFirstChild(string.char(85,112,112,101,114,84,111,114,115,111))
        or char:FindFirstChild(string.char(76,111,119,101,114,84,111,114,115,111))
        or char:FindFirstChild(string.char(72,101,97,100))
end
local function AIM_pegarParteAlvo(char)
    if not char then return nil end
    if AIM_CONFIG.ParteAlvo==string.char(67,97,98,101,195,167,97) then
        return char:FindFirstChild(string.char(72,101,97,100)) or char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
    elseif AIM_CONFIG.ParteAlvo==string.char(84,114,111,110,99,111) then
        return AIM_pegarTronco(char)
    end
    return char:FindFirstChild(string.char(72,101,97,100))
end
local function AIM_getClosest()
    local nearest,last = nil, math.huge
    local centro = AIM_getCentro()
    for _,p in ipairs(P:GetPlayers()) do
        if p ~= Pl then
            local part = AIM_pegarParteAlvo(p.Character)
            if part then
                local ePos,vis = Cam:WorldToViewportPoint(part.Position)
                if vis then
                    local d = (Vector2.new(ePos.X,ePos.Y) - centro).Magnitude
                    if d < last and d <= AIM_CONFIG.FOV then
                        last = d
                        nearest = p
                    end
                end
            end
        end
    end
    return nearest
end
local function AIM_lookAtComOffset(target)
    local camPos = Cam.CFrame.Position
    local dirAlvo = (target - camPos).Unit
    local fovRad = math.rad(Cam.FieldOfView)
    local vx, vy = Cam.ViewportSize.X, Cam.ViewportSize.Y
    local offX = -math.atan((AIM_CONFIG.OffsetX/vx)*2*math.tan(fovRad/2))
    local offY = math.atan((AIM_CONFIG.OffsetY/vy)*2*math.tan(fovRad/2))
    local cf = CFrame.new(camPos, camPos + dirAlvo)
    cf = cf * CFrame.Angles(offY, offX, 0)
    Cam.CFrame = cf
end

R.RenderStepped:Connect(function()
    if AimFOVring then
        AimFOVring.Visible = AIM_CONFIG.MostrarFOV or AIM_CONFIG.Ativo
        AimFOVring.Radius = AIM_CONFIG.FOV
        AimFOVring.Color = AIM_CONFIG.Cor
        AimFOVring.Thickness = AIM_CONFIG.Thickness
        AimFOVring.Position = AIM_getCentro()
        AimFOVring.Transparency = AIM_CONFIG.RingTransparency
    end
    if not AIM_CONFIG.Ativo then return end
    local closest = AIM_getClosest()
    if closest then
        local part = AIM_pegarParteAlvo(closest.Character)
        if part then AIM_lookAtComOffset(part.Position) end
    end
end)

local function HB_Salvar(char)
    if HB_Original[char] then return end
    local hrp = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
    if not hrp then return end
    HB_Original[char] = {Size=hrp.Size, Transparency=hrp.Transparency,
        Color=hrp.Color, Material=hrp.Material, CanCollide=hrp.CanCollide}
end
local function HB_Aplicar(char)
    if not char then return end
    if char == character then return end
    local hrp = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
    if not hrp then return end
    HB_Salvar(char)
    pcall(function()
        hrp.Size = Vector3.new(HB_CONFIG.Tamanho,HB_CONFIG.Tamanho,HB_CONFIG.Tamanho)
        hrp.Transparency = HB_CONFIG.Visual and HB_CONFIG.Transparencia or 1
        hrp.Color = HB_CONFIG.Cor
        hrp.Material = Enum.Material.Neon
        hrp.CanCollide = false
    end)
end
local function HB_Restaurar(char)
    if not char then return end
    local orig = HB_Original[char]
    if not orig then return end
    local hrp = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
    if hrp then
        pcall(function()
            hrp.Size = orig.Size hrp.Transparency = orig.Transparency
            hrp.Color = orig.Color hrp.Material = orig.Material
            hrp.CanCollide = orig.CanCollide
        end)
    end
    HB_Original[char] = nil
end

local HB_Conn
HB_Conn = R.Heartbeat:Connect(function()
    if PG:GetAttribute(string.char(90,75,89,72,105,116,98,111,120)) ~= HB_Tok then
        HB_Conn:Disconnect()
        for c in pairs(HB_Original) do HB_Restaurar(c) end
        return
    end
    if HB_CONFIG.Ativo then
        for _,p in ipairs(P:GetPlayers()) do
            if p ~= Pl and p.Character and p.Character.Parent then
                HB_Aplicar(p.Character)
            end
        end
        for char in pairs(HB_Original) do
            if not char.Parent then HB_Restaurar(char) end
        end
    else
        for char in pairs(HB_Original) do HB_Restaurar(char) end
    end
end)

function ShowCombate()
    CurrentPage = string.char(67,111,109,98,97,116,101)
    ClearContent()
    Content.ScrollingEnabled = true

    local col1, col2 = CreateTwoColumns(_CH, 0)

    local hbCard = UI.Card(col1, 1, string.char(239,191,189,239,191,189,32,72,105,116,98,111,120,32,77,111,100,105,102,105,99,97,100,111,114))
    UI.Toggle(hbCard, 1, string.char(65,116,105,118,97,114,32,72,105,116,98,111,120), HB_CONFIG.Ativo, function(v)
        HB_CONFIG.Ativo = v
        Notify(string.char(72,73,84,66,79,88), v and string.char(65,116,105,118,97,100,111,46) or string.char(68,101,115,97,116,105,118,97,100,111,46), v and string.char(83,117,99,99,101,115,115) or string.char(69,114,114,111,114))
    end)
    UI.Slider(hbCard, 2, string.char(84,97,109,97,110,104,111), HB_CONFIG.Tamanho, 1, 20, false, function(v) HB_CONFIG.Tamanho = v end)
    UI.Slider(hbCard, 3, string.char(84,114,97,110,115,112,97,114,195,170,110,99,105,97), math.floor(HB_CONFIG.Transparencia*10+.5), 0, 10, false,
        function(v) HB_CONFIG.Transparencia = v/10 end)

    local corRow = _I(string.char(70,114,97,109,101), hbCard)
    corRow.Size = _U2(1,0,0,26)
    corRow.BackgroundTransparency = 1
    corRow.LayoutOrder = 4
    local corLbl = _I(string.char(84,101,120,116,76,97,98,101,108), corRow)
    corLbl.BackgroundTransparency = 1
    corLbl.Size = _U2(1,-90,1,0)
    corLbl.Text = string.char(67,111,114,32,100,97,32,72,105,116,98,111,120)
    corLbl.TextColor3 = _K.Gray
    corLbl.Font = _GM
    corLbl.TextSize = 10
    corLbl.TextXAlignment = _XL
    local corHelp = UI.Help(corRow)
    corHelp.AnchorPoint = _V2(1,.5)
    corHelp.Position = _U2(1,-40,.5,0)
    local corSwatch = _I(string.char(84,101,120,116,66,117,116,116,111,110), corRow)
    corSwatch.AnchorPoint = _V2(1,.5)
    corSwatch.Position = _U2(1,0,.5,0)
    corSwatch.Size = _UO(34,18)
    corSwatch.BackgroundColor3 = HB_CONFIG.Cor
    corSwatch.BorderSizePixel = 0
    corSwatch.Text = ""
    corSwatch.AutoButtonColor = false
    Corner(corSwatch, 4) Stroke(corSwatch, _K.Stroke, 1)

    local HB_Presets = {
        _RGB(255,0,0), _RGB(0,255,100), _RGB(0,150,255),
        _RGB(255,200,0), _RGB(255,0,255), _RGB(150,80,255),
        _RGB(255,255,255), _RGB(0,0,0)
    }
    local presetFrame = _I(string.char(70,114,97,109,101), hbCard)
    presetFrame.Size = _U2(1,0,0,18)
    presetFrame.BackgroundTransparency = 1
    presetFrame.LayoutOrder = 5
    local presetList = _I(string.char(85,73,76,105,115,116,76,97,121,111,117,116), presetFrame)
    presetList.FillDirection = Enum.FillDirection.Horizontal
    presetList.Padding = _UD(0,4)
    presetList.Parent = presetFrame
    for _,cor in ipairs(HB_Presets) do
        local b = _I(string.char(84,101,120,116,66,117,116,116,111,110), presetFrame)
        b.Size = _UO(16,16)
        b.BackgroundColor3 = cor
        b.BorderSizePixel = 0
        b.Text = ""
        b.AutoButtonColor = false
        Corner(b,4) Stroke(b,_K.Stroke,1)
        b.MouseButton1Click:Connect(function()
            HB_CONFIG.Cor = cor
            corSwatch.BackgroundColor3 = cor
        end)
    end

    local aimCard = UI.Card(col2, 1, string.char(239,191,189,239,191,189,32,65,105,109))
    UI.Toggle(aimCard, 1, string.char(65,116,105,118,97,114,32,65,105,109,98,111,116), AIM_CONFIG.Ativo, function(v)
        AIM_CONFIG.Ativo = v
    end)
    UI.Toggle(aimCard, 2, string.char(77,111,115,116,114,97,114,32,70,79,86), AIM_CONFIG.MostrarFOV, function(v)
        AIM_CONFIG.MostrarFOV = v
    end)

    local alvoWrap = _I(string.char(70,114,97,109,101), aimCard)
    alvoWrap.Size = _U2(1,0,0,44)
    alvoWrap.BackgroundTransparency = 1
    alvoWrap.LayoutOrder = 3

    local alvoLbl = _I(string.char(84,101,120,116,76,97,98,101,108), alvoWrap)
    alvoLbl.BackgroundTransparency = 1
    alvoLbl.Position = _UO(0,0)
    alvoLbl.Size = _U2(1,-20,0,14)
    alvoLbl.Text = string.char(80,97,114,116,101,32,100,111,32,65,108,118,111)
    alvoLbl.TextColor3 = _K.Gray
    alvoLbl.Font = _GM
    alvoLbl.TextSize = 10
    alvoLbl.TextXAlignment = _XL

    local btnFrame = _I(string.char(70,114,97,109,101), alvoWrap)
    btnFrame.Position = _UO(0,20)
    btnFrame.Size = _U2(1,0,0,24)
    btnFrame.BackgroundTransparency = 1
    local bfl = _I(string.char(85,73,76,105,115,116,76,97,121,111,117,116), btnFrame)
    bfl.FillDirection = Enum.FillDirection.Horizontal
    bfl.Padding = _UD(0,4)
    bfl.Parent = btnFrame

    local opcoes = {string.char(67,97,98,101,195,167,97),string.char(84,114,111,110,99,111)}
    local btnAlvos = {}
    local function atualizarAlvos()
        for _,item in ipairs(btnAlvos) do
            if item.Nome == AIM_CONFIG.ParteAlvo then
                item.Btn.BackgroundColor3 = _RGB(60,40,110)
                item.Btn.TextColor3 = _K.PurpleLight
                item.Stroke.Color = _K.Purple
            else
                item.Btn.BackgroundColor3 = _RGB(30,30,40)
                item.Btn.TextColor3 = _K.Gray
                item.Stroke.Color = _K.Stroke
            end
        end
    end
    for _,nome in ipairs(opcoes) do
        local b = _I(string.char(84,101,120,116,66,117,116,116,111,110), btnFrame)
        b.Size = _U2(0.5,-2,1,0)
        b.BackgroundColor3 = _RGB(30,30,40)
        b.Text = nome
        b.TextColor3 = _K.Gray
        b.Font = _GB
        b.TextSize = 10
        b.BorderSizePixel = 0
        b.AutoButtonColor = false
        Corner(b,6)
        local s = Stroke(b,_K.Stroke,1)
        table.insert(btnAlvos,{Btn=b,Nome=nome,Stroke=s})
        b.MouseButton1Click:Connect(function()
            AIM_CONFIG.ParteAlvo = nome
            atualizarAlvos()
        end)
    end
    atualizarAlvos()

    UI.Slider(aimCard, 4, string.char(84,97,109,97,110,104,111,32,70,79,86), AIM_CONFIG.FOV, 20, 200, false,
        function(v) AIM_CONFIG.FOV = v end)
    UI.Slider(aimCard, 5, string.char(84,114,97,110,115,112,97,114,195,170,110,99,105,97), AIM_CONFIG.RingTransparency, 0, 1, true,
        function(v) AIM_CONFIG.RingTransparency = v end)

    local coresWrap = _I(string.char(70,114,97,109,101), aimCard)
    coresWrap.Size = _U2(1,0,0,34)
    coresWrap.BackgroundTransparency = 1
    coresWrap.LayoutOrder = 6

    local coresLbl = _I(string.char(84,101,120,116,76,97,98,101,108), coresWrap)
    coresLbl.BackgroundTransparency = 1
    coresLbl.Position = _UO(0,0)
    coresLbl.Size = _U2(1,0,0,14)
    coresLbl.Text = string.char(67,111,114,32,100,111,32,70,79,86)
    coresLbl.TextColor3 = _K.Gray
    coresLbl.Font = _GM
    coresLbl.TextSize = 10
    coresLbl.TextXAlignment = _XL

    local coresInner = _I(string.char(70,114,97,109,101), coresWrap)
    coresInner.Position = _UO(0,18)
    coresInner.Size = _U2(1,0,0,16)
    coresInner.BackgroundTransparency = 1
    local cil = _I(string.char(85,73,76,105,115,116,76,97,121,111,117,116), coresInner)
    cil.FillDirection = Enum.FillDirection.Horizontal
    cil.Padding = _UD(0,4)
    cil.Parent = coresInner
    local coresLista = {
        _RGB(150,80,255),_RGB(255,0,0),_RGB(0,255,100),
        _RGB(255,200,0),_RGB(0,200,255),_RGB(255,0,255),_RGB(255,255,255)
    }
    for _,cor in ipairs(coresLista) do
        local b = _I(string.char(84,101,120,116,66,117,116,116,111,110), coresInner)
        b.Size = _UO(16,16)
        b.BackgroundColor3 = cor
        b.BorderSizePixel = 0
        b.Text = ""
        b.AutoButtonColor = false
        Corner(b,4) Stroke(b,_K.Stroke,1)
        b.MouseButton1Click:Connect(function() AIM_CONFIG.Cor = cor end)
    end

    Content.CanvasPosition = _V2()
end

-- =========================================================================
-- LOJA
-- =========================================================================
local ShowLoja
do
    local AC={Fundo=_RGB(10,10,14),Card=_RGB(20,20,28),Borda=_RGB(0,220,255),
        Texto=_RGB(240,240,250),Verde=_RGB(0,190,110),Vermelho=_RGB(220,50,70),
        Amarelo=_RGB(255,200,0),Cinza=_RGB(80,80,95)}
    local tok=os.clock()
    PG:SetAttribute(string.char(90,75,89,65,114,109),tok)
    local function vivo() return PG:GetAttribute(string.char(90,75,89,65,114,109))==tok end
    local function ehVerde(c)
        if not c then return false end
        return c.G>0.2 and c.G>c.R*1.1 and c.G>c.B*1.1
    end
    local function limpar(obj)
        if not obj or not obj.Parent then return end
        if obj:IsA(string.char(70,114,97,109,101)) then
            local area=obj.AbsoluteSize.X*obj.AbsoluteSize.Y
            if ehVerde(obj.BackgroundColor3) or obj.BackgroundColor3==_RGB(0,0,0) then
                obj.BackgroundColor3=area>30000 and AC.Fundo or AC.Card
            end
            if area>5000 then
                if not obj:FindFirstChildOfClass(string.char(85,73,67,111,114,110,101,114)) then
                    _I(string.char(85,73,67,111,114,110,101,114),obj).CornerRadius=_UD(0,10)
                end
                local s=obj:FindFirstChildOfClass(string.char(85,73,83,116,114,111,107,101))
                if not s then s=_I(string.char(85,73,83,116,114,111,107,101),obj) end
                if ehVerde(s.Color) or s.Transparency>0.5 then
                    s.Color=AC.Borda s.Thickness=1 s.Transparency=0.4
                end
            end
        elseif obj:IsA(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101)) then
            obj.BorderSizePixel=0 obj.ScrollBarImageColor3=AC.Borda
            if ehVerde(obj.BackgroundColor3) then obj.BackgroundColor3=AC.Fundo end
        elseif obj:IsA(string.char(84,101,120,116,76,97,98,101,108)) then
            if ehVerde(obj.TextColor3) then obj.TextColor3=AC.Texto end
        elseif obj:IsA(string.char(84,101,120,116,66,117,116,116,111,110)) then
            if ehVerde(obj.BackgroundColor3) then obj.BackgroundColor3=AC.Verde end
            if ehVerde(obj.TextColor3) then obj.TextColor3=Color3.new(1,1,1) end
            if not obj:FindFirstChildOfClass(string.char(85,73,67,111,114,110,101,114)) then
                _I(string.char(85,73,67,111,114,110,101,114),obj).CornerRadius=_UD(0,6)
            end
        elseif obj:IsA(string.char(73,109,97,103,101,76,97,98,101,108)) or obj:IsA(string.char(73,109,97,103,101,66,117,116,116,111,110)) then
            if ehVerde(obj.BackgroundColor3) then obj.BackgroundColor3=AC.Card end
        end
    end
    local function aplicarTema(gui)
        if not gui or not gui.Parent then return end
        for _,obj in ipairs(gui:GetDescendants()) do pcall(limpar,obj) end
        if not gui:FindFirstChild(string.char(65,107,105,114,97,77,97,114,107)) then
            local m=_I(string.char(84,101,120,116,76,97,98,101,108),gui)
            m.Name=string.char(65,107,105,114,97,77,97,114,107) m.Size=_U2(1,-20,0,16)
            m.Position=_U2(0,10,1,-18) m.BackgroundTransparency=1
            m.Text=string.char(226,154,161,32,98,121,32,65,107,105,114,97) m.TextColor3=AC.Borda m.Font=_GB
            m.TextSize=11 m.ZIndex=200
        end
    end
    local function acharGui(nome)
        for _,g in ipairs(PG:GetChildren()) do
            if g:IsA(string.char(83,99,114,101,101,110,71,117,105)) and g.Name==nome then return g end
        end
        for _,g in ipairs(PG:GetDescendants()) do
            if g:IsA(string.char(83,99,114,101,101,110,71,117,105)) and g.Name==nome then return g end
        end
    end
    local monitoradas={}
    local function obter(nome)
        local g=monitoradas[nome]
        if g and g.Parent then return g end
        return acharGui(nome)
    end
    task.spawn(function()
        while vivo() do
            task.wait(0.5)
            local g=obter(string.char(71,117,110,83,104,111,112,71,117,105))
            if g and g~=monitoradas.GunShopGui then
                monitoradas.GunShopGui=g
                g:GetPropertyChangedSignal(string.char(69,110,97,98,108,101,100)):Connect(function()
                    if g.Enabled then task.wait(0.15) aplicarTema(g) end
                end)
            end
        end
    end)
    task.spawn(function()
        while vivo() do
            task.wait(0.8)
            local g=obter(string.char(71,117,110,83,104,111,112,71,117,105))
            if g and g.Enabled then pcall(aplicarTema,g) end
        end
    end)
    local function abrirLoja()
        local g=obter(string.char(71,117,110,83,104,111,112,71,117,105))
        if not g then Notify(string.char(69,82,82,79),string.char(76,111,106,97,32,100,101,32,97,114,109,97,115,32,110,195,163,111,32,101,110,99,111,110,116,114,97,100,97,32,110,111,32,106,111,103,111,46),string.char(69,114,114,111,114)) return end
        g.Enabled=true task.wait(0.15) aplicarTema(g)
    end
    ShowLoja=function()
        CurrentPage=string.char(76,111,106,97)
        ClearContent()
        local card = UI.Card(_CH, 0, string.char(239,191,189,239,191,189,32,76,111,106,97,32,100,101,32,65,114,109,97,115))
        local lbl = _I(string.char(84,101,120,116,76,97,98,101,108), card)
        lbl.Size = _U2(1,0,0,40)
        lbl.BackgroundTransparency = 1
        lbl.Text = string.char(65,98,114,101,32,97,32,108,111,106,97,32,100,101,32,97,114,109,97,115,32,100,111,32,106,111,103,111,32,99,111,109,32,118,105,115,117,97,108,32,100,97,114,107,46)
        lbl.TextColor3 = _K.Gray
        lbl.Font = _GM
        lbl.TextSize = 10
        lbl.TextWrapped = true
        lbl.TextXAlignment = _XL
        lbl.TextYAlignment = Enum.TextYAlignment.Top
        lbl.LayoutOrder = 1
        UI.ActionButton(card, 2, string.char(226,150,182,32,65,98,114,105,114,32,76,111,106,97), _RGB(30,30,40), abrirLoja)
        Content.CanvasPosition=_V2()
    end
end

-- =========================================================================
-- SELEÇÃO DE ABA
-- =========================================================================
local function SelectButton(b)
    if selectedButton then
        selectedButton.BackgroundColor3=_K.Card
        selectedButton.TextColor3=_K.Gray
    end
    selectedButton=b
    b.BackgroundColor3=_K.Selected
    b.TextColor3=_K.White
end

ebDeltaButton.MouseButton1Click:Connect(function()
    SelectButton(ebDeltaButton) ShowEBDelta()
end)
taffsButton.MouseButton1Click:Connect(function()
    SelectButton(taffsButton) ShowTAFFS()
end)
volversButton.MouseButton1Click:Connect(function()
    SelectButton(volversButton) ShowVolvers()
end)
iaButton.MouseButton1Click:Connect(function()
    SelectButton(iaButton) ShowAutoCorrecao()
end)
combateButton.MouseButton1Click:Connect(function()
    SelectButton(combateButton) ShowCombate()
end)
textosButton.MouseButton1Click:Connect(function()
    SelectButton(textosButton) ShowTextosProntos()
end)
creditosButton.MouseButton1Click:Connect(function()
    SelectButton(creditosButton) ShowCreditos()
end)
lojaButton.MouseButton1Click:Connect(function()
    SelectButton(lojaButton) ShowLoja()
end)

-- =========================================================================
-- ARRASTAR LOGO / MENU
-- =========================================================================
local LogoDragging=false
local LogoDragStart,LogoStartPosition
Logo.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        LogoDragging=true LogoDragStart=i.Position LogoStartPosition=Logo.Position
        i.Changed:Connect(function()
            if i.UserInputState==Enum.UserInputState.End then LogoDragging=false end
        end)
    end
end)
U.InputChanged:Connect(function(i)
    if LogoDragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
        local d=i.Position-LogoDragStart
        Logo.Position=_U2(LogoStartPosition.X.Scale,LogoStartPosition.X.Offset+d.X,
            LogoStartPosition.Y.Scale,LogoStartPosition.Y.Offset+d.Y)
    end
end)

local MainDragging=false
local MainDragStart,MainStartPosition
Header.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
        MainDragging=true MainDragStart=i.Position MainStartPosition=Main.Position
        i.Changed:Connect(function()
            if i.UserInputState==Enum.UserInputState.End then MainDragging=false end
        end)
    end
end)
U.InputChanged:Connect(function(i)
    if MainDragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
        local d=i.Position-MainDragStart
        Main.Position=_U2(MainStartPosition.X.Scale,MainStartPosition.X.Offset+d.X,
            MainStartPosition.Y.Scale,MainStartPosition.Y.Offset+d.Y)
    end
end)

local Opened=false
local function OpenMenu()
    if Opened then return end
    Opened=true Main.Visible=true
    Main.Size=UDim2.fromScale(.25,.15) Main.BackgroundTransparency=1
    T:Create(Main,TweenInfo.new(.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
        {Size=UDim2.fromScale(.78,.65),BackgroundTransparency=0}):Play()
end
local function CloseMenu()
    if not Opened then return end
    Opened=false
    local tw=T:Create(Main,TweenInfo.new(.25,Enum.EasingStyle.Quart,Enum.EasingDirection.In),
        {Size=UDim2.fromScale(.25,.15),BackgroundTransparency=1})
    tw:Play()
    tw.Completed:Wait()
    if not Opened then Main.Visible=false end
end
Logo.MouseButton1Click:Connect(function()
    if Opened then CloseMenu() else OpenMenu() end
end)
Close.MouseButton1Click:Connect(CloseMenu)

-- =========================================================================
-- CARREGAR ROTAS
-- =========================================================================
task.defer(function()
    local loaded=0
    for _,cat in ipairs(CategoryOrder) do
        if LoadCategory(cat) then loaded+=1 end
    end
    local lt1=LoadTowerRoute(string.char(84,111,114,114,101,32,49),string.char(195,154,110,105,99,97))
    local lt2=0
    for _,rn in ipairs(Tower2RouteOrder) do
        if LoadTowerRoute(string.char(84,111,114,114,101,32,50),rn) then lt2+=1 end
    end
    ShowEBDelta()
    Notify(string.char(90,75,89,32,80,65,82,75,79,85,82),loaded..string.char(47,52,32,112,97,114,107,111,117,114,115,32,226,128,162,32,84,111,114,114,101,32,49,58,32)..(lt1 and string.char(79,75) or string.char(69,82,82,79))..string.char(32,226,128,162,32,84,111,114,114,101,32,50,58,32)..lt2..string.char(47,52),
        loaded==4 and lt1 and lt2==4 and string.char(83,117,99,99,101,115,115) or string.char(69,114,114,111,114))
end)

print(string.char(65,75,73,82,65,32,77,69,78,85,32,86,50,46,50,46,49,32,99,97,114,114,101,103,97,100,111,32,99,111,109,32,115,117,99,101,115,115,111,33))