_G.ZKY_OK=false
do
    local KEY="Akira007"
    local LINK="https://discord.gg/NY2RfC7Kx"
    local g=Instance.new("ScreenGui")
    g.Name="ZKYKey" g.ResetOnSpawn=false
    pcall(function() g.Parent=(gethui and gethui()) or game:GetService("CoreGui") end)
    if not g.Parent then g.Parent=game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") end
    local f=Instance.new("Frame",g) f.Size=UDim2.new(0,280,0,220) f.Position=UDim2.new(0.5,-140,0.5,-110) f.BackgroundColor3=Color3.fromRGB(20,20,25)
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,10)
    local t=Instance.new("TextLabel",f) t.Size=UDim2.new(1,0,0,36) t.BackgroundTransparency=1 t.Text="ZKY PARKOUR - KEY" t.TextColor3=Color3.new(1,1,1) t.Font=Enum.Font.GothamBold t.TextSize=16
    local box=Instance.new("TextBox",f) box.Size=UDim2.new(1,-30,0,34) box.Position=UDim2.new(0,15,0,42) box.BackgroundColor3=Color3.fromRGB(35,35,42) box.TextColor3=Color3.new(1,1,1) box.PlaceholderText="Cole a key aqui" box.Text="" box.ClearTextOnFocus=false box.Font=Enum.Font.Gotham box.TextSize=14
    Instance.new("UICorner",box).CornerRadius=UDim.new(0,8)
    local a=Instance.new("TextLabel",f) a.Size=UDim2.new(1,-30,0,40) a.Position=UDim2.new(0,15,0,84) a.BackgroundTransparency=1 a.Text="Pra pegar a key, entre no Discord" a.TextColor3=Color3.fromRGB(180,180,180) a.Font=Enum.Font.Gotham a.TextSize=12 a.TextWrapped=true
    local bp=Instance.new("TextButton",f) bp.Size=UDim2.new(1,-30,0,34) bp.Position=UDim2.new(0,15,0,128) bp.BackgroundColor3=Color3.fromRGB(88,101,242) bp.Text="Pegar Key" bp.TextColor3=Color3.new(1,1,1) bp.Font=Enum.Font.GothamBold bp.TextSize=14
    Instance.new("UICorner",bp).CornerRadius=UDim.new(0,8)
    local bc=Instance.new("TextButton",f) bc.Size=UDim2.new(1,-30,0,34) bc.Position=UDim2.new(0,15,0,168) bc.BackgroundColor3=Color3.fromRGB(50,170,90) bc.Text="Check Key" bc.TextColor3=Color3.new(1,1,1) bc.Font=Enum.Font.GothamBold bc.TextSize=14
    Instance.new("UICorner",bc).CornerRadius=UDim.new(0,8)
    local st=Instance.new("TextLabel",f) st.Size=UDim2.new(1,-20,0,18) st.Position=UDim2.new(0,10,1,-20) st.BackgroundTransparency=1 st.Text="" st.TextColor3=Color3.fromRGB(200,200,200) st.Font=Enum.Font.Gotham st.TextSize=11
    bp.MouseButton1Click:Connect(function() pcall(function() setclipboard(LINK) end) pcall(function() game:GetService("GuiService"):OpenBrowserWindow(LINK) end) st.Text="Link copiado!" end)
    bc.MouseButton1Click:Connect(function() if box.Text:gsub("%s",""):lower()==KEY:lower() then _G.ZKY_OK=true g:Destroy() else st.Text="Key inválida." end end)
end
repeat task.wait() until _G.ZKY_OK

local _I,_U2,_UO,_UD,_RGB,_V2=Instance.new,UDim2.new,UDim2.fromOffset,UDim.new,Color3.fromRGB,Vector2.new
local GB,GM,XL,XC=Enum.Font.GothamBold,Enum.Font.GothamMedium,Enum.TextXAlignment.Left,Enum.TextXAlignment.Center
local P=game:GetService("Players") local T=game:GetService("TweenService") local U=game:GetService("UserInputService") local R=game:GetService("RunService")
local HS=game:GetService("HttpService") local TCS=game:GetService("TextChatService") local RS=game:GetService("ReplicatedStorage") local Pl=P.LocalPlayer
local PG=Pl:WaitForChild("PlayerGui")
local char,hum,hrp
local CFG={LineThickness=.15,LineTransparency=.2,LineColor=_RGB(255,145,45),JumpCooldown=.28,PlaybackSpeed=1,WalkToSpeed=16,GroundOffset=1.66}
local PK={Modo="Dummy"}
local IAC={ApiKey="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",Endpoint="https://api.groq.com/openai/v1/chat/completions",Modelo="openai/gpt-oss-120b",Timeout=10,
SystemPrompt="Você é um corretor gramatical extremamente rigoroso de português do Brasil. Corrija TODOS os erros da mensagem do usuário, sem deixar passar nenhum, incluindo: letras maiúsculas no início de frases e em nomes próprios; todos os acentos gráficos (agudo, circunflexo, til, crase) e a cedilha; toda a pontuação, como vírgulas, pontos finais, pontos de interrogação e de exclamação; concordância verbal e nominal; ortografia e separação de palavras. Não deixe nenhuma palavra sem acento ou sem maiúscula onde for necessário, nem nenhuma frase sem pontuação final. Não resuma, não reescreva o estilo, não mude o significado, o tom nem o tamanho da mensagem: apenas corrija a gramática, a ortografia e a pontuação, mantendo as mesmas palavras sempre que possível. Responda APENAS com a mensagem corrigida, sem explicações, aspas, comentários extras ou qualquer texto adicional."}
local IAT={ApiKey="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",Endpoint="https://api.groq.com/openai/v1/chat/completions",Modelo="openai/gpt-oss-120b",Timeout=15,
SystemPrompt="Você é um militar do Exército Brasileiro em um jogo de Roblox (roleplay militar). Escreva um texto curto, humano, gramaticalmente correto e patriótico sobre o tema fornecido. REGRAS OBRIGATÓRIAS: (1) O texto DEVE ter entre 130 e 180 caracteres, contando espaços. (2) No máximo 2 frases curtas. (3) Sem saudações, sem aspas, sem emojis, sem formatação. (4) Tom realista e militar, não exagerado nem infantil. (5) Responda APENAS com o texto final, nada mais."}
local http=request or(syn and syn.request) or(http and http.request) or http_request
local PB={Lento="https://pastebin.com/raw/M7DvRgTc",["Rápido"]="https://pastebin.com/raw/pBk8vYXE",["Mais Rápido"]="https://pastebin.com/raw/yz7gZmYr",["Sem Burla"]="https://pastebin.com/raw/N1j0iRDA"}
local CAT={"Lento","Rápido","Mais Rápido","Sem Burla"}
local TPB={["Torre 1"]={["Única"]="https://pastebin.com/raw/HxXb4Mr3"},["Torre 2"]={Frente="https://pastebin.com/raw/Y2arCYHb",["Atrás"]="https://pastebin.com/raw/rXxZX7CQ",Esquerda="https://pastebin.com/raw/FtpTHhGt",Direita="https://pastebin.com/raw/4u5Wjtkg"}}
local T2RO={"Frente","Atrás","Esquerda","Direita"}
local routes={Lento={},["Rápido"]={},["Mais Rápido"]={},["Sem Burla"]={}}
local tRoutes={["Torre 1"]={},["Torre 2"]={Frente={},["Atrás"]={},Esquerda={},Direita={}}}
local selCat,expPk={},{} local selT2="Frente" local expT2=false
local CurPage="EBDelta" local lineFolder
local Pb={Running=false,Conn=nil,Route=nil,StartClock=0,Idx=1,LastJump=-math.huge,Cat=nil,Pk=nil,Tower=nil,TowerRoute=nil,Walking=false,WalkConn=nil}
local SavedDir=nil local Turning=false
local Old=PG:FindFirstChild("ZKY_PARKOUR") if Old then Old:Destroy()end
local K={Bg=_RGB(18,18,20),Panel=_RGB(24,24,27),Card=_RGB(31,31,35),CardHover=_RGB(39,39,43),Sel=_RGB(55,55,60),Stroke=_RGB(65,65,70),SLight=_RGB(85,85,90),White=_RGB(245,245,245),Gray=_RGB(175,175,180),DGray=_RGB(115,115,120),Success=_RGB(80,210,125),Err=_RGB(230,85,85),Orange=_RGB(255,145,45),SelRed=_RGB(225,70,70),SelRedD=_RGB(75,32,32),Primary=_RGB(185,185,185),Purple=_RGB(150,80,255)}
local function Cor(o,r) local c=_I("UICorner") c.CornerRadius=_UD(0,r) c.Parent=o end
local function Sk(o,c,t) local s=_I("UIStroke") s.Color=c s.Thickness=t or 1 s.Parent=o return s end
local function Pad(o,t,b,l,r) local p=_I("UIPadding") p.PaddingTop=_UD(0,t or 0) p.PaddingBottom=_UD(0,b or 0) p.PaddingLeft=_UD(0,l or 0) p.PaddingRight=_UD(0,r or 0) p.Parent=o end
local function New(cls,props,parent) local o=_I(cls) if props then for k,v in pairs(props)do o[k]=v end end if parent then o.Parent=parent end return o end

-- NOTIFICAÇÕES
local NH=New("Frame",{Name="Notifs",AnchorPoint=_V2(1,1),Position=_U2(1,-15,1,-15),Size=_UO(270,300),BackgroundTransparency=1,ZIndex=200},PG)
local NL=New("UIListLayout",{VerticalAlignment=Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.HorizontalAlignment.Right,Padding=_UD(0,7)},NH)
local function Notify(tt,msg,nt)
    local c=K.Gray if nt=="Success" then c=K.Success elseif nt=="Error" then c=K.Err elseif nt=="Orange" then c=K.Orange end
    local n=New("Frame",{Size=_UO(250,64),BackgroundColor3=K.Panel,BorderSizePixel=0,BackgroundTransparency=1,ZIndex=201},NH) Cor(n,10)
    local ns=Sk(n,c) ns.Transparency=1
    local b=New("Frame",{Size=_UO(3,38),AnchorPoint=_V2(0,.5),Position=_U2(0,7,.5,0),BackgroundColor3=c,BorderSizePixel=0,BackgroundTransparency=1,ZIndex=202},n) Cor(b,5)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(18,9),Size=_U2(1,-28,0,18),Text=tt,TextColor3=K.White,TextSize=12,Font=GB,TextXAlignment=XL,ZIndex=203},n)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(18,30),Size=_U2(1,-28,0,25),Text=msg,TextColor3=K.Gray,TextSize=9,Font=GM,TextWrapped=true,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Center,ZIndex=203},n)
    n.Position=_U2(1,270,0,0)
    T:Create(n,TweenInfo.new(.35,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Position=_U2(),BackgroundTransparency=0}):Play()
    T:Create(ns,TweenInfo.new(.25),{Transparency=0}):Play()
    T:Create(b,TweenInfo.new(.25),{BackgroundTransparency=0}):Play()
    task.delay(2.8,function()
        if not n.Parent then return end
        local o=T:Create(n,TweenInfo.new(.3,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{Position=_U2(1,270),BackgroundTransparency=1})
        o:Play() T:Create(ns,TweenInfo.new(.2),{Transparency=1}):Play() T:Create(b,TweenInfo.new(.2),{BackgroundTransparency=1}):Play()
        o.Completed:Wait() if n.Parent then n:Destroy()end
    end)
end

-- CHARACTER
local function Refresh() char=Pl.Character if not char or not char.Parent then return false end hum=char:FindFirstChildOfClass("Humanoid") hrp=char:FindFirstChild("HumanoidRootPart") return hum~=nil and hrp~=nil end
Pl.CharacterAdded:Connect(function() task.wait(.2) Refresh() end) Refresh()

-- PARSE
local function N2(v) return v and tonumber(v) end
local function ParseRoutes(raw)
    local parsed,blocks={},{} local sp=1
    while true do
        local s=string.find(raw,"local Rota = {",sp) if not s then break end
        local b,e=0
        for i=s,#raw do local ch=string.sub(raw,i,i) if ch=="{" then b=b+1 elseif ch=="}" then b=b-1 if b==0 then e=i break end end end
        if not e then break end table.insert(blocks,string.sub(raw,s,e)) sp=e+1
    end
    for _,block in ipairs(blocks)do
        local frames,fs={},1
        while true do
            local p1,p2=string.find(block,"{(.-)}",fs) if not p1 then break end
            local f=string.sub(block,p1,p2)
            local t=string.match(f,"t%s*=%s*([%d%.%-]+)") local x=string.match(f,"x%s*=%s*([%d%.%-]+)")
            local y=string.match(f,"y%s*=%s*([%d%.%-]+)") local z=string.match(f,"z%s*=%s*([%d%.%-]+)")
            local j=string.match(f,"j%s*=%s*([%w]+)")
            local rx=string.match(f,"rx%s*=%s*([%d%.%-]+)") local ry=string.match(f,"ry%s*=%s*([%d%.%-]+)") local rz=string.match(f,"rz%s*=%s*([%d%.%-]+)")
            if t and x and y and z then
                local q={t=N2(t),position=Vector3.new(N2(x),N2(y),N2(z)),j=j=="true",rx=N2(rx),ry=N2(ry),rz=N2(rz)}
                if q.rx and q.ry and q.rz then q.rotation=CFrame.Angles(q.rx,q.ry,q.rz) end
                table.insert(frames,q)
            end
            fs=p2+1
        end
        if #frames>=2 then table.sort(frames,function(a,b)return a.t<b.t end) table.insert(parsed,frames) end
    end
    return parsed
end
local function LoadCat(c) local u=PB[c] if not u then return false end local ok,raw=pcall(function()return game:HttpGet(u)end) if not ok or not raw then return false end local p=ParseRoutes(raw) if #p==0 then return false end routes[c]=p return true end
local function LoadTR(t,r) local d=TPB[t] if not d then return false end local u=d[r] if not u then return false end local ok,raw=pcall(function()return game:HttpGet(u)end) if not ok or not raw then return false end local p=ParseRoutes(raw) if #p==0 then return false end tRoutes[t]=tRoutes[t] or {} tRoutes[t][r]=p[1] return true end
local function CreateLine(a,b) if not a or not b then return end local d=b-a local dist=d.Magnitude if dist<.01 then return end if not lineFolder then lineFolder=New("Folder",{Name="ZKY_RouteLines"},workspace) end local l=New("Part",{Name="RouteSegment",Anchored=true,CanCollide=false,CanTouch=false,CanQuery=false,CastShadow=false,Material=Enum.Material.Neon,Color=CFG.LineColor,Transparency=CFG.LineTransparency,Size=Vector3.new(CFG.LineThickness,CFG.LineThickness,dist),CFrame=CFrame.lookAt((a+b)/2,b)},lineFolder) end
local function ClearLines() if not lineFolder then return end for _,o in ipairs(lineFolder:GetChildren())do o:Destroy()end end
local function ShowLines(data) ClearLines() local last for _,f in ipairs(data)do if last then CreateLine(last,f.position)end last=f.position end end
local function GetPos(f) if not f then return end if f.position then return f.position end end
local function GetRot(f) if not f then return end if f.rotation then return f.rotation end end
local function Apply(pos,rot) if not pos or not Refresh()then return false end local c=pos+Vector3.new(0,CFG.GroundOffset,0) local tgt if rot then tgt=CFrame.new(c)*rot else local lk=hrp.CFrame.LookVector local flat=Vector3.new(lk.X,0,lk.Z) if flat.Magnitude<.01 then flat=Vector3.new(0,0,-1)else flat=flat.Unit end tgt=CFrame.lookAt(c,c+flat) end pcall(function()char:PivotTo(tgt)end) return true end
local function GetFrames(fr,el) local n=#fr if n<2 then return end if el<=fr[1].t then Pb.Idx=1 return fr[1],fr[2],0 end if el>=fr[n].t then return fr[n],fr[n],1 end local i=math.clamp(Pb.Idx,1,n-1) while i<n-1 and el>fr[i+1].t do i=i+1 end while i>1 and el<fr[i].t do i=i-1 end Pb.Idx=i local a,b=fr[i],fr[i+1] local d=b.t-a.t local al=d>0 and math.clamp((el-a.t)/d,0,1)or 0 return a,b,al end
local function HandleJump(f,e) if not f or not f.j or e-Pb.LastJump<CFG.JumpCooldown or not Refresh()then return end Pb.LastJump=e hum.Jump=true pcall(function()hum:ChangeState(Enum.HumanoidStateType.Jumping)end) end

local function WalkTo(dest,cancel,onDone)
    if not Refresh()then onDone(false) return end
    pcall(function() hum.AutoRotate=true end)
    hum.WalkSpeed=CFG.WalkToSpeed hum:MoveTo(dest)
    local st=os.clock() local ok=false
    while not cancel() do
        if not Refresh()then break end
        hum:MoveTo(dest)
        if (hrp.Position-dest).Magnitude<=4 then ok=true break end
        if os.clock()-st>60 then break end
        task.wait()
    end
    if Refresh()then hum:Move(Vector3.zero,false) end
    onDone(ok and not cancel())
end

local Dummy local KillDummy
local function MakeDummy(pos,rot)
    KillDummy()
    local tgt=rot and (CFrame.new(pos)*(rot-rot.Position)) or CFrame.new(pos)
    local ok=false
    if Refresh()then
        local sv={}
        for _,d in ipairs(char:GetDescendants())do sv[d]=d.Archivable pcall(function()d.Archivable=true end)end
        local cok,cl=pcall(function()return char:Clone()end)
        for i,v in pairs(sv)do pcall(function()i.Archivable=v end)end
        if cok and cl then
            for _,d in ipairs(cl:GetDescendants())do
                if d:IsA("Script")or d:IsA("LocalScript")then pcall(function()d:Destroy()end)
                elseif d:IsA("Shirt")or d:IsA("Pants")or d:IsA("ShirtGraphic")or d:IsA("Decal")then pcall(function()d:Destroy()end)
                elseif d:IsA("BasePart")then d.CanCollide=false d.CanQuery=false d.CanTouch=false d.Massless=true d.Material=Enum.Material.ForceField d.Color=_RGB(0,255,140) d.Transparency=.35 end
            end
            local h=cl:FindFirstChildOfClass("Humanoid") if h then pcall(function()h.WalkSpeed=0 h.JumpPower=0 h.PlatformStand=true end)end
            cl.PrimaryPart=cl.PrimaryPart or cl:FindFirstChild("HumanoidRootPart")
            if cl.PrimaryPart then
                cl.Parent=workspace local pok=pcall(function()cl:PivotTo(tgt)end)
                if pok then
                    for _,d in ipairs(cl:GetDescendants())do if d:IsA("BasePart")then d.Anchored=true end end
                    local hl=New("Highlight",{FillColor=_RGB(0,255,140),OutlineColor=_RGB(150,255,195),FillTransparency=.55,OutlineTransparency=0,DepthMode=Enum.HighlightDepthMode.AlwaysOnTop},cl)
                    cl.Name="ZKY_Dummy" Dummy=cl ok=true
                else cl:Destroy()end
            else cl:Destroy()end
        end
    end
    if not ok then
        local m=New("Part",{Name="ZKY_Dummy",Shape=Enum.PartType.Cylinder,Size=Vector3.new(.4,6,6),CFrame=tgt*CFrame.Angles(0,0,math.rad(90)),Color=_RGB(0,255,130),Material=Enum.Material.Neon,Transparency=.35,Anchored=true,CanCollide=false,CanQuery=false,CanTouch=false},workspace) Dummy=m
    end
end
KillDummy=function() if Dummy then pcall(function()Dummy:Destroy()end) Dummy=nil end end

local function Stop(reason)
    if Pb.Conn then Pb.Conn:Disconnect() Pb.Conn=nil end
    if Pb.WalkConn then Pb.WalkConn:Disconnect() Pb.WalkConn=nil end
    KillDummy() Pb.Running=false Pb.Route=nil Pb.Idx=1 Pb.LastJump=-math.huge Pb.Cat=nil Pb.Pk=nil Pb.Tower=nil Pb.TowerRoute=nil Pb.Walking=false
    if Refresh()then hum:Move(Vector3.zero,false) hum.Jump=false pcall(function()hum.AutoRotate=true end)end
    ClearLines()
    if reason=="completed" then Notify("CONCLUÍDO","Rota finalizada!","Success")
    elseif reason=="cancelled" then Notify("PARADO","Reprodução interrompida.","Error")
    elseif reason=="error" then Notify("ERRO","Não foi possível continuar.","Error")end
end
local function Exec(name)
    if not Pb.Running then return end
    Pb.Walking=false
    if Refresh()then hum:Move(Vector3.zero,false) pcall(function()hum.AutoRotate=false end)end
    Pb.StartClock=os.clock() Pb.Idx=1 Pb.LastJump=-math.huge
    Notify("EXECUTANDO",name,"Success")
    task.spawn(function()
        while Pb.Running and not Pb.Walking do
            if not Refresh()then Stop("error") break end
            local fr=Pb.Route if not fr or #fr<2 then Stop("error") break end
            local el=(os.clock()-Pb.StartClock)*CFG.PlaybackSpeed
            local fin=fr[#fr]
            if el>=fin.t then Apply(GetPos(fin),GetRot(fin)) Stop("completed") break end
            local a,b,al=GetFrames(fr,el) if not a or not b then break end
            local pa,pb=GetPos(a),GetPos(b) if not pa or not pb then Stop("error") break end
            local pos=pa:Lerp(pb,al)
            local ra,rb=GetRot(a),GetRot(b) local rot if ra and rb then rot=ra:Lerp(rb,al) elseif ra then rot=ra elseif rb then rot=rb end
            Apply(pos,rot) HandleJump(a,el) task.wait()
        end
    end)
end
local function StartRoute(data,cat,num,tower,tRoute)
    if Pb.Running then Notify("EM EXECUÇÃO","Pare a rota atual antes.","Error") return end
    if not data or #data<2 then Notify("ROTA INVÁLIDA","Frames insuficientes.","Error") return end
    if not Refresh()then Notify("PERSONAGEM","Não encontrado.","Error") return end
    local first=data[1] local fp=GetPos(first) if not fp then Notify("ERRO","Primeiro ponto inválido.","Error") return end
    local tgt=fp+Vector3.new(0,CFG.GroundOffset,0)
    Pb.Running=true Pb.Walking=true Pb.Route=data Pb.Cat=cat Pb.Pk=num Pb.Tower=tower Pb.TowerRoute=tRoute Pb.Idx=1
    ShowLines(data)
    local name = tower and ((tower=="Torre 1") and "Torre 1" or ("Torre 2 • "..tRoute)) or ("Parkour "..num.." • "..cat)
    if PK.Modo=="Dummy" then
        Notify("MARCADOR CRIADO","Ande até o marcador: "..name,"Orange")
        MakeDummy(tgt,GetRot(first))
        Pb.WalkConn=R.Heartbeat:Connect(function()
            if not Pb.Running or not Pb.Walking then return end
            if not Refresh()then Stop("error") return end
            if (hrp.Position-tgt).Magnitude<=5 then
                if Pb.WalkConn then Pb.WalkConn:Disconnect() Pb.WalkConn=nil end
                KillDummy() Exec(name)
            end
        end)
    else
        Notify("INDO PARA O INÍCIO",name,"Orange")
        task.spawn(function()
            WalkTo(tgt,function()return not Pb.Running end,function(ok)
                if not Pb.Running then return end
                if not ok then Stop("error") return end
                Exec(name)
            end)
        end)
    end
end
local function SaveDir()
    if not Refresh()then Notify("ERRO","Personagem não encontrado.","Error") return end
    local lk=hrp.CFrame.LookVector local fl=Vector3.new(lk.X,0,lk.Z)
    if fl.Magnitude<=0 then Notify("ERRO","Direção inválida.","Error") return end
    SavedDir=fl.Unit Notify("DIREÇÃO SALVA","Guardada!","Success")
end
local function Turn(cmd)
    if Turning then Notify("AGUARDE","Já girando.","Error") return end
    if not Refresh()then Notify("ERRO","Personagem não encontrado.","Error") return end
    Turning=true local old=hum.AutoRotate hum.AutoRotate=false
    local ang if cmd=="DIREITA" then ang=math.rad(-90) elseif cmd=="ESQUERDA" then ang=math.rad(90) elseif cmd=="RETAGUARDA" then ang=math.rad(180) end
    if ang then local p=hrp.Position local nc=hrp.CFrame*CFrame.Angles(0,ang,0) hrp.CFrame=CFrame.new(p)*(nc-nc.Position) end
    task.wait() hum.AutoRotate=old Turning=false Notify(cmd.." VOLVER!","Giro executado.","Success")
end
local function Vanguarda()
    if not SavedDir then Notify("ERRO","Salve uma direção.","Error") return end
    if not Refresh()then Notify("ERRO","Personagem não encontrado.","Error") return end
    local p=hrp.Position local old=hum.AutoRotate hum.AutoRotate=false hrp.CFrame=CFrame.lookAt(p,p+SavedDir) task.wait() hum.AutoRotate=old
    Notify("VANGUARDA VOLVER!","Direção restaurada.","Success")
end
local function SendChat(m) m=string.sub(m,1,200)
    if TCS.ChatVersion==Enum.ChatVersion.TextChatService then local cc=TCS:FindFirstChild("TextChannels") local c=cc and cc:FindFirstChild("RBXGeneral") if c then c:SendAsync(m) return true end end
    local ev=RS:FindFirstChild("DefaultChatSystemChatEvents") local s=ev and ev:FindFirstChild("SayMessageRequest") if s then s:FireServer(m,"All") return true end return false
end
local function HttpReq(url,body,apiKey,timeout)
    if not http then return nil,"Sem suporte a HTTP" end
    local resp,done=nil,false
    task.spawn(function()
        local ok,r=pcall(function() return http({Url=url,Method="POST",Headers={["Content-Type"]="application/json",["Authorization"]="Bearer "..apiKey},Body=body}) end)
        if ok then resp=r end done=true
    end)
    local st=tick()
    while not done and (tick()-st)<timeout do task.wait(.1) end
    if not done then return nil,"Tempo esgotado" end
    if not resp then return nil,"Falha na requisição" end
    if resp.StatusCode~=200 then return nil,"HTTP "..tostring(resp.StatusCode) end
    return resp
end
local function Corrigir(texto)
    local body=HS:JSONEncode({model=IAC.Modelo,messages={{role="system",content=IAC.SystemPrompt},{role="user",content=texto}},temperature=.2,max_tokens=500})
    local resp,err=HttpReq(IAC.Endpoint,body,IAC.ApiKey,IAC.Timeout)
    if not resp then return nil,err end
    local ok,d=pcall(function()return HS:JSONDecode(resp.Body)end)
    if not ok or not d.choices or not d.choices[1] then return nil,"Resposta inválida" end
    local m=d.choices[1].message local txt=m and m.content
    if not txt or txt=="" then return nil,"Resposta vazia" end
    return txt:gsub("^%s+",""):gsub("%s+$",""):gsub('^["\']+',""):gsub('["\']+$',"")
end
local function GerarTexto(tema)
    local body=HS:JSONEncode({model=IAT.Modelo,messages={{role="system",content=IAT.SystemPrompt},{role="user",content=tema}},temperature=0.8,max_tokens=120})
    local resp,err=HttpReq(IAT.Endpoint,body,IAT.ApiKey,IAT.Timeout)
    if not resp then return nil,err end
    local ok,d=pcall(function()return HS:JSONDecode(resp.Body)end)
    if not ok or not d.choices or not d.choices[1] then return nil,"Resposta inválida" end
    local txt=d.choices[1].message and d.choices[1].message.content
    if not txt or txt=="" then return nil,"Resposta vazia" end
    return txt:gsub("^%s+",""):gsub("%s+$",""):gsub('^["\']+',""):gsub('["\']+$',"")
end

-- ==============================
-- GUI PRINCIPAL
-- ==============================
local Gui=New("ScreenGui",{Name="ZKY_PARKOUR",ResetOnSpawn=false,IgnoreGuiInset=true,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},PG)
local Logo=New("TextButton",{Name="ZKY_Logo",Size=_UO(58,58),Position=_UO(12,65),BackgroundColor3=_RGB(10,10,10),BorderSizePixel=0,Text="🚀",TextColor3=K.White,TextSize=26,Font=GB,AutoButtonColor=false},Gui)
Cor(Logo,29) Sk(Logo,K.SLight)
local Main=New("Frame",{Name="Main",AnchorPoint=_V2(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromScale(.78,.65),BackgroundColor3=K.Bg,BorderSizePixel=0,Visible=false,ClipsDescendants=true,ZIndex=10},Gui)
Cor(Main,14) Sk(Main,K.Stroke)
local Header=New("Frame",{Size=_U2(1,-16,0,54),Position=_UO(8,8),BackgroundColor3=K.Panel,BorderSizePixel=0,ZIndex=20},Main)
Cor(Header,10) Sk(Header,K.Stroke)
New("TextLabel",{BackgroundTransparency=1,Position=_UO(13,7),Size=_U2(.55,0,0,23),Text="🚀 ZKY PARKOUR EB",TextColor3=K.White,TextSize=17,Font=GB,TextXAlignment=XL,ZIndex=22},Header)
New("TextLabel",{BackgroundTransparency=1,Position=_UO(14,31),Size=_U2(.65,0,0,15),Text="Auto Parkour • V3.3",TextColor3=K.DGray,TextSize=9,Font=GM,TextXAlignment=XL,ZIndex=22},Header)
local Ver=New("TextLabel",{BackgroundColor3=K.Card,AnchorPoint=_V2(.5,.5),Position=_U2(.5,0,.5,0),Size=_UO(55,25),Text="V3.3",TextColor3=K.Gray,TextSize=10,Font=GB,ZIndex=22},Header)
Cor(Ver,8) Sk(Ver,K.Stroke)
local BtnX=New("TextButton",{Size=_UO(34,34),Position=_U2(1,-42,.5,-17),BackgroundColor3=K.Card,BorderSizePixel=0,Text="×",TextColor3=K.Gray,TextSize=22,Font=GM,AutoButtonColor=false,ZIndex=25},Header)
Cor(BtnX,10) Sk(BtnX,K.Stroke)

local Sidebar=New("ScrollingFrame",{Size=_U2(0,118,1,-78),Position=_UO(8,70),BackgroundColor3=K.Panel,BorderSizePixel=0,ScrollBarThickness=2,ScrollBarImageColor3=K.SLight,AutomaticCanvasSize=Enum.AutomaticSize.Y,ZIndex=20},Main)
Cor(Sidebar,10) Sk(Sidebar,K.Stroke) Pad(Sidebar,7,7,6,6)
New("UIListLayout",{Padding=_UD(0,5),HorizontalAlignment=Enum.HorizontalAlignment.Center},Sidebar)
local function SideBtn(txt,sel) local b=New("TextButton",{Size=_U2(1,0,0,39),BackgroundColor3=sel and K.Sel or K.Card,BorderSizePixel=0,Text=txt,TextColor3=sel and K.White or K.Gray,TextSize=9,Font=GB,TextXAlignment=XL,AutoButtonColor=false},Sidebar) Cor(b,7) Pad(b,0,0,8,2) Sk(b,K.Stroke) return b end
local btnCreditos=SideBtn("👑 CRÉDITOS",false)
local btnEBDelta=SideBtn("🏃 EB DELTA",true)
local btnTaffs=SideBtn("📝 TAFFS",false)
local btnVolvers=SideBtn("↪ VOLVERS",false)
local btnIA=SideBtn("🤖 IA CHAT",false)
local btnCombate=SideBtn("⚔ COMBATE",false)
local btnTextos=SideBtn("📚 TEXTOS PRONTOS",false)
local btnLoja=SideBtn("🔫 LOJA",false)
local selBtn=btnEBDelta

local Content=New("ScrollingFrame",{Size=_U2(1,-134,1,-78),Position=_U2(0,126,0,70),BackgroundColor3=K.Panel,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=K.SLight,AutomaticCanvasSize=Enum.AutomaticSize.Y,ZIndex=20},Main)
Cor(Content,10) Sk(Content,K.Stroke)
local CH=New("Frame",{Size=_U2(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1},Content)
Pad(CH,9,9,9,9)
New("UIListLayout",{Padding=_UD(0,7)},CH)
local savedCanvas=Vector2.new(0,0)
local function ClearAll(keep)
    savedCanvas = keep and Content.CanvasPosition or Vector2.new(0,0)
    for _,c in ipairs(CH:GetChildren())do if c:IsA("GuiObject")then c:Destroy()end end
end
local function RestoreCanvas() task.defer(function() task.wait() Content.CanvasPosition=savedCanvas end) end

-- TAFFS
local TAFFS={ {N="CIE",E="🕵️‍♂️",C=_RGB(70,130,180),F={{"🕵️‍♂️ CIE","Centro de Inteligência do Exército"},{"👤 Criador","vicofjgfhf"},{"👤 Sub criador","RIP_dabfj8w"},{"👤 Comandante","eriqurrr."},{"👤 Subcomandante","nohanrtop"},{"📜 Lema","Inteligência para Vitória & Saber para Prever."},{"💬 Saudação","Saudações, senhores Agentes."},{"💬 Saudação","Saudações, senhores Fantasmas."},{"💬 Saudação","Saudações, senhor Agente."},{"💬 Saudação","Saudações, senhor Fantasma."}} },
{N="REC MEC",E="🐎",C=_RGB(220,180,60),F={{"🐎 REC MEC","Regimento de Cavalaria Mecanizado"},{"👤 Comandante","terro_2433."},{"👤 Subcomandante","Contanum5bl"},{"📜 Lema","Haverá sempre uma Cavalaria!, Aço na mente, motor no peito e honra na missão!"},{"💬 Saudação","Saudações, senhores Cavaleiros."},{"💬 Saudação","Saudações, senhor Cavaleiro."},{"📋 Licença","Licença, senhores Cavaleiros."},{"📋 Licença","Licença, senhor Cavaleiro."},{"📋 Licença","Com licença, senhores Cavaleiros."},{"📋 Licença","Com licença, senhor Cavaleiro."},{"📢 Comando","ATENÇÃO TURNO, PREPARAR PARA MARCHAR!"},{"📢 Comando","ATENÇÃO TURNO, MARCHEM!"},{"📢 Comando","ATENÇÃO PELOTÃO, PREPARAR PARA MARCHAR!"},{"📢 Comando","ATENÇÃO PELOTÃO, MARCHEM!"}} },
{N="BPE",E="👮‍♂️",C=_RGB(60,180,120),F={{"👮‍♂️ BPE","Batalhão de Polícia do Exército"},{"👤 Comandante","zCostasz."},{"👤 Subcomandante","Matheuslindo587."},{"📜 Lema","Orientar o Responsável, Corrigir o Irresponsável, Prender o Incorrigível."},{"💬 Saudação","Saudações, senhores Policiais."},{"💬 Saudação","Saudações, senhor Policial."}} },
{N="BFE",E="👻",C=_RGB(200,70,70),F={{"👻 BFE","Batalhão de Forças Especiais"},{"👤 Criador","NATANHMELLO4."},{"📅 Criado","1983"},{"👤 Comandante","RenanFoxiy."},{"👤 Subcomandante","TILAPIA_PROFISSIONAL."},{"🛡️ Escudo","Fundo preto com bordas amarelas. No centro um paraquedas branco junto de uma faca vermelha, simbolizando operações especiais e combate."},{"📜 Lema","Qualquer missão, em qualquer lugar, a qualquer hora, de qualquer maneira."},{"💬 Saudação","Saudações, senhores Fantasmas."},{"💬 Saudação","Saudações, senhor Fantasma."},{"📋 Licença","Com licença, senhor Fantasma."},{"📋 Licença","Licença, senhor Fantasma."}} },
{N="CYBER",E="💻",C=_RGB(150,100,200),F={{"💻 CYBER","Comando de Defesa Cibernética"},{"👤 Criador","wAnTee16j5156."},{"👤 Donos","MaxTheJp1 | ItsMeLyrio | Gabriel2444q."},{"👤 Comandante","highanddry98"},{"👤 Subcomandante","Não tem."},{"📜 Lema","Segurança no ciberespaço, soberania para a Nação."},{"📜 Juramento","JURO GUARDAR SIGILO SOBRE TUDO QUE VER E OUVIR NO COMDCIBER!"},{"💬 Saudação","Saudações, senhores Analistas."}} },
{N="BAC",E="💀",C=_RGB(220,100,50),F={{"💀 BAC","Batalhão de Ações de Comandos"},{"👤 Dono","MateusHgz."},{"👤 Comandante","SasukePro202."},{"👤 Subcomandante","DanielSxS2."},{"📜 Lema","O máximo de confusão, morte e destruição na retaguarda do inimigo."},{"💬 Saudação","Saudações, senhor Comando."},{"💬 Saudação","Saudações, senhores Comandos."}} },
{N="CAAT",E="🌵",C=_RGB(50,150,80),F={{"🌵 CAAT","Batalhão de Infantaria de Caatinga"},{"👤 Comandante","Não tem."},{"👤 Subcomandante","gabrielcm04."},{"📜 Lema","O pai cria, a mãe educa e a Caatinga elimina."},{"💬 Saudação","Saudações, senhores Guardiões da Caatinga."}} } }
local function TaffsCard(l,v,o,par)
    local c=New("Frame",{Size=_U2(1,0,0,48),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=o},par) Cor(c,8) Sk(c,K.Stroke,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,5),Size=_U2(1,-82,1,-10),Text=l..": "..v,TextColor3=K.White,TextSize=10,Font=GM,TextWrapped=true,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Center},c)
    local cp=New("TextButton",{AnchorPoint=_V2(1,.5),Position=_U2(1,-7,.5,0),Size=_UO(58,29),BackgroundColor3=K.Success,BorderSizePixel=0,Text="Copiar",TextColor3=K.White,TextSize=9,Font=GB,AutoButtonColor=false},c) Cor(cp,7) Sk(cp,K.SLight,1)
    cp.Activated:Connect(function() if typeof(setclipboard)~="function" then Notify("COPIAR","Sem setclipboard.","Error") return end local ok=pcall(function()setclipboard(v)end) if ok then cp.Text="✓" Notify("COPIADO","Copiado.","Success") task.delay(.9,function() if cp.Parent then cp.Text="Copiar" end end) end end)
end
local function ShowTaffs()
    CurPage="TAFFS" ClearAll()
    local h=New("Frame",{Size=_U2(1,0,0,58),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=0},CH) Cor(h,9) Sk(h,K.SLight,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(12,7),Size=_U2(1,-24,0,25),Text="📝 TAFFS",TextColor3=K.White,TextSize=16,Font=GB,TextXAlignment=XL},h)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(13,34),Size=_U2(1,-26,0,15),Text="Informações das organizações militares",TextColor3=K.DGray,TextSize=9,Font=GM,TextXAlignment=XL},h)
    for i,div in ipairs(TAFFS)do
        local s=New("Frame",{Size=_U2(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=i+1},CH) Cor(s,8) Sk(s,div.C,2)
        New("UIListLayout",{HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=_UD(0,5)},s)
        local hd=New("Frame",{Size=_U2(1,0,0,38),BackgroundColor3=div.C,BackgroundTransparency=.2,BorderSizePixel=0,LayoutOrder=0},s) Cor(hd,8)
        New("TextLabel",{BackgroundTransparency=1,Position=_UO(12,0),Size=_U2(1,-24,1,0),Text=div.E.."  "..div.N,TextColor3=K.White,TextSize=14,Font=GB,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Center},hd)
        for j,fl in ipairs(div.F)do TaffsCard(fl[1],fl[2],j,s) end
    end
end

local function GetCatColor(c) if c=="Lento"then return K.Success elseif c=="Rápido"then return K.White elseif c=="Mais Rápido"then return K.Orange elseif c=="Sem Burla"then return K.Gray end return K.Gray end

-- ==============================
-- EB DELTA (HOTBAR com underline)
-- ==============================
local EBSUB="Parkours"
local RenderSub
local function ShowEBDelta(keep)
    CurPage="EBDelta" ClearAll(keep)
    -- Hotbar
    local hb=New("Frame",{Size=_U2(1,0,0,44),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=0},CH)
    Cor(hb,8) Sk(hb,K.Stroke,1)
    local ul=New("Frame",{AnchorPoint=_V2(0,1),Position=_U2(0,8,1,-1),Size=_U2(1,-16,0,1),BackgroundColor3=K.Stroke,BorderSizePixel=0,ZIndex=2},hb)
    New("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,Padding=_UD(0,4)},hb)
    local hpad=New("UIPadding",{PaddingLeft=_UD(0,14),PaddingRight=_UD(0,14),PaddingTop=_UD(0,6),PaddingBottom=_UD(0,10)},hb)
    local tabs={{"Parkours","Parkours"},{"Torres","Torres"},{"Configuracao","Configurações"},{"Automacoes","Automações"}}
    for _,tb in ipairs(tabs)do
        local key,label=tb[1],tb[2]
        local sl=(EBSUB==key)
        local btn=New("TextButton",{Size=_UO(#label*9+16,28),BackgroundTransparency=1,BorderSizePixel=0,Text=label,TextColor3=sl and K.White or K.DGray,TextSize=12,Font=sl and GB or GM,AutoButtonColor=false,ZIndex=3},hb)
        if sl then
            local umark=New("Frame",{AnchorPoint=_V2(0,1),Position=_U2(0,0,1,-2),Size=_U2(1,0,0,2),BackgroundColor3=K.Purple,BorderSizePixel=0,ZIndex=5},btn)
        end
        btn.MouseButton1Click:Connect(function()
            if EBSUB~=key then EBSUB=key ShowEBDelta(false) end
        end)
    end
    if RenderSub then RenderSub() end
    if keep then RestoreCanvas() else Content.CanvasPosition=_V2() end
end

local function RenderParkours()
    for num=1,4 do
        local row=New("Frame",{Size=_U2(1,0,0,45),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=num},CH) Cor(row,8) Sk(row,K.Stroke)
        New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,0),Size=_U2(1,-105,1,0),Text="🏃 Parkour "..num,TextColor3=K.White,TextSize=12,Font=GB,TextXAlignment=XL},row)
        local running=Pb.Running and Pb.Pk==num and not Pb.Tower
        local start=New("TextButton",{AnchorPoint=_V2(1,.5),Position=_U2(1,-42,.5,0),Size=_UO(78,30),BackgroundColor3=running and K.Err or K.Success,BorderSizePixel=0,Text=running and "■ PARAR" or "▶ INICIAR",TextColor3=K.White,TextSize=9,Font=GB,AutoButtonColor=false,ZIndex=5},row) Cor(start,7)
        local exp=New("TextButton",{AnchorPoint=_V2(1,.5),Position=_U2(1,-7,.5,0),Size=_UO(27,31),BackgroundTransparency=1,BorderSizePixel=0,Text=expPk[num] and "▲" or "▼",TextColor3=K.Gray,TextSize=12,Font=GB,AutoButtonColor=false,ZIndex=6},row)
        local ec=New("Frame",{Size=_U2(1,0,0,expPk[num] and 149 or 0),BackgroundTransparency=1,ClipsDescendants=true,LayoutOrder=num+20},CH)
        New("UIListLayout",{Padding=_UD(0,5)},ec)
        for _,cat in ipairs(CAT)do
            local b=New("TextButton",{Size=_U2(1,0,0,32),BackgroundColor3=K.Panel,BorderSizePixel=0,Text="   "..cat,TextColor3=GetCatColor(cat),TextSize=10,Font=GB,TextXAlignment=XL,AutoButtonColor=false},ec) Cor(b,7)
            local s=Sk(b,K.Stroke)
            if selCat[num]==cat then b.BackgroundColor3=K.SelRedD b.TextColor3=K.SelRed s.Color=K.SelRed s.Thickness=1.5 end
            b.MouseButton1Click:Connect(function()
                local rt=routes[cat] and routes[cat][num]
                if not rt then Notify("ROTA NÃO ENCONTRADA","Parkour "..num.." • "..cat,"Error") return end
                selCat[num]=cat Notify("ROTA SELECIONADA","Parkour "..num.." • "..cat,"Success") ShowEBDelta(true)
            end)
        end
        start.MouseButton1Click:Connect(function()
            if Pb.Running and Pb.Pk==num and not Pb.Tower then Stop("cancelled") ShowEBDelta(true) return end
            local cat=selCat[num] or "Lento" selCat[num]=cat
            local rt=routes[cat] and routes[cat][num]
            if not rt then Notify("ROTA NÃO ENCONTRADA","Parkour "..num.." • "..cat,"Error") return end
            StartRoute(rt,cat,num) task.wait(.1) ShowEBDelta(true)
        end)
        exp.MouseButton1Click:Connect(function() expPk[num]=not expPk[num] ShowEBDelta(true) end)
    end
end

local function RenderTorres()
    local r1=New("Frame",{Size=_U2(1,0,0,45),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=1},CH) Cor(r1,8) Sk(r1,K.Stroke)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,0),Size=_U2(1,-105,1,0),Text="🏰 Torre 1",TextColor3=K.White,TextSize=12,Font=GB,TextXAlignment=XL},r1)
    local run1=Pb.Running and Pb.Tower=="Torre 1"
    local b1=New("TextButton",{AnchorPoint=_V2(1,.5),Position=_U2(1,-8,.5,0),Size=_UO(78,30),BackgroundColor3=run1 and K.Err or K.Success,BorderSizePixel=0,Text=run1 and "■ PARAR" or "▶ INICIAR",TextColor3=K.White,TextSize=9,Font=GB,AutoButtonColor=false},r1) Cor(b1,7)
    b1.MouseButton1Click:Connect(function()
        if Pb.Running and Pb.Tower=="Torre 1" then Stop("cancelled") ShowEBDelta(true) return end
        local rt=tRoutes["Torre 1"]["Única"] if not rt then Notify("ROTA NÃO CARREGADA","Torre 1","Error") return end
        StartRoute(rt,nil,nil,"Torre 1","Única") task.wait(.1) ShowEBDelta(true)
    end)
    local r2=New("Frame",{Size=_U2(1,0,0,45),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=2},CH) Cor(r2,8) Sk(r2,K.Stroke)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,0),Size=_U2(1,-150,1,0),Text="🏰 Torre 2",TextColor3=K.White,TextSize=12,Font=GB,TextXAlignment=XL},r2)
    local run2=Pb.Running and Pb.Tower=="Torre 2"
    local b2=New("TextButton",{AnchorPoint=_V2(1,.5),Position=_U2(1,-42,.5,0),Size=_UO(78,30),BackgroundColor3=run2 and K.Err or K.Success,BorderSizePixel=0,Text=run2 and "■ PARAR" or "▶ INICIAR",TextColor3=K.White,TextSize=9,Font=GB,AutoButtonColor=false},r2) Cor(b2,7)
    local ex=New("TextButton",{AnchorPoint=_V2(1,.5),Position=_U2(1,-7,.5,0),Size=_UO(27,31),BackgroundTransparency=1,BorderSizePixel=0,Text=expT2 and "▲" or "▼",TextColor3=K.Gray,TextSize=12,Font=GB,AutoButtonColor=false},r2)
    local tc=New("Frame",{Size=_U2(1,0,0,expT2 and 149 or 0),BackgroundTransparency=1,ClipsDescendants=true,LayoutOrder=3},CH)
    New("UIListLayout",{Padding=_UD(0,5)},tc)
    for _,rn in ipairs(T2RO)do
        local b=New("TextButton",{Size=_U2(1,0,0,32),BackgroundColor3=K.Panel,BorderSizePixel=0,Text="   "..rn,TextColor3=K.Gray,TextSize=10,Font=GB,TextXAlignment=XL,AutoButtonColor=false},tc) Cor(b,7)
        local s=Sk(b,K.Stroke)
        if selT2==rn then b.BackgroundColor3=K.SelRedD b.TextColor3=K.SelRed s.Color=K.SelRed s.Thickness=1.5 end
        b.MouseButton1Click:Connect(function()
            local rt=tRoutes["Torre 2"][rn] if not rt then Notify("ROTA NÃO CARREGADA","Torre 2 • "..rn,"Error") return end
            selT2=rn Notify("ROTA SELECIONADA","Torre 2 • "..rn,"Success") ShowEBDelta(true)
        end)
    end
    b2.MouseButton1Click:Connect(function()
        if Pb.Running and Pb.Tower=="Torre 2" then Stop("cancelled") ShowEBDelta(true) return end
        local rt=tRoutes["Torre 2"][selT2] if not rt then Notify("ROTA NÃO CARREGADA","Torre 2 • "..selT2,"Error") return end
        StartRoute(rt,nil,nil,"Torre 2",selT2) task.wait(.1) ShowEBDelta(true)
    end)
    ex.MouseButton1Click:Connect(function() expT2=not expT2 ShowEBDelta(true) end)
end

-- Auto JJs
local JJ={ativo=false,vel=29,maxCliq=2,meta=40,metaOn=true,feitos=0,cliqTotal=0,bolhas={},ultimaBolha=0,started=false}
local JJbtnRef,JJlblRef,JJfillRef,JJvalRef
local function JJset(v) if not JJbtnRef or not JJbtnRef.Parent then return end JJbtnRef.Text=v and "PARAR" or "LIGAR" JJbtnRef.BackgroundColor3=v and _RGB(220,50,70) or _RGB(0,190,110) end
local function JJclick(o) if firesignal then pcall(function() firesignal(o.MouseButton1Down) firesignal(o.MouseButton1Up) firesignal(o.MouseButton1Click) end) return end pcall(function() o.MouseButton1Down:Fire() o.MouseButton1Up:Fire() o.MouseButton1Click:Fire() end) end
local function JJisB(o) if o.ClassName~="ImageButton" then return false end if o.Name~="InputTemplate" then return false end if not o.Visible then return false end local s=o.AbsoluteSize if s.X<20 or s.Y<20 or s.X>200 or s.Y>200 then return false end local p=o.AbsolutePosition if p.X<=0 or p.Y<=0 then return false end return true end
local function JJid(o) local p=o.AbsolutePosition local s=o.AbsoluteSize return math.floor((p.X+s.X/2)/40).."_"..math.floor((p.Y+s.Y/2)/40) end
local function JJstart()
    if JJ.started then return end JJ.started=true
    task.spawn(function()
        while true do
            task.wait(0.1)
            if not JJ.ativo then continue end
            if JJ.metaOn and JJ.feitos>=JJ.meta then JJ.ativo=false JJset(false) continue end
            local now=tick()
            for id,d in pairs(JJ.bolhas)do if now-d.t>2.5 then JJ.bolhas[id]=nil end end
            local clicou=false
            for _,gg in ipairs(PG:GetChildren())do
                if gg:IsA("ScreenGui") and gg~=Gui then
                    for _,o in ipairs(gg:GetDescendants())do
                        if JJisB(o)then
                            JJ.ultimaBolha=tick()
                            local id=JJid(o)
                            local d=JJ.bolhas[id]
                            if not d then JJ.bolhas[id]={c=0,t=tick()} d=JJ.bolhas[id] end
                            d.t=tick()
                            if d.c<JJ.maxCliq then
                                JJclick(o) d.c=d.c+1 JJ.cliqTotal=JJ.cliqTotal+1 clicou=true
                                if d.c==1 then JJ.feitos=JJ.feitos+1 end
                                break
                            end
                        end
                    end
                    if clicou then break end
                end
            end
            if JJ.metaOn and JJ.feitos==JJ.meta-1 and (tick()-JJ.ultimaBolha>2) then JJ.ativo=false JJset(false) continue end
            if clicou then task.wait(JJ.vel/100) else task.wait(0.02) end
        end
    end)
    task.spawn(function()
        while true do
            task.wait(0.3)
            if JJlblRef and JJlblRef.Parent then
                JJlblRef.Text=string.format("JJs: %d/%d",JJ.feitos,JJ.meta)
                JJlblRef.TextColor3=(JJ.feitos>=JJ.meta and JJ.metaOn) and _RGB(0,190,110) or _RGB(255,200,0)
            end
        end
    end)
end
local function RenderAuto()
    JJstart()
    local c=New("Frame",{Size=_U2(1,0,0,260),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=1},CH) Cor(c,8) Sk(c,K.Stroke,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,6),Size=_U2(1,-20,0,18),Text="🤸 AUTO JJs",TextColor3=K.White,TextSize=13,Font=GB,TextXAlignment=XL},c)
    JJlblRef=New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,28),Size=_U2(1,-20,0,26),Text=string.format("JJs: %d/%d",JJ.feitos,JJ.meta),TextColor3=_RGB(255,200,0),TextSize=12,Font=GB,TextXAlignment=XL},c)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,60),Size=_U2(0.5,0,0,16),Text="META:",TextColor3=K.White,TextSize=10,Font=GB,TextXAlignment=XL},c)
    local mbox=New("TextBox",{Size=_U2(0.3,0,0,22),Position=_U2(0.65,0,0,58),BackgroundColor3=K.Panel,Text=tostring(JJ.meta),TextColor3=K.White,Font=GB,TextSize=11,BorderSizePixel=0,ClearTextOnFocus=false},c) Cor(mbox,5)
    mbox.FocusLost:Connect(function() local v=tonumber(mbox.Text) if v and v>0 then JJ.meta=v else mbox.Text=tostring(JJ.meta) end end)
    local mbtn=New("TextButton",{Position=_UO(10,86),Size=_U2(1,-20,0,22),BackgroundColor3=JJ.metaOn and _RGB(0,190,110) or _RGB(80,80,95),Text=JJ.metaOn and "META: ON" or "META: OFF",TextColor3=Color3.new(1,1,1),Font=GB,TextSize=10,BorderSizePixel=0,AutoButtonColor=false},c) Cor(mbtn,5)
    mbtn.MouseButton1Click:Connect(function() JJ.metaOn=not JJ.metaOn mbtn.Text=JJ.metaOn and "META: ON" or "META: OFF" mbtn.BackgroundColor3=JJ.metaOn and _RGB(0,190,110) or _RGB(80,80,95) end)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,114),Size=_U2(1,-20,0,14),Text="VELOCIDADE",TextColor3=K.White,TextSize=10,Font=GB,TextXAlignment=XL},c)
    local sbg=New("Frame",{Size=_U2(1,-20,0,6),Position=_UO(10,132),BackgroundColor3=K.Panel,BorderSizePixel=0},c) Cor(sbg,3)
    JJfillRef=New("Frame",{Size=_U2((JJ.vel-1)/39,0,1,0),BackgroundColor3=_RGB(0,190,110),BorderSizePixel=0},sbg) Cor(JJfillRef,3)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,140),Size=_U2(0.35,0,0,12),Text="RÁPIDO",TextColor3=K.DGray,TextSize=8,Font=GM,TextXAlignment=XL},c)
    New("TextLabel",{BackgroundTransparency=1,Position=_U2(0.65,0,0,140),Size=_U2(0.35,0,0,12),Text="LENTO",TextColor3=K.DGray,TextSize=8,Font=GM,TextXAlignment=Enum.TextXAlignment.Right},c)
    JJvalRef=New("TextLabel",{BackgroundTransparency=1,Position=_U2(0.35,0,0,139),Size=_U2(0.3,0,0,14),Text=tostring(JJ.vel),TextColor3=K.White,TextSize=12,Font=GB,TextXAlignment=XC},c)
    local m=New("TextButton",{Position=_UO(10,158),Size=_U2(0.15,0,0,26),BackgroundColor3=K.Panel,Text="−",TextColor3=K.White,TextSize=18,Font=GB,BorderSizePixel=0,AutoButtonColor=false},c) Cor(m,5)
    local p=New("TextButton",{Position=_U2(0.85,0,0,158),Size=_U2(0.15,0,0,26),BackgroundColor3=K.Panel,Text="+",TextColor3=K.White,TextSize=18,Font=GB,BorderSizePixel=0,AutoButtonColor=false},c) Cor(p,5)
    local function setv(v) JJ.vel=math.clamp(v,1,40) if JJvalRef and JJvalRef.Parent then JJvalRef.Text=tostring(JJ.vel) end if JJfillRef and JJfillRef.Parent then JJfillRef.Size=_U2((JJ.vel-1)/39,0,1,0) end end
    m.MouseButton1Click:Connect(function() setv(JJ.vel-1) end)
    p.MouseButton1Click:Connect(function() setv(JJ.vel+1) end)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,186),Size=_U2(1,-20,0,12),Text="Recomendação: 29",TextColor3=_RGB(255,200,0),TextSize=9,Font=GM,TextXAlignment=XL},c)
    local bt=New("TextButton",{Position=_UO(10,202),Size=_U2(1,-20,0,36),BackgroundColor3=_RGB(0,190,110),Text="LIGAR",TextColor3=Color3.new(1,1,1),TextSize=14,Font=GB,BorderSizePixel=0,AutoButtonColor=false},c) Cor(bt,6)
    JJbtnRef=bt JJset(JJ.ativo)
    bt.MouseButton1Click:Connect(function()
        if not JJ.ativo and JJ.metaOn and JJ.feitos>=JJ.meta then JJ.feitos=0 JJ.cliqTotal=0 JJ.bolhas={} end
        JJ.ativo=not JJ.ativo JJset(JJ.ativo)
        if JJ.ativo then JJ.ultimaBolha=tick() end
    end)
    local br=New("TextButton",{Position=_UO(10,242),Size=_U2(1,-20,0,16),BackgroundColor3=K.Panel,Text="RESETAR CONTADOR",TextColor3=K.DGray,TextSize=9,Font=GB,BorderSizePixel=0,AutoButtonColor=false},c) Cor(br,4)
    br.MouseButton1Click:Connect(function() JJ.feitos=0 JJ.cliqTotal=0 JJ.bolhas={} end)
end

local function RenderConfig()
    local c=New("Frame",{Size=_U2(1,0,0,250),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=1},CH) Cor(c,8) Sk(c,K.SLight,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(12,8),Size=_U2(1,-24,0,22),Text="⚙ CONFIGURAÇÃO DE ROTA",TextColor3=K.White,TextSize=14,Font=GB,TextXAlignment=XL},c)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(13,32),Size=_U2(1,-26,0,28),Text="Escolha como o personagem se aproxima do início da rota. Vale para Parkours E Torres.",TextColor3=K.DGray,TextSize=10,Font=GM,TextWrapped=true,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Top},c)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(12,70),Size=_U2(1,-24,0,14),Text="Modo selecionado: "..PK.Modo,TextColor3=K.Primary,TextSize=11,Font=GB,TextXAlignment=XL},c)
    local of=New("Frame",{Position=_UO(12,94),Size=_U2(1,-24,0,70),BackgroundTransparency=1},c)
    New("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=_UD(0,8)},of)
    local function opt(key,em,t1,t2)
        local sl=PK.Modo==key
        local b=New("TextButton",{Size=_U2(0.5,-4,1,0),BackgroundColor3=sl and K.SelRedD or K.Panel,BorderSizePixel=0,AutoButtonColor=false},of) Cor(b,8) Sk(b,sl and K.SelRed or K.Stroke,sl and 1.5 or 1)
        New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,6),Size=_UO(30,30),Text=em,TextSize=20,Font=GB,TextXAlignment=XL},b)
        New("TextLabel",{BackgroundTransparency=1,Position=_UO(46,6),Size=_U2(1,-50,0,20),Text=t1,TextColor3=sl and K.White or K.Gray,TextSize=12,Font=GB,TextXAlignment=XL},b)
        New("TextLabel",{BackgroundTransparency=1,Position=_UO(46,26),Size=_U2(1,-50,0,36),Text=t2,TextColor3=K.DGray,TextSize=9,Font=GM,TextWrapped=true,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Top},b)
        b.MouseButton1Click:Connect(function() if PK.Modo~=key then PK.Modo=key Notify("MODO ALTERADO","Modo: "..t1,"Success") ShowEBDelta(true) end end)
    end
    opt("Dummy","🧍","DUMMY","Cria um marcador verde. Você anda até ele e a rota começa.")
    opt("Direto","➡","IR DIRETO","O personagem anda até o início sozinho (movimento normal).")
    local ib=New("Frame",{Position=_UO(12,176),Size=_U2(1,-24,0,60),BackgroundColor3=K.Panel,BorderSizePixel=0},c) Cor(ib,7) Sk(ib,K.Stroke,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,6),Size=_U2(1,-20,0,16),Text="💡 Sobre o modo atual",TextColor3=K.White,TextSize=11,Font=GB,TextXAlignment=XL},ib)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,24),Size=_U2(1,-20,0,32),Text=PK.Modo=="Dummy" and "Aguarda você caminhar até o marcador verde." or "Anda automaticamente com o movimento natural do Roblox.",TextColor3=K.Gray,TextSize=9,Font=GM,TextWrapped=true,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Top},ib)
end

RenderSub=function()
    if EBSUB=="Parkours" then RenderParkours()
    elseif EBSUB=="Torres" then RenderTorres()
    elseif EBSUB=="Automacoes" then RenderAuto()
    elseif EBSUB=="Configuracao" then RenderConfig() end
end

-- VOLVERS
local function ShowVolvers()
    CurPage="Volvers" ClearAll()
    local h=New("Frame",{Size=_U2(1,0,0,58),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=0},CH) Cor(h,9) Sk(h,K.SLight,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(12,7),Size=_U2(1,-24,0,25),Text="↪ VOLVERS",TextColor3=K.White,TextSize=16,Font=GB,TextXAlignment=XL},h)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(13,34),Size=_U2(1,-26,0,15),Text="Comandos de formação – ZAYK VOLVERS V2",TextColor3=K.DGray,TextSize=9,Font=GM,TextXAlignment=XL},h)
    local wc=New("Frame",{Size=_U2(1,0,0,70),BackgroundColor3=_RGB(45,35,20),BorderSizePixel=0,LayoutOrder=1},CH) Cor(wc,8) Sk(wc,K.Orange,1.5)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(48,8),Size=_U2(1,-130,0,35),Text="Deseja executar os comandos Volvers em um menu secundário?",TextColor3=K.White,TextSize=10,Font=GB,TextWrapped=true,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Top},wc)
    local sb=New("TextButton",{AnchorPoint=_V2(1,.5),Position=_U2(1,-12,.5,0),Size=_UO(70,34),BackgroundColor3=K.Success,BorderSizePixel=0,Text="▶ SIM",TextColor3=K.White,TextSize=10,Font=GB,AutoButtonColor=false},wc) Cor(sb,8)
    sb.MouseButton1Click:Connect(function() local ok=pcall(function() loadstring(game:HttpGet("https://pastebin.com/raw/ZrzHAenq"))() end) if ok then Notify("MENU SECUNDÁRIO","Volver aberto.","Success") else Notify("ERRO","Falha ao carregar.","Error") end end)
    local cmds={{"◆ SALVAR POSIÇÃO","Salva somente para onde o personagem está olhando.",true,SaveDir},{"DIREITA VOLVER!","Gira 90° para a direita.",false,function()Turn("DIREITA")end},{"ESQUERDA VOLVER!","Gira 90° para a esquerda.",false,function()Turn("ESQUERDA")end},{"RETAGUARDA VOLVER!","Gira 180° para trás.",false,function()Turn("RETAGUARDA")end},{"VANGUARDA VOLVER!","Retorna à direção salva.",false,Vanguarda}}
    for i,cmd in ipairs(cmds)do
        local c=New("Frame",{Size=_U2(1,0,0,55),BackgroundColor3=cmd[3] and _RGB(38,38,38) or K.Card,BorderSizePixel=0,LayoutOrder=i+2},CH) Cor(c,8) Sk(c,cmd[3] and K.Primary or K.Stroke,cmd[3] and 1.7 or 1)
        New("TextLabel",{BackgroundTransparency=1,Position=_UO(11,5),Size=_U2(1,-100,0,20),Text=cmd[1],TextColor3=K.White,TextSize=10,Font=Enum.Font.GothamBlack,TextXAlignment=XL},c)
        New("TextLabel",{BackgroundTransparency=1,Position=_UO(11,26),Size=_U2(1,-100,0,17),Text=cmd[2],TextColor3=K.Gray,TextSize=7,Font=GM,TextXAlignment=XL},c)
        local eb=New("TextButton",{AnchorPoint=_V2(1,.5),Position=_U2(1,-8,.5,0),Size=_UO(68,30),BackgroundColor3=cmd[3] and K.Orange or K.Success,BorderSizePixel=0,Text="▶ EXECUTAR",TextColor3=K.White,TextSize=8,Font=GB,AutoButtonColor=false},c) Cor(eb,7)
        eb.MouseButton1Click:Connect(function() cmd[4]() end)
    end
end

-- IA CHAT
local iaBusy=false
local function ShowIAChat()
    CurPage="IAChat" ClearAll()
    local h=New("Frame",{Size=_U2(1,0,0,58),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=0},CH) Cor(h,9) Sk(h,K.SLight,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(12,7),Size=_U2(1,-24,0,25),Text="🤖 IA CHAT",TextColor3=K.White,TextSize=16,Font=GB,TextXAlignment=XL},h)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(13,34),Size=_U2(1,-26,0,15),Text="Corrige o texto em português e envia no chat",TextColor3=K.DGray,TextSize=9,Font=GM,TextXAlignment=XL},h)
    local c=New("Frame",{Size=_U2(1,0,0,140),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=1},CH) Cor(c,8) Sk(c,K.Stroke,1)
    local bx=New("TextBox",{Position=_UO(10,10),Size=_U2(1,-20,0,56),BackgroundColor3=K.Panel,BorderSizePixel=0,PlaceholderText="Digite sua mensagem...",PlaceholderColor3=K.DGray,Text="",TextColor3=K.White,TextSize=11,Font=GM,TextWrapped=true,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Top,ClearTextOnFocus=false,MultiLine=false},c) Cor(bx,7) Sk(bx,K.Stroke,1) Pad(bx,6,6,8,8)
    local sd=New("TextButton",{Position=_UO(10,74),Size=_U2(1,-20,0,34),BackgroundColor3=K.Success,BorderSizePixel=0,Text="✨ CORRIGIR E ENVIAR",TextColor3=K.White,TextSize=10,Font=GB,AutoButtonColor=false},c) Cor(sd,7)
    local stt=New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,114),Size=_U2(1,-20,0,18),Text="",TextColor3=K.Gray,TextSize=10,Font=GM,TextXAlignment=XL},c)
    local function setSt(t,cl) stt.Text=t stt.TextColor3=cl end
    sd.MouseButton1Click:Connect(function()
        if iaBusy then return end
        local tx=bx.Text:gsub("^%s+",""):gsub("%s+$","")
        if tx=="" then setSt("⚠️ Digite algo primeiro",K.Orange) return end
        iaBusy=true sd.Text="⏳ AGUARDE..." setSt("🧠 Pensando...",K.Gray)
        task.spawn(function()
            local cor,err=Corrigir(tx)
            if cor then
                if SendChat(cor)then setSt("✅ Corrigido e enviado!",K.Success) bx.Text="" Notify("IA CHAT","Mensagem enviada.","Success") else setSt("❌ Chat não encontrado",K.Err) end
            else setSt("❌ "..tostring(err),K.Err) end
            sd.Text="✨ CORRIGIR E ENVIAR" iaBusy=false
        end)
    end)
end

-- CRÉDITOS
local function ShowCreditos()
    CurPage="Creditos" ClearAll()
    local link="https://discord.gg/NY2RfC7Kx"
    local h=New("Frame",{Size=_U2(1,0,0,58),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=0},CH) Cor(h,9) Sk(h,K.SLight,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(12,7),Size=_U2(1,-24,0,25),Text="👑 CRÉDITOS",TextColor3=K.White,TextSize=16,Font=GB,TextXAlignment=XL},h)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(13,34),Size=_U2(1,-26,0,15),Text="Informações do desenvolvedor",TextColor3=K.DGray,TextSize=9,Font=GM,TextXAlignment=XL},h)
    local dv=New("Frame",{Size=_U2(1,0,0,70),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=1},CH) Cor(dv,8) Sk(dv,K.Stroke,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(11,8),Size=_U2(1,-22,0,54),Text="Esse script foi desenvolvido pelo akira007p 🔵 discord",TextColor3=K.White,TextSize=11,Font=GB,TextWrapped=true,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Center},dv)
    local sv=New("Frame",{Size=_U2(1,0,0,70),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=2},CH) Cor(sv,8) Sk(sv,K.Orange,1.5)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(11,9),Size=_U2(1,-100,0,20),Text="🔵 Servidor do Discord",TextColor3=K.White,TextSize=10,Font=Enum.Font.GothamBlack,TextXAlignment=XL},sv)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(11,32),Size=_U2(1,-100,0,28),Text=link,TextColor3=K.Gray,TextSize=8,Font=GM,TextWrapped=true,TextXAlignment=XL,TextYAlignment=Enum.TextYAlignment.Top},sv)
    local en=New("TextButton",{AnchorPoint=_V2(1,.5),Position=_U2(1,-8,.5,0),Size=_UO(70,32),BackgroundColor3=_RGB(88,101,242),BorderSizePixel=0,Text="▶ ENTRAR",TextColor3=K.White,TextSize=9,Font=GB,AutoButtonColor=false},sv) Cor(en,8)
    en.MouseButton1Click:Connect(function() pcall(function()setclipboard(link)end) pcall(function()game:GetService("GuiService"):OpenBrowserWindow(link)end) Notify("DISCORD","Link copiado!","Success") end)
end

-- LOJA
local function ShowLoja()
    CurPage="Loja" ClearAll()
    local h=New("Frame",{Size=_U2(1,0,0,58),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=0},CH) Cor(h,9) Sk(h,K.SLight,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(12,7),Size=_U2(1,-24,0,25),Text="🔫 LOJA DE ARMAS",TextColor3=K.White,TextSize=16,Font=GB,TextXAlignment=XL},h)
    local c=New("Frame",{Size=_U2(1,0,0,55),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=1},CH) Cor(c,8) Sk(c,_RGB(0,220,255),1.5)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(11,5),Size=_U2(1,-100,0,20),Text="🔫 LOJA DE ARMAS",TextColor3=K.White,TextSize=10,Font=Enum.Font.GothamBlack,TextXAlignment=XL},c)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(11,26),Size=_U2(1,-100,0,17),Text="Abre a loja de armas do jogo.",TextColor3=K.Gray,TextSize=7,Font=GM,TextXAlignment=XL},c)
    local b=New("TextButton",{AnchorPoint=_V2(1,.5),Position=_U2(1,-8,.5,0),Size=_UO(68,30),BackgroundColor3=K.Success,BorderSizePixel=0,Text="▶ ABRIR",TextColor3=K.White,TextSize=8,Font=GB,AutoButtonColor=false},c) Cor(b,7)
    b.MouseButton1Click:Connect(function()
        local g=PG:FindFirstChild("GunShopGui") or (function() for _,x in ipairs(PG:GetDescendants())do if x:IsA("ScreenGui") and x.Name=="GunShopGui" then return x end end end)()
        if not g then Notify("ERRO","Loja não encontrada.","Error") return end
        g.Enabled=true Main.Visible=false
    end)
end

-- COMBATE (AIMBOT + HITBOX)
local ShowCombate
local AB={Ativo=false,MostrarFOV=false,FOV=43,RingTransp=0.3,Cor=_RGB(150,80,255),Thickness=2,OffX=0,OffY=-47,Parte="Cabeça"}
local Cam=workspace.CurrentCamera
local FOVring=nil
pcall(function()
    if typeof(Drawing)~="nil" and Drawing.new then
        FOVring=Drawing.new("Circle")
        FOVring.Visible=false FOVring.Thickness=AB.Thickness FOVring.Color=AB.Cor FOVring.Filled=false FOVring.Radius=AB.FOV FOVring.Position=Cam.ViewportSize/2
    end
end)
local function ABcentro() return Vector2.new(Cam.ViewportSize.X/2+AB.OffX,Cam.ViewportSize.Y/2+AB.OffY) end
local function ABparte(ch)
    if not ch then return nil end
    if AB.Parte=="Cabeça" then return ch:FindFirstChild("Head") or ch:FindFirstChild("HumanoidRootPart")
    else return ch:FindFirstChild("Torso") or ch:FindFirstChild("UpperTorso") or ch:FindFirstChild("LowerTorso") or ch:FindFirstChild("Head") end
end
local function ABlook(t)
    local cp=Cam.CFrame.Position
    local dir=(t-cp).Unit
    local fr=math.rad(Cam.FieldOfView)
    local vx,vy=Cam.ViewportSize.X,Cam.ViewportSize.Y
    local oxr=-math.atan((AB.OffX/vx)*2*math.tan(fr/2))
    local oyr=math.atan((AB.OffY/vy)*2*math.tan(fr/2))
    local cf=CFrame.new(cp,cp+dir)
    cf=cf*CFrame.Angles(oyr,oxr,0)
    Cam.CFrame=cf
end
local function ABclosest()
    local near,last=nil,math.huge
    local ce=ABcentro()
    for _,p in ipairs(P:GetPlayers())do
        if p~=Pl then
            local pt=ABparte(p.Character)
            if pt then
                local ep,vs=Cam:WorldToViewportPoint(pt.Position)
                if vs then
                    local d=(Vector2.new(ep.X,ep.Y)-ce).Magnitude
                    if d<last and d<=AB.FOV then last=d near=p end
                end
            end
        end
    end
    return near
end
R.RenderStepped:Connect(function()
    if FOVring then
        FOVring.Visible=AB.MostrarFOV or AB.Ativo
        FOVring.Radius=AB.FOV FOVring.Color=AB.Cor FOVring.Thickness=AB.Thickness
        FOVring.Position=ABcentro() FOVring.Transparency=AB.RingTransp
    end
    if not AB.Ativo then return end
    local cl=ABclosest()
    if cl then
        local pt=ABparte(cl.Character)
        if pt then ABlook(pt.Position) end
    end
end)

-- HITBOX
local HB={Ativo=false,Visual=true,Tamanho=5,Transp=.7,Cor=_RGB(80,140,230)}
local HBorig={}
local HBtok=os.clock() PG:SetAttribute("ZKYHitbox",HBtok)
local HBpresets={_RGB(80,140,230),_RGB(255,0,0),_RGB(0,255,100),_RGB(255,200,0),_RGB(255,0,255),_RGB(255,255,255),_RGB(150,80,255)}
local function HBsalvar(ch)
    if HBorig[ch] then return end
    local hr=ch:FindFirstChild("HumanoidRootPart") if not hr then return end
    HBorig[ch]={S=hr.Size,T=hr.Transparency,C=hr.Color,M=hr.Material,CC=hr.CanCollide}
end
local function HBapply(ch)
    local hr=ch:FindFirstChild("HumanoidRootPart") if not hr then return end
    HBsalvar(ch)
    pcall(function()
        hr.Size=Vector3.new(HB.Tamanho,HB.Tamanho,HB.Tamanho)
        hr.Transparency=HB.Visual and HB.Transp or 1
        hr.Color=HB.Cor hr.Material=Enum.Material.Neon hr.CanCollide=false
    end)
end
local function HBrestore(ch)
    local o=HBorig[ch] if not o then return end
    local hr=ch:FindFirstChild("HumanoidRootPart")
    if hr then pcall(function() hr.Size=o.S hr.Transparency=o.T hr.Color=o.C hr.Material=o.M hr.CanCollide=o.CC end) end
    HBorig[ch]=nil
end
local HBconn
HBconn=R.Heartbeat:Connect(function()
    if PG:GetAttribute("ZKYHitbox")~=HBtok then HBconn:Disconnect() for c in pairs(HBorig)do HBrestore(c) end return end
    if HB.Ativo then
        for _,p in ipairs(P:GetPlayers())do if p~=Pl and p.Character then HBapply(p.Character) end end
        for c in pairs(HBorig)do if not c.Parent then HBorig[c]=nil end end
    else
        for c in pairs(HBorig)do HBrestore(c) end
    end
end)

local function CBHeader(txt,sub,order)
    local h=New("Frame",{Size=_U2(1,0,0,44),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=order},CH) Cor(h,9) Sk(h,K.SLight,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(12,5),Size=_U2(1,-24,0,20),Text=txt,TextColor3=K.White,TextSize=13,Font=GB,TextXAlignment=XL},h)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(13,25),Size=_U2(1,-26,0,14),Text=sub,TextColor3=K.DGray,TextSize=9,Font=GM,TextXAlignment=XL},h)
end
local function CBSlider(order,titulo,valor,mn,mx,dec,cb)
    local c=New("Frame",{Size=_U2(1,0,0,44),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=order},CH) Cor(c,8) Sk(c,K.Stroke,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,6),Size=_U2(1,-70,0,16),Text=titulo,TextColor3=K.White,TextSize=11,Font=GB,TextXAlignment=XL},c)
    local vl=New("TextLabel",{BackgroundTransparency=1,Position=_U2(1,-60,0,6),Size=_UO(50,16),Text=dec and string.format("%.2f",valor) or tostring(valor),TextColor3=K.Orange,TextSize=12,Font=GB,TextXAlignment=Enum.TextXAlignment.Right},c)
    local bb=New("Frame",{Size=_U2(1,-20,0,6),Position=_UO(10,28),BackgroundColor3=K.Panel,BorderSizePixel=0},c) Cor(bb,3)
    local f=New("Frame",{Size=_U2((valor-mn)/(mx-mn),0,1,0),BackgroundColor3=AB.Cor,BorderSizePixel=0},bb) Cor(f,3)
    local hit=New("TextButton",{Position=_UO(10,20),Size=_U2(1,-20,0,22),BackgroundTransparency=1,Text="",AutoButtonColor=false},c)
    local dr=false
    local function up(x)
        local pct=math.clamp((x-bb.AbsolutePosition.X)/math.max(bb.AbsoluteSize.X,1),0,1)
        local v = dec and (mn+(mx-mn)*pct) or math.floor(mn+(mx-mn)*pct+.5)
        vl.Text = dec and string.format("%.2f",v) or tostring(v)
        f.Size=_U2(pct,0,1,0) cb(v)
    end
    hit.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=true up(i.Position.X) end end)
    U.InputChanged:Connect(function(i) if dr and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then up(i.Position.X) end end)
    U.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=false end end)
end
local function HBToggle(order,txt,ini,cb)
    local c=New("Frame",{Size=_U2(1,0,0,42),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=order},CH) Cor(c,8) Sk(c,K.Stroke,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,0),Size=_U2(1,-70,1,0),Text=txt,TextColor3=K.White,TextSize=11,Font=GM,TextXAlignment=XL},c)
    local sw=New("TextButton",{AnchorPoint=_V2(1,.5),Position=_U2(1,-10,.5,0),Size=_UO(38,20),BackgroundColor3=ini and K.Success or K.Panel,Text="",BorderSizePixel=0,AutoButtonColor=false},c) Cor(sw,10) Sk(sw,K.Stroke,1)
    local bl=New("Frame",{Position=ini and _UO(21,3) or _UO(3,3),Size=_UO(14,14),BackgroundColor3=ini and Color3.new(1,1,1) or K.DGray,BorderSizePixel=0},sw) Cor(bl,7)
    local es=ini
    sw.MouseButton1Click:Connect(function()
        es=not es
        sw.BackgroundColor3=es and K.Success or K.Panel
        bl.Position=es and _UO(21,3) or _UO(3,3)
        bl.BackgroundColor3=es and Color3.new(1,1,1) or K.DGray
        cb(es)
    end)
end
local function HBSlider(order,titulo,valor,mn,mx,cb)
    local c=New("Frame",{Size=_U2(1,0,0,50),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=order},CH) Cor(c,8) Sk(c,K.Stroke,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,7),Size=_U2(1,-70,0,16),Text=titulo,TextColor3=K.White,TextSize=12,Font=GB,TextXAlignment=XL},c)
    local vl=New("TextLabel",{BackgroundTransparency=1,AnchorPoint=_V2(1,0),Position=_U2(1,-10,0,7),Size=_UO(50,16),Text=tostring(valor),TextColor3=K.Orange,TextSize=12,Font=GB,TextXAlignment=Enum.TextXAlignment.Right},c)
    local bb=New("Frame",{Position=_UO(10,38),Size=_U2(1,-20,0,8),BackgroundColor3=K.Panel,BorderSizePixel=0},c) Cor(bb,4)
    local f=New("Frame",{Size=_U2((valor-mn)/(mx-mn),0,1,0),BackgroundColor3=K.Success,BorderSizePixel=0},bb) Cor(f,4)
    local kn=New("Frame",{AnchorPoint=_V2(.5,.5),Position=_U2((valor-mn)/(mx-mn),0,.5,0),Size=_UO(14,14),BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0,ZIndex=2},bb) Cor(kn,7)
    local hit=New("TextButton",{Position=_UO(10,28),Size=_U2(1,-20,0,28),BackgroundTransparency=1,Text="",AutoButtonColor=false,ZIndex=3},c)
    local function up(x)
        local pct=math.clamp((x-bb.AbsolutePosition.X)/math.max(bb.AbsoluteSize.X,1),0,1)
        local v=math.floor(mn+(mx-mn)*pct+.5)
        local p=(v-mn)/(mx-mn)
        vl.Text=tostring(v) f.Size=_U2(p,0,1,0) kn.Position=_U2(p,0,.5,0) cb(v)
    end
    hit.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
            Content.ScrollingEnabled=false up(i.Position.X)
            local mv,fn
            mv=U.InputChanged:Connect(function(m) if m==i or m.UserInputType==Enum.UserInputType.MouseMovement then up(m.Position.X) end end)
            fn=i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then mv:Disconnect() fn:Disconnect() Content.ScrollingEnabled=true end end)
        end
    end)
end

ShowCombate=function()
    CurPage="Combate" ClearAll()
    -- AIMBOT
    CBHeader("🎯 AIMBOT","Mira automática • FOV • Cabeça / Tronco",0)
    local bt=New("TextButton",{Size=_U2(1,0,0,42),BackgroundColor3=AB.Ativo and K.Err or K.Success,Text=AB.Ativo and "PARAR" or "LIGAR",TextColor3=K.White,Font=GB,TextSize=14,BorderSizePixel=0,AutoButtonColor=false,LayoutOrder=1},CH) Cor(bt,8)
    bt.MouseButton1Click:Connect(function() AB.Ativo=not AB.Ativo bt.Text=AB.Ativo and "PARAR" or "LIGAR" bt.BackgroundColor3=AB.Ativo and K.Err or K.Success end)
    local cf=New("Frame",{Size=_U2(1,0,0,42),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=2},CH) Cor(cf,8) Sk(cf,K.Stroke,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,0),Size=_U2(1,-70,1,0),Text="Mostrar FOV",TextColor3=K.White,TextSize=11,Font=GM,TextXAlignment=XL},cf)
    local tf=New("TextButton",{AnchorPoint=_V2(1,.5),Position=_U2(1,-10,.5,0),Size=_UO(38,20),BackgroundColor3=AB.MostrarFOV and K.Success or K.Panel,Text="",BorderSizePixel=0,AutoButtonColor=false},cf) Cor(tf,10) Sk(tf,K.Stroke,1)
    local bf=New("Frame",{Position=AB.MostrarFOV and _UO(21,3) or _UO(3,3),Size=_UO(14,14),BackgroundColor3=AB.MostrarFOV and Color3.new(1,1,1) or K.DGray,BorderSizePixel=0},tf) Cor(bf,7)
    local ef=AB.MostrarFOV
    tf.MouseButton1Click:Connect(function()
        ef=not ef AB.MostrarFOV=ef
        tf.BackgroundColor3=ef and K.Success or K.Panel
        bf.Position=ef and _UO(21,3) or _UO(3,3)
        bf.BackgroundColor3=ef and Color3.new(1,1,1) or K.DGray
    end)
    local af=New("Frame",{Size=_U2(1,0,0,32),BackgroundTransparency=1,LayoutOrder=3},CH)
    New("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=_UD(0,5)},af)
    local opts={}
    local function updA() for _,o in ipairs(opts)do if o.N==AB.Parte then o.B.BackgroundColor3=K.SelRedD o.B.TextColor3=K.SelRed o.S.Color=K.SelRed o.S.Thickness=1.5 else o.B.BackgroundColor3=K.Panel o.B.TextColor3=K.Gray o.S.Color=K.Stroke o.S.Thickness=1 end end end
    for i,nm in ipairs({"Cabeça","Tronco"})do
        local b=New("TextButton",{Size=_U2(0.5,-3,1,0),BackgroundColor3=K.Panel,Text=nm,TextColor3=K.Gray,Font=GB,TextSize=11,BorderSizePixel=0,AutoButtonColor=false},af) Cor(b,6)
        local s=Sk(b,K.Stroke,1) table.insert(opts,{B=b,N=nm,S=s})
        b.MouseButton1Click:Connect(function() AB.Parte=nm updA() end)
    end
    updA()
    CBSlider(4,"Tamanho FOV",AB.FOV,20,200,false,function(v) AB.FOV=v end)
    CBSlider(5,"Transparência",AB.RingTransp,0,1,true,function(v) AB.RingTransp=v end)
    local cc=New("Frame",{Size=_U2(1,0,0,50),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=6},CH) Cor(cc,8) Sk(cc,K.Stroke,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,6),Size=_U2(1,-20,0,14),Text="Cor do FOV",TextColor3=K.White,TextSize=11,Font=GB,TextXAlignment=XL},cc)
    local cfr=New("Frame",{Position=_UO(10,26),Size=_U2(1,-20,0,20),BackgroundTransparency=1},cc)
    for i,cor in ipairs({_RGB(150,80,255),_RGB(255,0,0),_RGB(0,255,100),_RGB(255,200,0),_RGB(0,200,255),_RGB(255,0,255),_RGB(255,255,255)})do
        local b=New("TextButton",{Size=_UO(22,22),Position=_UO((i-1)*28,0),BackgroundColor3=cor,Text="",BorderSizePixel=0,AutoButtonColor=false},cfr) Cor(b,6) Sk(b,K.Stroke,1)
        b.MouseButton1Click:Connect(function() AB.Cor=cor if FOVring then FOVring.Color=cor end end)
    end
    -- HITBOX
    CBHeader("🎯 HITBOX","Reach • tamanho, cor e transparência",10)
    HBToggle(11,"Ativar Reach",HB.Ativo,function(v) HB.Ativo=v Notify("HITBOX",v and "Reach ativado." or "Reach desativado.",v and "Success" or "Error") end)
    HBToggle(12,"Mostrar Visual",HB.Visual,function(v) HB.Visual=v end)
    HBSlider(13,"Tamanho (Reach)",HB.Tamanho,1,50,function(v) HB.Tamanho=v end)
    HBSlider(14,"Transparência",math.floor(HB.Transp*10+.5),0,10,function(v) HB.Transp=v/10 end)
    local cc2=New("Frame",{Size=_U2(1,0,0,98),BackgroundColor3=K.Card,BorderSizePixel=0,LayoutOrder=15},CH) Cor(cc2,8) Sk(cc2,K.Stroke,1)
    New("TextLabel",{BackgroundTransparency=1,Position=_UO(10,7),Size=_U2(1,-20,0,16),Text="Cor da Hitbox",TextColor3=K.White,TextSize=12,Font=GB,TextXAlignment=XL},cc2)
    local fl=New("Frame",{Position=_UO(10,30),Size=_U2(1,-20,0,26),BackgroundTransparency=1},cc2)
    New("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,Padding=_UD(0,5)},fl)
    local amostras={}
    local function mark() for _,a in ipairs(amostras)do a.s.Enabled=(a.cor==HB.Cor) end end
    for _,cor in ipairs(HBpresets)do
        local b=New("TextButton",{Size=_UO(26,26),BackgroundColor3=cor,Text="",BorderSizePixel=0,AutoButtonColor=false},fl) Cor(b,6)
        local s=Sk(b,K.White,1.5) s.Enabled=(cor==HB.Cor)
        table.insert(amostras,{s=s,cor=cor})
        b.MouseButton1Click:Connect(function() HB.Cor=cor mark() end)
    end
    local rf=New("Frame",{Position=_UO(10,64),Size=_U2(1,-20,0,26),BackgroundColor3=K.Panel,BorderSizePixel=0},cc2) Cor(rf,6) Sk(rf,K.Stroke,1)
    local function txtc(c) return string.format("%d,%d,%d",math.floor(c.R*255+.5),math.floor(c.G*255+.5),math.floor(c.B*255+.5)) end
    local rb=New("TextBox",{Position=_UO(6,0),Size=_U2(1,-12,1,0),BackgroundTransparency=1,Text=txtc(HB.Cor),PlaceholderText="R,G,B",PlaceholderColor3=K.DGray,TextColor3=K.White,Font=Enum.Font.Code,TextSize=11,TextXAlignment=XL,ClearTextOnFocus=false},rf)
    rb.FocusLost:Connect(function()
        local r,g,b=rb.Text:match("(%d+)%s*,%s*(%d+)%s*,%s*(%d+)")
        if r and g and b then
            r,g,b=tonumber(r),tonumber(g),tonumber(b)
            if r and g and b and r<=255 and g<=255 and b<=255 then HB.Cor=_RGB(r,g,b) mark() end
        end
        rb.Text=txtc(HB.Cor)
    end)
end

-- TEXTOS PRONTOS
local ShowTextos
do
    local CC={
        {H=_RGB(59,130,246),B=_RGB(30,30,35)},
        {H=_RGB(239,68,68),B=_RGB(38,28,28)},
        {H=_RGB(16,185,129),B=_RGB(28,36,32)},
        {H=_RGB(245,158,11),B=_RGB(38,34,28)},
        {H=_RGB(139,92,246),B=_RGB(32,28,40)},
    }
    local Textos={
        {"POR QUE O EB É IMPORTANTE PRA SOCIEDADE?","O EB não é apenas farda e arma: é o braço forte que guarda a pátria, socorre em tragédias, forma cidadãos de honra e defende a soberania. Sem ele, não há paz social nem futuro seguro pra ninguém."},
        {"POR QUE VOCÊ QUER SUBIR DE PATENTE?","Quero subir de patente pra ajudar mais a tropa, aprender a liderar direito e fazer por merecer a confiança dos meus superiores. Não é por status, é por vontade de servir melhor."},
        {"POR QUE SERVIR AO EXÉRCITO BRASILEIRO?","Sirvo ao Exército porque acredito no Brasil e quero fazer parte de algo maior que eu. É onde aprendo disciplina, honra e o valor de proteger quem não pode se proteger sozinho."},
        {"COMO VOCÊ VÊ SUA JORNADA COMO MILITAR NO FUTURO?","Quero subir uma patente de cada vez, aprender com os oficiais mais experientes e um dia poder treinar os novatos. Pretendo ficar até onde conseguir, sempre honrando a farda."},
    }
    local function cardTema(tema,ordem,cor)
        local c=New("Frame",{Size=_U2(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=cor.B,BorderSizePixel=0,LayoutOrder=ordem,ClipsDescendants=true},CH) Cor(c,8) Sk(c,cor.H,.8,.7)
        New("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder},c)
        local hh=New("Frame",{Size=_U2(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=cor.H,BorderSizePixel=0,LayoutOrder=1},c)
        Pad(hh,8,8,12,12)
        New("TextLabel",{Size=_U2(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Text="🤫 "..tema[1],TextColor3=K.White,Font=GB,TextSize=12,TextXAlignment=XL,TextWrapped=true},hh)
        local bb=New("Frame",{Size=_U2(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=cor.B,BorderSizePixel=0,LayoutOrder=2},c)
        Pad(bb,12,12,12,12)
        New("UIListLayout",{Padding=_UD(0,12),SortOrder=Enum.SortOrder.LayoutOrder},bb)
        New("TextLabel",{Size=_U2(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Text=tema[2],TextColor3=K.Gray,Font=GM,TextSize=11,TextXAlignment=XL,TextWrapped=true,LineHeight=1.25},bb)
        local bc=New("Frame",{Size=_U2(1,0,0,28),BackgroundTransparency=1},bb)
        local cp=New("TextButton",{Size=_UO(75,28),Position=_U2(1,0,0,0),AnchorPoint=_V2(1,0),BackgroundColor3=K.Success,Text="Copiar",TextColor3=K.White,Font=GB,TextSize=11,BorderSizePixel=0,AutoButtonColor=false},bc) Cor(cp,6)
        cp.MouseButton1Click:Connect(function()
            if setclipboard then pcall(setclipboard,tema[2]) cp.Text="Copiado!" cp.BackgroundColor3=_RGB(52,211,153) task.wait(1.5) cp.Text="Copiar" cp.BackgroundColor3=K.Success end
        end)
    end
    ShowTextos=function()
        CurPage="Textos" ClearAll()
        for i,t in ipairs(Textos)do cardTema(t,i,CC[((i-1)%#CC)+1]) end
        -- card IA
        local ai=New("Frame",{Size=_U2(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=_RGB(28,24,38),BorderSizePixel=0,LayoutOrder=999,ClipsDescendants=true},CH) Cor(ai,8) Sk(ai,_RGB(139,92,246),1,.4)
        New("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder},ai)
        local ah=New("Frame",{Size=_U2(1,0,0,35),BackgroundColor3=_RGB(139,92,246),BorderSizePixel=0,LayoutOrder=1},ai)
        New("TextLabel",{Size=_U2(1,-20,1,0),Position=_UO(12,0),BackgroundTransparency=1,Text="🤖 GERADOR DE TEXTO IA",TextColor3=_RGB(240,240,245),Font=GB,TextSize=12,TextXAlignment=XL},ah)
        local ab=New("Frame",{Size=_U2(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=_RGB(28,24,38),BorderSizePixel=0,LayoutOrder=2},ai)
        Pad(ab,10,10,10,10)
        New("UIListLayout",{Padding=_UD(0,10),SortOrder=Enum.SortOrder.LayoutOrder},ab)
        New("TextLabel",{Size=_U2(1,0,0,14),BackgroundTransparency=1,Text="Tema (ex: por que servir ao EB?)",TextColor3=_RGB(155,155,165),Font=GM,TextSize=10,TextXAlignment=XL},ab)
        local inp=New("TextBox",{Size=_U2(1,0,0,32),BackgroundColor3=_RGB(22,22,26),PlaceholderText="Digite o tema aqui...",PlaceholderColor3=_RGB(155,155,165),Text="",TextColor3=_RGB(240,240,245),Font=GM,TextSize=11,TextXAlignment=XL,BorderSizePixel=0,ClearTextOnFocus=false},ab) Cor(inp,6) Sk(inp,_RGB(50,50,58),1,.5)
        local bg=New("TextButton",{Size=_U2(1,0,0,34),BackgroundColor3=_RGB(139,92,246),Text="⚡ GERAR TEXTO",TextColor3=_RGB(240,240,245),Font=GB,TextSize=12,BorderSizePixel=0,AutoButtonColor=false},ab) Cor(bg,8)
        local out=New("TextLabel",{Size=_U2(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Text="O texto gerado aparecerá aqui...",TextColor3=_RGB(155,155,165),Font=GM,TextSize=11,TextXAlignment=XL,TextWrapped=true,LineHeight=1.25},ab)
        local bc2=New("TextButton",{Size=_U2(1,0,0,30),BackgroundColor3=_RGB(32,32,38),Text="📋 COPIAR TEXTO GERADO",TextColor3=_RGB(155,155,165),Font=GB,TextSize=11,BorderSizePixel=0,AutoButtonColor=false},ab) Cor(bc2,6)
        local ultimo=""
        bg.MouseButton1Click:Connect(function()
            if inp.Text=="" then out.Text="⚠️ Digite um tema primeiro." out.TextColor3=_RGB(245,158,11) return end
            out.Text="⏳ Gerando texto... aguarde." out.TextColor3=_RGB(245,158,11)
            bc2.BackgroundColor3=_RGB(32,32,38) bc2.TextColor3=_RGB(155,155,165)
            local t,err=GerarTexto(inp.Text)
            if t then ultimo=t out.Text=t out.TextColor3=_RGB(240,240,245) bc2.BackgroundColor3=_RGB(16,185,129) bc2.TextColor3=_RGB(240,240,245)
            else ultimo="" out.Text="❌ Erro: "..tostring(err) out.TextColor3=_RGB(239,68,68) end
        end)
        bc2.MouseButton1Click:Connect(function()
            if ultimo=="" then bc2.Text="⚠️ Gere um texto primeiro" task.wait(1.5) bc2.Text="📋 COPIAR TEXTO GERADO" return end
            if setclipboard then local ok=pcall(setclipboard,ultimo) if ok then bc2.Text="✓ COPIADO!" bc2.BackgroundColor3=_RGB(52,211,153) task.wait(1.5) bc2.Text="📋 COPIAR TEXTO GERADO" bc2.BackgroundColor3=_RGB(16,185,129) end end
        end)
    end
end

-- SELETOR DE ABAS
local function SelBtn(b)
    if selBtn then selBtn.BackgroundColor3=K.Card selBtn.TextColor3=K.Gray end
    selBtn=b b.BackgroundColor3=K.Sel b.TextColor3=K.White
end
btnEBDelta.MouseButton1Click:Connect(function() SelBtn(btnEBDelta) ShowEBDelta() end)
btnTaffs.MouseButton1Click:Connect(function() SelBtn(btnTaffs) ShowTaffs() end)
btnVolvers.MouseButton1Click:Connect(function() SelBtn(btnVolvers) ShowVolvers() end)
btnIA.MouseButton1Click:Connect(function() SelBtn(btnIA) ShowIAChat() end)
btnCombate.MouseButton1Click:Connect(function() SelBtn(btnCombate) ShowCombate() end)
btnTextos.MouseButton1Click:Connect(function() SelBtn(btnTextos) ShowTextos() end)
btnLoja.MouseButton1Click:Connect(function() SelBtn(btnLoja) ShowLoja() end)
btnCreditos.MouseButton1Click:Connect(function() SelBtn(btnCreditos) ShowCreditos() end)

-- DRAG / OPEN / CLOSE
local ldrag=false local lds,lsp
Logo.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then ldrag=true lds=i.Position lsp=Logo.Position i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then ldrag=false end end) end end)
U.InputChanged:Connect(function(i) if ldrag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then local d=i.Position-lds Logo.Position=_U2(lsp.X.Scale,lsp.X.Offset+d.X,lsp.Y.Scale,lsp.Y.Offset+d.Y) end end)
local mdrag=false local mds,msp
Header.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then mdrag=true mds=i.Position msp=Main.Position i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then mdrag=false end end) end end)
U.InputChanged:Connect(function(i) if mdrag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then local d=i.Position-mds Main.Position=_U2(msp.X.Scale,msp.X.Offset+d.X,msp.Y.Scale,msp.Y.Offset+d.Y) end end)
local Opened=false
local function OpenM() if Opened then return end Opened=true Main.Visible=true Main.Size=UDim2.fromScale(.25,.15) Main.BackgroundTransparency=1 T:Create(Main,TweenInfo.new(.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.fromScale(.78,.65),BackgroundTransparency=0}):Play() end
local function CloseM() if not Opened then return end Opened=false local tw=T:Create(Main,TweenInfo.new(.25,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{Size=UDim2.fromScale(.25,.15),BackgroundTransparency=1}) tw:Play() tw.Completed:Wait() if not Opened then Main.Visible=false end end
Logo.MouseButton1Click:Connect(function() if Opened then CloseM() else OpenM() end end)
BtnX.MouseButton1Click:Connect(CloseM)

-- CARREGAMENTO INICIAL
task.defer(function()
    local loaded=0
    for _,c in ipairs(CAT)do if LoadCat(c)then loaded=loaded+1 end end
    local lt1=LoadTR("Torre 1","Única") local lt2=0
    for _,r in ipairs(T2RO)do if LoadTR("Torre 2",r)then lt2=lt2+1 end end
    for i=1,4 do selCat[i]="Lento" end
    ShowEBDelta()
    Notify("ZKY PARKOUR EB","v3.3 • "..loaded.."/4 parkours • T1:"..(lt1 and "OK" or "X").." • T2:"..lt2.."/4", loaded==4 and lt1 and lt2==4 and "Success" or "Error")
end)

print("[ZKY PARKOUR EB V3.3] Carregado!")