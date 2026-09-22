_G.ZKY_OK = false
do
    local KEY_CORRETA = "Akira007"
    local LINK_DISCORD = "https://discord.gg/NY2RfC7Kx"
    local gui = Instance.new("ScreenGui")
    gui.Name = "ZKYKey"
    gui.ResetOnSpawn = false
    pcall(function() gui.Parent = (gethui and gethui()) or game:GetService("CoreGui") end)
    if not gui.Parent then
        gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    end
    local f = Instance.new("Frame", gui)
    f.Size = UDim2.new(0, 280, 0, 220)
    f.Position = UDim2.new(0.5, -140, 0.5, -110)
    f.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 10)
    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1, 0, 0, 36)
    t.BackgroundTransparency = 1
    t.Text = "EB DELTA — KEY"
    t.TextColor3 = Color3.new(1, 1, 1)
    t.Font = Enum.Font.GothamBold
    t.TextSize = 16
    local box = Instance.new("TextBox", f)
    box.Size = UDim2.new(1, -30, 0, 34)
    box.Position = UDim2.new(0, 15, 0, 42)
    box.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    box.TextColor3 = Color3.new(1, 1, 1)
    box.PlaceholderText = "Cole a key aqui"
    box.Text = ""
    box.ClearTextOnFocus = false
    box.Font = Enum.Font.Gotham
    box.TextSize = 14
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 8)
    local aviso = Instance.new("TextLabel", f)
    aviso.Size = UDim2.new(1, -30, 0, 40)
    aviso.Position = UDim2.new(0, 15, 0, 84)
    aviso.BackgroundTransparency = 1
    aviso.Text = "Pra pegar a key, entre no Discord"
    aviso.TextColor3 = Color3.fromRGB(180, 180, 180)
    aviso.Font = Enum.Font.Gotham
    aviso.TextSize = 12
    aviso.TextWrapped = true
    local bPegar = Instance.new("TextButton", f)
    bPegar.Size = UDim2.new(1, -30, 0, 34)
    bPegar.Position = UDim2.new(0, 15, 0, 128)
    bPegar.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    bPegar.Text = "Pegar Key"
    bPegar.TextColor3 = Color3.new(1, 1, 1)
    bPegar.Font = Enum.Font.GothamBold
    bPegar.TextSize = 14
    Instance.new("UICorner", bPegar).CornerRadius = UDim.new(0, 8)
    local bChk = Instance.new("TextButton", f)
    bChk.Size = UDim2.new(1, -30, 0, 34)
    bChk.Position = UDim2.new(0, 15, 0, 168)
    bChk.BackgroundColor3 = Color3.fromRGB(50, 170, 90)
    bChk.Text = "Check Key"
    bChk.TextColor3 = Color3.new(1, 1, 1)
    bChk.Font = Enum.Font.GothamBold
    bChk.TextSize = 14
    Instance.new("UICorner", bChk).CornerRadius = UDim.new(0, 8)
    local st = Instance.new("TextLabel", f)
    st.Size = UDim2.new(1, -20, 0, 18)
    st.Position = UDim2.new(0, 10, 1, -20)
    st.BackgroundTransparency = 1
    st.Text = ""
    st.TextColor3 = Color3.fromRGB(200, 200, 200)
    st.Font = Enum.Font.Gotham
    st.TextSize = 11
    bPegar.MouseButton1Click:Connect(function()
        pcall(function() setclipboard(LINK_DISCORD) end)
        pcall(function() game:GetService("GuiService"):OpenBrowserWindow(LINK_DISCORD) end)
        st.Text = "Link do Discord copiado!"
    end)
    bChk.MouseButton1Click:Connect(function()
        local digitada = box.Text:gsub("%s", "")
        if digitada:lower() == KEY_CORRETA:lower() then
            _G.ZKY_OK = true
            gui:Destroy()
        else
            st.Text = "Key inválida."
        end
    end)
end
repeat task.wait() until _G.ZKY_OK

-- ==========================================================
-- INÍCIO DO SCRIPT PRINCIPAL — ESTRUTURA REORGANIZADA
-- ==========================================================

local _I,_U2,_UO,_UD,_RGB,_V2,_GB,_GM,_XL,_XC = Instance.new,UDim2.new,UDim2.fromOffset,UDim.new,Color3.fromRGB,Vector2.new,Enum.Font.GothamBold,Enum.Font.GothamMedium,Enum.TextXAlignment.Left,Enum.TextXAlignment.Center
local P = game:GetService("Players")
local T = game:GetService("TweenService")
local U = game:GetService("UserInputService")
local R = game:GetService("RunService")
local HS = game:GetService("HttpService")
local TCS = game:GetService("TextChatService")
local Pl = P.LocalPlayer
local PG = Pl:WaitForChild("PlayerGui")
local character, humanoid, rootPart

-- ==========================================================
-- CONFIGURAÇÕES GERAIS
-- ==========================================================
local CONFIG = {
    LineThickness = .15,
    LineTransparency = .2,
    LineColor = _RGB(255, 145, 45),
    JumpCooldown = .28,
    PlaybackSpeed = 1,
    WalkToSpeed = 16,
    GroundOffset = 1.66
}

-- MODO DE EXECUÇÃO GLOBAL — COMPARTILHADO ENTRE TORRES E PARKOUR
local ExecutionMode = { Modo = "Dummy" } -- "Dummy" ou "Direto"

-- ==========================================================
-- ROTAS — PASTEBINS
-- ==========================================================
local Pastebins = {
    Lento = "https://pastebin.com/raw/M7DvRgTc",
    ["Rápido"] = "https://pastebin.com/raw/pBk8vYXE",
    ["Mais Rápido"] = "https://pastebin.com/raw/yz7gZmYr",
    ["Sem Burla"] = "https://pastebin.com/raw/N1j0iRDA"
}
local CategoryOrder = {"Lento", "Rápido", "Mais Rápido", "Sem Burla"}

local TowerPastebins = {
    ["Torres"] = {
        ["Única"] = "https://pastebin.com/raw/HxXb4Mr3"
    },
    ["Torre 2"] = {
        Frente = "https://pastebin.com/raw/Y2arCYHb",
        ["Atrás"] = "https://pastebin.com/raw/rXxZX7CQ",
        Esquerda = "https://pastebin.com/raw/FtpTHhGt",
        Direita = "https://pastebin.com/raw/4u5Wjtkg"
    }
}
local Tower2RouteOrder = {"Frente", "Atrás", "Esquerda", "Direita"}

local routes = {Lento = {}, ["Rápido"] = {}, ["Mais Rápido"] = {}, ["Sem Burla"] = {}}
local towerRoutes = {
    ["Torres"] = {},
    ["Torre 2"] = {Frente = {}, ["Atrás"] = {}, Esquerda = {}, Direita = {}}
}

local selectedCategory, expandedParkour = {}, {}
local selectedTower2Route = "Frente"
local expandedTower2 = false
local CurrentPage = "EB DELTA"
local lineFolder
local linesVisible = true

-- ==========================================================
-- SISTEMA DE REPRODUÇÃO
-- ==========================================================
local Playback = {
    Running = false,
    Connection = nil,
    Route = nil,
    StartClock = 0,
    CurrentIndex = 1,
    LastJump = -math.huge,
    Category = nil,
    Parkour = nil,
    Tower = nil,
    TowerRoute = nil,
    WalkingToStart = false,
    WalkConnection = nil
}
local SavedDirection = nil
local Turning = false

-- ==========================================================
-- PALETA DE CORES
-- ==========================================================
local _K = {
    Background = _RGB(18, 18, 20),
    Panel = _RGB(24, 24, 27),
    Card = _RGB(31, 31, 35),
    CardHover = _RGB(39, 39, 43),
    Selected = _RGB(55, 55, 60),
    Stroke = _RGB(65, 65, 70),
    StrokeLight = _RGB(85, 85, 90),
    White = _RGB(245, 245, 245),
    Gray = _RGB(175, 175, 180),
    DarkGray = _RGB(115, 115, 120),
    Success = _RGB(80, 210, 125),
    Error = _RGB(230, 85, 85),
    Orange = _RGB(255, 145, 45),
    SelectionRed = _RGB(225, 70, 70),
    SelectionRedDark = _RGB(75, 32, 32),
    Primary = _RGB(185, 185, 185)
}

local function Corner(o, r)
    local c = _I("UICorner")
    c.CornerRadius = _UD(0, r)
    c.Parent = o
end
local function Stroke(o, c, t)
    local s = _I("UIStroke")
    s.Color = c
    s.Thickness = t or 1
    s.Parent = o
    return s
end
local function Padding(o, t, b, l, rr)
    local p = _I("UIPadding")
    p.PaddingTop = _UD(0, t or 0)
    p.PaddingBottom = _UD(0, b or 0)
    p.PaddingLeft = _UD(0, l or 0)
    p.PaddingRight = _UD(0, rr or 0)
    p.Parent = o
end

-- ==========================================================
-- NOTIFICAÇÕES
-- ==========================================================
local NH = _I("Frame")
NH.Name = "Notifications"
NH.AnchorPoint = _V2(1, 1)
NH.Position = _U2(1, -15, 1, -15)
NH.Size = _UO(270, 300)
NH.BackgroundTransparency = 1
NH.ZIndex = 200
NH.Parent = PG
local NL = _I("UIListLayout")
NL.VerticalAlignment = Enum.VerticalAlignment.Bottom
NL.HorizontalAlignment = Enum.HorizontalAlignment.Right
NL.Padding = _UD(0, 7)
NL.Parent = NH

local function Notify(tt, msg, nt)
    local c = _K.Gray
    if nt == "Success" then c = _K.Success
    elseif nt == "Error" then c = _K.Error
    elseif nt == "Orange" then c = _K.Orange end
    local n = _I("Frame")
    n.Size = _UO(250, 64)
    n.BackgroundColor3 = _K.Panel
    n.BorderSizePixel = 0
    n.BackgroundTransparency = 1
    n.ZIndex = 201
    n.Parent = NH
    Corner(n, 10)
    local ns = Stroke(n, c)
    ns.Transparency = 1
    local a = _I("Frame")
    a.Size = _UO(3, 38)
    a.AnchorPoint = _V2(0, .5)
    a.Position = _U2(0, 7, .5, 0)
    a.BackgroundColor3 = c
    a.BorderSizePixel = 0
    a.BackgroundTransparency = 1
    a.ZIndex = 202
    a.Parent = n
    Corner(a, 5)
    local ttl = _I("TextLabel")
    ttl.BackgroundTransparency = 1
    ttl.Position = _UO(18, 9)
    ttl.Size = _U2(1, -28, 0, 18)
    ttl.Text = tt
    ttl.TextColor3 = _K.White
    ttl.TextSize = 12
    ttl.Font = _GB
    ttl.TextXAlignment = _XL
    ttl.ZIndex = 203
    ttl.Parent = n
    local msgL = _I("TextLabel")
    msgL.BackgroundTransparency = 1
    msgL.Position = _UO(18, 30)
    msgL.Size = _U2(1, -28, 0, 25)
    msgL.Text = msg
    msgL.TextColor3 = _K.Gray
    msgL.TextSize = 9
    msgL.Font = _GM
    msgL.TextWrapped = true
    msgL.TextXAlignment = _XL
    msgL.TextYAlignment = Enum.TextYAlignment.Center
    msgL.ZIndex = 203
    msgL.Parent = n
    n.Position = _U2(1, 270, 0, 0)
    T:Create(n, TweenInfo.new(.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = _U2(), BackgroundTransparency = 0}):Play()
    T:Create(ns, TweenInfo.new(.25), {Transparency = 0}):Play()
    T:Create(a, TweenInfo.new(.25), {BackgroundTransparency = 0}):Play()
    task.delay(2.8, function()
        if not n.Parent then return end
        local o = T:Create(n, TweenInfo.new(.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = _U2(1, 270), BackgroundTransparency = 1})
        o:Play()
        T:Create(ns, TweenInfo.new(.2), {Transparency = 1}):Play()
        T:Create(a, TweenInfo.new(.2), {BackgroundTransparency = 1}):Play()
        o.Completed:Wait()
        if n.Parent then n:Destroy() end
    end)
end

-- ==========================================================
-- ATUALIZAR PERSONAGEM
-- ==========================================================
local function RefreshCharacter()
    character = Pl.Character
    if not character or not character.Parent then return false end
    humanoid = character:FindFirstChildOfClass("Humanoid")
    rootPart = character:FindFirstChild("HumanoidRootPart")
    return humanoid ~= nil and rootPart ~= nil
end
Pl.CharacterAdded:Connect(function() task.wait(.2); RefreshCharacter() end)
RefreshCharacter()

local function Number(v) return v and tonumber(v) end

-- ==========================================================
-- CARREGAR E PARSEAR ROTAS
-- ==========================================================
local function ParseRoutes(raw)
    local parsed, blocks = {}, {}
    local sp = 1
    while true do
        local s = string.find(raw, "local Rota = {", sp)
        if not s then break end
        local b, e = 0
        for i = s, #raw do
            local ch = string.sub(raw, i, i)
            if ch == "{" then b = b + 1
            elseif ch == "}" then
                b = b - 1
                if b == 0 then e = i; break end
            end
        end
        if not e then break end
        table.insert(blocks, string.sub(raw, s, e))
        sp = e + 1
    end
    for _, block in ipairs(blocks) do
        local frames, fs = {}, 1
        while true do
            local p1, p2 = string.find(block, "{(.-)}", fs)
            if not p1 then break end
            local f = string.sub(block, p1, p2)
            local t = string.match(f, "t%s*=%s*([%d%.%-]+)")
            local x = string.match(f, "x%s*=%s*([%d%.%-]+)")
            local y = string.match(f, "y%s*=%s*([%d%.%-]+)")
            local z = string.match(f, "z%s*=%s*([%d%.%-]+)")
            local j = string.match(f, "j%s*=%s*([%w]+)")
            local rx = string.match(f, "rx%s*=%s*([%d%.%-]+)")
            local ry = string.match(f, "ry%s*=%s*([%d%.%-]+)")
            local rz = string.match(f, "rz%s*=%s*([%d%.%-]+)")
            if t and x and y and z then
                local q = {
                    t = Number(t), x = Number(x), y = Number(y), z = Number(z),
                    j = j == "true", position = Vector3.new(Number(x), Number(y), Number(z)),
                    rx = Number(rx), ry = Number(ry), rz = Number(rz)
                }
                if q.rx and q.ry and q.rz then
                    q.rotation = CFrame.Angles(q.rx, q.ry, q.rz)
                    q.hasRotation = true
                else
                    q.hasRotation = false
                end
                table.insert(frames, q)
            end
            fs = p2 + 1
        end
        if #frames >= 2 then
            table.sort(frames, function(a, b) return a.t < b.t end)
            table.insert(parsed, frames)
        end
    end
    return parsed
end

local function LoadCategory(cat)
    local url = Pastebins[cat]
    if not url then return false end
    local ok, raw = pcall(function() return game:HttpGet(url) end)
    if not ok or not raw then return false end
    local p = ParseRoutes(raw)
    if #p == 0 then return false end
    routes[cat] = p
    return true
end

local function LoadTowerRoute(tower, route)
    local d = TowerPastebins[tower]
    if not d then return false end
    local url = d[route]
    if not url then return false end
    local ok, raw = pcall(function() return game:HttpGet(url) end)
    if not ok or not raw then return false end
    local p = ParseRoutes(raw)
    if #p == 0 then return false end
    towerRoutes[tower][route] = p[1]
    return true
end

-- ==========================================================
-- LINHAS DA ROTA
-- ==========================================================
local function CreateLine(a, b)
    if not a or not b then return end
    local d = b - a
    local dist = d.Magnitude
    if dist < .01 then return end
    if not lineFolder then
        lineFolder = _I("Folder")
        lineFolder.Name = "ZKY_RouteLines"
        lineFolder.Parent = workspace
    end
    local l = _I("Part")
    l.Name = "RouteSegment"
    l.Anchored = true
    l.CanCollide = false
    l.CanTouch = false
    l.CanQuery = false
    l.CastShadow = false
    l.Material = Enum.Material.Neon
    l.Color = CONFIG.LineColor
    l.Transparency = linesVisible and CONFIG.LineTransparency or 1
    l.Size = Vector3.new(CONFIG.LineThickness, CONFIG.LineThickness, dist)
    l.CFrame = CFrame.lookAt((a + b) / 2, b)
    l.Parent = lineFolder
end

local function ClearLines()
    if not lineFolder then return end
    for _, o in ipairs(lineFolder:GetChildren()) do o:Destroy() end
end

local function ShowRouteLines(data)
    ClearLines()
    local last
    for _, f in ipairs(data) do
        local p = f.position
        if last then CreateLine(last, p) end
        last = p
    end
end

-- ==========================================================
-- POSIÇÃO E ROTAÇÃO
-- ==========================================================
local function GetPosition(f)
    if not f then return end
    if f.position then return f.position end
    if f.x and f.y and f.z then return Vector3.new(f.x, f.y, f.z) end
end

local function GetRotation(f)
    if not f then return end
    if f.rotation then return f.rotation end
    if f.rx and f.ry and f.rz then
        return CFrame.Angles(f.rx, f.ry, f.rz)
    end
end

local function ApplyPosition(pos, rot)
    if not pos or not RefreshCharacter() then return false end
    local corrected = pos + Vector3.new(0, CONFIG.GroundOffset, 0)
    local target
    if rot then
        target = CFrame.new(corrected) * rot
    else
        local look = rootPart.CFrame.LookVector
        local flat = Vector3.new(look.X, 0, look.Z)
        if flat.Magnitude < .01 then
            flat = Vector3.new(0, 0, -1)
        else
            flat = flat.Unit
        end
        target = CFrame.lookAt(corrected, corrected + flat)
    end
    pcall(function() character:PivotTo(target) end)
    return true
end

-- ==========================================================
-- INTERPOLAÇÃO DE FRAMES
-- ==========================================================
local function GetFrames(frames, elapsed)
    local count = #frames
    if count < 2 then return end
    if elapsed <= frames[1].t then
        Playback.CurrentIndex = 1
        return frames[1], frames[2], 0
    end
    if elapsed >= frames[count].t then
        return frames[count], frames[count], 1
    end
    local i = math.clamp(Playback.CurrentIndex, 1, count - 1)
    while i < count - 1 and elapsed > frames[i + 1].t do i = i + 1 end
    while i > 1 and elapsed < frames[i].t do i = i - 1 end
    Playback.CurrentIndex = i
    local a, b = frames[i], frames[i + 1]
    local d = b.t - a.t
    local alpha = d > 0 and math.clamp((elapsed - a.t) / d, 0, 1) or 0
    return a, b, alpha
end

local function HandleJump(f, e)
    if not f or not f.j or e - Playback.LastJump < CONFIG.JumpCooldown or not RefreshCharacter() then return end
    Playback.LastJump = e
    humanoid.Jump = true
    pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end)
end

-- ==========================================================
-- CAMINHAR ATÉ O INÍCIO DA ROTA
-- ==========================================================
local function AndarAte(destino, estaCancelado, aoTerminar)
    if not RefreshCharacter() then aoTerminar(false) return end
    if ExecutionMode.Modo == "Direto" then
        -- No modo Direto: não caminha, teletransporta suavemente
        local startPos = rootPart.Position
        local dist = (destino - startPos).Magnitude
        if dist > 2 then
            local steps = math.ceil(dist / 2)
            for i = 1, steps do
                if estaCancelado() then aoTerminar(false) return end
                local alpha = i / steps
                local interp = startPos:Lerp(destino, alpha)
                ApplyPosition(interp, nil)
                task.wait(0.03)
            end
        end
        aoTerminar(true)
        return
    end
    -- Modo Dummy: caminha normalmente
    humanoid.WalkSpeed = CONFIG.WalkToSpeed
    humanoid:MoveTo(destino)
    local started = os.clock()
    local sucesso = false
    while not estaCancelado() do
        if not RefreshCharacter() then break end
        if (rootPart.Position - destino).Magnitude <= 4 then sucesso = true break end
        if os.clock() - started > 60 then break end
        task.wait()
    end
    if RefreshCharacter() then humanoid:Move(Vector3.zero, false) end
    aoTerminar(sucesso and not estaCancelado())
end

-- ==========================================================
-- DUMMY / MARCADOR VISUAL
-- ==========================================================
local DummyObj, RemoverDummy
local function CriarDummy(pos, rot)
    RemoverDummy()
    local alvo = rot and (CFrame.new(pos) * (rot - rot.Position)) or CFrame.new(pos)
    local ok = false
    if RefreshCharacter() then
        local salvos = {}
        for _, d in ipairs(character:GetDescendants()) do
            salvos[d] = d.Archivable
            pcall(function() d.Archivable = true end)
        end
        local cok, clone = pcall(function() return character:Clone() end)
        for inst, valor in pairs(salvos) do
            pcall(function() inst.Archivable = valor end)
        end
        if cok and clone then
            for _, d in ipairs(clone:GetDescendants()) do
                if d:IsA("Script") or d:IsA("LocalScript") then pcall(function() d:Destroy() end)
                elseif d:IsA("Shirt") or d:IsA("Pants") or d:IsA("ShirtGraphic") or d:IsA("Decal") then pcall(function() d:Destroy() end)
                elseif d:IsA("BasePart") then
                    d.CanCollide = false
                    d.CanQuery = false
                    d.CanTouch = false
                    d.Massless = true
                    d.Material = Enum.Material.ForceField
                    d.Color = _RGB(0, 255, 140)
                    d.Transparency = .35
                end
            end
            local hum = clone:FindFirstChildOfClass("Humanoid")
            if hum then pcall(function() hum.WalkSpeed = 0; hum.JumpPower = 0; hum.PlatformStand = true end) end
            clone.PrimaryPart = clone.PrimaryPart or clone:FindFirstChild("HumanoidRootPart")
            if clone.PrimaryPart then
                clone.Parent = workspace
                local pok = pcall(function() clone:PivotTo(alvo) end)
                if pok then
                    for _, d in ipairs(clone:GetDescendants()) do
                        if d:IsA("BasePart") then d.Anchored = true end
                    end
                    local hl = _I("Highlight")
                    hl.FillColor = _RGB(0, 255, 140)
                    hl.OutlineColor = _RGB(150, 255, 195)
                    hl.FillTransparency = .55
                    hl.OutlineTransparency = 0
                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    hl.Parent = clone
                    clone.Name = "ZKY_Dummy"
                    DummyObj = clone
                    ok = true
                else clone:Destroy() end
            else clone:Destroy() end
        end
    end
    if not ok then
        local marcador = _I("Part")
        marcador.Name = "ZKY_Dummy"
        marcador.Shape = Enum.PartType.Cylinder
        marcador.Size = Vector3.new(.4, 6, 6)
        marcador.CFrame = alvo * CFrame.Angles(0, 0, math.rad(90))
        marcador.Color = _RGB(0, 255, 130)
        marcador.Material = Enum.Material.Neon
        marcador.Transparency = .35
        marcador.Anchored = true
        marcador.CanCollide = false
        marcador.CanQuery = false
        marcador.CanTouch = false
        marcador.Parent = workspace
        DummyObj = marcador
    end
end
RemoverDummy = function() if DummyObj then pcall(function() DummyObj:Destroy() end); DummyObj = nil end end

-- ==========================================================
-- PARAR REPRODUÇÃO
-- ==========================================================
local function StopPlayback(reason)
    if Playback.Connection then Playback.Connection:Disconnect(); Playback.Connection = nil end
    if Playback.WalkConnection then Playback.WalkConnection:Disconnect(); Playback.WalkConnection = nil end
    RemoverDummy()
    Playback.Running = false
    Playback.Route = nil
    Playback.CurrentIndex = 1
    Playback.LastJump = -math.huge
    Playback.Category = nil
    Playback.Parkour = nil
    Playback.Tower = nil
    Playback.TowerRoute = nil
    Playback.WalkingToStart = false
    if RefreshCharacter() then
        humanoid:Move(Vector3.zero, false)
        humanoid.Jump = false
        pcall(function() humanoid.AutoRotate = true end)
    end
    ClearLines()
    if reason == "completed" then
        Notify("CONCLUÍDO", "Rota finalizada!", "Success")
    elseif reason == "cancelled" then
        Notify("PARADO", "Reprodução interrompida.", "Error")
    elseif reason == "error" then
        Notify("ERRO", "Não foi possível continuar.", "Error")
    end
end

-- ==========================================================
-- EXECUÇÃO DA ROTA
-- ==========================================================
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
    Notify("EXECUTANDO", name, "Success")
    task.spawn(function()
        while Playback.Running and not Playback.WalkingToStart do
            if not RefreshCharacter() then StopPlayback("error"); break end
            local frames = Playback.Route
            if not frames or #frames < 2 then StopPlayback("error"); break end
            local elapsed = (os.clock() - Playback.StartClock) * CONFIG.PlaybackSpeed
            local final = frames[#frames]
            if elapsed >= final.t then
                ApplyPosition(GetPosition(final), GetRotation(final))
                StopPlayback("completed")
                break
            end
            local a, b, alpha = GetFrames(frames, elapsed)
            if not a or not b then break end
            local pa, pb = GetPosition(a), GetPosition(b)
            if not pa or not pb then StopPlayback("error"); break end
            local pos = pa:Lerp(pb, alpha)
            local ra, rb = GetRotation(a), GetRotation(b)
            local rot
            if ra and rb then rot = ra:Lerp(rb, alpha)
            elseif ra then rot = ra
            elseif rb then rot = rb end
            ApplyPosition(pos, rot)
            HandleJump(a, elapsed)
            task.wait()
        end
    end)
end

-- ==========================================================
-- INICIAR ROTA
-- ==========================================================
local function StartPlayback(data, cat, num, tower, towerRoute)
    if Playback.Running then
        Notify("EM EXECUÇÃO", "Pare a rota atual antes de iniciar outra.", "Error")
        return
    end
    if not data or #data < 2 then
        Notify("ROTA INVÁLIDA", "Essa rota não possui frames suficientes.", "Error")
        return
    end
    if not RefreshCharacter() then
        Notify("PERSONAGEM", "Personagem não encontrado.", "Error")
        return
    end
    local first = data[1]
    local fp = GetPosition(first)
    if not fp then
        Notify("ERRO", "Primeiro ponto da rota inválido.", "Error")
        return
    end
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
        name = tower == "Torres" and "Torres" or "Torre 2 • " .. towerRoute
    else
        name = "Parkour " .. num .. " • " .. cat
    end
    local usarDummy = ExecutionMode.Modo == "Dummy"
    if usarDummy then
        Notify("MARCADOR CRIADO", "Ande até o marcador verde para iniciar: " .. name, "Orange")
        CriarDummy(target, GetRotation(first))
        Playback.WalkConnection = R.Heartbeat:Connect(function()
            if not Playback.Running or not Playback.WalkingToStart then return end
            if not RefreshCharacter() then StopPlayback("error"); return end
            if (rootPart.Position - target).Magnitude <= 5 then
                if Playback.WalkConnection then Playback.WalkConnection:Disconnect(); Playback.WalkConnection = nil end
                RemoverDummy()
                IniciarExecucao(name)
            end
        end)
    else
        Notify("INDO PARA O INÍCIO", "Ajustando posição inicial...", "Orange")
        AndarAte(target, function() return not Playback.Running end, function(sucesso)
            if not Playback.Running then return end
            if not sucesso then
                StopPlayback("error")
                return
            end
            IniciarExecucao(name)
        end)
    end
end

-- ==========================================================
-- INTERFACE PRINCIPAL
-- ==========================================================
local Old = PG:FindFirstChild("ZKY_PARKOUR")
if Old then Old:Destroy() end

local sg = _I("ScreenGui")
sg.Name = "ZKY_PARKOUR"
sg.ResetOnSpawn = false
sg.DisplayOrder = 100
sg.IgnoreGuiInset = true
sg.Parent = PG

-- LOGO ARRASTÁVEL
local logo = _I("TextButton", sg)
logo.Size = _UO(54, 54)
logo.Position = _UO(18, 200)
logo.BackgroundColor3 = _K.Background
logo.Text = "⚡"
logo.TextSize = 26
logo.Font = _GB
logo.BorderSizePixel = 0
logo.AutoButtonColor = false
logo.Active = true
logo.TextColor3 = _K.White
logo.ZIndex = 2
Corner(logo, 27)
Stroke(logo, _K.Orange, 1.8, 0.2)

-- MENU PRINCIPAL
local menu = _I("Frame", sg)
menu.Size = _UO(720, 440)
menu.Position = UDim2.fromScale(0.5, 0.5)
menu.AnchorPoint = Vector2.new(0.5, 0.5)
menu.BackgroundColor3 = _K.Background
menu.BorderSizePixel = 0
menu.Visible = false
menu.Active = true
Corner(menu, 12)
Stroke(menu, _K.Stroke, 1, 0.5)

-- HEADER
local header = _I("Frame", menu)
header.Size = _U2(1, 0, 0, 52)
header.BackgroundColor3 = _K.Panel
header.BorderSizePixel = 0
Corner(header, 12)
local hMask = _I("Frame", header)
hMask.Size = _U2(1, 0, 0.5, 0)
hMask.Position = _U2(0, 0, 0.5, 0)
hMask.BackgroundColor3 = _K.Panel
hMask.BorderSizePixel = 0
local titulo = _I("TextLabel", header)
titulo.Size = _U2(1, -60, 0, 22)
titulo.Position = _UO(16, 8)
titulo.BackgroundTransparency = 1
titulo.Text = "⚡ EB DELTA — EXECUTOR"
titulo.TextColor3 = _K.White
titulo.Font = _GB
titulo.TextSize = 16
titulo.TextXAlignment = _XL
local subtitulo = _I("TextLabel", header)
subtitulo.Size = _U2(1, -60, 0, 14)
subtitulo.Position = _UO(16, 30)
subtitulo.BackgroundTransparency = 1
subtitulo.Text = "Parkour • Torres • Combate • IA"
subtitulo.TextColor3 = _K.DarkGray
subtitulo.Font = _GM
subtitulo.TextSize = 11
subtitulo.TextXAlignment = _XL
local btnX = _I("TextButton", header)
btnX.Size = _UO(32, 32)
btnX.Position = _U2(1, -44, 0.5, -16)
btnX.BackgroundColor3 = _K.Card
btnX.Text = "×"
btnX.TextColor3 = _K.Gray
btnX.Font = _GB
btnX.TextSize = 16
btnX.BorderSizePixel = 0
btnX.AutoButtonColor = false
Corner(btnX, 8)
btnX.MouseButton1Click:Connect(function() menu.Visible = false end)

-- BARRA LATERAL DE ABAS
local SideBar = _I("Frame", menu)
SideBar.Size = _U2(0, 160, 1, -52)
SideBar.Position = _UO(0, 52)
SideBar.BackgroundColor3 = _K.Panel
SideBar.BorderSizePixel = 0
local SideLayout = _I("UIListLayout")
SideLayout.Padding = _UD(0, 4)
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Parent = SideBar

local Content = _I("ScrollingFrame", menu)
Content.Size = _U2(1, -160, 1, -52)
Content.Position = _UO(160, 52)
Content.BackgroundTransparency = 1
Content.BorderSizePixel = 0
Content.ScrollBarThickness = 4
Content.ScrollBarImageColor3 = _K.Orange
Content.AutomaticCanvasSize = Enum.AutomaticSize.Y
local ContentLayout = _I("UIListLayout")
ContentLayout.Padding = _UD(0, 12)
ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
ContentLayout.Parent = Content

local function ClearContent()
    for _, c in ipairs(Content:GetChildren()) do
        if c ~= ContentLayout then c:Destroy() end
    end
end

local SelectedButton = nil
local function SelectButton(btn)
    if SelectedButton then
        SelectedButton.BackgroundColor3 = _K.Panel
    end
    SelectedButton = btn
    btn.BackgroundColor3 = _K.Selected
end

local function SideButton(texto, selecionado)
    local btn = _I("TextButton", SideBar)
    btn.Size = _U2(1, -16, 0, 44)
    btn.Position = _UO(8, 8)
    btn.BackgroundColor3 = selecionado and _K.Selected or _K.Panel
    btn.Text = texto
    btn.TextColor3 = _K.White
    btn.Font = _GB
    btn.TextSize = 12
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    Corner(btn, 8)
    return btn
end

-- ==========================================================
-- ABA: EB DELTA (PARKOUR + TORRES + CONFIGURAÇÕES)
-- ==========================================================
local ebDeltaButton = SideButton("🏋️ EB DELTA", true)
ebDeltaButton.MouseButton1Click:Connect(function()
    SelectButton(ebDeltaButton)
    ClearContent()

    -- BOTÕES SUPERIORES INTERNOS
    local topBar = _I("Frame", Content)
    topBar.Size = _U2(1, 0, 0, 48)
    topBar.BackgroundColor3 = _K.Card
    topBar.BorderSizePixel = 0
    Corner(topBar, 10)
    Stroke(topBar, _K.StrokeLight, 1)
    local topLayout = _I("UIListLayout")
    topLayout.FillDirection = Enum.FillDirection.Horizontal
    topLayout.Padding = _UD(0, 8)
    topLayout.SortOrder = Enum.SortOrder.LayoutOrder
    topLayout.Parent = topBar
    Padding(topBar, 8, 8, 8, 8)

    local function SubBotao(texto, ativo)
        local btn = _I("TextButton", topBar)
        btn.Size = _U2(0.33, -8, 1, 0)
        btn.BackgroundColor3 = ativo and _K.Selected or _K.Panel
        btn.Text = texto
        btn.TextColor3 = ativo and _K.White or _K.Gray
        btn.Font = _GB
        btn.TextSize = 11
        btn.BorderSizePixel = 0
        btn.AutoButtonColor = false
        Corner(btn, 6)
        return btn
    end

    local btnParkour = SubBotao("🏃 PARKOUR", true)
    local btnTorres = SubBotao("🗼 TORRES", false)
    local btnAutomacao = SubBotao("🤖 AUTOMAÇÃO", false)
    local btnConfig = SubBotao("⚙️ CONFIG", false)

    -- ÁREA DE CONTEÚDO
    local areaConteudo = _I("Frame", Content)
    areaConteudo.Size = _U2(1, 0, 0, 0)
    areaConteudo.AutomaticSize = Enum.AutomaticSize.Y
    areaConteudo.BackgroundTransparency = 1
    local areaLayout = _I("UIListLayout")
    areaLayout.Padding = _UD(0, 10)
    areaLayout.SortOrder = Enum.SortOrder.LayoutOrder
    areaLayout.Parent = areaConteudo

    -- FUNÇÃO RENDERIZAR PARKOUR
    local function RenderParkour()
        for _, c in ipairs(areaConteudo:GetChildren()) do if c ~= areaLayout then c:Destroy() end end
        for _, cat in ipairs(CategoryOrder) do
            local temDados = routes[cat] and #routes[cat] > 0
            local card = _I("Frame", areaConteudo)
            card.Size = _U2(1, 0, 0, 0)
            card.AutomaticSize = Enum.AutomaticSize.Y
            card.BackgroundColor3 = _K.Card
            card.BorderSizePixel = 0
            Corner(card, 10)
            Stroke(card, _K.StrokeLight, 1)
            local cardLayout = _I("UIListLayout")
            cardLayout.Padding = _UD(0, 10)
            cardLayout.Parent = card
            Padding(card, 12, 12, 12, 12)

            local cab = _I("TextButton", card)
            cab.Size = _U2(1, 0, 0, 32)
            cab.BackgroundTransparency = 1
            cab.Text = (temDados and "▼ " or "▶ ") .. cat
            cab.TextColor3 = _K.White
            cab.Font = _GB
            cab.TextSize = 13
            cab.TextXAlignment = _XL
            cab.AutoButtonColor = false
            cab.LayoutOrder = 1

            local lista = _I("Frame", card)
            lista.Size = _U2(1, 0, 0, 0)
            lista.AutomaticSize = Enum.AutomaticSize.Y
            lista.BackgroundTransparency = 1
            lista.Visible = expandedParkour[cat] == true
            lista.LayoutOrder = 2
            local listaLayout = _I("UIListLayout")
            listaLayout.Padding = _UD(0, 6)
            listaLayout.Parent = lista

            if not temDados then
                local btnCarregar = _I("TextButton", lista)
                btnCarregar.Size = _U2(1, 0, 0, 36)
                btnCarregar.BackgroundColor3 = _K.Panel
                btnCarregar.Text = "🔄 Carregar rotas..."
                btnCarregar.TextColor3 = _K.Orange
                btnCarregar.Font = _GB
                btnCarregar.TextSize = 12
                btnCarregar.AutoButtonColor = false
                Corner(btnCarregar, 8)
                btnCarregar.MouseButton1Click:Connect(function()
                    local ok = LoadCategory(cat)
                    if ok then
                        Notify("SUCESSO", cat .. " carregado!", "Success")
                        expandedParkour[cat] = true
                        RenderParkour()
                    else
                        Notify("ERRO", "Falha ao carregar " .. cat, "Error")
                    end
                end)
            else
                for idx, rota in ipairs(routes[cat]) do
                    local btnRota = _I("TextButton", lista)
                    btnRota.Size = _U2(1, 0, 0, 36)
                    btnRota.BackgroundColor3 = _K.Panel
                    btnRota.Text = "▶ Rota " .. idx
                    btnRota.TextColor3 = _K.Gray
                    btnRota.Font = _GM
                    btnRota.TextSize = 12
                    btnRota.AutoButtonColor = false
                    Corner(btnRota, 6)
                    btnRota.MouseButton1Click:Connect(function()
                        StartPlayback(rota, cat, idx)
                    end)
                end
            end

            cab.MouseButton1Click:Connect(function()
                expandedParkour[cat] = not expandedParkour[cat]
                RenderParkour()
            end)
        end
    end

    -- FUNÇÃO RENDERIZAR TORRES
    local function RenderTorres()
        for _, c in ipairs(areaConteudo:GetChildren()) do if c ~= areaLayout then c:Destroy() end end
        for torre, rotas in pairs(TowerPastebins) do
            local card = _I("Frame", areaConteudo)
            card.Size = _U2(1, 0, 0, 0)
            card.AutomaticSize = Enum.AutomaticSize.Y
            card.BackgroundColor3 = _K.Card
            card.BorderSizePixel = 0
            Corner(card, 10)
            Stroke(card, _K.StrokeLight, 1)
            local cardLayout = _I("UIListLayout")
            cardLayout.Padding = _UD(0, 10)
            cardLayout.Parent = card
            Padding(card, 12, 12, 12, 12)

            local cab = _I("TextLabel", card)
            cab.Size = _U2(1, 0, 0, 32)
            cab.BackgroundTransparency = 1
            cab.Text = "🗼 " .. torre
            cab.TextColor3 = _K.White
            cab.Font = _GB
            cab.TextSize = 13
            cab.TextXAlignment = _XL

            local lista = _I("Frame", card)
            lista.Size = _U2(1, 0, 0, 0)
            lista.AutomaticSize = Enum.AutomaticSize.Y
            lista.BackgroundTransparency = 1
            lista.LayoutOrder = 2
            local listaLayout = _I("UIListLayout")
            listaLayout.Padding = _UD(0, 6)
            listaLayout.Parent = lista

            for rota, link in pairs(rotas) do
                local temDados = towerRoutes[torre] and towerRoutes[torre][rota] and #towerRoutes[torre][rota] > 0
                local btnRota = _I("TextButton", lista)
                btnRota.Size = _U2(1, 0, 0, 36)
                btnRota.BackgroundColor3 = _K.Panel
                btnRota.Text = (temDados and "▶ " or "🔄 ") .. rota
                btnRota.TextColor3 = temDados and _K.Gray or _K.Orange
                btnRota.Font = _GM
                btnRota.TextSize = 12
                btnRota.AutoButtonColor = false
                Corner(btnRota, 6)
                btnRota.MouseButton1Click:Connect(function()
                    if not temDados then
                        local ok = LoadTowerRoute(torre, rota)
                        if ok then
                            Notify("SUCESSO", torre .. " — " .. rota .. " carregado!", "Success")
                            RenderTorres()
