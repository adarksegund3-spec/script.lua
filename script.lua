-- =========================================================================
-- AKIRA MENU V2.3.6 — Sem Menus Secundários
-- =========================================================================

-- =========================================================================
-- LIMPEZA TOTAL
-- =========================================================================
do
    local PL = game:GetService("Players")
    local LPl = PL.LocalPlayer
    local LPG = LPl:WaitForChild("PlayerGui")
    local alvos = {"ZKY_PARKOUR", "ZKYKey", "ZKY_Logo", "Notifications"}
    local function limparEm(pai)
        if not pai then return end
        for _, g in ipairs(pai:GetChildren()) do
            if g:IsA("ScreenGui") then
                for _, nome in ipairs(alvos) do
                    if g.Name == nome then pcall(function() g:Destroy() end) break end
                end
            end
        end
    end
    limparEm(LPG)
    pcall(function() limparEm(gethui and gethui() or nil) end)
    pcall(function() limparEm(game:GetService("CoreGui")) end)
end

-- =========================================================================
-- SERVIÇOS E ATALHOS
-- =========================================================================
local _I,_U2,_UO,_UD,_RGB,_V2,_GB,_GM,_XL,_XC = Instance.new,UDim2.new,UDim2.fromOffset,UDim.new,Color3.fromRGB,Vector2.new,Enum.Font.GothamBold,Enum.Font.GothamMedium,Enum.TextXAlignment.Left,Enum.TextXAlignment.Center
local P = game:GetService("Players")
local T = game:GetService("TweenService")
local U = game:GetService("UserInputService")
local R = game:GetService("RunService")
local HS = game:GetService("HttpService")
local TCS = game:GetService("TextChatService")
local RS = game:GetService("ReplicatedStorage")
local Pl = P.LocalPlayer
local PG = Pl:WaitForChild("PlayerGui")
local character,humanoid,rootPart

local CONFIG = {
    LineThickness = .15, LineTransparency = .2, LineColor = _RGB(255,145,45),
    JumpCooldown = .28, PlaybackSpeed = 1, WalkToSpeed = 16, GroundOffset = 1.66
}
local MovementConfig = { Modo = "Dummy" }

local IA_CONFIG = {
    ApiKey = "", Endpoint = "https://api.groq.com/openai/v1/chat/completions",
    Modelo = "openai/gpt-oss-120b", Timeout = 15, MaxTokens = 2048,
    SystemPrompt = "Você é um corretor gramatical extremamente rigoroso de português do Brasil. Corrija TODOS os erros da mensagem do usuário, sem deixar passar nenhum, incluindo: letras maiúsculas no início de frases e em nomes próprios; todos os acentos gráficos (agudo, circunflexo, til, crase) e a cedilha; toda a pontuação, como vírgulas, pontos finais, pontos de interrogação e de exclamação; concordância verbal e nominal; ortografia e separação de palavras. Não deixe nenhuma palavra sem acento ou sem maiúscula onde for necessário, nem nenhuma frase sem pontuação final. Não resuma, não reescreva o estilo, não mude o significado, o tom nem o tamanho da mensagem: apenas corrija a gramática, a ortografia e a pontuação, mantendo as mesmas palavras sempre que possível. Responda APENAS com a mensagem corrigida, sem explicações, aspas, comentários extras ou qualquer texto adicional."
}

local IA_TEXTOS = {
    ApiKey = "", Endpoint = "https://api.groq.com/openai/v1/chat/completions",
    Modelo = "openai/gpt-oss-120b", Timeout = 20, MaxTokens = 2048,
    SystemPrompt = "Você é um gerador de textos do Exército Brasileiro em um jogo de Roblox (roleplay militar). O usuário vai te dar um TEMA. Você deve escrever um texto curto, humano, gramaticalmente perfeito e patriótico sobre exatamente esse tema. REGRAS OBRIGATÓRIAS: (1) O texto DEVE ter entre 150 e 210 caracteres, contando espaços. (2) Máximo 3 frases curtas. (3) Fique 100% fiel ao tema pedido, sem fugir do assunto. (4) Tom militar realista, natural e humano, sem exageros nem clichês. (5) Sem saudações, sem aspas, sem emojis, sem formatação, sem introduções. (6) Responda APENAS com o texto final, nada mais."
}

local LINK_PEGAR_KEY = "https://console.groq.com/keys"
local httpRequest = request or (syn and syn.request) or (http and http.request) or http_request

local ARQ_CONFIG = "Akira_Config.json"
local SUPORTA_SALVAR = (type(writefile)=="function") and (type(readfile)=="function") and (type(isfile)=="function")
local Persist = { ia_key = "", posicoes = {}, rotas_salvas = {}, limite_posicoes = 15 }

local function persistCarregar()
    if not SUPORTA_SALVAR then return end
    local ok, existe = pcall(function() return isfile(ARQ_CONFIG) end)
    if not ok or not existe then return end
    local ok2, conteudo = pcall(function() return readfile(ARQ_CONFIG) end)
    if not ok2 or not conteudo or conteudo == "" then return end
    local ok3, dados = pcall(function() return HS:JSONDecode(conteudo) end)
    if not ok3 or type(dados) ~= "table" then return end
    if type(dados.ia_key) == "string" and #dados.ia_key > 0 then
        Persist.ia_key = dados.ia_key; IA_CONFIG.ApiKey = dados.ia_key; IA_TEXTOS.ApiKey = dados.ia_key
    end
    if type(dados.posicoes) == "table" then
        local limpos = {}
        for _, p in ipairs(dados.posicoes) do
            if type(p) == "table" and type(p.nome) == "string"
                and type(p.x) == "number" and type(p.y) == "number" and type(p.z) == "number" then
                table.insert(limpos, { nome = p.nome, x = p.x, y = p.y, z = p.z,
                    rx = tonumber(p.rx) or 0, ry = tonumber(p.ry) or 0, rz = tonumber(p.rz) or 0 })
            end
        end
        Persist.posicoes = limpos
    end
    if type(dados.rotas_salvas) == "table" then
        local limpas = {}
        for _, r in ipairs(dados.rotas_salvas) do
            if type(r) == "table" and type(r.nome) == "string" and type(r.frames) == "table" then
                local framesValidos = {}
                for _, f in ipairs(r.frames) do
                    if type(f) == "table" and type(f.t) == "number"
                        and type(f.x) == "number" and type(f.y) == "number" and type(f.z) == "number" then
                        table.insert(framesValidos, { t = f.t, x = f.x, y = f.y, z = f.z,
                            rx = tonumber(f.rx) or 0, ry = tonumber(f.ry) or 0, rz = tonumber(f.rz) or 0,
                            j = f.j and true or false })
                    end
                end
                if #framesValidos >= 2 then table.insert(limpas, { nome = r.nome, frames = framesValidos }) end
            end
        end
        Persist.rotas_salvas = limpas
    end
end

local function persistSalvar()
    if not SUPORTA_SALVAR then return end
    local ok, encoded = pcall(function() return HS:JSONEncode(Persist) end)
    if not ok or not encoded then return end
    pcall(function() writefile(ARQ_CONFIG, encoded) end)
end
persistCarregar()

local Pastebins = {
    Lento = "https://pastebin.com/raw/M7DvRgTc",
    ["Rápido"] = "https://pastebin.com/raw/pBk8vYXE",
    ["Mais Rápido"] = "https://pastebin.com/raw/yz7gZmYr",
    ["Sem Burla"] = "https://pastebin.com/raw/N1j0iRDA"
}
local CategoryOrder = {"Lento","Rápido","Mais Rápido","Sem Burla"}
local TowerPastebins = {
    ["Torre 1"] = {["Única"]="https://pastebin.com/raw/HxXb4Mr3"},
    ["Torre 2"] = {
        Frente = "https://pastebin.com/raw/Y2arCYHb",
        ["Atrás"] = "https://pastebin.com/raw/rXxZX7CQ",
        Esquerda = "https://pastebin.com/raw/FtpTHhGt",
        Direita = "https://pastebin.com/raw/4u5Wjtkg"
    }
}
local Tower2RouteOrder = {"Frente","Atrás","Esquerda","Direita"}
local routes = {Lento={},["Rápido"]={},["Mais Rápido"]={},["Sem Burla"]={}}
local towerRoutes = {["Torre 1"]={},["Torre 2"]={Frente={},["Atrás"]={},Esquerda={},Direita={}}}
local selectedCategory = {}
for i=1,4 do selectedCategory[i]="Lento" end
local selectedTower2Route = "Frente"
local CurrentPage = "Creditos"
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

local _K = {
    Background = _RGB(15,15,18), Panel = _RGB(20,20,25), Card = _RGB(24,24,30),
    CardHover = _RGB(32,32,40), Selected = _RGB(45,45,55), Stroke = _RGB(45,45,55),
    StrokeLight = _RGB(65,65,80), White = _RGB(240,240,245), Gray = _RGB(170,170,180),
    DarkGray = _RGB(115,115,125), Success = _RGB(80,210,125), Error = _RGB(230,85,85),
    Orange = _RGB(255,145,45), SelectionRed = _RGB(225,70,70), SelectionRedDark = _RGB(75,32,32),
    Primary = _RGB(185,185,185), Purple = _RGB(150,110,240), PurpleLight = _RGB(180,150,255)
}

local function Corner(o,r) local c=_I("UICorner") c.CornerRadius=_UD(0,r) c.Parent=o end
local function Stroke(o,c,t) local s=_I("UIStroke") s.Color=c s.Thickness=t or 1 s.Parent=o return s end
local function Padding(o,t,b,l,rr)
    local p=_I("UIPadding")
    p.PaddingTop=_UD(0,t or 0) p.PaddingBottom=_UD(0,b or 0)
    p.PaddingLeft=_UD(0,l or 0) p.PaddingRight=_UD(0,rr or 0)
    p.Parent=o
end

-- =========================================================================
-- NOTIFICAÇÕES
-- =========================================================================
local NH = _I("Frame")
NH.Name="Notifications" NH.AnchorPoint=_V2(1,1) NH.Position=_U2(1,-15,1,-15)
NH.Size=_UO(270,300) NH.BackgroundTransparency=1 NH.ZIndex=200 NH.Parent=PG
local NL = _I("UIListLayout")
NL.VerticalAlignment=Enum.VerticalAlignment.Bottom
NL.HorizontalAlignment=Enum.HorizontalAlignment.Right
NL.Padding=_UD(0,7) NL.Parent=NH

local function Notify(tt,msg,nt)
    local c=_K.Gray
    if nt=="Success" then c=_K.Success
    elseif nt=="Error" then c=_K.Error
    elseif nt=="Orange" then c=_K.Orange end
    local n=_I("Frame") n.Size=_UO(250,64) n.BackgroundColor3=_K.Panel
    n.BorderSizePixel=0 n.BackgroundTransparency=1 n.ZIndex=201 n.Parent=NH
    Corner(n,10) local ns=Stroke(n,c) ns.Transparency=1
    local a=_I("Frame") a.Size=_UO(3,38) a.AnchorPoint=_V2(0,.5)
    a.Position=_U2(0,7,.5,0) a.BackgroundColor3=c a.BorderSizePixel=0
    a.BackgroundTransparency=1 a.ZIndex=202 a.Parent=n Corner(a,5)
    local ttl=_I("TextLabel")
    ttl.BackgroundTransparency=1 ttl.Position=_UO(18,9) ttl.Size=_U2(1,-28,0,18)
    ttl.Text=tt ttl.TextColor3=_K.White ttl.TextSize=12 ttl.Font=_GB
    ttl.TextXAlignment=_XL ttl.ZIndex=203 ttl.Parent=n
    local msgL=_I("TextLabel")
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
    humanoid=character:FindFirstChildOfClass("Humanoid")
    rootPart=character:FindFirstChild("HumanoidRootPart")
    return humanoid~=nil and rootPart~=nil
end

local walkTrack
local walkAnimCache
Pl.CharacterAdded:Connect(function()
    task.wait(.2); RefreshCharacter(); walkTrack = nil; walkAnimCache = nil
end)
RefreshCharacter()

local function iniciarAnimacaoAndar()
    if not RefreshCharacter() then return end
    if walkTrack and walkTrack.IsPlaying then return end
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then animator = _I("Animator"); animator.Parent = humanoid end
    if not walkAnimCache then
        local animationId = nil
        local animate = character:FindFirstChild("Animate")
        if animate then
            local walkFolder = animate:FindFirstChild("walk")
            if walkFolder then
                local anim = walkFolder:FindFirstChildOfClass("Animation")
                if anim then animationId = anim.AnimationId end
            end
        end
        if not animationId then
            local isR15 = humanoid.RigType == Enum.HumanoidRigType.R15
            animationId = isR15 and "rbxassetid://507777826" or "rbxassetid://180426354"
        end
        local ok, track = pcall(function()
            local anim = _I("Animation"); anim.AnimationId = animationId
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
    if walkTrack then pcall(function() walkTrack:Stop() end) walkTrack = nil end
end

local ultimaPosAnim
local ultimoTempoMov = 0
task.spawn(function()
    while true do
        task.wait(0.08)
        if RefreshCharacter() then
            local pos = rootPart.Position
            if ultimaPosAnim then
                local delta = (pos - ultimaPosAnim).Magnitude
                if delta > 0.06 then ultimoTempoMov = os.clock() end
            end
            ultimaPosAnim = pos
            local noChao = humanoid.FloorMaterial ~= Enum.Material.Air
            local aindaMovendo = (os.clock() - ultimoTempoMov) < 0.2
            local naRota = Playback.Running and not Playback.WalkingToStart
            if naRota and noChao and aindaMovendo then
                if not walkTrack or not walkTrack.IsPlaying then iniciarAnimacaoAndar() end
            else
                if walkTrack and walkTrack.IsPlaying then pararAnimacaoAndar() end
            end
        else
            ultimaPosAnim = nil
            if walkTrack and walkTrack.IsPlaying then pararAnimacaoAndar() end
        end
    end
end)

local function Number(v) return v and tonumber(v) end

local function ParseRoutes(raw)
    local parsed,blocks={},{} local sp=1
    while true do
        local s=string.find(raw,"local Rota = {",sp)
        if not s then break end
        local b,e=0
        for i=s,#raw do
            local ch=string.sub(raw,i,i)
            if ch=="{" then b+=1
            elseif ch=="}" then b-=1; if b==0 then e=i; break end end
        end
        if not e then break end
        table.insert(blocks,string.sub(raw,s,e))
        sp=e+1
    end
    for _,block in ipairs(blocks) do
        local frames,fs={},1
        while true do
            local p1,p2=string.find(block,"{(.-)}",fs)
            if not p1 then break end
            local f=string.sub(block,p1,p2)
            local t=string.match(f,"t%s*=%s*([%d%.%-]+)")
            local x=string.match(f,"x%s*=%s*([%d%.%-]+)")
            local y=string.match(f,"y%s*=%s*([%d%.%-]+)")
            local z=string.match(f,"z%s*=%s*([%d%.%-]+)")
            local j=string.match(f,"j%s*=%s*([%w]+)")
            local rx=string.match(f,"rx%s*=%s*([%d%.%-]+)")
            local ry=string.match(f,"ry%s*=%s*([%d%.%-]+)")
            local rz=string.match(f,"rz%s*=%s*([%d%.%-]+)")
            if t and x and y and z then
                local q={t=Number(t),x=Number(x),y=Number(y),z=Number(z),j=j=="true",
                    position=Vector3.new(Number(x),Number(y),Number(z)),
                    rx=Number(rx),ry=Number(ry),rz=Number(rz)}
                if q.rx and q.ry and q.rz then q.rotation=CFrame.Angles(q.rx,q.ry,q.rz); q.hasRotation=true
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
        lineFolder=_I("Folder"); lineFolder.Name="ZKY_RouteLines"; lineFolder.Parent=workspace
    end
    local l=_I("Part") l.Name="RouteSegment" l.Anchored=true l.CanCollide=false
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
    if rot then target=CFrame.new(corrected)*rot
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
        for inst,valor in pairs(salvos) do pcall(function() inst.Archivable=valor end) end
        if cok and clone then
            for _,d in ipairs(clone:GetDescendants()) do
                if d:IsA("Script") or d:IsA("LocalScript") then pcall(function() d:Destroy() end)
                elseif d:IsA("Shirt") or d:IsA("Pants") or d:IsA("ShirtGraphic") or d:IsA("Decal") then pcall(function() d:Destroy() end)
                elseif d:IsA("BasePart") then
                    d.CanCollide=false d.CanQuery=false d.CanTouch=false d.Massless=true
                    d.Material=Enum.Material.ForceField d.Color=_RGB(0,255,140) d.Transparency=.35
                end
            end
            local hum=clone:FindFirstChildOfClass("Humanoid")
            if hum then pcall(function() hum.WalkSpeed=0 hum.JumpPower=0 hum.PlatformStand=true end) end
            clone.PrimaryPart=clone.PrimaryPart or clone:FindFirstChild("HumanoidRootPart")
            if clone.PrimaryPart then
                clone.Parent=workspace
                local pok=pcall(function() clone:PivotTo(alvo) end)
                if pok then
                    for _,d in ipairs(clone:GetDescendants()) do
                        if d:IsA("BasePart") then d.Anchored=true end
                    end
                    local hl=_I("Highlight")
                    hl.FillColor=_RGB(0,255,140) hl.OutlineColor=_RGB(150,255,195)
                    hl.FillTransparency=.55 hl.OutlineTransparency=0
                    hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop hl.Parent=clone
                    clone.Name="ZKY_Dummy" DummyObj=clone ok=true
                else clone:Destroy() end
            else clone:Destroy() end
        end
    end
    if not ok then
        local marcador=_I("Part")
        marcador.Name="ZKY_Dummy" marcador.Shape=Enum.PartType.Cylinder
        marcador.Size=Vector3.new(.4,6,6)
        marcador.CFrame=alvo*CFrame.Angles(0,0,math.rad(90))
        marcador.Color=_RGB(0,255,130) marcador.Material=Enum.Material.Neon
        marcador.Transparency=.35 marcador.Anchored=true
        marcador.CanCollide=false marcador.CanQuery=false marcador.CanTouch=false
        marcador.Parent=workspace DummyObj=marcador
    end
end
RemoverDummy=function() if DummyObj then pcall(function() DummyObj:Destroy() end) DummyObj=nil end end

-- =========================================================================
-- STOP PLAYBACK
-- =========================================================================
local function StopPlayback(reason)
    if Playback.Connection then Playback.Connection:Disconnect(); Playback.Connection=nil end
    if Playback.WalkConnection then Playback.WalkConnection:Disconnect(); Playback.WalkConnection=nil end
    RemoverDummy()
    Playback.Running=false Playback.Route=nil Playback.CurrentIndex=1
    Playback.LastJump=-math.huge Playback.Category=nil Playback.Parkour=nil
    Playback.Tower=nil Playback.TowerRoute=nil Playback.WalkingToStart=false
    if RefreshCharacter() then
        pcall(function() rootPart.Anchored = false end)
        humanoid:Move(Vector3.zero,false); humanoid.Jump=false
        humanoid.WalkSpeed = 16
        humanoid.JumpPower = 50
        pcall(function() humanoid.AutoRotate=true end)
        for _, estado in ipairs({
            Enum.HumanoidStateType.Freefall,
            Enum.HumanoidStateType.FallingDown,
            Enum.HumanoidStateType.Ragdoll,
            Enum.HumanoidStateType.Climbing,
            Enum.HumanoidStateType.Swimming,
            Enum.HumanoidStateType.PlatformStanding,
            Enum.HumanoidStateType.Jumping,
        }) do
            pcall(function() humanoid:SetStateEnabled(estado, true) end)
        end
        local anim = character and character:FindFirstChild("Animate")
        if anim then pcall(function() anim.Disabled = false end) end
    end
    pararAnimacaoAndar()
    ClearLines()
    if reason=="completed" then Notify("CONCLUÍDO","Rota finalizada!","Success")
    elseif reason=="cancelled" then Notify("PARADO","Reprodução interrompida.","Error")
    elseif reason=="error" then Notify("ERRO","Não foi possível continuar.","Error") end
end

-- =========================================================================
-- INICIAR EXECUÇÃO
-- =========================================================================
local function IniciarExecucao(name)
    if not Playback.Running then return end
    Playback.WalkingToStart = false
    if not RefreshCharacter() then StopPlayback("error"); return end

    local rootAnchoredOrig = rootPart.Anchored
    local autoRotateOrig = humanoid.AutoRotate
    local walkSpeedOrig = humanoid.WalkSpeed
    local jumpPowerOrig = humanoid.JumpPower

    humanoid:Move(Vector3.zero, false)

    local animateScript = character:FindFirstChild("Animate")
    if animateScript then pcall(function() animateScript.Disabled = true end) end

    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then animator = _I("Animator"); animator.Parent = humanoid end
    pcall(function()
        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            track:Stop(0)
        end
    end)

    local isR15 = humanoid.RigType == Enum.HumanoidRigType.R15
    local walkAnimId = isR15 and "rbxassetid://507777826" or "rbxassetid://180426354"
    local walkAnim = _I("Animation")
    walkAnim.AnimationId = walkAnimId
    local walkPlaybackTrack = animator:LoadAnimation(walkAnim)
    walkPlaybackTrack.Looped = true
    walkPlaybackTrack.Priority = Enum.AnimationPriority.Movement

    pcall(function() rootPart.Anchored = true end)
    pcall(function() humanoid.AutoRotate = false end)
    humanoid.WalkSpeed = 0
    humanoid.JumpPower = 0

    for _, estado in ipairs({
        Enum.HumanoidStateType.Freefall,
        Enum.HumanoidStateType.FallingDown,
        Enum.HumanoidStateType.Ragdoll,
        Enum.HumanoidStateType.Climbing,
        Enum.HumanoidStateType.Swimming,
        Enum.HumanoidStateType.PlatformStanding,
        Enum.HumanoidStateType.Jumping,
    }) do
        pcall(function() humanoid:SetStateEnabled(estado, false) end)
    end

    task.wait(0.05)
    pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Running) end)
    pcall(function() walkPlaybackTrack:Play(0.1) end)

    local estadoLoopAtivo = true
    task.spawn(function()
        while estadoLoopAtivo and Playback.Running do
            pcall(function()
                if humanoid:GetState() ~= Enum.HumanoidStateType.Running then
                    humanoid:ChangeState(Enum.HumanoidStateType.Running)
                end
            end)
            task.wait(0.15)
        end
    end)

    Playback.StartClock = os.clock()
    Playback.CurrentIndex = 1
    Playback.LastJump = -math.huge
    Notify("EXECUTANDO", name, "Success")

    local ultimaPos = nil
    local parado = false

    task.spawn(function()
        while Playback.Running and not Playback.WalkingToStart do
            if not RefreshCharacter() then
                estadoLoopAtivo = false
                pcall(function() walkPlaybackTrack:Stop(0.1) end)
                StopPlayback("error"); break
            end
            local frames = Playback.Route
            if not frames or #frames < 2 then
                estadoLoopAtivo = false
                pcall(function() walkPlaybackTrack:Stop(0.1) end)
                StopPlayback("error"); break
            end
            local elapsed = (os.clock() - Playback.StartClock) * CONFIG.PlaybackSpeed
            local final = frames[#frames]
            if elapsed >= final.t then
                ApplyPosition(GetPosition(final), GetRotation(final))
                estadoLoopAtivo = false
                pcall(function() walkPlaybackTrack:Stop(0.1) end)
                pcall(function() rootPart.Anchored = rootAnchoredOrig end)
                pcall(function() humanoid.AutoRotate = autoRotateOrig end)
                humanoid.WalkSpeed = walkSpeedOrig
                humanoid.JumpPower = jumpPowerOrig
                for _, estado in ipairs({
                    Enum.HumanoidStateType.Freefall,
                    Enum.HumanoidStateType.FallingDown,
                    Enum.HumanoidStateType.Ragdoll,
                    Enum.HumanoidStateType.Climbing,
                    Enum.HumanoidStateType.Swimming,
                    Enum.HumanoidStateType.PlatformStanding,
                    Enum.HumanoidStateType.Jumping,
                }) do
                    pcall(function() humanoid:SetStateEnabled(estado, true) end)
                end
                local anim = character and character:FindFirstChild("Animate")
                if anim then pcall(function() anim.Disabled = false end) end
                StopPlayback("completed")
                break
            end
            local a, b, alpha = GetFrames(frames, elapsed)
            if not a or not b then break end
            local pa, pb = GetPosition(a), GetPosition(b)
            if not pa or not pb then
                estadoLoopAtivo = false
                pcall(function() walkPlaybackTrack:Stop(0.1) end)
                StopPlayback("error"); break
            end
            local pos = pa:Lerp(pb, alpha)
            local ra, rb = GetRotation(a), GetRotation(b)
            local rot
            if ra and rb then rot = ra:Lerp(rb, alpha)
            elseif ra then rot = ra
            elseif rb then rot = rb end
            ApplyPosition(pos, rot)
            HandleJump(a, elapsed)

            if ultimaPos then
                local delta = (pos - ultimaPos).Magnitude
                local movendo = delta > 0.005
                if not movendo and not parado then
                    parado = true
                    pcall(function() walkPlaybackTrack:Stop(0.1) end)
                elseif movendo and parado then
                    parado = false
                    pcall(function() walkPlaybackTrack:Play(0.1) end)
                end
            end
            ultimaPos = pos

            R.Heartbeat:Wait()
        end
    end)
end

local function StartPlayback(data, cat, num, tower, towerRoute)
    if Playback.Running then Notify("EM EXECUÇÃO","Pare a rota atual antes.","Error"); return end
    if not data or #data < 2 then Notify("ROTA INVÁLIDA","Frames insuficientes.","Error"); return end
    if not RefreshCharacter() then Notify("PERSONAGEM","Personagem não encontrado.","Error"); return end
    local first = data[1]
    local fp = GetPosition(first)
    if not fp then Notify("ERRO","Primeiro ponto inválido.","Error"); return end
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
    if tower then name = tower == "Torre 1" and "Torre 1" or "Torre 2 • " .. towerRoute
    else name = "Parkour " .. num .. " • " .. cat end
    local usarDummy = MovementConfig.Modo == "Dummy" and not desativarDummies
    if usarDummy then
        Notify("MARCADOR CRIADO", "Ande até o marcador verde: " .. name, "Orange")
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
        Notify("INDO PARA O INÍCIO", name, "Orange")
        task.spawn(function()
            AndarAte(target, function() return not Playback.Running end, function(sucesso)
                if not Playback.Running then return end
                if not sucesso then StopPlayback("error") return end
                IniciarExecucao(name)
            end)
        end)
    end
end

local function SaveDirection()
    if not RefreshCharacter() then Notify("ERRO","Personagem não encontrado.","Error") return end
    local look=rootPart.CFrame.LookVector
    local flat=Vector3.new(look.X,0,look.Z)
    if flat.Magnitude<=0 then Notify("ERRO","Direção inválida.","Error") return end
    SavedDirection=flat.Unit
    Notify("DIREÇÃO SALVA","Direção guardada!","Success")
end
local function Turn(command)
    if Turning then Notify("AGUARDE","Já está girando.","Error") return end
    if not RefreshCharacter() then Notify("ERRO","Personagem não encontrado.","Error") return end
    Turning=true
    local oldAutoRotate=humanoid.AutoRotate humanoid.AutoRotate=false
    local angle
    if command=="DIREITA" then angle=math.rad(-90)
    elseif command=="ESQUERDA" then angle=math.rad(90)
    elseif command=="RETAGUARDA" then angle=math.rad(180) end
    if angle then
        local pos=rootPart.Position
        local newCF=rootPart.CFrame*CFrame.Angles(0,angle,0)
        rootPart.CFrame=CFrame.new(pos)*(newCF-newCF.Position)
    end
    task.wait()
    humanoid.AutoRotate=oldAutoRotate
    Turning=false
    Notify(command.." VOLVER!","Giro executado.","Success")
end
local function VanguardaVolver()
    if not SavedDirection then Notify("ERRO","Salve uma direção primeiro.","Error") return end
    if not RefreshCharacter() then Notify("ERRO","Personagem não encontrado.","Error") return end
    local pos=rootPart.Position
    local oldAutoRotate=humanoid.AutoRotate humanoid.AutoRotate=false
    rootPart.CFrame=CFrame.lookAt(pos,pos+SavedDirection)
    task.wait()
    humanoid.AutoRotate=oldAutoRotate
    Notify("VANGUARDA VOLVER!","Retornou à direção salva.","Success")
end

local function EnviarNoChat(msg)
    msg=string.sub(msg,1,200)
    if TCS.ChatVersion==Enum.ChatVersion.TextChatService then
        local canais=TCS:FindFirstChild("TextChannels")
        local canal=canais and canais:FindFirstChild("RBXGeneral")
        if canal then canal:SendAsync(msg); return true end
    end
    local eventos=RS:FindFirstChild("DefaultChatSystemChatEvents")
    local say=eventos and eventos:FindFirstChild("SayMessageRequest")
    if say then say:FireServer(msg,"All"); return true end
    return false
end

-- =========================================================================
-- FUNÇÕES IA
-- =========================================================================
local function CorrigirTexto(texto)
    if not httpRequest then return nil,"Executor sem suporte a HTTP" end
    if not IA_CONFIG.ApiKey or IA_CONFIG.ApiKey == "" then return nil, "Sem key — integre na aba Key 🔑" end
    local corpo=HS:JSONEncode({
        model=IA_CONFIG.Modelo,
        messages={{role="system",content=IA_CONFIG.SystemPrompt},{role="user",content=texto}},
        temperature=.2, max_tokens=IA_CONFIG.MaxTokens or 2048
    })
    local resposta,terminou=nil,false
    task.spawn(function()
        local ok,res=pcall(function()
            return httpRequest({Url=IA_CONFIG.Endpoint,Method="POST",
                Headers={["Content-Type"]="application/json",["Authorization"]="Bearer "..IA_CONFIG.ApiKey},
                Body=corpo})
        end)
        if ok then resposta=res end
        terminou=true
    end)
    local inicio=os.clock()
    while not terminou and (os.clock()-inicio)<IA_CONFIG.Timeout do task.wait(.1) end
    if not terminou then return nil,"Tempo esgotado" end
    if not resposta then return nil,"Falha na requisição" end
    if not resposta.Body then return nil,"Resposta vazia" end
    if resposta.StatusCode~=200 then return nil,"HTTP "..tostring(resposta.StatusCode) end
    local okJson,dados=pcall(function() return HS:JSONDecode(resposta.Body) end)
    if not okJson or not dados.choices or not dados.choices[1] then return nil,"Resposta inválida" end
    local msg = dados.choices[1].message
    if not msg then return nil,"Resposta vazia" end
    local txt = msg.content
    if not txt or txt=="" then return nil,"Resposta vazia" end
    txt=txt:gsub("^%s+",""):gsub("%s+$","")
    txt=txt:gsub('^["\']+',""):gsub('["\']+$',"")
    return txt
end

local function GerarTextoIA(tema)
    if not httpRequest then return nil,"Executor sem suporte a HTTP" end
    if not IA_TEXTOS.ApiKey or IA_TEXTOS.ApiKey == "" then return nil, "Sem key — integre na aba Key 🔑" end
    if not tema or tema=="" then return nil,"Tema vazio" end
    local corpo = HS:JSONEncode({
        model = IA_TEXTOS.Modelo,
        messages = {{ role = "system", content = IA_TEXTOS.SystemPrompt },{ role = "user", content = "Tema: " .. tema }},
        temperature = 0.85, max_tokens = IA_TEXTOS.MaxTokens or 2048
    })
    local resposta, terminou = nil, false
    task.spawn(function()
        local ok, res = pcall(function()
            return httpRequest({Url = IA_TEXTOS.Endpoint,Method = "POST",
                Headers = {["Content-Type"] = "application/json",["Authorization"] = "Bearer " .. IA_TEXTOS.ApiKey},
                Body = corpo})
        end)
        if ok then resposta = res end
        terminou = true
    end)
    local inicio = os.clock()
    while not terminou and (os.clock() - inicio) < IA_TEXTOS.Timeout do task.wait(0.1) end
    if not terminou then return nil, "Tempo esgotado" end
    if not resposta then return nil, "Falha na requisição" end
    if not resposta.Body then return nil, "Resposta vazia" end
    if resposta.StatusCode ~= 200 then return nil, "HTTP " .. tostring(resposta.StatusCode) end
    local okJson, dados = pcall(function() return HS:JSONDecode(resposta.Body) end)
    if not okJson or not dados.choices or not dados.choices[1] then return nil, "Resposta inválida" end
    local msg = dados.choices[1].message
    if not msg then return nil, "Resposta vazia" end
    local txt = msg.content
    if not txt or txt == "" then return nil, "Resposta vazia" end
    txt = txt:gsub("^%s+", ""):gsub("%s+$", "")
    txt = txt:gsub('^["\']+', ""):gsub('["\']+$', "")
    txt = txt:gsub("^Tema:%s*", ""):gsub("^Texto:%s*", "")
    if #txt > 220 then txt = txt:sub(1, 220) end
    return txt
end

-- =========================================================================
-- GUI PRINCIPAL
-- =========================================================================
local Gui=_I("ScreenGui")
Gui.Name="ZKY_PARKOUR" Gui.ResetOnSpawn=false Gui.IgnoreGuiInset=true
Gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling Gui.Parent=PG

local Logo=_I("TextButton")
Logo.Name="ZKY_Logo" Logo.Size=_UO(58,58) Logo.Position=_UO(12,65)
Logo.BackgroundColor3=_RGB(10,10,10) Logo.BorderSizePixel=0 Logo.Text="🚀"
Logo.TextColor3=_K.White Logo.TextSize=26 Logo.Font=_GB
Logo.AutoButtonColor=false Logo.Active=true Logo.Parent=Gui Corner(Logo,29) Stroke(Logo,_K.StrokeLight)

local Main=_I("Frame")
Main.Name="Main" Main.AnchorPoint=_V2(.5,.5) Main.Position=UDim2.fromScale(.5,.5)
Main.Size=UDim2.fromScale(.78,.65) Main.BackgroundColor3=_K.Background
Main.BorderSizePixel=0 Main.Visible=false Main.ClipsDescendants=true
Main.ZIndex=10 Main.Parent=Gui Corner(Main,14) Stroke(Main,_K.Stroke)

local Header=_I("Frame")
Header.Size=_U2(1,-16,0,54) Header.Position=_UO(8,8) Header.BackgroundColor3=_K.Panel
Header.BorderSizePixel=0 Header.ZIndex=20 Header.Parent=Main
Corner(Header,10) Stroke(Header,_K.Stroke)

local Title=_I("TextLabel")
Title.BackgroundTransparency=1 Title.Position=_UO(13,7) Title.Size=_U2(.55,0,0,23)
Title.Text="🚀 AKIRA MENU" Title.TextColor3=_K.White Title.TextSize=17
Title.Font=_GB Title.TextXAlignment=_XL Title.ZIndex=22 Title.Parent=Header

local Subtitle=_I("TextLabel")
Subtitle.BackgroundTransparency=1 Subtitle.Position=_UO(14,31) Subtitle.Size=_U2(.65,0,0,15)
Subtitle.Text="Auto Parkour • Akira" Subtitle.TextColor3=_K.DarkGray
Subtitle.TextSize=9 Subtitle.Font=_GM Subtitle.TextXAlignment=_XL Subtitle.ZIndex=22 Subtitle.Parent=Header

local Version=_I("TextLabel")
Version.BackgroundColor3=_K.Card Version.AnchorPoint=_V2(.5,.5)
Version.Position=_U2(.5,0,.5,0) Version.Size=_UO(55,25) Version.Text="V2.3.6"
Version.TextColor3=_K.Gray Version.TextSize=10 Version.Font=_GB
Version.ZIndex=22 Version.Parent=Header Corner(Version,8) Stroke(Version,_K.Stroke)

local Close=_I("TextButton")
Close.Size=_UO(34,34) Close.Position=_U2(1,-42,.5,-17)
Close.BackgroundColor3=_K.Card Close.BorderSizePixel=0 Close.Text="×"
Close.TextColor3=_K.Gray Close.TextSize=22 Close.Font=_GM
Close.AutoButtonColor=false Close.ZIndex=25 Close.Parent=Header
Corner(Close,10) Stroke(Close,_K.Stroke)

local Sidebar=_I("ScrollingFrame")
Sidebar.Size=_U2(0,118,1,-78) Sidebar.Position=_UO(8,70)
Sidebar.BackgroundColor3=_K.Panel Sidebar.BorderSizePixel=0
Sidebar.ScrollBarThickness=2 Sidebar.ScrollBarImageColor3=_K.StrokeLight
Sidebar.AutomaticCanvasSize=Enum.AutomaticSize.Y Sidebar.ZIndex=20 Sidebar.Parent=Main
Corner(Sidebar,10) Stroke(Sidebar,_K.Stroke) Padding(Sidebar,7,7,6,6)
local SideLayout=_I("UIListLayout")
SideLayout.Padding=_UD(0,5)
SideLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center
SideLayout.Parent=Sidebar

local function SideButton(text,selected)
    local b=_I("TextButton")
    b.Size=_U2(1,0,0,39)
    b.BackgroundColor3=selected and _K.Selected or _K.Card
    b.BorderSizePixel=0 b.Text=text
    b.TextColor3=selected and _K.White or _K.Gray
    b.TextSize=9 b.Font=_GB b.TextXAlignment=_XL b.AutoButtonColor=false
    b.Parent=Sidebar Corner(b,7) Padding(b,0,0,8,2) Stroke(b,_K.Stroke)
    return b
end

local creditosButton    = SideButton("👑 CRÉDITOS", true)
local ebDeltaButton     = SideButton("🚀 EB DELTA", false)
local gravarRotaButton  = SideButton("⏺️ GRAVAR ROTA", false)
local taffsButton       = SideButton("📝 TAFFS", false)
local volversButton     = SideButton("↪ VOLVERS", false)
local iaButton          = SideButton("🤖 INTELIGÊNCIA", false)
local combateButton     = SideButton("🎯 COMBATE", false)
local textosButton      = SideButton("📚 TEXTOS PRONTOS", false)
local lojaButton        = SideButton("🔫 LOJA", false)
local extraButton       = SideButton("⚡ EXTRA", false)
local selectedButton    = creditosButton

local Content=_I("ScrollingFrame")
Content.Size=_U2(1,-134,1,-78) Content.Position=_U2(0,126,0,70)
Content.BackgroundColor3=_K.Panel Content.BorderSizePixel=0
Content.ScrollBarThickness=3 Content.ScrollBarImageColor3=_K.StrokeLight
Content.AutomaticCanvasSize=Enum.AutomaticSize.Y Content.ZIndex=20 Content.Parent=Main
Corner(Content,10) Stroke(Content,_K.Stroke)

local _CH=_I("Frame")
_CH.Size=_U2(1,0,0,0) _CH.AutomaticSize=Enum.AutomaticSize.Y
_CH.BackgroundTransparency=1 _CH.Parent=Content
Padding(_CH,9,9,9,9)
local ContentLayout=_I("UIListLayout")
ContentLayout.Padding=_UD(0,7) ContentLayout.Parent=_CH

local function ClearContent()
    for _,c in ipairs(_CH:GetChildren()) do
        if c:IsA("GuiObject") then c:Destroy() end
    end
end

-- =========================================================================
-- COMPONENTES UI
-- =========================================================================
local UI = {}

function UI.Help(parent)
    local h = _I("TextButton", parent)
    h.Size = _UO(14,14); h.BackgroundColor3 = _RGB(35,35,45)
    h.BorderSizePixel = 0; h.Text = "?"; h.TextColor3 = _K.DarkGray
    h.Font = _GB; h.TextSize = 9; h.AutoButtonColor = false; h.ZIndex = 5
    Corner(h, 7); return h
end

function UI.Toggle(parent, ordem, texto, inicial, callback)
    local row = _I("Frame", parent)
    row.Size = _U2(1,0,0,28); row.BackgroundTransparency = 1; row.LayoutOrder = ordem
    local lbl = _I("TextLabel", row)
    lbl.BackgroundTransparency = 1; lbl.Position = _UO(0,0)
    lbl.Size = _U2(1,-90,1,0); lbl.Text = texto; lbl.TextColor3 = _K.Gray
    lbl.Font = _GM; lbl.TextSize = 10; lbl.TextXAlignment = _XL
    local help = UI.Help(row)
    help.AnchorPoint = _V2(1,0.5); help.Position = _U2(1,-48,0.5,0)
    local sw = _I("TextButton", row)
    sw.AnchorPoint = _V2(1,.5); sw.Position = _U2(1,0,.5,0)
    sw.Size = _UO(38,20); sw.BackgroundColor3 = _RGB(40,40,50)
    sw.BorderSizePixel = 0; sw.Text = ""; sw.AutoButtonColor = false
    Corner(sw, 10)
    local bol = _I("Frame", sw)
    bol.Size = _UO(14,14); bol.Position = _UO(3,3)
    bol.BackgroundColor3 = _RGB(120,120,130); bol.BorderSizePixel = 0
    Corner(bol, 7)
    local est = inicial
    local function aplicar(v)
        est = v
        if v then
            sw.BackgroundColor3 = _K.Purple
            bol.Position = _UO(21,3); bol.BackgroundColor3 = _RGB(255,255,255)
        else
            sw.BackgroundColor3 = _RGB(40,40,50)
            bol.Position = _UO(3,3); bol.BackgroundColor3 = _RGB(120,120,130)
        end
    end
    aplicar(est)
    sw.MouseButton1Click:Connect(function() aplicar(not est) callback(est) end)
    return row
end

function UI.Dropdown(parent, ordem, label, opcoes, atual, callback)
    local wrap = _I("Frame", parent)
    wrap.Size = _U2(1,0,0,0); wrap.AutomaticSize = Enum.AutomaticSize.Y
    wrap.BackgroundTransparency = 1; wrap.LayoutOrder = ordem
    local lay = _I("UIListLayout", wrap)
    lay.Padding = _UD(0,6); lay.SortOrder = Enum.SortOrder.LayoutOrder; lay.Parent = wrap
    local row = _I("Frame", wrap)
    row.Size = _U2(1,0,0,14); row.BackgroundTransparency = 1; row.LayoutOrder = 1
    local lbl = _I("TextLabel", row)
    lbl.BackgroundTransparency = 1; lbl.Size = _U2(1,-20,1,0)
    lbl.Text = label; lbl.TextColor3 = _K.Gray; lbl.Font = _GM
    lbl.TextSize = 10; lbl.TextXAlignment = _XL
    local help = UI.Help(row)
    help.AnchorPoint = _V2(1,.5); help.Position = _U2(1,0,.5,0)
    local box = _I("TextButton", wrap)
    box.Size = _U2(1,0,0,30); box.BackgroundColor3 = _RGB(18,18,24)
    box.BorderSizePixel = 0; box.Text = ""; box.AutoButtonColor = false
    box.LayoutOrder = 2; Corner(box, 6); Stroke(box, _K.Stroke, 1)
    local boxTxt = _I("TextLabel", box)
    boxTxt.BackgroundTransparency = 1; boxTxt.Position = _UO(10,0)
    boxTxt.Size = _U2(1,-30,1,0); boxTxt.Text = atual
    boxTxt.TextColor3 = _K.White; boxTxt.Font = _GB
    boxTxt.TextSize = 10; boxTxt.TextXAlignment = _XL
    local arrow = _I("TextLabel", box)
    arrow.AnchorPoint = _V2(1,.5); arrow.Position = _U2(1,-10,.5,0)
    arrow.Size = _UO(14,14); arrow.BackgroundTransparency = 1
    arrow.Text = "▼"; arrow.TextColor3 = _K.DarkGray
    arrow.Font = _GB; arrow.TextSize = 9
    local lista = _I("Frame", wrap)
    lista.Size = _U2(1,0,0,0); lista.BackgroundColor3 = _RGB(16,16,22)
    lista.BorderSizePixel = 0; lista.ClipsDescendants = true
    lista.LayoutOrder = 3; lista.Visible = false; Corner(lista, 6)
    Stroke(lista, _K.Stroke, 1)
    local listaLay = _I("UIListLayout", lista)
    listaLay.Padding = _UD(0,1); listaLay.SortOrder = Enum.SortOrder.LayoutOrder
    listaLay.Parent = lista
    local alturaItem = 26
    local alturaTotal = #opcoes * alturaItem
    local estado = { aberto=false }
    local function fechar() estado.aberto = false; lista.Visible = false; lista.Size = _U2(1,0,0,0) end
    local function abrir() estado.aberto = true; lista.Visible = true; lista.Size = _U2(1,0,0,alturaTotal) end
    for i,op in ipairs(opcoes) do
        local b = _I("TextButton", lista)
        b.Size = _U2(1,0,0,alturaItem); b.BackgroundColor3 = _RGB(16,16,22)
        b.BorderSizePixel = 0; b.Text = "   "..op
        b.TextColor3 = (op==atual) and _K.PurpleLight or _K.Gray
        b.Font = _GB; b.TextSize = 10; b.TextXAlignment = _XL
        b.AutoButtonColor = false; b.LayoutOrder = i
        b.MouseEnter:Connect(function() b.BackgroundColor3 = _RGB(28,28,36) end)
        b.MouseLeave:Connect(function() b.BackgroundColor3 = _RGB(16,16,22) end)
        b.MouseButton1Click:Connect(function()
            boxTxt.Text = op; callback(op); fechar()
        end)
    end
    box.MouseButton1Click:Connect(function()
        if estado.aberto then fechar() else abrir() end
    end)
end

function UI.Slider(parent, ordem, titulo, valor, min, max, isDec, callback)
    local wrap = _I("Frame", parent)
    wrap.Size = _U2(1,0,0,50); wrap.BackgroundTransparency = 1; wrap.LayoutOrder = ordem
    local lbl = _I("TextLabel", wrap)
    lbl.BackgroundTransparency = 1; lbl.Position = _UO(0,0)
    lbl.Size = _U2(1,-60,0,14); lbl.Text = titulo
    lbl.TextColor3 = _K.Gray; lbl.Font = _GM; lbl.TextSize = 10; lbl.TextXAlignment = _XL
    local valLbl = _I("TextLabel", wrap)
    valLbl.AnchorPoint = _V2(1,0); valLbl.Position = _U2(1,-22,0,0)
    valLbl.Size = _UO(50,14); valLbl.BackgroundTransparency = 1
    valLbl.Text = isDec and string.format("%.2f",valor) or tostring(valor)
    valLbl.TextColor3 = _K.White; valLbl.Font = _GB; valLbl.TextSize = 10
    valLbl.TextXAlignment = Enum.TextXAlignment.Right
    local help = UI.Help(wrap)
    help.AnchorPoint = _V2(1,0); help.Position = _U2(1,0,0,0)
    local barBg = _I("Frame", wrap)
    barBg.Position = _UO(0,24); barBg.Size = _U2(1,0,0,6)
    barBg.BackgroundColor3 = _RGB(35,35,45); barBg.BorderSizePixel = 0
    Corner(barBg, 3)
    local pct0 = (valor-min)/(max-min)
    local fill = _I("Frame", barBg)
    fill.Size = _U2(pct0,0,1,0); fill.BackgroundColor3 = _K.Purple
    fill.BorderSizePixel = 0; Corner(fill, 3)
    local knob = _I("Frame", barBg)
    knob.AnchorPoint = _V2(.5,.5); knob.Position = _U2(pct0,0,.5,0)
    knob.Size = _UO(12,12); knob.BackgroundColor3 = _RGB(255,255,255)
    knob.BorderSizePixel = 0; knob.ZIndex = 2; Corner(knob, 6)
    local hit = _I("TextButton", wrap)
    hit.Position = _UO(0,16); hit.Size = _U2(1,0,0,24)
    hit.BackgroundTransparency = 1; hit.Text = ""; hit.AutoButtonColor = false
    local dragging = false
    local function atualizar(x)
        local pct = math.clamp((x-barBg.AbsolutePosition.X)/math.max(barBg.AbsoluteSize.X,1),0,1)
        local v
        if isDec then v = min + (max-min)*pct; valLbl.Text = string.format("%.2f",v)
        else v = math.floor(min + (max-min)*pct + .5); valLbl.Text = tostring(v) end
        fill.Size = _U2(pct,0,1,0); knob.Position = _U2(pct,0,.5,0)
        callback(v)
    end
    hit.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            Content.ScrollingEnabled=false dragging=true; atualizar(i.Position.X)
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
    local wrap = _I("Frame", parent)
    wrap.Size = _U2(1,0,0,54); wrap.BackgroundTransparency = 1; wrap.LayoutOrder = ordem
    local lbl = _I("TextLabel", wrap)
    lbl.BackgroundTransparency = 1; lbl.Position = _UO(0,0)
    lbl.Size = _U2(1,-20,0,14); lbl.Text = label
    lbl.TextColor3 = _K.Gray; lbl.Font = _GM; lbl.TextSize = 10; lbl.TextXAlignment = _XL
    local help = UI.Help(wrap)
    help.AnchorPoint = _V2(1,0); help.Position = _U2(1,0,0,0)
    local box = _I("TextBox", wrap)
    box.Position = _UO(0,20); box.Size = _U2(1,0,0,30)
    box.BackgroundColor3 = _RGB(18,18,24); box.BorderSizePixel = 0
    box.Text = valor or ""; box.PlaceholderText = placeholder or ""
    box.PlaceholderColor3 = _K.DarkGray; box.TextColor3 = _K.White
    box.Font = _GM; box.TextSize = 10; box.TextXAlignment = _XL
    box.ClearTextOnFocus = false; Corner(box, 6); Stroke(box, _K.Stroke, 1)
    Padding(box, 0,0,10,10)
    box.FocusLost:Connect(function() callback(box.Text) end)
    return box
end

function UI.ActionButton(parent, ordem, texto, corBg, callback)
    local b = _I("TextButton", parent)
    b.Size = _U2(1,0,0,32); b.BackgroundColor3 = corBg or _RGB(30,30,40)
    b.BorderSizePixel = 0; b.Text = texto; b.TextColor3 = _K.White
    b.Font = _GB; b.TextSize = 10; b.AutoButtonColor = false
    b.LayoutOrder = ordem; Corner(b, 6); Stroke(b, _K.Stroke, 1)
    b.MouseButton1Click:Connect(callback)
    return b
end

function UI.Card(parent, ordem, titulo)
    local card = _I("Frame", parent)
    card.Size = _U2(1,0,0,0); card.AutomaticSize = Enum.AutomaticSize.Y
    card.BackgroundColor3 = _RGB(22,22,28); card.BorderSizePixel = 0
    card.LayoutOrder = ordem; Corner(card, 8); Padding(card, 14, 14, 14, 14)
    local lay = _I("UIListLayout", card)
    lay.Padding = _UD(0,12); lay.SortOrder = Enum.SortOrder.LayoutOrder; lay.Parent = card
    if titulo then
        local hwrap = _I("Frame", card)
        hwrap.Size = _U2(1,0,0,20); hwrap.BackgroundTransparency = 1; hwrap.LayoutOrder = -1
        local h = _I("TextLabel", hwrap)
        h.BackgroundTransparency = 1; h.Position = _UO(0,0)
        h.Size = _U2(1,0,0,16); h.Text = titulo; h.TextColor3 = _K.White
        h.Font = _GB; h.TextSize = 12; h.TextXAlignment = _XL
        local line = _I("Frame", hwrap)
        line.Position = _UO(0,18); line.Size = _U2(0,36,0,2)
        line.BackgroundColor3 = _K.Purple; line.BorderSizePixel = 0; Corner(line, 1)
    end
    return card
end

local function CreateTwoColumns(parent, ordem)
    local container = _I("Frame", parent)
    container.Size = _U2(1,0,0,0); container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundTransparency = 1; container.LayoutOrder = ordem
    local lay = _I("UIListLayout", container)
    lay.FillDirection = Enum.FillDirection.Horizontal; lay.Padding = _UD(0, 10)
    lay.SortOrder = Enum.SortOrder.LayoutOrder; lay.Parent = container
    local col1 = _I("Frame", container)
    col1.Size = _U2(0.55, -5, 0, 0); col1.AutomaticSize = Enum.AutomaticSize.Y
    col1.BackgroundTransparency = 1; col1.LayoutOrder = 1
    local c1lay = _I("UIListLayout", col1)
    c1lay.Padding = _UD(0, 10); c1lay.SortOrder = Enum.SortOrder.LayoutOrder; c1lay.Parent = col1
    local col2 = _I("Frame", container)
    col2.Size = _U2(0.45, -5, 0, 0); col2.AutomaticSize = Enum.AutomaticSize.Y
    col2.BackgroundTransparency = 1; col2.LayoutOrder = 2
    local c2lay = _I("UIListLayout", col2)
    c2lay.Padding = _UD(0, 10); c2lay.SortOrder = Enum.SortOrder.LayoutOrder; c2lay.Parent = col2
    return col1, col2
end

-- =========================================================================
-- SISTEMA DE TRANSPARÊNCIA GLOBAL
-- =========================================================================
local TranspState = { ativo = false }

local function Transp_AplicarEm(obj)
    if not obj:IsA("GuiObject") then return end
    local bt = obj.BackgroundTransparency
    if bt >= 0.9 then return end
    if obj:GetAttribute("ZKY_OrigBT") == nil then
        obj:SetAttribute("ZKY_OrigBT", bt)
    end
    obj.BackgroundTransparency = math.min(0.92, bt + 0.55)
end

local function Transp_RestaurarEm(obj)
    if not obj:IsA("GuiObject") then return end
    local orig = obj:GetAttribute("ZKY_OrigBT")
    if orig ~= nil then
        obj.BackgroundTransparency = orig
        obj:SetAttribute("ZKY_OrigBT", nil)
    end
end

local function Transp_Aplicar(ativar)
    TranspState.ativo = ativar
    if ativar then
        Main.BackgroundTransparency = 0.4
        for _, obj in ipairs(Main:GetDescendants()) do
            Transp_AplicarEm(obj)
        end
    else
        Main.BackgroundTransparency = 0
        for _, obj in ipairs(Main:GetDescendants()) do
            Transp_RestaurarEm(obj)
        end
    end
end

local function Transp_Reaplicar()
    if not TranspState.ativo then return end
    Main.BackgroundTransparency = 0.4
    for _, obj in ipairs(Main:GetDescendants()) do
        Transp_AplicarEm(obj)
    end
end

-- =========================================================================
-- MODAL EDITAR NOME
-- =========================================================================
local function abrirModalEditarNome(titulo, nomeAtual, aoConfirmar)
    local modal = _I("Frame", Gui)
    modal.Size = _UO(320, 160); modal.Position = UDim2.fromScale(0.5, 0.5)
    modal.AnchorPoint = _V2(0.5, 0.5); modal.BackgroundColor3 = _K.Panel
    modal.BorderSizePixel = 0; modal.ZIndex = 600
    Corner(modal, 12); Stroke(modal, _K.Purple, 2)
    local t = _I("TextLabel", modal)
    t.Size = _U2(1, 0, 0, 36); t.BackgroundTransparency = 1
    t.Text = titulo or "✏️ Editar nome"; t.TextColor3 = _K.White
    t.Font = _GB; t.TextSize = 13
    local box = _I("TextBox", modal)
    box.Position = _UO(15, 48); box.Size = _U2(1, -30, 0, 34)
    box.BackgroundColor3 = _RGB(18,18,24); box.BorderSizePixel = 0
    box.Text = nomeAtual or ""; box.PlaceholderText = "Digite o nome..."
    box.PlaceholderColor3 = _K.DarkGray; box.TextColor3 = _K.White
    box.Font = _GM; box.TextSize = 12; box.TextXAlignment = _XL
    box.ClearTextOnFocus = false; Corner(box, 6); Stroke(box, _K.Stroke, 1)
    Padding(box, 0,0,10,10)
    local btnCancel = _I("TextButton", modal)
    btnCancel.Position = _UO(15, 110); btnCancel.Size = _U2(0.5, -20, 0, 34)
    btnCancel.BackgroundColor3 = _RGB(50,50,60); btnCancel.BorderSizePixel = 0
    btnCancel.Text = "Cancelar"; btnCancel.TextColor3 = _K.White
    btnCancel.Font = _GB; btnCancel.TextSize = 11; btnCancel.AutoButtonColor = false
    Corner(btnCancel, 6)
    local btnOk = _I("TextButton", modal)
    btnOk.Position = _U2(0.5, 5, 0, 110); btnOk.Size = _U2(0.5, -20, 0, 34)
    btnOk.BackgroundColor3 = _K.Success; btnOk.BorderSizePixel = 0
    btnOk.Text = "✓ Salvar"; btnOk.TextColor3 = _K.White
    btnOk.Font = _GB; btnOk.TextSize = 11; btnOk.AutoButtonColor = false
    Corner(btnOk, 6)
    btnCancel.MouseButton1Click:Connect(function() modal:Destroy() end)
    btnOk.MouseButton1Click:Connect(function()
        local novo = box.Text:gsub("^%s+",""):gsub("%s+$","")
        if novo == "" then Notify("NOME","⚠️ Nome vazio.","Error"); return end
        modal:Destroy(); aoConfirmar(novo)
    end)
    box:CaptureFocus()
end

-- =========================================================================
-- TAFFS
-- =========================================================================
local TAFFS_DATA = {
    { Name="TAF (CIGS)", Emoji="🐅", Color=_RGB(255, 180, 50), Fields={
        {"🐅 TAF", "Teste de Aptidão Física: CIGS"},
        {"🎖️ Comandante", "Sagas"},
        {"🎖️ Subcomandante", "Deselegant"},
        {"📜 Lema", "Treinar para resistir & Combater para vencer."},
        {"🫡 Pronomes", "Saudações, senhor Guerreiro de Selva. / Saudações, senhores Guerreiros de Selva."},
        {"🌿 Início", "Retirar boina, dar saudações ao instrutor e passar pelos escudos."}
    }},
    { Name="CIE", Emoji="🕵️‍♂️", Color=_RGB(70,130,180), Fields={
        {"🕵️‍♂️ CIE", "Agente."},
        {"👤 Criador", "vicofjgfhf"},
        {"👤 Sub criador", "RIP_dabfj8w"},
        {"🎖️ Comandante", "eriqurrr."},
        {"🎖️ Subcomandante", "Rodrigopao8"},
        {"🫡 Saudações", "Saudações, senhores Agentes. / Saudações, senhores Fantasmas. / Saudações, senhor Agente. / Saudações, senhor Fantasma."},
        {"📜 Lema CIE", "Inteligência para Vitória & Saber para Prever."}
    }},
    { Name="REC MEC", Emoji="🐎", Color=_RGB(220,180,60), Fields={
        {"🐎 REC MEC", "Cavaleiros."},
        {"👤 Comandante", "terro_2433."},
        {"🎖️ Subcomandante", "Contanum5bl"},
        {"📜 Lema", "Haverá sempre uma Cavalaria!, Aço na mente, motor no peito e honra na missão!"},
        {"🫡 Saudações", "Saudações, senhores Cavaleiros. / Saudações, senhor Cavaleiro."},
        {"🎖️ Licença", "Licença, senhores Cavaleiros. / Licença, senhor Cavaleiro."},
        {"🫡 Com licença", "Com licença, senhores Cavaleiros. / Com licença, senhor Cavaleiro."},
        {"📢 Comandos", "ATENÇÃO TURNO, PREPARAR PARA MARCHAR! / ATENÇÃO TURNO, MARCHEM! / ATENÇÃO PELOTÃO, PREPARAR PARA MARCHAR! / ATENÇÃO PELOTÃO, MARCHEM!"}
    }},
    { Name="BPE", Emoji="🛡️", Color=_RGB(60,180,120), Fields={
        {"🛡️ BPE", "Polícia do Exército"},
        {"👤 Comandante", "zCostasz."},
        {"🎖️ Subcomandante", "Matheuslindo587."},
        {"📜 Lema", "Orientar o Responsável, Corrigir o Irresponsável, Prender o Incorrigível."},
        {"🫡 Pronomes / Saudações", "Saudações, senhores Policiais. / Saudações, senhor Policial."}
    }},
    { Name="BFE (Fantasma)", Emoji="👻", Color=_RGB(200,70,70), Fields={
        {"👻 BFE", "Fantasma."},
        {"👤 Criador", "NATANHMELLO4."},
        {"📅 Criado", "1983."},
        {"🛡️ Escudo", "O escudo do BFE possui fundo preto com bordas amarelas. No centro, há um paraquedas branco junto de uma faca vermelha, simbolizando operações especiais e combate. Na parte inferior, aparece a faixa de Forças Especiais."},
        {"👤 Comandante", "RenanFoxiy."},
        {"🎖️ Subcomandante", "TILAPIA_PROFISSIONAL."},
        {"📜 Lema", "Qualquer missão, em qualquer lugar, a qualquer hora, de qualquer maneira."},
        {"🫡 Saudações", "Saudações, senhores Fantasmas. / Saudações, senhor Fantasma."},
        {"🎖️ Licença", "Com licença, senhores Fantasmas. / Com licença, senhor Fantasma."}
    }},
    { Name="BIP", Emoji="🪂", Color=_RGB(200, 200, 100), Fields={
        {"🪂 BIP", "Batalhão de Infantaria Paraquedista."},
        {"👤 Comandante", ""},
        {"🎖️ Subcomandante", ""},
        {"📜 Lema", "Paraquedistas, sempre prontos para a missão, do céu ao chão."},
        {"🎯 Missão", "Manter a tropa pronta para atuar em missões aeroterrestres, com disciplina, coragem e prontidão."},
        {"🫡 Saudações", "Saudações, senhores Paraquedistas. / Saudações, senhor Paraquedista."},
        {"🎖️ Licença", "Com licença, senhores Paraquedistas. / Com licença, senhor Paraquedista."},
        {"🪂 Grito de Guerra", "PARAQUEDISTA!"}
    }},
    { Name="BSE", Emoji="🦉", Color=_RGB(100, 150, 200), Fields={
        {"🦉 BSE", "Batalhão Sentinela De Elite"},
        {"👤 Comandante", "aizedamanga9149"},
        {"🎖️ Subcomandante", "davisilva0194"},
        {"📜 Lema", "Sentinela de Elite, firmes na missão; honra e disciplina, nossa tradição!"},
        {"🫡 Saudações", "Saudações, senhores sentinelas! / Saudações, senhor sentinela! / Saudações, nobres sentinelas! / Saudações, nobre sentinela!"},
        {"🎖️ Com licença", "Com licença, senhor sentinela! / Com licença, nobres sentinelas! / Com licença, nobre sentinela!"}
    }},
    { Name="BAC", Emoji="💀", Color=_RGB(220,100,50), Fields={
        {"💀 INFORMAÇÕES BAC", "Batalhão de Ações de Comandos"},
        {"👑 Dono", "MateusHgz"},
        {"🎖️ Comandante", "SasukeePro202."},
        {"🎖️ Subcomandante", "DanielSxS2."},
        {"📜 Lema da BAC", "O máximo de confusão, morte e destruição na retaguarda do inimigo."},
        {"🫡 Saudações", "Saudações, senhor Comando. / Saudações, senhores Comandos."}
    }},
    { Name="CYBER", Emoji="💻", Color=_RGB(150,100,200), Fields={
        {"💻 CYBER", "Comando de Defesa Cibernética."},
        {"🫡 Saudações", "Saudações, senhores Analistas."},
        {"👤 Criador", "wAnTee16j5156."},
        {"👑 Dono", "MaxTheJp1. / ItsMeLyrio. / Gabriel2444q."},
        {"🎖️ Comandante", "highanddry98"},
        {"🎖️ Subcomandante", "Não tem."},
        {"📜 Lema", "Segurança no ciberespaço, soberania para a Nação."},
        {"🛡️ JURAMENTO", "JURO GUARDAR SIGILO SOBRE TUDO QUE VER E OUVRIR NO COMDCIBER!"}
    }},
    { Name="CAATINGA", Emoji="🌵", Color=_RGB(50,150,80), Fields={
        {"🌵 CAATINGA", "Guardiões da Caatinga."},
        {"👤 Comandante", "Gabrielcm04"},
        {"🎖️ Subcomandante", "Plk_Ln17"},
        {"📜 Lema", "O pai cria, a mãe educa e a Caatinga elimina."},
        {"🫡 Saudação", "Saudações, senhores guardiões da Caatinga."}
    }}
}

local function CreateTAFFSCard(label,value,order,parent,color)
    local card=_I("Frame")
    card.Size=_U2(1,0,0,48) card.BackgroundColor3=_K.Card
    card.BorderSizePixel=0 card.LayoutOrder=order card.Parent=parent
    Corner(card,8) Stroke(card,_K.Stroke,1)
    local text=_I("TextLabel")
    text.BackgroundTransparency=1 text.Position=_UO(10,5) text.Size=_U2(1,-82,1,-10)
    text.Text=label..": "..value text.TextColor3=_K.White
    text.TextSize=10 text.Font=_GM text.TextWrapped=true
    text.TextXAlignment=_XL text.TextYAlignment=Enum.TextYAlignment.Center text.Parent=card
    local copy=_I("TextButton")
    copy.AnchorPoint=_V2(1,.5) copy.Position=_U2(1,-7,.5,0)
    copy.Size=_UO(58,29) copy.BackgroundColor3=_K.Success copy.BorderSizePixel=0
    copy.Text="Copiar" copy.TextColor3=_K.White copy.TextSize=9
    copy.Font=_GB copy.AutoButtonColor=false copy.Parent=card
    Corner(copy,7) Stroke(copy,_K.StrokeLight,1)
    copy.Activated:Connect(function()
        if typeof(setclipboard)~="function" then Notify("COPIAR","Sem setclipboard.","Error") return end
        local ok=pcall(function() setclipboard(value) end)
        if ok then
            copy.Text="✓" Notify("COPIADO","Informação copiada.","Success")
            task.delay(.9,function() if copy.Parent then copy.Text="Copiar" end end)
        end
    end)
end

local function ShowTAFFS()
    CurrentPage="TAFFS"
    ClearContent()
    local header=_I("Frame")
    header.Size=_U2(1,0,0,58) header.BackgroundColor3=_K.Card header.BorderSizePixel=0
    header.LayoutOrder=0 header.Parent=_CH Corner(header,9) Stroke(header,_K.StrokeLight,1)
    local title=_I("TextLabel")
    title.BackgroundTransparency=1 title.Position=_UO(12,7) title.Size=_U2(1,-24,0,25)
    title.Text="📝 TAFFS" title.TextColor3=_K.White title.TextSize=16
    title.Font=_GB title.TextXAlignment=_XL title.Parent=header
    local sub=_I("TextLabel")
    sub.BackgroundTransparency=1 sub.Position=_UO(13,34) sub.Size=_U2(1,-26,0,15)
    sub.Text="Informações das organizações militares" sub.TextColor3=_K.DarkGray
    sub.TextSize=9 sub.Font=_GM sub.TextXAlignment=_XL sub.Parent=header
    for idx,div in ipairs(TAFFS_DATA) do
        local section=_I("Frame")
        section.Size=_U2(1,0,0,0) section.AutomaticSize=Enum.AutomaticSize.Y
        section.BackgroundColor3=_K.Card section.BorderSizePixel=0
        section.LayoutOrder=idx section.Parent=_CH
        Corner(section,8) Stroke(section,div.Color,2)
        local sectionLayout=_I("UIListLayout")
        sectionLayout.FillDirection=Enum.FillDirection.Vertical
        sectionLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center
        sectionLayout.SortOrder=Enum.SortOrder.LayoutOrder
        sectionLayout.Padding=_UD(0,5) sectionLayout.Parent=section
        local headerDiv=_I("Frame")
        headerDiv.Size=_U2(1,0,0,38) headerDiv.BackgroundColor3=div.Color
        headerDiv.BackgroundTransparency=0.2 headerDiv.BorderSizePixel=0
        headerDiv.LayoutOrder=0 headerDiv.Parent=section Corner(headerDiv,8)
        local titleDiv=_I("TextLabel")
        titleDiv.BackgroundTransparency=1 titleDiv.Position=_UO(12,0)
        titleDiv.Size=_U2(1,-24,1,0) titleDiv.Text=div.Emoji.."  "..div.Name
        titleDiv.TextColor3=_K.White titleDiv.TextSize=14 titleDiv.Font=_GB
        titleDiv.TextXAlignment=_XL titleDiv.TextYAlignment=Enum.TextYAlignment.Center
        titleDiv.Parent=headerDiv
        for i,field in ipairs(div.Fields) do
            CreateTAFFSCard(field[1],field[2],i,section,div.Color)
        end
    end
    Content.CanvasPosition=_V2()
    Transp_Reaplicar()
end

-- =========================================================================
-- EB DELTA
-- =========================================================================
local EBDeltaSubPage = "Parkour"

local function ShowParkoursContent()
    local col1, col2 = CreateTwoColumns(_CH, 1)
    local function makeParkourCard(parent, num)
        local card = UI.Card(parent, num, "Parkour "..num)
        local catAtual = selectedCategory[num] or "Lento"
        UI.Dropdown(card, 1, "Velocidade", CategoryOrder, catAtual, function(op)
            selectedCategory[num] = op
        end)
        local running = Playback.Running and Playback.Parkour==num and not Playback.Tower
        UI.ActionButton(card, 2, running and "Parar" or ("Iniciar Parkour "..num),
            _RGB(28,28,36), function()
                if Playback.Running and Playback.Parkour==num and not Playback.Tower then
                    StopPlayback("cancelled"); ShowEBDelta(); return
                end
                local cat = selectedCategory[num] or "Lento"
                local rs = routes[cat]
                local route = rs and rs[num]
                if not route then Notify("ROTA NÃO ENCONTRADA","Parkour "..num.." • "..cat,"Error"); return end
                StartPlayback(route, cat, num)
                task.wait(.1) ShowEBDelta()
            end)
    end
    makeParkourCard(col1, 1); makeParkourCard(col2, 2)
    makeParkourCard(col1, 3); makeParkourCard(col2, 4)
end

local function ShowTowersContent()
    local col1, col2 = CreateTwoColumns(_CH, 1)
    do
        local card = UI.Card(col1, 1, "Torre 1")
        UI.Dropdown(card, 1, "Versão", {"Única"}, "Única", function(op) end)
        local running = Playback.Running and Playback.Tower=="Torre 1"
        UI.ActionButton(card, 2, running and "Parar" or "Iniciar Torre 1", _RGB(28,28,36), function()
            if Playback.Running and Playback.Tower=="Torre 1" then
                StopPlayback("cancelled"); ShowEBDelta(); return
            end
            local route = towerRoutes["Torre 1"]["Única"]
            if not route then Notify("ROTA NÃO CARREGADA","Torre 1.","Error"); return end
            StartPlayback(route, nil, nil, "Torre 1", "Única")
            task.wait(.1) ShowEBDelta()
        end)
    end
    do
        local card = UI.Card(col2, 1, "Torre 2")
        UI.Dropdown(card, 1, "Versão", Tower2RouteOrder, selectedTower2Route, function(op)
            selectedTower2Route = op
        end)
        local running = Playback.Running and Playback.Tower=="Torre 2"
        UI.ActionButton(card, 2, running and "Parar" or "Iniciar Torre 2", _RGB(28,28,36), function()
            if Playback.Running and Playback.Tower=="Torre 2" then
                StopPlayback("cancelled"); ShowEBDelta(); return
            end
            local route = towerRoutes["Torre 2"][selectedTower2Route]
            if not route then Notify("ROTA NÃO CARREGADA","Torre 2 • "..selectedTower2Route,"Error"); return end
            StartPlayback(route, nil, nil, "Torre 2", selectedTower2Route)
            task.wait(.1) ShowEBDelta()
        end)
    end
end

local ShowAutomacaoContent
do
    local ativo,VELOCIDADE,MAX_CLIQUES,META,META_ATIVA=false,53,2,308,true
    local jjsFeitos,bolhasVistas,cliquesTotal=0,{},0
    local btnToggleRef,infoLbl
    local function setBtnEstado(ligado)
        if not btnToggleRef or not btnToggleRef.Parent then return end
        btnToggleRef.Text = ligado and "Parar Auto JJS" or "Iniciar Auto JJS"
    end
    local function clicarFiresignal(obj)
        if firesignal then
            pcall(firesignal, obj.MouseButton1Down); pcall(firesignal, obj.MouseButton1Up); pcall(firesignal, obj.MouseButton1Click); return
        end
        pcall(function() obj.MouseButton1Down:Fire() end)
        pcall(function() obj.MouseButton1Up:Fire() end)
        pcall(function() obj.MouseButton1Click:Fire() end)
    end
    local function ehBolha(obj)
        if obj.ClassName~="ImageButton" then return false end
        if obj.Name~="InputTemplate" then return false end
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
        return math.floor(cx/40).."_"..math.floor(cy/40)
    end
    task.spawn(function()
        while true do
            task.wait(0.08)
            if not ativo then continue end
            if META_ATIVA and jjsFeitos >= META then
                ativo = false; setBtnEstado(false)
                Notify("AUTO JJS","Meta atingida: "..jjsFeitos.."/"..META,"Success")
                continue
            end
            local delayAtual=VELOCIDADE/100
            local agora=tick()
            for id,dados in pairs(bolhasVistas) do
                if agora-dados.t>2.5 then bolhasVistas[id]=nil end
            end
            local clicouAlguma=false
            for _,gui in ipairs(PG:GetChildren()) do
                if gui:IsA("ScreenGui") and gui~=Gui then
                    for _,obj in ipairs(gui:GetDescendants()) do
                        if ehBolha(obj) then
                            local id=gerarID(obj)
                            local dados=bolhasVistas[id]
                            if not dados then bolhasVistas[id]={count=0,t=tick()}; dados=bolhasVistas[id] end
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
                    infoLbl.Text=string.format("JJs: %d/%d",jjsFeitos,META)
                    infoLbl.TextColor3 = (jjsFeitos>=META) and _K.Success or _K.Orange
                else
                    infoLbl.Text=string.format("JJs: %d (sem meta)",jjsFeitos)
                    infoLbl.TextColor3 = _K.PurpleLight
                end
            end
        end
    end)
    ShowAutomacaoContent=function()
        local card = UI.Card(_CH, 1, "Auto JJS")
        UI.Toggle(card, 1, "Ativar Auto JJS", ativo, function(v) ativo = v end)
        local metaBox
        local function updateMetaBoxState()
            if not metaBox then return end
            if META_ATIVA then
                metaBox.TextEditable = true; metaBox.TextColor3 = _K.White
                metaBox.BackgroundColor3 = _RGB(18,18,24); metaBox.PlaceholderColor3 = _K.DarkGray
            else
                metaBox.TextEditable = false; metaBox.TextColor3 = _K.DarkGray
                metaBox.BackgroundColor3 = _RGB(13,13,17); metaBox.PlaceholderColor3 = _RGB(70,70,80)
            end
        end
        UI.Toggle(card, 2, "Ativar Meta", META_ATIVA, function(v)
            META_ATIVA = v; updateMetaBoxState()
            if v then Notify("AUTO JJS","Meta ativada. Alvo: "..META,"Success")
            else Notify("AUTO JJS","Meta desativada.","Orange") end
        end)
        metaBox = UI.TextBox(card, 3, "Quantidade Limite Exata", "Ex: 308", tostring(META), function(txt)
            local v = tonumber(txt)
            if v and v>0 then META=v end
        end)
        updateMetaBoxState()
        UI.Slider(card, 4, "Delay", VELOCIDADE, 1, 100, false, function(v) VELOCIDADE = v end)
        infoLbl = _I("TextLabel", card)
        infoLbl.Size = _U2(1,0,0,14); infoLbl.BackgroundTransparency = 1
        infoLbl.Text = META_ATIVA and ("JJs: 0/"..META) or "JJs: 0 (sem meta)"
        infoLbl.TextColor3 = _K.Orange; infoLbl.Font = _GB
        infoLbl.TextSize = 10; infoLbl.TextXAlignment = _XL; infoLbl.LayoutOrder = 5
        btnToggleRef = UI.ActionButton(card, 6, "Iniciar Auto JJS", _RGB(28,28,36), function()
            if not ativo and jjsFeitos >= META then
                jjsFeitos = 0; cliquesTotal = 0; bolhasVistas = {}
            end
            ativo = not ativo
            setBtnEstado(ativo)
        end)
        UI.ActionButton(card, 7, "Resetar Contador", _RGB(24,24,30), function()
            jjsFeitos = 0; cliquesTotal = 0; bolhasVistas = {}
            Notify("AUTO JJS","Contador resetado.","Success")
        end)
    end
end

local function ShowConfiguracaoContent()
    local card = UI.Card(_CH, 1, "Geral")
    UI.Toggle(card, 1, "Desativar Dummies (Ir Direto/MoveTo)", desativarDummies, function(v)
        desativarDummies = v
        MovementConfig.Modo = v and "Direto" or "Dummy"
    end)
    UI.Toggle(card, 2, "Mostrar Linhas (Apenas Parkour)", mostrarLinhas, function(v)
        mostrarLinhas = v; linesVisible = v
    end)
    UI.ActionButton(card, 3, "Limpar Dummies e Rotas Pendentes", _RGB(30,30,40), function()
        if Playback.Running then StopPlayback("cancelled") end
        RemoverDummy(); ClearLines()
        Notify("LIMPEZA","Dummies e rotas removidos.","Success")
    end)
end

function ShowEBDelta()
    CurrentPage = "EBDelta"
    ClearContent()
    local hotbar = _I("Frame", _CH)
    hotbar.Size = _U2(1,0,0,30); hotbar.BackgroundTransparency = 1; hotbar.LayoutOrder = 0
    local hbLay = _I("UIListLayout", hotbar)
    hbLay.FillDirection = Enum.FillDirection.Horizontal
    hbLay.Padding = _UD(0,18)
    hbLay.VerticalAlignment = Enum.VerticalAlignment.Center
    hbLay.Parent = hotbar
    local tabs = {
        {Nome="Parkours", Id="Parkour"}, {Nome="Torres", Id="Torres"},
        {Nome="Configurações", Id="Configuracao"}, {Nome="Automações", Id="Automacao"}
    }
    for _, tab in ipairs(tabs) do
        local sel = EBDeltaSubPage == tab.Id
        local b = _I("TextButton", hotbar)
        b.Size = _UO(110, 28); b.BackgroundTransparency = 1; b.Text = tab.Nome
        b.TextColor3 = sel and _K.White or _K.DarkGray
        b.Font = _GB; b.TextSize = 12; b.AutoButtonColor = false
        b.TextXAlignment = Enum.TextXAlignment.Center
        b.MouseButton1Click:Connect(function() EBDeltaSubPage = tab.Id; ShowEBDelta() end)
        if sel then
            local line = _I("Frame", b)
            line.AnchorPoint = _V2(0.5,1); line.Position = _U2(0.5,0,1,-2)
            line.Size = _U2(0.6,0,0,2); line.BackgroundColor3 = _K.Purple
            line.BorderSizePixel = 0; Corner(line,1)
        end
    end
    if EBDeltaSubPage=="Torres" then ShowTowersContent()
    elseif EBDeltaSubPage=="Parkour" then ShowParkoursContent()
    elseif EBDeltaSubPage=="Automacao" then ShowAutomacaoContent()
    else ShowConfiguracaoContent() end
    Content.CanvasPosition=_V2()
    Transp_Reaplicar()
end

-- =========================================================================
-- VOLVERS
-- =========================================================================
local function ShowVolvers()
    CurrentPage="Volvers"
    ClearContent()
    local header=_I("Frame")
    header.Size=_U2(1,0,0,58) header.BackgroundColor3=_K.Card header.BorderSizePixel=0
    header.LayoutOrder=0 header.Parent=_CH Corner(header,9) Stroke(header,_K.StrokeLight,1)
    local title=_I("TextLabel")
    title.BackgroundTransparency=1 title.Position=_UO(12,7) title.Size=_U2(1,-24,0,25)
    title.Text="↪ VOLVERS" title.TextColor3=_K.White title.TextSize=16
    title.Font=_GB title.TextXAlignment=_XL title.Parent=header
    local sub=_I("TextLabel")
    sub.BackgroundTransparency=1 sub.Position=_UO(13,34) sub.Size=_U2(1,-26,0,15)
    sub.Text="Comandos de formação – ZAYK VOLVERS V2" sub.TextColor3=_K.DarkGray
    sub.TextSize=9 sub.Font=_GM sub.TextXAlignment=_XL sub.Parent=header
    local commands={
        { name="◆ SALVAR POSIÇÃO", desc="Salva somente para onde o personagem está olhando.", highlight=true, action=SaveDirection },
        { name="DIREITA VOLVER!", desc="Gira 90° para a direita.", highlight=false, action=function() Turn("DIREITA") end },
        { name="ESQUERDA VOLVER!", desc="Gira 90° para a esquerda.", highlight=false, action=function() Turn("ESQUERDA") end },
        { name="RETAGUARDA VOLVER!", desc="Gira 180° para trás.", highlight=false, action=function() Turn("RETAGUARDA") end },
        { name="VANGUARDA VOLVER!", desc="Retorna à direção salva sem alterar sua posição.", highlight=false, action=VanguardaVolver }
    }
    for i,cmd in ipairs(commands) do
        local card=_I("Frame")
        card.Size=_U2(1,0,0,55)
        card.BackgroundColor3=cmd.highlight and _RGB(38,38,38) or _K.Card
        card.BorderSizePixel=0 card.LayoutOrder=i card.Parent=_CH
        Corner(card,8)
        Stroke(card, cmd.highlight and _K.Primary or _K.Stroke, cmd.highlight and 1.7 or 1)
        local nameLabel=_I("TextLabel")
        nameLabel.BackgroundTransparency=1 nameLabel.Position=_UO(11,5)
        nameLabel.Size=_U2(1,-100,0,20) nameLabel.Text=cmd.name
        nameLabel.TextColor3=_K.White nameLabel.TextSize=10
        nameLabel.Font=Enum.Font.GothamBlack nameLabel.TextXAlignment=_XL nameLabel.Parent=card
        local descLabel=_I("TextLabel")
        descLabel.BackgroundTransparency=1 descLabel.Position=_UO(11,26)
        descLabel.Size=_U2(1,-100,0,17) descLabel.Text=cmd.desc
        descLabel.TextColor3=_K.Gray descLabel.TextSize=7 descLabel.Font=_GM
        descLabel.TextXAlignment=_XL descLabel.Parent=card
        local execBtn=_I("TextButton")
        execBtn.AnchorPoint=_V2(1,.5) execBtn.Position=_U2(1,-8,.5,0)
        execBtn.Size=_UO(68,30)
        execBtn.BackgroundColor3=cmd.highlight and _K.Orange or _K.Success
        execBtn.BorderSizePixel=0 execBtn.Text="▶ EXECUTAR" execBtn.TextColor3=_K.White
        execBtn.TextSize=8 execBtn.Font=_GB execBtn.AutoButtonColor=false execBtn.Parent=card
        Corner(execBtn,7)
        execBtn.MouseButton1Click:Connect(function() cmd.action() end)
    end
    Content.CanvasPosition=_V2()
    Transp_Reaplicar()
end

-- =========================================================================
-- IA
-- =========================================================================
local IASubPage = "Corrigir"
local iaOcupado = false

local function ShowIACorrigirSub()
    local card = UI.Card(_CH, 1, "✨ Corrigir Português")
    local inputCard = _I("Frame", card)
    inputCard.Size = _U2(1,0,0,140); inputCard.BackgroundColor3 = _RGB(18,18,24)
    inputCard.BorderSizePixel = 0; inputCard.LayoutOrder = 1
    Corner(inputCard, 6); Stroke(inputCard, _K.Stroke, 1)
    local box = _I("TextBox", inputCard)
    box.Position = _UO(10,10); box.Size = _U2(1,-20,0,60)
    box.BackgroundColor3 = _RGB(14,14,18); box.BorderSizePixel = 0
    box.PlaceholderText = "Digite sua mensagem..."; box.PlaceholderColor3 = _K.DarkGray
    box.Text = ""; box.TextColor3 = _K.White; box.TextSize = 11
    box.Font = _GM; box.TextWrapped = true; box.TextXAlignment = _XL
    box.TextYAlignment = Enum.TextYAlignment.Top; box.ClearTextOnFocus = false
    Corner(box, 6); Padding(box, 6,6,8,8)
    local send = _I("TextButton", inputCard)
    send.Position = _UO(10,78); send.Size = _U2(1,-20,0,32)
    send.BackgroundColor3 = _K.Purple; send.BorderSizePixel = 0
    send.Text = "✨ Corrigir e Enviar"; send.TextColor3 = _K.White
    send.TextSize = 10; send.Font = _GB; send.AutoButtonColor = false; Corner(send, 6)
    local status = _I("TextLabel", inputCard)
    status.BackgroundTransparency = 1; status.Position = _UO(10,116)
    status.Size = _U2(1,-20,0,18); status.Text = ""
    status.TextColor3 = _K.Gray; status.TextSize = 10
    status.Font = _GM; status.TextXAlignment = _XL
    local function setStatus(t,c) status.Text=t status.TextColor3=c end
    send.MouseButton1Click:Connect(function()
        if iaOcupado then return end
        local texto=box.Text:gsub("^%s+",""):gsub("%s+$","")
        if texto=="" then setStatus("⚠️ Digite algo primeiro",_K.Orange) return end
        iaOcupado=true send.Text="⏳ Aguarde..." setStatus("🧠 Pensando...",_K.Gray)
        task.spawn(function()
            local corrigido,erro=CorrigirTexto(texto)
            if corrigido then
                if EnviarNoChat(corrigido) then
                    setStatus("✅ Corrigido e enviado!",_K.Success)
                    box.Text=""
                    Notify("IA","Mensagem enviada.","Success")
                else setStatus("❌ Chat não encontrado",_K.Error) end
            else setStatus("❌ "..tostring(erro),_K.Error) end
            send.Text="✨ Corrigir e Enviar" iaOcupado=false
        end)
    end)
end

local function ShowIAGerarSub()
    local card = UI.Card(_CH, 1, "⚡ Gerar Texto (EB)")
    local inputCard = _I("Frame", card)
    inputCard.Size = _U2(1,0,0,0); inputCard.AutomaticSize = Enum.AutomaticSize.Y
    inputCard.BackgroundColor3 = _RGB(18,18,24); inputCard.BorderSizePixel = 0
    inputCard.LayoutOrder = 1; Corner(inputCard, 6); Stroke(inputCard, _K.Stroke, 1)
    Padding(inputCard, 10, 10, 10, 10)
    local lay = _I("UIListLayout", inputCard)
    lay.Padding = _UD(0,10); lay.SortOrder = Enum.SortOrder.LayoutOrder; lay.Parent = inputCard
    local inputBox = _I("TextBox", inputCard)
    inputBox.Size = _U2(1, 0, 0, 30); inputBox.BackgroundColor3 = _RGB(14,14,18)
    inputBox.PlaceholderText = "Digite o tema (ex: Por que servir ao EB?)"
    inputBox.PlaceholderColor3 = _K.DarkGray; inputBox.Text = ""
    inputBox.TextColor3 = _K.White; inputBox.Font = _GM
    inputBox.TextSize = 11; inputBox.TextXAlignment = _XL
    inputBox.BorderSizePixel = 0; Corner(inputBox, 6); Stroke(inputBox, _K.Stroke, 1)
    Padding(inputBox, 6,6,8,8); inputBox.LayoutOrder = 1
    local btnGerar = _I("TextButton", inputCard)
    btnGerar.Size = _U2(1, 0, 0, 35); btnGerar.BackgroundColor3 = _RGB(139, 92, 246)
    btnGerar.Text = "⚡ GERAR TEXTO"; btnGerar.TextColor3 = _K.White
    btnGerar.Font = _GB; btnGerar.TextSize = 12; btnGerar.BorderSizePixel = 0
    btnGerar.AutoButtonColor = false; btnGerar.LayoutOrder = 2; Corner(btnGerar, 8)
    local outputLabel = _I("TextLabel", inputCard)
    outputLabel.Size = _U2(1, 0, 0, 0); outputLabel.AutomaticSize = Enum.AutomaticSize.Y
    outputLabel.BackgroundTransparency = 1
    outputLabel.Text = "A resposta da IA aparecerá aqui..."
    outputLabel.TextColor3 = _K.Gray; outputLabel.Font = _GM
    outputLabel.TextSize = 11; outputLabel.TextXAlignment = _XL
    outputLabel.TextWrapped = true; outputLabel.LineHeight = 1.2; outputLabel.LayoutOrder = 3
    local btnCopiarIA = _I("TextButton", inputCard)
    btnCopiarIA.Size = _U2(1, 0, 0, 28); btnCopiarIA.BackgroundColor3 = _K.Card
    btnCopiarIA.Text = "📋 Copiar Texto"; btnCopiarIA.TextColor3 = _K.White
    btnCopiarIA.Font = _GB; btnCopiarIA.TextSize = 10
    btnCopiarIA.BorderSizePixel = 0; btnCopiarIA.AutoButtonColor = false
    btnCopiarIA.LayoutOrder = 4; Corner(btnCopiarIA, 6); Stroke(btnCopiarIA, _K.Stroke, 1)
    local textoAtual = nil
    btnGerar.MouseButton1Click:Connect(function()
        local temaDigitado = inputBox.Text
        if temaDigitado == "" then
            outputLabel.Text = "⚠️ Digite um tema primeiro."
            outputLabel.TextColor3 = _K.Orange; return
        end
        outputLabel.Text = "⏳ Gerando..."; outputLabel.TextColor3 = _K.Orange
        btnCopiarIA.BackgroundColor3 = _K.Card; textoAtual = nil
        task.spawn(function()
            local textoGerado, erro = GerarTextoIA(temaDigitado)
            if textoGerado then
                textoAtual = textoGerado; outputLabel.Text = textoGerado
                outputLabel.TextColor3 = _K.White; btnCopiarIA.BackgroundColor3 = _K.Success
            else
                outputLabel.Text = "❌ Erro: " .. tostring(erro)
                outputLabel.TextColor3 = _K.Error
            end
        end)
    end)
    btnCopiarIA.MouseButton1Click:Connect(function()
        if not textoAtual then Notify("IA","Nada pra copiar.","Orange"); return end
        if setclipboard then
            pcall(setclipboard, textoAtual)
            btnCopiarIA.Text = "✅ Copiado!"; btnCopiarIA.BackgroundColor3 = _K.Success
            task.wait(1.5); btnCopiarIA.Text = "📋 Copiar Texto"
            btnCopiarIA.BackgroundColor3 = _K.Card
        end
    end)
end

local function ShowIAKeySub()
    local card = UI.Card(_CH, 1, "🔑 API Key")
    local info = _I("TextLabel", card)
    info.Size = _U2(1, 0, 0, 55); info.BackgroundTransparency = 1
    info.Text = "Cole aqui sua API Key da Groq.\nSem a key, as funções de IA não funcionam.\nPegue uma de graça clicando no botão abaixo."
    info.TextColor3 = _K.Gray; info.Font = _GM; info.TextSize = 10
    info.TextWrapped = true; info.TextXAlignment = _XL
    info.TextYAlignment = Enum.TextYAlignment.Top; info.LayoutOrder = 1
    UI.ActionButton(card, 2, "🔗 Pegar Key (Abrir Site)", _RGB(88,101,242), function()
        pcall(function() setclipboard(LINK_PEGAR_KEY) end)
        pcall(function() game:GetService("GuiService"):OpenBrowserWindow(LINK_PEGAR_KEY) end)
        Notify("IA KEY","Site aberto + link copiado!","Success")
    end)
    local keyBox = UI.TextBox(card, 3, "Cole sua API Key aqui", "gsk_...",
        (Persist.ia_key and #Persist.ia_key > 0) and Persist.ia_key or "", function() end)
    local avisoLabel = _I("TextLabel", card)
    avisoLabel.Size = _U2(1, 0, 0, 0); avisoLabel.AutomaticSize = Enum.AutomaticSize.Y
    avisoLabel.BackgroundTransparency = 1
    local keyAtual = Persist.ia_key or ""
    local mostrado = #keyAtual > 12 and (keyAtual:sub(1,8).."..."..keyAtual:sub(-4)) or keyAtual
    if not SUPORTA_SALVAR then
        avisoLabel.Text = "⚠️ Executor não suporta salvar."; avisoLabel.TextColor3 = _K.Orange
    elseif mostrado == "" then
        avisoLabel.Text = "Nenhuma key salva."; avisoLabel.TextColor3 = _K.DarkGray
    else
        avisoLabel.Text = "Key salva: " .. mostrado; avisoLabel.TextColor3 = _K.Success
    end
    avisoLabel.Font = _GM; avisoLabel.TextSize = 9; avisoLabel.TextWrapped = true
    avisoLabel.TextXAlignment = _XL; avisoLabel.LayoutOrder = 4
    UI.ActionButton(card, 5, "✓ Integrar Key", _K.Success, function()
        local novaKey = keyBox.Text:gsub("^%s+",""):gsub("%s+$","")
        if novaKey == "" then Notify("IA KEY","⚠️ Cole uma key!","Error"); return end
        IA_CONFIG.ApiKey = novaKey; IA_TEXTOS.ApiKey = novaKey
        Persist.ia_key = novaKey; persistSalvar()
        Notify("IA KEY","✅ Key integrada!","Success")
        avisoLabel.Text = "Key salva: " .. (novaKey:sub(1,8).."..."..novaKey:sub(-4))
        avisoLabel.TextColor3 = _K.Success
    end)
    if SUPORTA_SALVAR then
        UI.ActionButton(card, 6, "🗑️ Apagar Key Salva", _RGB(180,60,60), function()
            Persist.ia_key = ""; IA_CONFIG.ApiKey = ""; IA_TEXTOS.ApiKey = ""
            persistSalvar(); keyBox.Text = ""
            avisoLabel.Text = "Nenhuma key salva."; avisoLabel.TextColor3 = _K.DarkGray
            Notify("IA KEY","Key apagada.","Orange")
        end)
    end
end

local function ShowIA()
    CurrentPage = "IA"
    ClearContent()
    local hotbar = _I("Frame", _CH)
    hotbar.Size = _U2(1,0,0,30); hotbar.BackgroundTransparency = 1; hotbar.LayoutOrder = 0
    local hbLay = _I("UIListLayout", hotbar)
    hbLay.FillDirection = Enum.FillDirection.Horizontal; hbLay.Padding = _UD(0,18)
    hbLay.VerticalAlignment = Enum.VerticalAlignment.Center; hbLay.Parent = hotbar
    local tabs = {
        {Nome="Corrigir", Id="Corrigir"}, {Nome="Gerar Texto", Id="Gerar"}, {Nome="Key 🔑", Id="Key"}
    }
    for _, tab in ipairs(tabs) do
        local sel = IASubPage == tab.Id
        local b = _I("TextButton", hotbar)
        b.Size = _UO(110, 28); b.BackgroundTransparency = 1; b.Text = tab.Nome
        b.TextColor3 = sel and _K.White or _K.DarkGray
        b.Font = _GB; b.TextSize = 12; b.AutoButtonColor = false
        b.TextXAlignment = Enum.TextXAlignment.Center
        b.MouseButton1Click:Connect(function() IASubPage = tab.Id; ShowIA() end)
        if sel then
            local line = _I("Frame", b)
            line.AnchorPoint = _V2(0.5,1); line.Position = _U2(0.5,0,1,-2)
            line.Size = _U2(0.6,0,0,2); line.BackgroundColor3 = _K.Purple
            line.BorderSizePixel = 0; Corner(line,1)
        end
    end
    if IASubPage == "Corrigir" then ShowIACorrigirSub()
    elseif IASubPage == "Gerar" then ShowIAGerarSub()
    else ShowIAKeySub() end
    Content.CanvasPosition = _V2()
    Transp_Reaplicar()
end

-- =========================================================================
-- CRÉDITOS
-- =========================================================================
local function ShowCreditos()
    CurrentPage = "Creditos"
    ClearContent()
    local link = "https://discord.gg/NY2RfC7Kx"
    local header = _I("Frame", _CH)
    header.Size = _U2(1,0,0,58); header.BackgroundColor3 = _K.Card
    header.BorderSizePixel = 0; header.LayoutOrder = 0
    Corner(header,9) Stroke(header,_K.StrokeLight,1)
    local title = _I("TextLabel", header)
    title.BackgroundTransparency = 1; title.Position = _UO(12,7)
    title.Size = _U2(1,-24,0,25); title.Text = "🚀 AKIRA MENU"
    title.TextColor3 = _K.White; title.TextSize = 16
    title.Font = _GB; title.TextXAlignment = _XL
    local sub = _I("TextLabel", header)
    sub.BackgroundTransparency = 1; sub.Position = _UO(13,34)
    sub.Size = _U2(1,-26,0,15); sub.Text = "Versão Free v1"
    sub.TextColor3 = _K.DarkGray; sub.TextSize = 9
    sub.Font = _GM; sub.TextXAlignment = _XL
    local infoTitle = _I("TextLabel", _CH)
    infoTitle.Size = _U2(1,0,0,18); infoTitle.BackgroundTransparency = 1
    infoTitle.Text = "Informações"; infoTitle.TextColor3 = _K.White
    infoTitle.Font = _GB; infoTitle.TextSize = 13
    infoTitle.TextXAlignment = _XL; infoTitle.LayoutOrder = 1
    local col1, col2 = CreateTwoColumns(_CH, 2)
    local dadosTitle = _I("TextLabel", col1)
    dadosTitle.Size = _U2(1,0,0,18); dadosTitle.BackgroundTransparency = 1
    dadosTitle.Text = "Dados do Jogador"; dadosTitle.TextColor3 = _K.White
    dadosTitle.Font = _GB; dadosTitle.TextSize = 11
    dadosTitle.TextXAlignment = _XL; dadosTitle.LayoutOrder = 1
    local function infoCard(parent, ordem, texto, corTexto)
        local c = _I("Frame", parent)
        c.Size = _U2(1,0,0,30); c.BackgroundColor3 = _RGB(18,18,24)
        c.BorderSizePixel = 0; c.LayoutOrder = ordem
        Corner(c,6) Stroke(c,_K.Stroke,1)
        local t = _I("TextLabel", c)
        t.BackgroundTransparency = 1; t.Size = _U2(1,-20,1,0)
        t.Position = _UO(10,0); t.Text = texto
        t.TextColor3 = corTexto or _K.Gray; t.Font = _GM
        t.TextSize = 10; t.TextXAlignment = _XL
        t.TextYAlignment = Enum.TextYAlignment.Center
        return c
    end
    local executor = "Desconhecido"
    pcall(function() if identifyexecutor then executor = identifyexecutor() end end)
    infoCard(col1, 2, "👤 Jogador: " .. Pl.Name, _K.White)
    infoCard(col1, 3, "⚙️ Executor: " .. executor, _K.White)
    infoCard(col1, 4, "📦 Versão: Free v1", _K.White)
    infoCard(col1, 5, "👑 Desenvolvedor: akira007p", _K.PurpleLight)
    infoCard(col1, 6, "✅ Status: ● Ativo", _K.Success)
    local uiTitle = _I("TextLabel", col2)
    uiTitle.Size = _U2(1,0,0,18); uiTitle.BackgroundTransparency = 1
    uiTitle.Text = "UI Config"; uiTitle.TextColor3 = _K.White
    uiTitle.Font = _GB; uiTitle.TextSize = 11
    uiTitle.TextXAlignment = _XL; uiTitle.LayoutOrder = 1
    local uiCard = _I("Frame", col2)
    uiCard.Size = _U2(1,0,0,30); uiCard.BackgroundColor3 = _RGB(18,18,24)
    uiCard.BorderSizePixel = 0; uiCard.LayoutOrder = 2
    Corner(uiCard,6) Stroke(uiCard,_K.Stroke,1)
    local uiLbl = _I("TextLabel", uiCard)
    uiLbl.BackgroundTransparency = 1; uiLbl.Position = _UO(10,0)
    uiLbl.Size = _U2(1,-60,1,0); uiLbl.Text = "Interface transparente"
    uiLbl.TextColor3 = _K.Gray; uiLbl.Font = _GM; uiLbl.TextSize = 10
    uiLbl.TextXAlignment = _XL; uiLbl.TextYAlignment = Enum.TextYAlignment.Center
    local uiToggle = _I("TextButton", uiCard)
    uiToggle.AnchorPoint = _V2(1,.5); uiToggle.Position = _U2(1,-10,.5,0)
    uiToggle.Size = _UO(38,20); uiToggle.BackgroundColor3 = _RGB(40,40,50)
    uiToggle.BorderSizePixel = 0; uiToggle.Text = ""
    uiToggle.AutoButtonColor = false; Corner(uiToggle, 10)
    local uiBol = _I("Frame", uiToggle)
    uiBol.Size = _UO(14,14); uiBol.Position = _UO(3,3)
    uiBol.BackgroundColor3 = _RGB(120,120,130); uiBol.BorderSizePixel = 0
    Corner(uiBol, 7)

    local function atualizarToggleVisual(ativo)
        if ativo then
            uiToggle.BackgroundColor3 = _K.Purple
            uiBol.Position = _UO(21,3); uiBol.BackgroundColor3 = _RGB(255,255,255)
        else
            uiToggle.BackgroundColor3 = _RGB(40,40,50)
            uiBol.Position = _UO(3,3); uiBol.BackgroundColor3 = _RGB(120,120,130)
        end
    end
    atualizarToggleVisual(TranspState.ativo)
    uiToggle.MouseButton1Click:Connect(function()
        local novoEstado = not TranspState.ativo
        Transp_Aplicar(novoEstado)
        atualizarToggleVisual(novoEstado)
        Notify("UI CONFIG",
            novoEstado and "Transparência ativada." or "Transparência desativada.",
            novoEstado and "Success" or "Orange")
    end)

    local discordCard = _I("Frame", _CH)
    discordCard.Size = _U2(1,0,0,55); discordCard.BackgroundColor3 = _RGB(88,101,242)
    discordCard.BorderSizePixel = 0; discordCard.LayoutOrder = 10
    Corner(discordCard,8)
    local discordLbl = _I("TextLabel", discordCard)
    discordLbl.BackgroundTransparency = 1; discordLbl.Position = _UO(14,0)
    discordLbl.Size = _U2(1,-130,1,0)
    discordLbl.Text = "💬 Entre no nosso Discord!\n" .. link
    discordLbl.TextColor3 = _K.White; discordLbl.Font = _GB
    discordLbl.TextSize = 11; discordLbl.TextWrapped = true
    discordLbl.TextXAlignment = _XL; discordLbl.TextYAlignment = Enum.TextYAlignment.Center
    local discordBtn = _I("TextButton", discordCard)
    discordBtn.AnchorPoint = _V2(1,.5); discordBtn.Position = _U2(1,-10,.5,0)
    discordBtn.Size = _UO(90,32); discordBtn.BackgroundColor3 = _RGB(255,255,255)
    discordBtn.BorderSizePixel = 0; discordBtn.Text = "▶ ENTRAR"
    discordBtn.TextColor3 = _RGB(88,101,242); discordBtn.TextSize = 10
    discordBtn.Font = _GB; discordBtn.AutoButtonColor = false; Corner(discordBtn,6)
    discordBtn.MouseButton1Click:Connect(function()
        pcall(function() setclipboard(link) end)
        pcall(function() game:GetService("GuiService"):OpenBrowserWindow(link) end)
        Notify("DISCORD","Link copiado!","Success")
    end)
    Content.CanvasPosition = _V2()
    Transp_Reaplicar()
end

-- =========================================================================
-- TEXTOS PRONTOS
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
        Fundo = _RGB(25,25,25), Painel = _RGB(35,35,35), Borda = _RGB(50,50,50),
        Texto = _RGB(255,255,255), TextoDim = _RGB(160,160,160),
        Verde = _RGB(16,185,129), VerdeHover = _RGB(52,211,153),
    }
    local TEXTOS = {
        { Titulo = "POR QUE O EB É IMPORTANTE PRA SOCIEDADE?", Texto = "O EB não é apenas farda e arma: é o braço forte que guarda a pátria, socorre em tragédias, forma cidadãos de honra e defende a soberania. Sem ele, não há paz social nem futuro seguro pra ninguém." },
        { Titulo = "POR QUE VOCÊ QUER SUBIR DE PATENTE?", Texto = "Quero subir de patente pra ajudar mais a tropa, aprender a liderar direito e fazer por merecer a confiança dos meus superiores. Não é por status, é por vontade de servir melhor." },
        { Titulo = "POR QUE SERVIR AO EXÉRCITO BRASILEIRO?", Texto = "Sirvo ao Exército porque acredito no Brasil e quero fazer parte de algo maior que eu. É onde aprendo disciplina, honra e o valor de proteger quem não pode se proteger sozinho." },
        { Titulo = "COMO VOCÊ VÊ SUA JORNADA COMO MILITAR NO FUTURO?", Texto = "Quero subir uma patente de cada vez, aprender com os oficiais mais experientes e um dia poder treinar os novatos. Pretendo ficar até onde conseguir, sempre honrando a farda." },
    }
    local function criarCard(tema, ordem, cor)
        local card = _I("Frame", _CH)
        card.Size = _U2(1, 0, 0, 0); card.AutomaticSize = Enum.AutomaticSize.Y
        card.BackgroundColor3 = cor.Body; card.BorderSizePixel = 0
        card.LayoutOrder = ordem; Corner(card, 8); Stroke(card, cor.Header, 0.5, 0.7)
        card.ClipsDescendants = true
        _I("UIListLayout", card).SortOrder = Enum.SortOrder.LayoutOrder
        local cardHeader = _I("Frame", card)
        cardHeader.Size = _U2(1, 0, 0, 0); cardHeader.AutomaticSize = Enum.AutomaticSize.Y
        cardHeader.BackgroundColor3 = cor.Header; cardHeader.BorderSizePixel = 0
        cardHeader.LayoutOrder = 1
        Padding(cardHeader, 8, 8, 12, 12)
        local tituloCard = _I("TextLabel", cardHeader)
        tituloCard.Size = _U2(1, 0, 0, 0); tituloCard.AutomaticSize = Enum.AutomaticSize.Y
        tituloCard.BackgroundTransparency = 1; tituloCard.Text = "🤫 " .. tema.Titulo
        tituloCard.TextColor3 = C.Texto; tituloCard.Font = _GB
        tituloCard.TextSize = 12; tituloCard.TextXAlignment = _XL; tituloCard.TextWrapped = true
        local cardBody = _I("Frame", card)
        cardBody.Size = _U2(1, 0, 0, 0); cardBody.AutomaticSize = Enum.AutomaticSize.Y
        cardBody.BackgroundColor3 = cor.Body; cardBody.BorderSizePixel = 0
        cardBody.LayoutOrder = 2
        Padding(cardBody, 12, 12, 12, 12)
        local bodyLayout = _I("UIListLayout", cardBody)
        bodyLayout.Padding = _UD(0, 12); bodyLayout.SortOrder = Enum.SortOrder.LayoutOrder
        local textoCard = _I("TextLabel", cardBody)
        textoCard.Size = _U2(1, 0, 0, 0); textoCard.AutomaticSize = Enum.AutomaticSize.Y
        textoCard.BackgroundTransparency = 1; textoCard.Text = tema.Texto
        textoCard.TextColor3 = C.TextoDim; textoCard.Font = _GM
        textoCard.TextSize = 11; textoCard.TextXAlignment = _XL
        textoCard.TextWrapped = true; textoCard.LineHeight = 1.2
        local btnContainer = _I("Frame", cardBody)
        btnContainer.Size = _U2(1, 0, 0, 28); btnContainer.BackgroundTransparency = 1
        local btnCopiar = _I("TextButton", btnContainer)
        btnCopiar.Size = _UO(75, 28); btnCopiar.Position = _U2(1, 0, 0, 0)
        btnCopiar.AnchorPoint = Vector2.new(1, 0)
        btnCopiar.BackgroundColor3 = C.Verde; btnCopiar.Text = "Copiar"
        btnCopiar.TextColor3 = C.Texto; btnCopiar.Font = _GB
        btnCopiar.TextSize = 11; btnCopiar.BorderSizePixel = 0
        btnCopiar.AutoButtonColor = false; Corner(btnCopiar, 6)
        btnCopiar.MouseEnter:Connect(function() btnCopiar.BackgroundColor3 = C.VerdeHover end)
        btnCopiar.MouseLeave:Connect(function() btnCopiar.BackgroundColor3 = C.Verde end)
        btnCopiar.MouseButton1Click:Connect(function()
            if setclipboard then
                pcall(setclipboard, tema.Texto)
                btnCopiar.Text = "Copiado!"; btnCopiar.BackgroundColor3 = C.VerdeHover
                task.wait(1.5); btnCopiar.Text = "Copiar"
                btnCopiar.BackgroundColor3 = C.Verde
            end
        end)
    end
    function ShowTextosProntos()
        CurrentPage = "TextosProntos"
        ClearContent()
        local header = _I("Frame", _CH)
        header.Size = _U2(1, 0, 0, 58); header.BackgroundColor3 = C.Painel
        header.BorderSizePixel = 0; header.LayoutOrder = 0
        Corner(header, 9) Stroke(header, C.Borda, 1)
        local title = _I("TextLabel", header)
        title.BackgroundTransparency = 1; title.Position = _UO(12, 7)
        title.Size = _U2(1, -24, 0, 25); title.Text = "📋 TEXTOS PRONTOS"
        title.TextColor3 = C.Texto; title.TextSize = 16
        title.Font = _GB; title.TextXAlignment = _XL
        local sub = _I("TextLabel", header)
        sub.BackgroundTransparency = 1; sub.Position = _UO(13, 34)
        sub.Size = _U2(1, -26, 0, 15)
        sub.Text = "Textos prontos militares para copiar e colar"
        sub.TextColor3 = C.TextoDim; sub.TextSize = 9
        sub.Font = _GM; sub.TextXAlignment = _XL
        for i, tema in ipairs(TEXTOS) do
            local corIndex = ((i - 1) % #CARD_COLORS) + 1
            criarCard(tema, i, CARD_COLORS[corIndex])
        end
        Content.CanvasPosition = _V2()
        Transp_Reaplicar()
    end
end

-- =========================================================================
-- COMBATE
-- =========================================================================
local Cam = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    Cam = workspace.CurrentCamera
end)

local AIM_CONFIG = {
    Ativo=false, MostrarFOV=false, FOV=43, RingTransparency=0.3,
    Cor=Color3.fromRGB(150,80,255), Thickness=2,
    OffsetX=0, OffsetY=-47, ParteAlvo="Cabeça"
}
local HB_CONFIG = { Ativo=false, Visual=true, Tamanho=2, Transparencia=0.5, Cor=_RGB(255,0,0), Material="Neon" }
local HB_Original = {}
local HB_Tok = os.clock()
PG:SetAttribute("ZKYHitbox", HB_Tok)

local AimFOVring
pcall(function()
    AimFOVring = Drawing.new("Circle")
    AimFOVring.Visible=false; AimFOVring.Thickness=AIM_CONFIG.Thickness
    AimFOVring.Color=AIM_CONFIG.Cor; AimFOVring.Filled=false
    AimFOVring.Radius=AIM_CONFIG.FOV
end)

local function AIM_getCentro()
    return Vector2.new(Cam.ViewportSize.X/2 + AIM_CONFIG.OffsetX, Cam.ViewportSize.Y/2 + AIM_CONFIG.OffsetY)
end
local function AIM_pegarTronco(char)
    if not char then return nil end
    return char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
        or char:FindFirstChild("LowerTorso") or char:FindFirstChild("Head")
end
local function AIM_pegarParteAlvo(char)
    if not char then return nil end
    if AIM_CONFIG.ParteAlvo=="Cabeça" then return char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
    elseif AIM_CONFIG.ParteAlvo=="Tronco" then return AIM_pegarTronco(char) end
    return char:FindFirstChild("Head")
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
                    if d < last and d <= AIM_CONFIG.FOV then last = d; nearest = p end
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
        AimFOVring.Radius = AIM_CONFIG.FOV; AimFOVring.Color = AIM_CONFIG.Cor
        AimFOVring.Thickness = AIM_CONFIG.Thickness; AimFOVring.Position = AIM_getCentro()
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
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    HB_Original[char] = {Size=hrp.Size, Transparency=hrp.Transparency, Color=hrp.Color, Material=hrp.Material, CanCollide=hrp.CanCollide}
end
local function HB_Aplicar(char)
    if not char or char == character then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    HB_Salvar(char)
    pcall(function()
        hrp.Size = Vector3.new(HB_CONFIG.Tamanho,HB_CONFIG.Tamanho,HB_CONFIG.Tamanho)
        hrp.Transparency = HB_CONFIG.Visual and HB_CONFIG.Transparencia or 1
        hrp.Color = HB_CONFIG.Cor; hrp.Material = Enum.Material.Neon
        hrp.CanCollide = false
    end)
end
local function HB_Restaurar(char)
    if not char then return end
    local orig = HB_Original[char]; if not orig then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then
        pcall(function()
            hrp.Size = orig.Size; hrp.Transparency = orig.Transparency
            hrp.Color = orig.Color; hrp.Material = orig.Material
            hrp.CanCollide = orig.CanCollide
        end)
    end
    HB_Original[char] = nil
end
local HB_Conn
HB_Conn = R.Heartbeat:Connect(function()
    if PG:GetAttribute("ZKYHitbox") ~= HB_Tok then
        HB_Conn:Disconnect()
        for c in pairs(HB_Original) do HB_Restaurar(c) end
        return
    end
    if HB_CONFIG.Ativo then
        for _,p in ipairs(P:GetPlayers()) do
            if p ~= Pl and p.Character and p.Character.Parent then HB_Aplicar(p.Character) end
        end
        for char in pairs(HB_Original) do
            if not char.Parent then HB_Restaurar(char) end
        end
    else
        for char in pairs(HB_Original) do HB_Restaurar(char) end
    end
end)
function ShowCombate()
    CurrentPage = "Combate"
    ClearContent()
    Content.ScrollingEnabled = true
    local col1, col2 = CreateTwoColumns(_CH, 0)
    local hbCard = UI.Card(col1, 1, "🎯 Hitbox Modificador")
    UI.Toggle(hbCard, 1, "Ativar Hitbox", HB_CONFIG.Ativo, function(v)
        HB_CONFIG.Ativo = v
        Notify("HITBOX", v and "Ativado." or "Desativado.", v and "Success" or "Error")
    end)
    UI.Slider(hbCard, 2, "Tamanho", HB_CONFIG.Tamanho, 1, 20, false, function(v) HB_CONFIG.Tamanho = v end)
    UI.Slider(hbCard, 3, "Transparência", math.floor(HB_CONFIG.Transparencia*10+.5), 0, 10, false,
        function(v) HB_CONFIG.Transparencia = v/10 end)
    local corRow = _I("Frame", hbCard)
    corRow.Size = _U2(1,0,0,26); corRow.BackgroundTransparency = 1; corRow.LayoutOrder = 4
    local corLbl = _I("TextLabel", corRow)
    corLbl.BackgroundTransparency = 1; corLbl.Size = _U2(1,-90,1,0)
    corLbl.Text = "Cor da Hitbox"; corLbl.TextColor3 = _K.Gray
    corLbl.Font = _GM; corLbl.TextSize = 10; corLbl.TextXAlignment = _XL
    local corHelp = UI.Help(corRow)
    corHelp.AnchorPoint = _V2(1,.5); corHelp.Position = _U2(1,-40,.5,0)
    local corSwatch = _I("TextButton", corRow)
    corSwatch.AnchorPoint = _V2(1,.5); corSwatch.Position = _U2(1,0,.5,0)
    corSwatch.Size = _UO(34,18); corSwatch.BackgroundColor3 = HB_CONFIG.Cor
    corSwatch.BorderSizePixel = 0; corSwatch.Text = ""
    corSwatch.AutoButtonColor = false; Corner(corSwatch, 4); Stroke(corSwatch, _K.Stroke, 1)
    local HB_Presets = {
        _RGB(255,0,0), _RGB(0,255,100), _RGB(0,150,255), _RGB(255,200,0),
        _RGB(255,0,255), _RGB(150,80,255), _RGB(255,255,255), _RGB(0,0,0)
    }
    local presetFrame = _I("Frame", hbCard)
    presetFrame.Size = _U2(1,0,0,18); presetFrame.BackgroundTransparency = 1
    presetFrame.LayoutOrder = 5
    local presetList = _I("UIListLayout", presetFrame)
    presetList.FillDirection = Enum.FillDirection.Horizontal
    presetList.Padding = _UD(0,4); presetList.Parent = presetFrame
    for _,cor in ipairs(HB_Presets) do
        local b = _I("TextButton", presetFrame)
        b.Size = _UO(16,16); b.BackgroundColor3 = cor; b.BorderSizePixel = 0
        b.Text = ""; b.AutoButtonColor = false; Corner(b,4); Stroke(b,_K.Stroke,1)
        b.MouseButton1Click:Connect(function() HB_CONFIG.Cor = cor; corSwatch.BackgroundColor3 = cor end)
    end
    local aimCard = UI.Card(col2, 1, "🎯 Aim")
    UI.Toggle(aimCard, 1, "Ativar Aimbot", AIM_CONFIG.Ativo, function(v) AIM_CONFIG.Ativo = v end)
    UI.Toggle(aimCard, 2, "Mostrar FOV", AIM_CONFIG.MostrarFOV, function(v) AIM_CONFIG.MostrarFOV = v end)
    local alvoWrap = _I("Frame", aimCard)
    alvoWrap.Size = _U2(1,0,0,44); alvoWrap.BackgroundTransparency = 1; alvoWrap.LayoutOrder = 3
    local alvoLbl = _I("TextLabel", alvoWrap)
    alvoLbl.BackgroundTransparency = 1; alvoLbl.Position = _UO(0,0)
    alvoLbl.Size = _U2(1,-20,0,14); alvoLbl.Text = "Parte do Alvo"
    alvoLbl.TextColor3 = _K.Gray; alvoLbl.Font = _GM
    alvoLbl.TextSize = 10; alvoLbl.TextXAlignment = _XL
    local btnFrame = _I("Frame", alvoWrap)
    btnFrame.Position = _UO(0,20); btnFrame.Size = _U2(1,0,0,24)
    btnFrame.BackgroundTransparency = 1
    local bfl = _I("UIListLayout", btnFrame)
    bfl.FillDirection = Enum.FillDirection.Horizontal
    bfl.Padding = _UD(0,4); bfl.Parent = btnFrame
    local opcoes = {"Cabeça","Tronco"}
    local btnAlvos = {}
    local function atualizarAlvos()
        for _,item in ipairs(btnAlvos) do
            if item.Nome == AIM_CONFIG.ParteAlvo then
                item.Btn.BackgroundColor3 = _RGB(60,40,110)
                item.Btn.TextColor3 = _K.PurpleLight; item.Stroke.Color = _K.Purple
            else
                item.Btn.BackgroundColor3 = _RGB(30,30,40)
                item.Btn.TextColor3 = _K.Gray; item.Stroke.Color = _K.Stroke
            end
        end
    end
    for _,nome in ipairs(opcoes) do
        local b = _I("TextButton", btnFrame)
        b.Size = _U2(0.5,-2,1,0); b.BackgroundColor3 = _RGB(30,30,40)
        b.Text = nome; b.TextColor3 = _K.Gray; b.Font = _GB
        b.TextSize = 10; b.BorderSizePixel = 0; b.AutoButtonColor = false
        Corner(b,6); local s = Stroke(b,_K.Stroke,1)
        table.insert(btnAlvos,{Btn=b,Nome=nome,Stroke=s})
        b.MouseButton1Click:Connect(function() AIM_CONFIG.ParteAlvo = nome; atualizarAlvos() end)
    end
    atualizarAlvos()
    UI.Slider(aimCard, 4, "Tamanho FOV", AIM_CONFIG.FOV, 20, 200, false, function(v) AIM_CONFIG.FOV = v end)
    UI.Slider(aimCard, 5, "Transparência", AIM_CONFIG.RingTransparency, 0, 1, true, function(v) AIM_CONFIG.RingTransparency = v end)
    local coresWrap = _I("Frame", aimCard)
    coresWrap.Size = _U2(1,0,0,34); coresWrap.BackgroundTransparency = 1; coresWrap.LayoutOrder = 6
    local coresLbl = _I("TextLabel", coresWrap)
    coresLbl.BackgroundTransparency = 1; coresLbl.Position = _UO(0,0)
    coresLbl.Size = _U2(1,0,0,14); coresLbl.Text = "Cor do FOV"
    coresLbl.TextColor3 = _K.Gray; coresLbl.Font = _GM
    coresLbl.TextSize = 10; coresLbl.TextXAlignment = _XL
    local coresInner = _I("Frame", coresWrap)
    coresInner.Position = _UO(0,18); coresInner.Size = _U2(1,0,0,16)
    coresInner.BackgroundTransparency = 1
    local cil = _I("UIListLayout", coresInner)
    cil.FillDirection = Enum.FillDirection.Horizontal
    cil.Padding = _UD(0,4); cil.Parent = coresInner
    local coresLista = {
        _RGB(150,80,255),_RGB(255,0,0),_RGB(0,255,100),
        _RGB(255,200,0),_RGB(0,200,255),_RGB(255,0,255),_RGB(255,255,255)
    }
    for _,cor in ipairs(coresLista) do
        local b = _I("TextButton", coresInner)
        b.Size = _UO(16,16); b.BackgroundColor3 = cor; b.BorderSizePixel = 0
        b.Text = ""; b.AutoButtonColor = false; Corner(b,4); Stroke(b,_K.Stroke,1)
        b.MouseButton1Click:Connect(function() AIM_CONFIG.Cor = cor end)
    end
    Content.CanvasPosition = _V2()
    Transp_Reaplicar()
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
    PG:SetAttribute("ZKYArm",tok)
    local function vivo() return PG:GetAttribute("ZKYArm")==tok end
    local function ehVerde(c)
        if not c then return false end
        return c.G>0.2 and c.G>c.R*1.1 and c.G>c.B*1.1
    end
    local function limpar(obj)
        if not obj or not obj.Parent then return end
        if obj:IsA("Frame") then
            local area=obj.AbsoluteSize.X*obj.AbsoluteSize.Y
            if ehVerde(obj.BackgroundColor3) or obj.BackgroundColor3==_RGB(0,0,0) then
                obj.BackgroundColor3=area>30000 and AC.Fundo or AC.Card
            end
            if area>5000 then
                if not obj:FindFirstChildOfClass("UICorner") then
                    _I("UICorner",obj).CornerRadius=_UD(0,10)
                end
                local s=obj:FindFirstChildOfClass("UIStroke")
                if not s then s=_I("UIStroke",obj) end
                if ehVerde(s.Color) or s.Transparency>0.5 then
                    s.Color=AC.Borda; s.Thickness=1; s.Transparency=0.4
                end
            end
        elseif obj:IsA("ScrollingFrame") then
            obj.BorderSizePixel=0; obj.ScrollBarImageColor3=AC.Borda
            if ehVerde(obj.BackgroundColor3) then obj.BackgroundColor3=AC.Fundo end
        elseif obj:IsA("TextLabel") then
            if ehVerde(obj.TextColor3) then obj.TextColor3=AC.Texto end
        elseif obj:IsA("TextButton") then
            if ehVerde(obj.BackgroundColor3) then obj.BackgroundColor3=AC.Verde end
            if ehVerde(obj.TextColor3) then obj.TextColor3=Color3.new(1,1,1) end
            if not obj:FindFirstChildOfClass("UICorner") then
                _I("UICorner",obj).CornerRadius=_UD(0,6)
            end
        elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            if ehVerde(obj.BackgroundColor3) then obj.BackgroundColor3=AC.Card end
        end
    end
    local function aplicarTema(gui)
        if not gui or not gui.Parent then return end
        for _,obj in ipairs(gui:GetDescendants()) do pcall(limpar,obj) end
        if not gui:FindFirstChild("AkiraMark") then
            local m=_I("TextLabel",gui)
            m.Name="AkiraMark" m.Size=_U2(1,-20,0,16)
            m.Position=_U2(0,10,1,-18) m.BackgroundTransparency=1
            m.Text="⚡ by Akira" m.TextColor3=AC.Borda m.Font=_GB
            m.TextSize=11 m.ZIndex=200
        end
    end
    local function acharGui(nome)
        for _,g in ipairs(PG:GetChildren()) do
            if g:IsA("ScreenGui") and g.Name==nome then return g end
        end
        for _,g in ipairs(PG:GetDescendants()) do
            if g:IsA("ScreenGui") and g.Name==nome then return g end
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
            local g=obter("GunShopGui")
            if g and g~=monitoradas.GunShopGui then
                monitoradas.GunShopGui=g
                g:GetPropertyChangedSignal("Enabled"):Connect(function()
                    if g.Enabled then task.wait(0.15) aplicarTema(g) end
                end)
            end
        end
    end)
    task.spawn(function()
        while vivo() do
            task.wait(0.8)
            local g=obter("GunShopGui")
            if g and g.Enabled then pcall(aplicarTema,g) end
        end
    end)
    local function abrirLoja()
        local g=obter("GunShopGui")
        if not g then Notify("ERRO","Loja não encontrada.","Error"); return end
        g.Enabled=true; task.wait(0.15); aplicarTema(g)
    end
    ShowLoja=function()
        CurrentPage="Loja"
        ClearContent()
        local card = UI.Card(_CH, 0, "🔫 Loja de Armas")
        local lbl = _I("TextLabel", card)
        lbl.Size = _U2(1,0,0,40); lbl.BackgroundTransparency = 1
        lbl.Text = "Abre a loja de armas do jogo com visual dark."
        lbl.TextColor3 = _K.Gray; lbl.Font = _GM; lbl.TextSize = 10
        lbl.TextWrapped = true; lbl.TextXAlignment = _XL
        lbl.TextYAlignment = Enum.TextYAlignment.Top; lbl.LayoutOrder = 1
        UI.ActionButton(card, 2, "▶ Abrir Loja", _RGB(30,30,40), abrirLoja)
        Content.CanvasPosition=_V2()
        Transp_Reaplicar()
    end
end

-- =========================================================================
-- EXTRA
-- =========================================================================
local ExtraSubPage = "Visual"

local ExtraState = {
    FullbrightAtivo = false,
    ZoomUnlocked = false, ZoomMaxOriginal = nil, ZoomMinOriginal = nil,
    LightOriginal = nil,
    ShaderAtual = "Nenhum",
    FPSBoosterAtivo = false,
    DuploPulo = false,
    VelocidadeAtiva = false, VelocidadeValor = 24,
    InfiniteJump = false,
    ESPAtivo = false,
    ESPNome = true, ESPDistancia = true, ESPVida = false,
    ESPCaixa = false, ESPEsqueleto = false, ESPHighlight = true,
    ESPCor = _RGB(255, 80, 80),
    AntiAFK = false
}

local _FPS = 0
task.spawn(function()
    local count, lastT = 0, tick()
    while true do
        R.RenderStepped:Wait()
        count += 1
        local now = tick()
        if now - lastT >= 1 then _FPS = count; count = 0; lastT = now end
    end
end)

local ShaderInstancias = {}
local function limparShaders()
    for _, inst in ipairs(ShaderInstancias) do
        pcall(function() inst:Destroy() end)
    end
    ShaderInstancias = {}
end

local function aplicarShader(tipo)
    limparShaders()
    ExtraState.ShaderAtual = tipo
    if tipo == "Nenhum" or not tipo then return end
    local L = game:GetService("Lighting")
    local function novo(cls, props)
        local inst = _I(cls, L)
        inst.Name = "ZKY_Shader"
        for k, v in pairs(props or {}) do
            pcall(function() inst[k] = v end)
        end
        table.insert(ShaderInstancias, inst)
        return inst
    end
    if tipo == "Realista V1" then
        novo("ColorCorrectionEffect", { Saturation = 0.08, Contrast = 0.05, Brightness = 0, TintColor = _RGB(255, 252, 245) })
        novo("BloomEffect", { Intensity = 0.25, Size = 16, Threshold = 1.2 })
        novo("SunRaysEffect", { Intensity = 0.03, Spread = 0.7 })
    elseif tipo == "Cinematográfico V2" then
        novo("ColorCorrectionEffect", { Saturation = 0.05, Contrast = 0.12, Brightness = -0.01, TintColor = _RGB(255, 245, 235) })
        novo("BloomEffect", { Intensity = 0.5, Size = 20, Threshold = 1.05 })
        novo("BlurEffect", { Size = 2 })
        novo("SunRaysEffect", { Intensity = 0.05, Spread = 0.9 })
    elseif tipo == "Synthwave V3" then
        novo("ColorCorrectionEffect", { Saturation = 0.35, Contrast = 0.15, Brightness = 0.02, TintColor = _RGB(255, 210, 245) })
        novo("BloomEffect", { Intensity = 0.8, Size = 28, Threshold = 0.95 })
    elseif tipo == "Neon V4" then
        novo("ColorCorrectionEffect", { Saturation = 0.4, Contrast = 0.18, Brightness = 0.05, TintColor = _RGB(210, 245, 255) })
        novo("BloomEffect", { Intensity = 0.9, Size = 32, Threshold = 0.85 })
    elseif tipo == "Anaglyph V5" then
        novo("ColorCorrectionEffect", { Saturation = -0.25, Contrast = 0.12, Brightness = 0, TintColor = _RGB(255, 240, 240) })
        novo("BloomEffect", { Intensity = 0.4, Size = 18, Threshold = 1.1 })
    elseif tipo == "Frio/Céu" then
        novo("ColorCorrectionEffect", { Saturation = 0.02, Contrast = 0.05, Brightness = 0.01, TintColor = _RGB(230, 242, 255) })
        novo("BloomEffect", { Intensity = 0.3, Size = 18, Threshold = 1.15 })
    elseif tipo == "Quente/Sépia" then
        novo("ColorCorrectionEffect", { Saturation = 0.12, Contrast = 0.06, Brightness = 0.01, TintColor = _RGB(255, 242, 225) })
        novo("BloomEffect", { Intensity = 0.25, Size = 14, Threshold = 1.2 })
    elseif tipo == "Clean/Nítido" then
        novo("ColorCorrectionEffect", { Saturation = 0.1, Contrast = 0.08, Brightness = 0.02, TintColor = _RGB(255, 255, 255) })
    end
end

-- =========================================================================
-- FPS BOOSTER AGRESSIVO
-- =========================================================================
local FPSOriginais = {}

local function ativarFPSBooster()
    FPSOriginais = {}
    local L = game:GetService("Lighting")

    FPSOriginais.Lighting = {
        GlobalShadows = L.GlobalShadows,
        Brightness = L.Brightness,
        Ambient = L.Ambient,
        OutdoorAmbient = L.OutdoorAmbient,
        EnvironmentDiffuseScale = L.EnvironmentDiffuseScale,
        EnvironmentSpecularScale = L.EnvironmentSpecularScale,
        FogEnd = L.FogEnd,
        FogStart = L.FogStart,
        FogColor = L.FogColor
    }

    pcall(function()
        L.GlobalShadows = false
        L.EnvironmentDiffuseScale = 0
        L.EnvironmentSpecularScale = 0
        L.FogEnd = 1000000
        L.FogStart = 1000000
    end)

    for _, ef in ipairs(L:GetChildren()) do
        if ef:IsA("PostEffect") or ef:IsA("Atmosphere") or ef:IsA("Sky") or ef:IsA("Clouds") then
            FPSOriginais[ef] = ef.Enabled
            pcall(function() ef.Enabled = false end)
        end
    end

    local count = 0
    for _, obj in ipairs(workspace:GetDescendants()) do
        local cls = obj.ClassName
        if cls == "ParticleEmitter" or cls == "Trail" or cls == "Smoke"
            or cls == "Fire" or cls == "Sparkles" or cls == "Beam" then
            FPSOriginais[obj] = obj.Enabled
            pcall(function() obj.Enabled = false end)
            count = count + 1
        elseif cls == "Decal" or cls == "Texture" then
            FPSOriginais[obj] = obj.Transparency
            pcall(function() obj.Transparency = 1 end)
            count = count + 1
        elseif cls == "PointLight" or cls == "SpotLight" or cls == "SurfaceLight" then
            FPSOriginais[obj] = obj.Enabled
            pcall(function() obj.Enabled = false end)
            count = count + 1
        end
    end

    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end)

    return count
end

local function desativarFPSBooster()
    local L = game:GetService("Lighting")
    if FPSOriginais.Lighting then
        pcall(function()
            L.GlobalShadows = FPSOriginais.Lighting.GlobalShadows
            L.Brightness = FPSOriginais.Lighting.Brightness
            L.Ambient = FPSOriginais.Lighting.Ambient
            L.OutdoorAmbient = FPSOriginais.Lighting.OutdoorAmbient
            L.EnvironmentDiffuseScale = FPSOriginais.Lighting.EnvironmentDiffuseScale
            L.EnvironmentSpecularScale = FPSOriginais.Lighting.EnvironmentSpecularScale
            L.FogEnd = FPSOriginais.Lighting.FogEnd
            L.FogStart = FPSOriginais.Lighting.FogStart
            L.FogColor = FPSOriginais.Lighting.FogColor
        end)
    end
    for obj, val in pairs(FPSOriginais) do
        if obj ~= "Lighting" and typeof(obj) == "Instance" then
            pcall(function()
                if not obj.Parent then return end
                if obj:IsA("PostEffect") or obj:IsA("Atmosphere") or obj:IsA("Sky") or obj:IsA("Clouds") then
                    obj.Enabled = val
                elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke")
                    or obj:IsA("Fire") or obj:IsA("Sparkles") or obj:IsA("Beam") then
                    obj.Enabled = val
                elseif obj:IsA("Decal") or obj:IsA("Texture") then
                    obj.Transparency = val
                elseif obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
                    obj.Enabled = val
                end
            end)
        end
    end
    FPSOriginais = {}
    pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic end)
end

-- =========================================================================
-- DUPLO PULO + INFINITE JUMP
-- =========================================================================
do
    local canDouble = false
    local usedDouble = false
    task.spawn(function()
        while true do
            task.wait(0.06)
            if not RefreshCharacter() then continue end
            if humanoid.FloorMaterial ~= Enum.Material.Air then
                canDouble = false; usedDouble = false
            elseif not usedDouble and ExtraState.DuploPulo then
                canDouble = true
            end
        end
    end)
    U.JumpRequest:Connect(function()
        if not RefreshCharacter() then return end
        if ExtraState.InfiniteJump then
            humanoid.Jump = true
            pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end)
            return
        end
        if not ExtraState.DuploPulo then return end
        if canDouble and not usedDouble then
            usedDouble = true; canDouble = false
            humanoid.Jump = true
            pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end)
        end
    end)
end

task.spawn(function()
    while true do
        task.wait(0.3)
        if RefreshCharacter() then
            if ExtraState.VelocidadeAtiva then
                pcall(function() humanoid.WalkSpeed = ExtraState.VelocidadeValor end)
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(60)
        if ExtraState.AntiAFK then
            pcall(function()
                local vu = game:GetService("VirtualUser")
                vu:CaptureController(); vu:ClickButton2(Vector2.new())
            end)
        end
    end
end)

-- =========================================================================
-- ESP
-- =========================================================================
local ESP_Storage = {}
local hasDrawing = false
pcall(function()
    if Drawing and Drawing.new then hasDrawing = true end
end)

local SKELETON_R15 = {
    {"Head","UpperTorso"},{"UpperTorso","LowerTorso"},
    {"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},
    {"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},
    {"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},
    {"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"},
}
local SKELETON_R6 = {
    {"Head","Torso"},{"Torso","Left Arm"},{"Torso","Right Arm"},
    {"Torso","Left Leg"},{"Torso","Right Leg"}
}

local function ESP_Limpar(player)
    local d = ESP_Storage[player]
    if not d then return end
    if d.Highlight then pcall(function() d.Highlight:Destroy() end) end
    if d.Billboard then pcall(function() d.Billboard:Destroy() end) end
    if d.Skeleton then
        for _, ln in ipairs(d.Skeleton) do pcall(function() ln:Remove() end) end
    end
    if d.Box then
        for _, ln in ipairs(d.Box) do pcall(function() ln:Remove() end) end
    end
    ESP_Storage[player] = nil
end

local function ESP_Criar(player)
    if player == Pl then return end
    local char = player.Character
    if not char or not char.Parent then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local antigoHL = char:FindFirstChild("ZKY_ESP_HL")
    local antigoBB = char:FindFirstChild("ZKY_ESP_BB")
    if antigoHL then antigoHL:Destroy() end
    if antigoBB then antigoBB:Destroy() end
    local corEsp = ExtraState.ESPCor
    local hl = _I("Highlight")
    hl.Name = "ZKY_ESP_HL"
    hl.Adornee = char
    hl.Archivable = true
    hl.Enabled = ExtraState.ESPHighlight
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.FillColor = corEsp
    hl.FillTransparency = 0.5
    hl.OutlineColor = _RGB(255, 255, 255)
    hl.OutlineTransparency = 0
    hl.Parent = char
    local bb = _I("BillboardGui")
    bb.Name = "ZKY_ESP_BB"
    bb.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    bb.Active = true
    bb.AlwaysOnTop = true
    bb.ExtentsOffset = Vector3.new(0, 3, 0)
    bb.LightInfluence = 1
    bb.Size = _U2(0, 800, 0, 50)
    bb.Parent = char
    local nomeLbl = _I("TextLabel", bb)
    nomeLbl.Name = "Nome"
    nomeLbl.BackgroundTransparency = 1
    nomeLbl.Size = _U2(1, 0, 0.5, 0)
    nomeLbl.Font = _GB
    nomeLbl.TextSize = 16
    nomeLbl.TextColor3 = corEsp
    nomeLbl.TextStrokeTransparency = 0
    nomeLbl.TextStrokeColor3 = _RGB(0, 0, 0)
    nomeLbl.Text = player.Name
    nomeLbl.TextWrapped = true
    local infoLbl = _I("TextLabel", bb)
    infoLbl.Name = "Info"
    infoLbl.BackgroundTransparency = 1
    infoLbl.Position = _U2(0, 0, 0.5, 0)
    infoLbl.Size = _U2(1, 0, 0.5, 0)
    infoLbl.Font = _GM
    infoLbl.TextSize = 14
    infoLbl.TextColor3 = _RGB(255, 255, 255)
    infoLbl.TextStrokeTransparency = 0
    infoLbl.TextStrokeColor3 = _RGB(0, 0, 0)
    infoLbl.Text = ""
    infoLbl.TextWrapped = true
    ESP_Storage[player] = { Highlight = hl, Billboard = bb, Char = char }
end

local function ESP_Atualizar()
    if not ExtraState.ESPAtivo then return end
    local cam = workspace.CurrentCamera
    if not cam then return end
    for _, p in ipairs(P:GetPlayers()) do
        if p ~= Pl then
            local char = p.Character
            local d = ESP_Storage[p]
            if not char or not char.Parent then
                if d then ESP_Limpar(p) end
            else
                if not d or d.Char ~= char then
                    ESP_Limpar(p); ESP_Criar(p); d = ESP_Storage[p]
                end
                if d then
                    if d.Highlight then
                        d.Highlight.Enabled = ExtraState.ESPHighlight
                        d.Highlight.FillColor = ExtraState.ESPCor
                    end
                    if d.Billboard then
                        local nomeLbl = d.Billboard:FindFirstChild("Nome")
                        local infoLbl = d.Billboard:FindFirstChild("Info")
                        if nomeLbl then
                            nomeLbl.Visible = ExtraState.ESPNome
                            nomeLbl.Text = p.Name
                            nomeLbl.TextColor3 = ExtraState.ESPCor
                        end
                        if infoLbl then
                            local partes = {}
                            if ExtraState.ESPDistancia and rootPart and char:FindFirstChild("HumanoidRootPart") then
                                local dist = math.floor((rootPart.Position - char.HumanoidRootPart.Position).Magnitude)
                                table.insert(partes, "Dist: "..dist.."m")
                            end
                            if ExtraState.ESPVida then
                                local hum = char:FindFirstChildOfClass("Humanoid")
                                if hum then table.insert(partes, "❤ "..math.floor(hum.Health)) end
                            end
                            infoLbl.Text = table.concat(partes, "  •  ")
                            infoLbl.Visible = #partes > 0
                        end
                    end
                    if ExtraState.ESPEsqueleto and hasDrawing then
                        if not d.Skeleton then
                            d.Skeleton = {}
                            for i = 1, 15 do
                                local ok, ln = pcall(function() return Drawing.new("Line") end)
                                if ok and ln then
                                    ln.Color = ExtraState.ESPCor; ln.Thickness = 1.5
                                    ln.Transparency = 1; ln.Visible = false
                                    d.Skeleton[i] = ln
                                else break end
                            end
                        end
                        if d.Skeleton then
                            local hum = char:FindFirstChildOfClass("Humanoid")
                            if hum then
                                local bones = (hum.RigType == Enum.HumanoidRigType.R15) and SKELETON_R15 or SKELETON_R6
                                for i, pair in ipairs(bones) do
                                    local p1 = char:FindFirstChild(pair[1])
                                    local p2 = char:FindFirstChild(pair[2])
                                    local ln = d.Skeleton[i]
                                    if p1 and p2 and ln then
                                        local v1, on1 = cam:WorldToViewportPoint(p1.Position)
                                        local v2, on2 = cam:WorldToViewportPoint(p2.Position)
                                        if on1 and on2 then
                                            ln.From = Vector2.new(v1.X, v1.Y); ln.To = Vector2.new(v2.X, v2.Y)
                                            ln.Color = ExtraState.ESPCor; ln.Visible = true
                                        else ln.Visible = false end
                                    elseif ln then ln.Visible = false end
                                end
                            end
                        end
                    else
                        if d.Skeleton then
                            for _, ln in ipairs(d.Skeleton) do pcall(function() ln:Remove() end) end
                            d.Skeleton = nil
                        end
                    end
                    if ExtraState.ESPCaixa and hasDrawing then
                        if not d.Box then
                            d.Box = {}
                            for i = 1, 4 do
                                local ok, ln = pcall(function() return Drawing.new("Line") end)
                                if ok and ln then
                                    ln.Color = ExtraState.ESPCor; ln.Thickness = 1.5
                                    ln.Transparency = 1; ln.Visible = false
                                    d.Box[i] = ln
                                else break end
                            end
                        end
                        if d.Box then
                            local hrp2 = char:FindFirstChild("HumanoidRootPart")
                            if hrp2 then
                                local topPos = hrp2.Position + Vector3.new(0, 3, 0)
                                local botPos = hrp2.Position - Vector3.new(0, 3, 0)
                                local topV, on1 = cam:WorldToViewportPoint(topPos)
                                local botV, on2 = cam:WorldToViewportPoint(botPos)
                                if on1 and on2 then
                                    local h = math.abs(topV.Y - botV.Y); local w = h * 0.55
                                    local x, y = topV.X, topV.Y
                                    local x1, y1 = x - w/2, y
                                    local x2, y2 = x + w/2, y
                                    local x3, y3 = x + w/2, y + h
                                    local x4, y4 = x - w/2, y + h
                                    if d.Box[1] then d.Box[1].From = Vector2.new(x1,y1); d.Box[1].To = Vector2.new(x2,y2); d.Box[1].Visible = true; d.Box[1].Color = ExtraState.ESPCor end
                                    if d.Box[2] then d.Box[2].From = Vector2.new(x2,y2); d.Box[2].To = Vector2.new(x3,y3); d.Box[2].Visible = true; d.Box[2].Color = ExtraState.ESPCor end
                                    if d.Box[3] then d.Box[3].From = Vector2.new(x3,y3); d.Box[3].To = Vector2.new(x4,y4); d.Box[3].Visible = true; d.Box[3].Color = ExtraState.ESPCor end
                                    if d.Box[4] then d.Box[4].From = Vector2.new(x4,y4); d.Box[4].To = Vector2.new(x1,y1); d.Box[4].Visible = true; d.Box[4].Color = ExtraState.ESPCor end
                                else
                                    for _, ln in ipairs(d.Box) do ln.Visible = false end
                                end
                            end
                        end
                    else
                        if d.Box then
                            for _, ln in ipairs(d.Box) do pcall(function() ln:Remove() end) end
                            d.Box = nil
                        end
                    end
                end
            end
        end
    end
    for p in pairs(ESP_Storage) do
        if not p.Parent or p == Pl then ESP_Limpar(p) end
    end
end

task.spawn(function()
    while true do
        task.wait(0.1)
        if ExtraState.ESPAtivo then pcall(ESP_Atualizar)
        else for p in pairs(ESP_Storage) do ESP_Limpar(p) end end
    end
end)
P.PlayerRemoving:Connect(function(p) ESP_Limpar(p) end)

-- =========================================================================
-- PANIC MODE
-- =========================================================================
local function PanicMode()
    ExtraState.ESPAtivo = false
    ExtraState.ESPCaixa = false
    ExtraState.ESPEsqueleto = false
    ExtraState.ESPHighlight = false
    for p in pairs(ESP_Storage) do ESP_Limpar(p) end
    ExtraState.DuploPulo = false
    ExtraState.VelocidadeAtiva = false
    ExtraState.InfiniteJump = false
    ExtraState.AntiAFK = false
    if ExtraState.LightOriginal then
        pcall(function()
            local L = game:GetService("Lighting")
            L.Brightness = ExtraState.LightOriginal.Brightness
            L.ClockTime = ExtraState.LightOriginal.ClockTime
            L.GlobalShadows = ExtraState.LightOriginal.GlobalShadows
            L.Ambient = ExtraState.LightOriginal.Ambient
            L.OutdoorAmbient = ExtraState.LightOriginal.OutdoorAmbient
        end)
        ExtraState.LightOriginal = nil
    end
    ExtraState.FullbrightAtivo = false
    if ExtraState.ZoomMaxOriginal then
        pcall(function()
            Pl.CameraMaxZoomDistance = ExtraState.ZoomMaxOriginal
            Pl.CameraMinZoomDistance = ExtraState.ZoomMinOriginal
        end)
        ExtraState.ZoomMaxOriginal = nil; ExtraState.ZoomMinOriginal = nil
    end
    ExtraState.ZoomUnlocked = false
    limparShaders(); ExtraState.ShaderAtual = "Nenhum"
    if ExtraState.FPSBoosterAtivo then desativarFPSBooster(); ExtraState.FPSBoosterAtivo = false end
    if RefreshCharacter() then pcall(function() humanoid.Health = 0 end) end
    Notify("PANIC", "Tudo desativado + personagem resetado.", "Error")
end

-- =========================================================================
-- SUB-ABAS DO EXTRA
-- =========================================================================
local function extraSalvarLighting()
    if ExtraState.LightOriginal then return end
    local L = game:GetService("Lighting")
    ExtraState.LightOriginal = { Brightness = L.Brightness, ClockTime = L.ClockTime,
        GlobalShadows = L.GlobalShadows, Ambient = L.Ambient, OutdoorAmbient = L.OutdoorAmbient }
end

local function ShowExtraVisualContent()
    local card = UI.Card(_CH, 1, "👁️ Visual")
    UI.Toggle(card, 1, "Unlock Zoom (Sem Limite)", ExtraState.ZoomUnlocked, function(v)
        ExtraState.ZoomUnlocked = v
        if not ExtraState.ZoomMaxOriginal then
            ExtraState.ZoomMaxOriginal = Pl.CameraMaxZoomDistance
            ExtraState.ZoomMinOriginal = Pl.CameraMinZoomDistance
        end
        if v then
            pcall(function()
                Pl.CameraMaxZoomDistance = math.huge
                Pl.CameraMinZoomDistance = 0.5
            end)
            Notify("EXTRA", "Zoom desbloqueado!", "Success")
        else
            pcall(function()
                Pl.CameraMaxZoomDistance = ExtraState.ZoomMaxOriginal
                Pl.CameraMinZoomDistance = ExtraState.ZoomMinOriginal
            end)
            Notify("EXTRA", "Zoom restaurado.", "Orange")
        end
    end)
    local shaderCard = UI.Card(_CH, 2, "🎨 Shaders / Efeitos Visuais")
    local shaderDesc = _I("TextLabel", shaderCard)
    shaderDesc.Size = _U2(1, 0, 0, 0); shaderDesc.AutomaticSize = Enum.AutomaticSize.Y
    shaderDesc.BackgroundTransparency = 1
    shaderDesc.Text = "Efeitos visuais. Clique em 'Nenhum' para desativar."
    shaderDesc.TextColor3 = _K.Gray; shaderDesc.Font = _GM
    shaderDesc.TextSize = 10; shaderDesc.TextWrapped = true
    shaderDesc.TextXAlignment = _XL; shaderDesc.LayoutOrder = 1
    UI.Toggle(shaderCard, 2, "Fullbright (dia/claro)", ExtraState.FullbrightAtivo, function(v)
        ExtraState.FullbrightAtivo = v
        if v then
            extraSalvarLighting()
            pcall(function()
                local L = game:GetService("Lighting")
                L.Brightness = 3; L.ClockTime = 14; L.GlobalShadows = false
                L.Ambient = _RGB(200,200,200); L.OutdoorAmbient = _RGB(200,200,200)
            end)
            Notify("EXTRA", "Fullbright ativado.", "Success")
        else
            if ExtraState.LightOriginal then
                pcall(function()
                    local L = game:GetService("Lighting")
                    L.Brightness = ExtraState.LightOriginal.Brightness
                    L.ClockTime = ExtraState.LightOriginal.ClockTime
                    L.GlobalShadows = ExtraState.LightOriginal.GlobalShadows
                    L.Ambient = ExtraState.LightOriginal.Ambient
                    L.OutdoorAmbient = ExtraState.LightOriginal.OutdoorAmbient
                end)
            end
            Notify("EXTRA", "Fullbright desativado.", "Orange")
        end
    end)
    local shaderOpcoes = { "Nenhum", "Realista V1", "Cinematográfico V2", "Synthwave V3",
        "Neon V4", "Anaglyph V5", "Frio/Céu", "Quente/Sépia", "Clean/Nítido" }
    UI.Dropdown(shaderCard, 3, "Shader Ativo", shaderOpcoes, ExtraState.ShaderAtual, function(op)
        aplicarShader(op)
        Notify("SHADER", op == "Nenhum" and "Shader desativado." or ("Shader '"..op.."' ativado."), op == "Nenhum" and "Orange" or "Success")
    end)
    local fpsCard = UI.Card(_CH, 3, "⚡ FPS Booster")
    local fpsDesc = _I("TextLabel", fpsCard)
    fpsDesc.Size = _U2(1, 0, 0, 0); fpsDesc.AutomaticSize = Enum.AutomaticSize.Y
    fpsDesc.BackgroundTransparency = 1
    fpsDesc.Text = "Remove partículas, efeitos, decals, luzes e texturas. Aumenta muito o FPS."
    fpsDesc.TextColor3 = _K.Gray; fpsDesc.Font = _GM
    fpsDesc.TextSize = 10; fpsDesc.TextWrapped = true
    fpsDesc.TextXAlignment = _XL; fpsDesc.LayoutOrder = 1
    UI.Toggle(fpsCard, 2, "Ativar FPS Booster", ExtraState.FPSBoosterAtivo, function(v)
        ExtraState.FPSBoosterAtivo = v
        if v then
            local count = ativarFPSBooster()
            Notify("FPS", "✅ Ativado! "..count.." objetos otimizados.", "Success")
        else
            desativarFPSBooster()
            Notify("FPS", "FPS Booster desativado.", "Orange")
        end
    end)
end

local function ShowExtraMovimentoContent()
    local card = UI.Card(_CH, 1, "🏃 Movimento")
    UI.Toggle(card, 1, "Duplo Pulo (aperte 2x no ar)", ExtraState.DuploPulo, function(v)
        ExtraState.DuploPulo = v
        Notify("EXTRA", v and "Duplo pulo ativado." or "Duplo pulo desativado.", v and "Success" or "Orange")
    end)
    UI.Toggle(card, 2, "Pulo Infinito (Inf. Jump)", ExtraState.InfiniteJump, function(v)
        ExtraState.InfiniteJump = v
        Notify("EXTRA", v and "Pulo infinito ativado." or "Pulo infinito desativado.", v and "Success" or "Orange")
    end)
    UI.Toggle(card, 3, "Velocidade Customizada", ExtraState.VelocidadeAtiva, function(v)
        ExtraState.VelocidadeAtiva = v
        if not v and RefreshCharacter() then pcall(function() humanoid.WalkSpeed = 16 end) end
        Notify("EXTRA", v and ("Velocidade: "..ExtraState.VelocidadeValor) or "Velocidade padrão.", v and "Success" or "Orange")
    end)
    UI.Slider(card, 4, "Velocidade (WalkSpeed)", ExtraState.VelocidadeValor, 16, 100, false, function(v)
        ExtraState.VelocidadeValor = v
    end)
    local dica = _I("TextLabel", card)
    dica.Size = _U2(1, 0, 0, 0); dica.AutomaticSize = Enum.AutomaticSize.Y
    dica.BackgroundTransparency = 1
    dica.Text = "⚡ Recomendado: até 40. Valores altos podem dar kick."
    dica.TextColor3 = _K.DarkGray; dica.Font = _GM
    dica.TextSize = 9; dica.TextWrapped = true
    dica.TextXAlignment = _XL; dica.LayoutOrder = 5
end

local function ShowExtraESPContent()
    local card = UI.Card(_CH, 1, "👁️ ESP (Jogadores)")
    UI.Toggle(card, 1, "Ativar ESP", ExtraState.ESPAtivo, function(v)
        ExtraState.ESPAtivo = v
        if not v then for p in pairs(ESP_Storage) do ESP_Limpar(p) end end
        Notify("ESP", v and "ESP ativado." or "ESP desativado.", v and "Success" or "Orange")
    end)
    UI.Toggle(card, 2, "Highlight (brilho no corpo)", ExtraState.ESPHighlight, function(v) ExtraState.ESPHighlight = v end)
    UI.Toggle(card, 3, "Nome", ExtraState.ESPNome, function(v) ExtraState.ESPNome = v end)
    UI.Toggle(card, 4, "Distância (m)", ExtraState.ESPDistancia, function(v) ExtraState.ESPDistancia = v end)
    UI.Toggle(card, 5, "Vida (❤)", ExtraState.ESPVida, function(v) ExtraState.ESPVida = v end)
    UI.Toggle(card, 6, "Caixa (Box)", ExtraState.ESPCaixa, function(v) ExtraState.ESPCaixa = v end)
    UI.Toggle(card, 7, "Esqueleto (Skeleton)", ExtraState.ESPEsqueleto, function(v) ExtraState.ESPEsqueleto = v end)
    if not hasDrawing then
        local aviso = _I("TextLabel", card)
        aviso.Size = _U2(1, 0, 0, 0); aviso.AutomaticSize = Enum.AutomaticSize.Y
        aviso.BackgroundTransparency = 1
        aviso.Text = "⚠️ Executor sem Drawing API. 'Caixa' e 'Esqueleto' não vão funcionar."
        aviso.TextColor3 = _K.Orange; aviso.Font = _GM
        aviso.TextSize = 9; aviso.TextWrapped = true
        aviso.TextXAlignment = _XL; aviso.LayoutOrder = 8
    end
    local coresWrap = _I("Frame", card)
    coresWrap.Size = _U2(1, 0, 0, 44); coresWrap.BackgroundTransparency = 1; coresWrap.LayoutOrder = 9
    local lbl = _I("TextLabel", coresWrap)
    lbl.BackgroundTransparency = 1; lbl.Position = _UO(0, 0)
    lbl.Size = _U2(1, 0, 0, 14); lbl.Text = "Cor do ESP"
    lbl.TextColor3 = _K.Gray; lbl.Font = _GM
    lbl.TextSize = 10; lbl.TextXAlignment = _XL
    local coresInner = _I("Frame", coresWrap)
    coresInner.Position = _UO(0, 20); coresInner.Size = _U2(1, 0, 0, 22)
    coresInner.BackgroundTransparency = 1
    local cil = _I("UIListLayout", coresInner)
    cil.FillDirection = Enum.FillDirection.Horizontal
    cil.Padding = _UD(0, 6); cil.Parent = coresInner
    local cores = { _RGB(255, 80, 80), _RGB(80, 255, 120), _RGB(80, 160, 255),
        _RGB(255, 200, 60), _RGB(200, 80, 255), _RGB(255, 255, 255) }
    for _, cor in ipairs(cores) do
        local b = _I("TextButton", coresInner)
        b.Size = _UO(20, 20); b.BackgroundColor3 = cor
        b.BorderSizePixel = 0; b.Text = ""; b.AutoButtonColor = false
        Corner(b, 6); Stroke(b, _K.Stroke, 1)
        b.MouseButton1Click:Connect(function() ExtraState.ESPCor = cor end)
    end
end

local function ShowExtraUtilidadesContent()
    local card = UI.Card(_CH, 1, "🛠️ Utilidades")
    UI.Toggle(card, 1, "Anti-AFK (não kicka por inatividade)", ExtraState.AntiAFK, function(v)
        ExtraState.AntiAFK = v
        Notify("EXTRA", v and "Anti-AFK ativado." or "Anti-AFK desativado.", v and "Success" or "Orange")
    end)
    UI.ActionButton(card, 2, "💀 Resetar Personagem", _RGB(80, 40, 40), function()
        if RefreshCharacter() then
            pcall(function() humanoid.Health = 0 end)
            Notify("EXTRA", "Personagem resetado.", "Success")
        else Notify("EXTRA", "Personagem não encontrado.", "Error") end
    end)
    local panicCard = UI.Card(_CH, 2, "🚨 Modo Pânico")
    local panicDesc = _I("TextLabel", panicCard)
    panicDesc.Size = _U2(1, 0, 0, 0); panicDesc.AutomaticSize = Enum.AutomaticSize.Y
    panicDesc.BackgroundTransparency = 1
    panicDesc.Text = "Desativa TODAS as funções e reseta o personagem de uma vez."
    panicDesc.TextColor3 = _K.Gray; panicDesc.Font = _GM
    panicDesc.TextSize = 10; panicDesc.TextWrapped = true
    panicDesc.TextXAlignment = _XL; panicDesc.TextYAlignment = Enum.TextYAlignment.Top
    panicDesc.LineHeight = 1.4; panicDesc.LayoutOrder = 1
    local panicBtn = UI.ActionButton(panicCard, 2, "🚨 ATIVAR MODO PÂNICO", _RGB(180, 40, 40), function()
        PanicMode()
    end)
    panicBtn.TextSize = 12
end

local function ShowExtraPosicoesContent()
    local descCard = _I("Frame", _CH)
    descCard.Size = _U2(1, 0, 0, 78); descCard.BackgroundColor3 = _RGB(25, 22, 35)
    descCard.BorderSizePixel = 0; descCard.LayoutOrder = 1
    Corner(descCard, 8); Stroke(descCard, _K.Purple, 1.5)
    local descIcon = _I("TextLabel", descCard)
    descIcon.BackgroundTransparency = 1; descIcon.Position = _UO(12, 8)
    descIcon.Size = _UO(30, 30); descIcon.Text = "📍"
    descIcon.TextSize = 20; descIcon.Font = _GB
    descIcon.TextXAlignment = _XC; descIcon.TextYAlignment = Enum.TextYAlignment.Center
    local descText = _I("TextLabel", descCard)
    descText.BackgroundTransparency = 1; descText.Position = _UO(48, 8)
    descText.Size = _U2(1, -60, 0, 62)
    descText.Text = "Salve posições específicas para teleportar rapidamente."
    descText.TextColor3 = _K.White; descText.TextSize = 10
    descText.Font = _GM; descText.TextWrapped = true
    descText.TextXAlignment = _XL; descText.TextYAlignment = Enum.TextYAlignment.Top

    local btnAdd = UI.ActionButton(_CH, 2, "", _K.Success, function() end)
    local function atualizarBotaoAdd()
        if #Persist.posicoes < Persist.limite_posicoes then
            btnAdd.Text = "➕ Adicionar Posição  ("..#Persist.posicoes.."/"..Persist.limite_posicoes..")"
            btnAdd.BackgroundColor3 = _K.Success
        else
            btnAdd.Text = "🚫 Limite atingido  ("..#Persist.posicoes.."/"..Persist.limite_posicoes..")"
            btnAdd.BackgroundColor3 = _RGB(70,70,80)
        end
    end
    atualizarBotaoAdd()

    local container = _I("Frame", _CH)
    container.Size = _U2(1, 0, 0, 0); container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundTransparency = 1; container.LayoutOrder = 3
    local containerLay = _I("UIListLayout", container)
    containerLay.Padding = _UD(0, 7); containerLay.SortOrder = Enum.SortOrder.LayoutOrder
    containerLay.Parent = container

    local placeholder = nil
    local function atualizarPlaceholder()
        if #Persist.posicoes == 0 then
            if not placeholder or not placeholder.Parent then
                placeholder = _I("Frame", container)
                placeholder.Size = _U2(1, 0, 0, 55); placeholder.BackgroundColor3 = _RGB(18,18,24)
                placeholder.BorderSizePixel = 0; placeholder.LayoutOrder = 0
                Corner(placeholder, 8); Stroke(placeholder, _K.Stroke, 1)
                local lbl = _I("TextLabel", placeholder)
                lbl.BackgroundTransparency = 1; lbl.Size = _U2(1, 1, 1, 0)
                lbl.Text = "Nenhuma posição salva ainda."
                lbl.TextColor3 = _K.DarkGray; lbl.Font = _GM
                lbl.TextSize = 10; lbl.TextWrapped = true
                lbl.TextXAlignment = _XC; lbl.TextYAlignment = Enum.TextYAlignment.Center
            end
        else
            if placeholder then placeholder:Destroy(); placeholder = nil end
        end
    end

    local function acharIndice(alvo)
        for j, p in ipairs(Persist.posicoes) do
            if p == alvo then return j end
        end
        return nil
    end

    local function criarCardPosicao(pos, layoutOrder)
        local card = _I("Frame", container)
        card.Size = _U2(1, 0, 0, 94); card.BackgroundColor3 = _RGB(18, 18, 24)
        card.BorderSizePixel = 0; card.LayoutOrder = layoutOrder or 1
        Corner(card, 8); Stroke(card, _K.Stroke, 1)
        local nomeLbl = _I("TextLabel", card)
        nomeLbl.BackgroundTransparency = 1; nomeLbl.Position = _UO(12, 8)
        nomeLbl.Size = _U2(1, -100, 0, 20); nomeLbl.Text = "📍 "..pos.nome
        nomeLbl.TextColor3 = _K.White; nomeLbl.Font = _GB
        nomeLbl.TextSize = 12; nomeLbl.TextXAlignment = _XL
        local btnEdit = _I("TextButton", card)
        btnEdit.AnchorPoint = _V2(1, 0); btnEdit.Position = _U2(1, -44, 0, 8)
        btnEdit.Size = _UO(30, 26); btnEdit.BackgroundColor3 = _RGB(50, 60, 90)
        btnEdit.BorderSizePixel = 0; btnEdit.Text = "✏️"
        btnEdit.TextColor3 = _K.White; btnEdit.Font = _GB
        btnEdit.TextSize = 13; btnEdit.AutoButtonColor = false; Corner(btnEdit, 6)
        local btnDel = _I("TextButton", card)
        btnDel.AnchorPoint = _V2(1, 0); btnDel.Position = _U2(1, -10, 0, 8)
        btnDel.Size = _UO(30, 26); btnDel.BackgroundColor3 = _RGB(120, 40, 40)
        btnDel.BorderSizePixel = 0; btnDel.Text = "🗑️"
        btnDel.TextColor3 = _K.White; btnDel.Font = _GB
        btnDel.TextSize = 13; btnDel.AutoButtonColor = false; Corner(btnDel, 6)
        local coordLbl = _I("TextLabel", card)
        coordLbl.BackgroundTransparency = 1; coordLbl.Position = _UO(12, 32)
        coordLbl.Size = _U2(1, -24, 0, 16)
        coordLbl.Text = string.format("X: %.0f   Y: %.0f   Z: %.0f", pos.x, pos.y, pos.z)
        coordLbl.TextColor3 = _K.DarkGray; coordLbl.Font = _GM
        coordLbl.TextSize = 9; coordLbl.TextXAlignment = _XL
        local btnSave = _I("TextButton", card)
        btnSave.AnchorPoint = _V2(1, 1); btnSave.Position = _U2(0.5, -5, 1, -10)
        btnSave.Size = _U2(0.5, -20, 0, 32); btnSave.BackgroundColor3 = _K.Success
        btnSave.BorderSizePixel = 0; btnSave.Text = "💾 Salvar"
        btnSave.TextColor3 = _K.White; btnSave.Font = _GB
        btnSave.TextSize = 10; btnSave.AutoButtonColor = false; Corner(btnSave, 6)
        local btnIr = _I("TextButton", card)
        btnIr.AnchorPoint = _V2(1, 1); btnIr.Position = _U2(1, -12, 1, -10)
        btnIr.Size = _U2(0.5, -20, 0, 32); btnIr.BackgroundColor3 = _K.Purple
        btnIr.BorderSizePixel = 0; btnIr.Text = "📌 Ir"
        btnIr.TextColor3 = _K.White; btnIr.Font = _GB
        btnIr.TextSize = 10; btnIr.AutoButtonColor = false; Corner(btnIr, 6)
        btnEdit.MouseButton1Click:Connect(function()
            abrirModalEditarNome("✏️ Editar nome da posição", pos.nome, function(novoNome)
                pos.nome = novoNome; nomeLbl.Text = "📍 "..novoNome
                persistSalvar(); Notify("POSIÇÃO", "Nome atualizado: "..novoNome, "Success")
            end)
        end)
        btnDel.MouseButton1Click:Connect(function()
            local idxAtual = acharIndice(pos)
            if not idxAtual then Notify("POSIÇÃO","Já removida.","Orange"); return end
            local nomeRemovido = pos.nome
            table.remove(Persist.posicoes, idxAtual)
            persistSalvar(); card:Destroy()
            atualizarPlaceholder(); atualizarBotaoAdd()
            Notify("POSIÇÃO", "🗑️ '"..nomeRemovido.."' excluída!", "Orange")
        end)
        btnSave.MouseButton1Click:Connect(function()
            if not RefreshCharacter() then Notify("POSIÇÃO","Sem personagem.","Error"); return end
            local cf = rootPart.CFrame
            local rx, ry, rz = cf:ToEulerAnglesXYZ()
            pos.x = cf.Position.X; pos.y = cf.Position.Y; pos.z = cf.Position.Z
            pos.rx = rx; pos.ry = ry; pos.rz = rz
            coordLbl.Text = string.format("X: %.0f   Y: %.0f   Z: %.0f", pos.x, pos.y, pos.z)
            persistSalvar()
            Notify("POSIÇÃO", "💾 '"..pos.nome.."' atualizada!", "Success")
        end)
        btnIr.MouseButton1Click:Connect(function()
            if not RefreshCharacter() then Notify("POSIÇÃO","Sem personagem.","Error"); return end
            local cf = CFrame.new(pos.x, pos.y, pos.z) * CFrame.Angles(pos.rx or 0, pos.ry or 0, pos.rz or 0)
            pcall(function() character:PivotTo(cf) end)
            Notify("POSIÇÃO", "📌 Teleportado para '"..pos.nome.."'", "Success")
        end)
        return card
    end

    btnAdd.MouseButton1Click:Connect(function()
        if #Persist.posicoes >= Persist.limite_posicoes then
            Notify("POSIÇÃO", "Limite atingido.", "Error"); return
        end
        if not RefreshCharacter() then Notify("POSIÇÃO","Sem personagem.","Error"); return end
        local n = #Persist.posicoes + 1
        local cf = rootPart.CFrame
        local rx, ry, rz = cf:ToEulerAnglesXYZ()
        local nova = { nome = "Posição "..n, x = cf.Position.X, y = cf.Position.Y, z = cf.Position.Z,
            rx = rx, ry = ry, rz = rz }
        table.insert(Persist.posicoes, nova); persistSalvar()
        criarCardPosicao(nova, n); atualizarPlaceholder(); atualizarBotaoAdd()
        Notify("POSIÇÃO", "📍 Posição "..n.." adicionada!", "Success")
    end)
    for i, pos in ipairs(Persist.posicoes) do criarCardPosicao(pos, i) end
    atualizarPlaceholder()
end

local function ShowExtra()
    CurrentPage = "Extra"
    ClearContent()
    local hotbar = _I("Frame", _CH)
    hotbar.Size = _U2(1, 0, 0, 30); hotbar.BackgroundTransparency = 1; hotbar.LayoutOrder = 0
    local hbLay = _I("UIListLayout", hotbar)
    hbLay.FillDirection = Enum.FillDirection.Horizontal
    hbLay.Padding = _UD(0, 14)
    hbLay.VerticalAlignment = Enum.VerticalAlignment.Center
    hbLay.Parent = hotbar
    local tabs = {
        {Nome = "Visual", Id = "Visual"}, {Nome = "Movimento", Id = "Movimento"},
        {Nome = "ESP", Id = "ESP"}, {Nome = "Utilidades", Id = "Utilidades"},
        {Nome = "Posições", Id = "Posicoes"}
    }
    for _, tab in ipairs(tabs) do
        local sel = ExtraSubPage == tab.Id
        local b = _I("TextButton", hotbar)
        b.Size = _UO(90, 28); b.BackgroundTransparency = 1; b.Text = tab.Nome
        b.TextColor3 = sel and _K.White or _K.DarkGray
        b.Font = _GB; b.TextSize = 11; b.AutoButtonColor = false
        b.TextXAlignment = Enum.TextXAlignment.Center
        b.MouseButton1Click:Connect(function() ExtraSubPage = tab.Id; ShowExtra() end)
        if sel then
            local line = _I("Frame", b)
            line.AnchorPoint = _V2(0.5, 1); line.Position = _U2(0.5, 0, 1, -2)
            line.Size = _U2(0.6, 0, 0, 2); line.BackgroundColor3 = _K.Purple
            line.BorderSizePixel = 0; Corner(line, 1)
        end
    end
    if ExtraSubPage == "Posicoes" then ShowExtraPosicoesContent()
    elseif ExtraSubPage == "Movimento" then ShowExtraMovimentoContent()
    elseif ExtraSubPage == "ESP" then ShowExtraESPContent()
    elseif ExtraSubPage == "Utilidades" then ShowExtraUtilidadesContent()
    else ShowExtraVisualContent() end
    Content.CanvasPosition = _V2()
    Transp_Reaplicar()
end

-- =========================================================================
-- SISTEMA DE GRAVAÇÃO
-- =========================================================================
local Gravacao = {
    Estado = "idle", Frames = {}, StartGravacao = 0, UltimoFrame = -math.huge,
    MostrarRota = true, GravConn = nil, RepConn = nil, LinhasFolder = nil,
    RotaSelecionada = nil, MAX_FRAMES = 8000, MAX_SEGUNDOS = 600, OnEstadoMudou = {}
}

local function gravNotificarMudanca()
    for _, cb in ipairs(Gravacao.OnEstadoMudou) do pcall(cb) end
end

local function gravClearLines()
    if not Gravacao.LinhasFolder then return end
    for _, o in ipairs(Gravacao.LinhasFolder:GetChildren()) do o:Destroy() end
end

local function gravCreateLine(a, b, cor)
    if not a or not b then return end
    local d = b - a; local dist = d.Magnitude
    if dist < .01 then return end
    if not Gravacao.LinhasFolder then
        Gravacao.LinhasFolder = _I("Folder")
        Gravacao.LinhasFolder.Name = "ZKY_GravacaoLines"
        Gravacao.LinhasFolder.Parent = workspace
    end
    local l = _I("Part")
    l.Name = "GravSeg"; l.Anchored = true; l.CanCollide = false
    l.CanTouch = false; l.CanQuery = false; l.CastShadow = false
    l.Material = Enum.Material.Neon; l.Color = cor or _RGB(150, 110, 240)
    l.Transparency = 0.2; l.Size = Vector3.new(.15, .15, dist)
    l.CFrame = CFrame.lookAt((a + b) / 2, b); l.Parent = Gravacao.LinhasFolder
end

local function gravMostrarLinhas(frames, mostrar, cor)
    gravClearLines()
    if not mostrar then return end
    if not frames or #frames < 2 then return end
    local last = nil
    for _, f in ipairs(frames) do
        local p = Vector3.new(f.x, f.y, f.z)
        if last then gravCreateLine(last, p, cor) end
        last = p
    end
end

local function gravIniciar()
    if Gravacao.Estado == "gravando" then return end
    if not RefreshCharacter() then Notify("GRAVAÇÃO", "Personagem não encontrado.", "Error"); return end
    if Gravacao.RepConn then Gravacao.RepConn:Disconnect(); Gravacao.RepConn = nil end
    Gravacao.Frames = {}; Gravacao.StartGravacao = os.clock()
    Gravacao.UltimoFrame = -math.huge; Gravacao.Estado = "gravando"
    Notify("GRAVAÇÃO", "⏺️ Gravando — faça seus movimentos!", "Success")
    gravNotificarMudanca()
    Gravacao.GravConn = R.Heartbeat:Connect(function()
        if Gravacao.Estado ~= "gravando" then return end
        if not RefreshCharacter() then return end
        if #Gravacao.Frames >= Gravacao.MAX_FRAMES then
            Gravacao.Estado = "idle"
            if Gravacao.GravConn then Gravacao.GravConn:Disconnect(); Gravacao.GravConn = nil end
            Notify("GRAVAÇÃO", "Limite de frames atingido.", "Orange")
            gravNotificarMudanca(); return
        end
        local agora = os.clock()
        if agora - Gravacao.StartGravacao > Gravacao.MAX_SEGUNDOS then
            Gravacao.Estado = "idle"
            if Gravacao.GravConn then Gravacao.GravConn:Disconnect(); Gravacao.GravConn = nil end
            Notify("GRAVAÇÃO", "Tempo máximo atingido.", "Orange")
            gravNotificarMudanca(); return
        end
        if agora - Gravacao.UltimoFrame < (1 / 30) then return end
        Gravacao.UltimoFrame = agora
        local cf = rootPart.CFrame
        local rx, ry, rz = cf:ToEulerAnglesXYZ()
        table.insert(Gravacao.Frames, {
            t = agora - Gravacao.StartGravacao,
            x = cf.Position.X, y = cf.Position.Y, z = cf.Position.Z,
            rx = rx, ry = ry, rz = rz, j = humanoid.Jump
        })
    end)
end

local function gravParar()
    if Gravacao.Estado ~= "gravando" then return end
    if Gravacao.GravConn then Gravacao.GravConn:Disconnect(); Gravacao.GravConn = nil end
    if #Gravacao.Frames >= 2 then
        Gravacao.Estado = "idle"
        local ultimo = Gravacao.Frames[#Gravacao.Frames]
        Notify("GRAVAÇÃO", "⏹️ Parado! "..#Gravacao.Frames.." frames ("..string.format("%.1f", ultimo.t).."s)", "Success")
        if Gravacao.MostrarRota then gravMostrarLinhas(Gravacao.Frames, true, _RGB(80, 210, 125)) end
    else
        Gravacao.Estado = "idle"; Gravacao.Frames = {}
        Notify("GRAVAÇÃO", "Nada foi gravado.", "Orange")
    end
    gravNotificarMudanca()
end

local function gravPararReproducao(silencioso)
    if Gravacao.Estado ~= "reproduzindo" then return end
    Gravacao.Estado = "idle"
    if Gravacao.RepConn then Gravacao.RepConn:Disconnect(); Gravacao.RepConn = nil end
    if RefreshCharacter() then
        pcall(function() rootPart.Anchored = false end)
        humanoid:Move(Vector3.zero, false)
        humanoid.WalkSpeed = 16
        humanoid.JumpPower = 50
        pcall(function() humanoid.AutoRotate = true end)
        pcall(function() humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true) end)
        pcall(function() humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true) end)
        pcall(function() humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true) end)
        pcall(function() humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true) end)
        pcall(function() humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true) end)
        pcall(function() humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true) end)
        pcall(function() humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true) end)
        local animateScript = character and character:FindFirstChild("Animate")
        if animateScript then
            pcall(function() animateScript.Disabled = false end)
        end
    end
    pararAnimacaoAndar()
    if not silencioso then Notify("REPRODUÇÃO", "⏹️ Reprodução parada.", "Orange") end
    gravNotificarMudanca()
end

local function gravReproduzir(frames, nome)
    if Gravacao.Estado == "reproduzindo" then return end
    if Gravacao.Estado == "gravando" then Notify("REPRODUÇÃO", "Pare a gravação antes.", "Error"); return end
    if Playback.Running then Notify("REPRODUÇÃO", "Pare o Auto Parkour antes.", "Error"); return end
    if not frames or #frames < 2 then Notify("REPRODUÇÃO", "Frames insuficientes.", "Error"); return end
    if not RefreshCharacter() then Notify("REPRODUÇÃO", "Personagem não encontrado.", "Error"); return end

    Gravacao.Estado = "reproduzindo"

    local rootAnchoredOriginal = rootPart.Anchored
    local autoRotateOriginal = humanoid.AutoRotate
    local walkSpeedOriginal = humanoid.WalkSpeed
    local jumpPowerOriginal = humanoid.JumpPower

    local animateScript = character:FindFirstChild("Animate")
    if animateScript then
        pcall(function() animateScript.Disabled = true end)
    end

    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then
        animator = _I("Animator")
        animator.Parent = humanoid
    end
    pcall(function()
        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            track:Stop(0)
        end
    end)

    local isR15 = humanoid.RigType == Enum.HumanoidRigType.R15
    local walkAnimId = isR15 and "rbxassetid://507777826" or "rbxassetid://180426354"
    local walkAnim = _I("Animation")
    walkAnim.AnimationId = walkAnimId
    local walkPlaybackTrack = animator:LoadAnimation(walkAnim)
    walkPlaybackTrack.Looped = true
    walkPlaybackTrack.Priority = Enum.AnimationPriority.Movement

    pcall(function() rootPart.Anchored = true end)
    pcall(function() humanoid.AutoRotate = false end)
    humanoid.WalkSpeed = 0
    humanoid.JumpPower = 0

    for _, estado in ipairs({
        Enum.HumanoidStateType.Freefall,
        Enum.HumanoidStateType.FallingDown,
        Enum.HumanoidStateType.Ragdoll,
        Enum.HumanoidStateType.Climbing,
        Enum.HumanoidStateType.Swimming,
        Enum.HumanoidStateType.PlatformStanding,
        Enum.HumanoidStateType.Jumping,
    }) do
        pcall(function() humanoid:SetStateEnabled(estado, false) end)
    end

    task.wait(0.05)
    pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Running) end)
    pcall(function() walkPlaybackTrack:Play(0.1) end)

    local estadoLoopAtivo = true
    task.spawn(function()
        while estadoLoopAtivo and Gravacao.Estado == "reproduzindo" do
            pcall(function()
                if humanoid:GetState() ~= Enum.HumanoidStateType.Running then
                    humanoid:ChangeState(Enum.HumanoidStateType.Running)
                end
            end)
            task.wait(0.15)
        end
    end)

    Notify("REPRODUÇÃO", "▶️ "..(nome or (#frames.." frames")), "Success")
    gravNotificarMudanca()

    local t0 = os.clock()
    local idx = 1
    local maxT = frames[#frames].t
    local ultimaPos = Vector3.new(frames[1].x, frames[1].y, frames[1].z)
    local parado = false

    Gravacao.RepConn = R.RenderStepped:Connect(function()
        if Gravacao.Estado ~= "reproduzindo" then return end
        if not RefreshCharacter() then
            if character and character:FindFirstChild("HumanoidRootPart") then
                rootPart = character.HumanoidRootPart
                pcall(function() rootPart.Anchored = true end)
            else
                estadoLoopAtivo = false
                gravPararReproducao(true); return
            end
        end

        local elapsed = os.clock() - t0
        if elapsed >= maxT then
            estadoLoopAtivo = false
            pcall(function() walkPlaybackTrack:Stop(0.1) end)
            pcall(function() rootPart.Anchored = rootAnchoredOriginal end)
            pcall(function() humanoid.AutoRotate = autoRotateOriginal end)
            humanoid.WalkSpeed = walkSpeedOriginal
            humanoid.JumpPower = jumpPowerOriginal
            for _, estado in ipairs({
                Enum.HumanoidStateType.Freefall,
                Enum.HumanoidStateType.FallingDown,
                Enum.HumanoidStateType.Ragdoll,
                Enum.HumanoidStateType.Climbing,
                Enum.HumanoidStateType.Swimming,
                Enum.HumanoidStateType.PlatformStanding,
                Enum.HumanoidStateType.Jumping,
            }) do
                pcall(function() humanoid:SetStateEnabled(estado, true) end)
            end
            local anim = character and character:FindFirstChild("Animate")
            if anim then pcall(function() anim.Disabled = false end) end
            Gravacao.Estado = "idle"
            if Gravacao.RepConn then Gravacao.RepConn:Disconnect(); Gravacao.RepConn = nil end
            pararAnimacaoAndar()
            Notify("REPRODUÇÃO", "✅ Finalizada!", "Success")
            gravNotificarMudanca()
            return
        end

        while idx < #frames - 1 and elapsed > frames[idx + 1].t do idx = idx + 1 end
        local a = frames[idx]
        local b = frames[idx + 1] or a
        local d = b.t - a.t
        local alpha = d > 0 and math.clamp((elapsed - a.t) / d, 0, 1) or 0

        local pa = Vector3.new(a.x, a.y, a.z)
        local pb = Vector3.new(b.x, b.y, b.z)
        local posAtual = pa:Lerp(pb, alpha)

        local ra = CFrame.Angles(a.rx or 0, a.ry or 0, a.rz or 0)
        local rb = CFrame.Angles(b.rx or 0, b.ry or 0, b.rz or 0)
        local rotAtual = ra:Lerp(rb, alpha)

        local cf = CFrame.new(posAtual + Vector3.new(0, CONFIG.GroundOffset, 0)) * rotAtual
        pcall(function() character:PivotTo(cf) end)

        local delta = (posAtual - ultimaPos).Magnitude
        local movendo = delta > 0.005
        if not movendo and not parado then
            parado = true
            pcall(function() walkPlaybackTrack:Stop(0.1) end)
        elseif movendo and parado then
            parado = false
            pcall(function() walkPlaybackTrack:Play(0.1) end)
        end

        ultimaPos = posAtual
    end)
end

-- =========================================================================
-- ABA: GRAVAR ROTA
-- =========================================================================
local GravarRotaAbaAtiva = false

local function ShowGravarRota()
    CurrentPage = "GravarRota"
    GravarRotaAbaAtiva = true
    ClearContent()
    Gravacao.OnEstadoMudou = {}
    local col1, col2 = CreateTwoColumns(_CH, 0)
    local colEsq = _I("Frame", col1)
    colEsq.Size = _U2(1, 0, 0, 0); colEsq.AutomaticSize = Enum.AutomaticSize.Y
    colEsq.BackgroundTransparency = 1; colEsq.LayoutOrder = 1
    local colEsqLay = _I("UIListLayout", colEsq)
    colEsqLay.Padding = _UD(0, 12); colEsqLay.SortOrder = Enum.SortOrder.LayoutOrder
    colEsqLay.Parent = colEsq

    local btnPrincipal = _I("TextButton", colEsq)
    btnPrincipal.Size = _U2(1, 0, 0, 58); btnPrincipal.BorderSizePixel = 0
    btnPrincipal.TextColor3 = _K.White; btnPrincipal.Font = _GB
    btnPrincipal.TextSize = 15; btnPrincipal.AutoButtonColor = false
    btnPrincipal.LayoutOrder = 1; Corner(btnPrincipal, 10)
    local btnPrincipalStroke = Stroke(btnPrincipal, _K.Success, 2)
    local function updateBotaoPrincipal()
        if Gravacao.Estado == "gravando" then
            btnPrincipal.Text = "⏹️  PARAR GRAVAÇÃO"
            btnPrincipal.BackgroundColor3 = _RGB(160, 40, 40)
            btnPrincipalStroke.Color = _K.Error
        elseif Gravacao.Estado == "reproduzindo" then
            btnPrincipal.Text = "⏹️  PARAR REPRODUÇÃO"
            btnPrincipal.BackgroundColor3 = _RGB(160, 40, 40)
            btnPrincipalStroke.Color = _K.Error
        else
            btnPrincipal.Text = "⏺️  INICIAR GRAVAÇÃO"
            btnPrincipal.BackgroundColor3 = _RGB(40, 150, 80)
            btnPrincipalStroke.Color = _K.Success
        end
    end
    updateBotaoPrincipal()
    btnPrincipal.MouseButton1Click:Connect(function()
        if Gravacao.Estado == "gravando" then gravParar()
        elseif Gravacao.Estado == "reproduzindo" then gravPararReproducao()
        else gravIniciar() end
        updateBotaoPrincipal()
    end)
    table.insert(Gravacao.OnEstadoMudou, updateBotaoPrincipal)

    local cardTemp = UI.Card(colEsq, 2, "📼 Rotas Temporárias")
    local infoLbl = _I("TextLabel", cardTemp)
    infoLbl.Size = _U2(1, 0, 0, 16); infoLbl.BackgroundTransparency = 1
    infoLbl.Text = "Nenhuma gravação."; infoLbl.TextColor3 = _K.DarkGray
    infoLbl.Font = _GM; infoLbl.TextSize = 10
    infoLbl.TextXAlignment = _XL; infoLbl.LayoutOrder = 0
    local function updateInfo()
        if #Gravacao.Frames >= 2 then
            local u = Gravacao.Frames[#Gravacao.Frames]
            infoLbl.Text = string.format("📊 %d frames  •  %.1fs  •  %s",
                #Gravacao.Frames, u.t,
                Gravacao.Estado == "gravando" and "gravando..." or "pronto")
            infoLbl.TextColor3 = Gravacao.Estado == "gravando" and _K.Error or _K.Success
        else
            infoLbl.Text = Gravacao.Estado == "gravando" and "⏺️ gravando..." or "Nenhuma gravação."
            infoLbl.TextColor3 = Gravacao.Estado == "gravando" and _K.Error or _K.DarkGray
        end
    end
    updateInfo()
    table.insert(Gravacao.OnEstadoMudou, updateInfo)
    task.spawn(function()
        while GravarRotaAbaAtiva and infoLbl.Parent do
            task.wait(0.25)
            if not infoLbl.Parent then break end
            if Gravacao.Estado == "gravando" then updateInfo() end
        end
    end)
    UI.Toggle(cardTemp, 1, "Mostrar Rota", Gravacao.MostrarRota, function(v)
        Gravacao.MostrarRota = v
        if v and #Gravacao.Frames >= 2 then gravMostrarLinhas(Gravacao.Frames, true, _RGB(80, 210, 125))
        else gravClearLines() end
    end)
    local btnRepTemp = UI.ActionButton(cardTemp, 2, "▶️ Reproduzir / Parar", _RGB(40, 40, 55), function()
        if Gravacao.Estado == "reproduzindo" then gravPararReproducao()
        elseif Gravacao.Estado == "gravando" then Notify("REPRODUÇÃO", "Pare a gravação antes.", "Error")
        else
            if #Gravacao.Frames < 2 then Notify("REPRODUÇÃO", "Grave algo primeiro!", "Error"); return end
            gravReproduzir(Gravacao.Frames, "temporária")
        end
        updateBotaoPrincipal()
    end)
    local function updateBtnRepTemp()
        if Gravacao.Estado == "reproduzindo" then
            btnRepTemp.Text = "⏹️ Parar Reprodução"; btnRepTemp.BackgroundColor3 = _K.Error
        else
            btnRepTemp.Text = "▶️ Reproduzir / Parar"; btnRepTemp.BackgroundColor3 = _RGB(40, 40, 55)
        end
    end
    updateBtnRepTemp()
    table.insert(Gravacao.OnEstadoMudou, updateBtnRepTemp)

    local nomeBox = UI.TextBox(cardTemp, 3, "Nome da Rota", "Vazio = Automático", "", function() end)

    UI.ActionButton(cardTemp, 4, "💾 Salvar Rota", _K.Success, function()
        if #Gravacao.Frames < 2 then Notify("SALVAR", "Grave algo primeiro!", "Error"); return end
        if #Persist.rotas_salvas >= 30 then Notify("SALVAR", "Limite de 30 rotas atingido.", "Error"); return end
        local nome = nomeBox.Text:gsub("^%s+",""):gsub("%s+$","")
        if nome == "" then nome = "Rota "..(#Persist.rotas_salvas + 1) end
        for _, r in ipairs(Persist.rotas_salvas) do
            if r.nome == nome then Notify("SALVAR", "Já existe rota '"..nome.."'.", "Error"); return end
        end
        local copia = {}
        for i, f in ipairs(Gravacao.Frames) do
            copia[i] = { t = f.t, x = f.x, y = f.y, z = f.z,
                rx = f.rx or 0, ry = f.ry or 0, rz = f.rz or 0, j = f.j and true or false }
        end
        table.insert(Persist.rotas_salvas, { nome = nome, frames = copia })
        persistSalvar(); Gravacao.Frames = {}; gravClearLines()
        Notify("SALVAR", "✅ Rota '"..nome.."' salva! ("..#copia.." frames)", "Success")
        task.defer(function()
            task.wait(0.05)
            if CurrentPage == "GravarRota" then ShowGravarRota() end
        end)
    end)

    UI.ActionButton(cardTemp, 5, "🗑️ Descartar Gravação", _RGB(80, 40, 40), function()
        if #Gravacao.Frames == 0 then Notify("GRAVAÇÃO", "Nada pra descartar.", "Orange"); return end
        Gravacao.Frames = {}; gravClearLines()
        Notify("GRAVAÇÃO", "Gravação descartada.", "Orange")
        task.defer(function()
            task.wait(0.05)
            if CurrentPage == "GravarRota" then ShowGravarRota() end
        end)
    end)

    local cardSalvas = UI.Card(colEsq, 3, "📁 Rotas Salvas ("..#Persist.rotas_salvas..")")

    if #Persist.rotas_salvas == 0 then
        local vazio = _I("TextLabel", cardSalvas)
        vazio.Size = _U2(1, 0, 0, 30); vazio.BackgroundTransparency = 1
        vazio.Text = "Nenhuma rota salva ainda."; vazio.TextColor3 = _K.DarkGray
        vazio.Font = _GM; vazio.TextSize = 10; vazio.LayoutOrder = 1
    else
        local nomes = {}
        for _, r in ipairs(Persist.rotas_salvas) do table.insert(nomes, r.nome) end
        local selAtual = Gravacao.RotaSelecionada or nomes[1]
        if not table.find(nomes, selAtual) then selAtual = nomes[1] end
        Gravacao.RotaSelecionada = selAtual
        UI.Dropdown(cardSalvas, 1, "Selecionar Rota", nomes, selAtual, function(op)
            Gravacao.RotaSelecionada = op; gravClearLines()
        end)
        local btnExec = UI.ActionButton(cardSalvas, 2, "▶️ Iniciar / Parar", _K.Purple, function()
            if Gravacao.Estado == "reproduzindo" then gravPararReproducao(); updateBotaoPrincipal(); return end
            if Gravacao.Estado == "gravando" then Notify("REPRODUÇÃO", "Pare a gravação antes.", "Error"); return end
            local sel = Gravacao.RotaSelecionada
            if not sel then Notify("EXECUTAR", "Selecione uma rota.", "Error"); return end
            local rota = nil
            for _, r in ipairs(Persist.rotas_salvas) do
                if r.nome == sel then rota = r; break end
            end
            if not rota then Notify("EXECUTAR", "Rota não encontrada.", "Error"); return end
            gravReproduzir(rota.frames, rota.nome); updateBotaoPrincipal()
        end)
        local function updateBtnExec()
            if Gravacao.Estado == "reproduzindo" then
                btnExec.Text = "⏹️ Parar"; btnExec.BackgroundColor3 = _K.Error
            else
                btnExec.Text = "▶️ Iniciar / Parar"; btnExec.BackgroundColor3 = _K.Purple
            end
        end
        updateBtnExec()
        table.insert(Gravacao.OnEstadoMudou, updateBtnExec)
        UI.Toggle(cardSalvas, 3, "Ver Rota", false, function(v)
            local sel = Gravacao.RotaSelecionada
            if not sel then if v then Notify("VER ROTA", "Selecione uma rota.", "Error") end return end
            local rota = nil
            for _, r in ipairs(Persist.rotas_salvas) do
                if r.nome == sel then rota = r; break end
            end
            if rota then gravMostrarLinhas(rota.frames, v, _RGB(150, 110, 240)) end
        end)
        local renomeBox = UI.TextBox(cardSalvas, 4, "Renomear Rota", "Novo nome...", "", function() end)
        local linhaBts = _I("Frame", cardSalvas)
        linhaBts.Size = _U2(1, 0, 0, 32); linhaBts.BackgroundTransparency = 1
        linhaBts.LayoutOrder = 5
        local lbLay = _I("UIListLayout", linhaBts)
        lbLay.FillDirection = Enum.FillDirection.Horizontal
        lbLay.Padding = _UD(0, 6); lbLay.Parent = linhaBts
        local btnRen = _I("TextButton", linhaBts)
        btnRen.Size = _U2(0.5, -3, 1, 0); btnRen.BackgroundColor3 = _RGB(50, 60, 90)
        btnRen.BorderSizePixel = 0; btnRen.Text = "✏️ Renomear"
        btnRen.TextColor3 = _K.White; btnRen.Font = _GB
        btnRen.TextSize = 10; btnRen.AutoButtonColor = false
        Corner(btnRen, 6); Stroke(btnRen, _K.Stroke, 1)
        local btnDel = _I("TextButton", linhaBts)
        btnDel.Size = _U2(0.5, -3, 1, 0); btnDel.BackgroundColor3 = _RGB(120, 40, 40)
        btnDel.BorderSizePixel = 0; btnDel.Text = "🗑️ Excluir"
        btnDel.TextColor3 = _K.White; btnDel.Font = _GB
        btnDel.TextSize = 10; btnDel.AutoButtonColor = false
        Corner(btnDel, 6); Stroke(btnDel, _RGB(180, 60, 60), 1)
        btnRen.MouseButton1Click:Connect(function()
            local sel = Gravacao.RotaSelecionada
            if not sel then Notify("RENOMEAR", "Selecione uma rota.", "Error"); return end
            local novo = renomeBox.Text:gsub("^%s+",""):gsub("%s+$","")
            if novo == "" then Notify("RENOMEAR", "Digite o novo nome.", "Error"); return end
            for _, r in ipairs(Persist.rotas_salvas) do
                if r.nome == novo and r.nome ~= sel then Notify("RENOMEAR", "Já existe.", "Error"); return end
            end
            for _, r in ipairs(Persist.rotas_salvas) do
                if r.nome == sel then r.nome = novo; break end
            end
            Gravacao.RotaSelecionada = novo; persistSalvar()
            Notify("RENOMEAR", "✅ '"..novo.."'", "Success")
            task.defer(function()
                task.wait(0.05)
                if CurrentPage == "GravarRota" then ShowGravarRota() end
            end)
        end)
        btnDel.MouseButton1Click:Connect(function()
            local sel = Gravacao.RotaSelecionada
            if not sel then Notify("EXCLUIR", "Selecione uma rota.", "Error"); return end
            for i, r in ipairs(Persist.rotas_salvas) do
                if r.nome == sel then table.remove(Persist.rotas_salvas, i); break end
            end
            Gravacao.RotaSelecionada = nil; persistSalvar(); gravClearLines()
            Notify("EXCLUIR", "🗑️ '"..sel.."' excluída.", "Orange")
            task.defer(function()
                task.wait(0.05)
                if CurrentPage == "GravarRota" then ShowGravarRota() end
            end)
        end)
    end

    local cardAjuda = UI.Card(col2, 1, "💡 Como usar")
    local passos = _I("TextLabel", cardAjuda)
    passos.Size = _U2(1, 0, 0, 0); passos.AutomaticSize = Enum.AutomaticSize.Y
    passos.BackgroundTransparency = 1
    passos.Text = "1. Clique em INICIAR GRAVAÇÃO\n2. Ande, pule, corra pelo mapa\n3. Clique em PARAR GRAVAÇÃO\n4. Dê um nome e clique em Salvar\n5. Selecione a rota e clique em Reproduzir\n\n⚡ A reprodução usa Anchored (física desligada) — sem tremelique, sem lag, com animação de andar normal."
    passos.TextColor3 = _K.Gray; passos.Font = _GM
    passos.TextSize = 10; passos.TextWrapped = true
    passos.TextXAlignment = _XL; passos.TextYAlignment = Enum.TextYAlignment.Top
    passos.LineHeight = 1.4
    Content.CanvasPosition = _V2()
    Transp_Reaplicar()
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

ebDeltaButton.MouseButton1Click:Connect(function() SelectButton(ebDeltaButton) ShowEBDelta() end)
gravarRotaButton.MouseButton1Click:Connect(function() SelectButton(gravarRotaButton) ShowGravarRota() end)
taffsButton.MouseButton1Click:Connect(function() SelectButton(taffsButton) ShowTAFFS() end)
volversButton.MouseButton1Click:Connect(function() SelectButton(volversButton) ShowVolvers() end)
iaButton.MouseButton1Click:Connect(function() SelectButton(iaButton) ShowIA() end)
combateButton.MouseButton1Click:Connect(function() SelectButton(combateButton) ShowCombate() end)
textosButton.MouseButton1Click:Connect(function() SelectButton(textosButton) ShowTextosProntos() end)
creditosButton.MouseButton1Click:Connect(function() SelectButton(creditosButton) ShowCreditos() end)
lojaButton.MouseButton1Click:Connect(function() SelectButton(lojaButton) ShowLoja() end)
extraButton.MouseButton1Click:Connect(function() SelectButton(extraButton) ShowExtra() end)

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
-- CARREGAR ROTAS + ABRIR CRÉDITOS COMO PADRÃO
-- =========================================================================
task.defer(function()
    local loaded=0
    for _,cat in ipairs(CategoryOrder) do
        if LoadCategory(cat) then loaded+=1 end
    end
    local lt1=LoadTowerRoute("Torre 1","Única")
    local lt2=0
    for _,rn in ipairs(Tower2RouteOrder) do
        if LoadTowerRoute("Torre 2",rn) then lt2+=1 end
    end
    ShowCreditos()
    Notify("ZKY PARKOUR",loaded.."/4 parkours • Torre 1: "..(lt1 and "OK" or "ERRO").." • Torre 2: "..lt2.."/4",
        loaded==4 and lt1 and lt2==4 and "Success" or "Error")

    if SUPORTA_SALVAR then
        task.wait(0.5)
        Notify("PERSISTÊNCIA","💾 "..#Persist.posicoes.." posições • "..#Persist.rotas_salvas.." rotas","Success")
    else
        task.wait(0.5)
        Notify("PERSISTÊNCIA","⚠️ Executor não suporta salvar.","Orange")
    end
end)

print("AKIRA MENU V2.3.6 carregado!")