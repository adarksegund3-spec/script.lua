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
    t.Text = "ZKY PARKOUR - KEY"
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

local _I,_U2,_UO,_UD,_RGB,_V2,_GB,_GM,_XL,_XC=Instance.new,UDim2.new,UDim2.fromOffset,UDim.new,Color3.fromRGB,Vector2.new,Enum.Font.GothamBold,Enum.Font.GothamMedium,Enum.TextXAlignment.Left,Enum.TextXAlignment.Center
local P=game:GetService("Players") local T=game:GetService("TweenService") local U=game:GetService("UserInputService") local R=game:GetService("RunService")
local HS=game:GetService("HttpService") local TCS=game:GetService("TextChatService") local RS=game:GetService("ReplicatedStorage") local Pl=P.LocalPlayer
local PG=Pl:WaitForChild("PlayerGui") local character,humanoid,rootPart local CONFIG={ LineThickness=.15, LineTransparency=.2, LineColor=_RGB(255,145,45),
JumpCooldown=.28, PlaybackSpeed=1, WalkToSpeed=16, GroundOffset=1.66 } local IA_CONFIG={ ApiKey="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",
Endpoint="https://api.groq.com/openai/v1/chat/completions", Modelo="openai/gpt-oss-120b", Timeout=10,
SystemPrompt="Você é um corretor gramatical. Corrija a mensagem do usuário para português do Brasil, mantendo o significado e o tom original. Responda APENAS com a mensagem corrigida, sem explicações, aspas ou comentários extras."
} local httpRequest=request or(syn and syn.request) or(http and http.request) or http_request local Pastebins={ Lento="https://pastebin.com/raw/M7DvRgTc",
["Rápido"]="https://pastebin.com/raw/pBk8vYXE", ["Mais Rápido"]="https://pastebin.com/raw/yz7gZmYr", ["Sem Burla"]="https://pastebin.com/raw/N1j0iRDA" }
local CategoryOrder={"Lento","Rápido","Mais Rápido","Sem Burla"} local TowerPastebins={ ["Torre 1"]={["Única"]="https://pastebin.com/raw/HxXb4Mr3"}, ["Torre 2"]={
Frente="https://pastebin.com/raw/Y2arCYHb", ["Atrás"]="https://pastebin.com/raw/rXxZX7CQ", Esquerda="https://pastebin.com/raw/FtpTHhGt",
Direita="https://pastebin.com/raw/4u5Wjtkg" } } local Tower2RouteOrder={"Frente","Atrás","Esquerda","Direita"}
local routes={Lento={},["Rápido"]={},["Mais Rápido"]={},["Sem Burla"]={}} local towerRoutes={["Torre 1"]={},["Torre 2"]={Frente={},["Atrás"]={},Esquerda={},Direita={}}}
local selectedCategory,expandedParkour={},{} local selectedTower2Route="Frente" local expandedTower2=false local CurrentPage="Parkours" local lineFolder
local linesVisible=true local Playback={ Running=false, Connection=nil, Route=nil, StartClock=0, CurrentIndex=1, LastJump=-math.huge, Category=nil, Parkour=nil,
Tower=nil, TowerRoute=nil, WalkingToStart=false, WalkConnection=nil } local SavedDirection=nil local Turning=false local Old=PG:FindFirstChild("ZKY_PARKOUR")
if Old then Old:Destroy()end local _K={ Background=_RGB(18,18,20), Panel=_RGB(24,24,27), Card=_RGB(31,31,35), CardHover=_RGB(39,39,43), Selected=_RGB(55,55,60),
Stroke=_RGB(65,65,70), StrokeLight=_RGB(85,85,90), White=_RGB(245,245,245), Gray=_RGB(175,175,180), DarkGray=_RGB(115,115,120), Success=_RGB(80,210,125),
Error=_RGB(230,85,85), Orange=_RGB(255,145,45), SelectionRed=_RGB(225,70,70), SelectionRedDark=_RGB(75,32,32), Primary=_RGB(185,185,185) } local function Corner(o,r)
local c=_I("UICorner") c.CornerRadius=_UD(0,r) c.Parent=o end local function Stroke(o,c,t) local s=_I("UIStroke") s.Color=c s.Thickness=t or 1 s.Parent=o return s end
local function Padding(o,t,b,l,rr) local p=_I("UIPadding") p.PaddingTop=_UD(0,t or 0) p.PaddingBottom=_UD(0,b or 0) p.PaddingLeft=_UD(0,l or 0)
p.PaddingRight=_UD(0,rr or 0) p.Parent=o end local NH=_I("Frame") NH.Name="Notifications" NH.AnchorPoint=_V2(1,1) NH.Position=_U2(1,-15,1,-15) NH.Size=_UO(270,300)
NH.BackgroundTransparency=1 NH.ZIndex=200 NH.Parent=PG local NL=_I("UIListLayout") NL.VerticalAlignment=Enum.VerticalAlignment.Bottom
NL.HorizontalAlignment=Enum.HorizontalAlignment.Right NL.Padding=_UD(0,7) NL.Parent=NH local function Notify(tt,msg,nt) local c=_K.Gray if nt=="Success" then c=_K.Success
elseif nt=="Error" then c=_K.Error elseif nt=="Orange" then c=_K.Orange end local n=_I("Frame") n.Size=_UO(250,64) n.BackgroundColor3=_K.Panel n.BorderSizePixel=0
n.BackgroundTransparency=1 n.ZIndex=201 n.Parent=NH Corner(n,10) local ns=Stroke(n,c) ns.Transparency=1 local a=_I("Frame") a.Size=_UO(3,38) a.AnchorPoint=_V2(0,.5)
a.Position=_U2(0,7,.5,0) a.BackgroundColor3=c a.BorderSizePixel=0 a.BackgroundTransparency=1 a.ZIndex=202 a.Parent=n Corner(a,5) local ttl=_I("TextLabel")
ttl.BackgroundTransparency=1 ttl.Position=_UO(18,9) ttl.Size=_U2(1,-28,0,18) ttl.Text=tt ttl.TextColor3=_K.White ttl.TextSize=12 ttl.Font=_GB ttl.TextXAlignment=_XL
ttl.ZIndex=203 ttl.Parent=n local msgL=_I("TextLabel") msgL.BackgroundTransparency=1 msgL.Position=_UO(18,30) msgL.Size=_U2(1,-28,0,25) msgL.Text=msg
msgL.TextColor3=_K.Gray msgL.TextSize=9 msgL.Font=_GM msgL.TextWrapped=true msgL.TextXAlignment=_XL msgL.TextYAlignment=Enum.TextYAlignment.Center msgL.ZIndex=203
msgL.Parent=n n.Position=_U2(1,270,0,0) T:Create(n,TweenInfo.new(.35,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Position=_U2(),BackgroundTransparency=0}):Play()
T:Create(ns,TweenInfo.new(.25),{Transparency=0}):Play() T:Create(a,TweenInfo.new(.25),{BackgroundTransparency=0}):Play() task.delay(2.8,function()
if not n.Parent then return end local o=T:Create(n,TweenInfo.new(.3,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{Position=_U2(1,270),BackgroundTransparency=1})
o:Play() T:Create(ns,TweenInfo.new(.2),{Transparency=1}):Play() T:Create(a,TweenInfo.new(.2),{BackgroundTransparency=1}):Play() o.Completed:Wait()
if n.Parent then n:Destroy()end end) end local function RefreshCharacter() character=Pl.Character if not character or not character.Parent then return false end
humanoid=character:FindFirstChildOfClass("Humanoid") rootPart=character:FindFirstChild("HumanoidRootPart") return humanoid~=nil and rootPart~=nil end
Pl.CharacterAdded:Connect(function()task.wait(.2);RefreshCharacter()end) RefreshCharacter() local function Number(v)return v and tonumber(v)end
local function ParseRoutes(raw) local parsed,blocks={},{} local sp=1 while true do local s=string.find(raw,"local Rota = {",sp) if not s then break end local b,e=0
for i=s,#raw do local ch=string.sub(raw,i,i) if ch=="{" then b+=1 elseif ch=="}" then b-=1;if b==0 then e=i;break end end end if not e then break end
table.insert(blocks,string.sub(raw,s,e)) sp=e+1 end for _,block in ipairs(blocks)do local frames,fs={},1 while true do local p1,p2=string.find(block,"{(.-)}",fs)
if not p1 then break end local f=string.sub(block,p1,p2) local t=string.match(f,"t%s*=%s*([%d%.%-]+)") local x=string.match(f,"x%s*=%s*([%d%.%-]+)")
local y=string.match(f,"y%s*=%s*([%d%.%-]+)") local z=string.match(f,"z%s*=%s*([%d%.%-]+)") local j=string.match(f,"j%s*=%s*([%w]+)")
local rx=string.match(f,"rx%s*=%s*([%d%.%-]+)") local ry=string.match(f,"ry%s*=%s*([%d%.%-]+)") local rz=string.match(f,"rz%s*=%s*([%d%.%-]+)")
if t and x and y and z then
local q={t=Number(t),x=Number(x),y=Number(y),z=Number(z),j=j=="true",position=Vector3.new(Number(x),Number(y),Number(z)),rx=Number(rx),ry=Number(ry),rz=Number(rz)}
if q.rx and q.ry and q.rz then q.rotation=CFrame.Angles(q.rx,q.ry,q.rz);q.hasRotation=true else q.hasRotation=false end table.insert(frames,q) end fs=p2+1 end
if#frames>=2 then table.sort(frames,function(a,b)return a.t<b.t end);table.insert(parsed,frames)end end return parsed end local function LoadCategory(cat)
local url=Pastebins[cat];if not url then return false end local ok,raw=pcall(function()return game:HttpGet(url)end) if not ok or not raw then return false end
local p=ParseRoutes(raw);if#p==0 then return false end routes[cat]=p;return true end local function LoadTowerRoute(tower,route)
local d=TowerPastebins[tower];if not d then return false end local url=d[route];if not url then return false end local ok,raw=pcall(function()return game:HttpGet(url)end)
if not ok or not raw then return false end local p=ParseRoutes(raw);if#p==0 then return false end towerRoutes[tower]=towerRoutes[tower]or{} towerRoutes[tower][route]=p[1]
return true end local function CreateLine(a,b) if not a or not b then return end local d=b-a;local dist=d.Magnitude;if dist<.01 then return end
if not lineFolder then lineFolder=_I("Folder");lineFolder.Name="ZKY_RouteLines";lineFolder.Parent=workspace end local l=_I("Part") l.Name="RouteSegment" l.Anchored=true
l.CanCollide=false l.CanTouch=false l.CanQuery=false l.CastShadow=false l.Material=Enum.Material.Neon l.Color=CONFIG.LineColor
l.Transparency=linesVisible and CONFIG.LineTransparency or 1 l.Size=Vector3.new(CONFIG.LineThickness,CONFIG.LineThickness,dist) l.CFrame=CFrame.lookAt((a+b)/2,b)
l.Parent=lineFolder end local function ClearLines() if not lineFolder then return end for _,o in ipairs(lineFolder:GetChildren())do o:Destroy()end end
local function ShowRouteLines(data) ClearLines();local last for _,f in ipairs(data)do local p=f.position;if last then CreateLine(last,p)end;last=p end end
local function GetPosition(f) if not f then return end if f.position then return f.position end if f.x and f.y and f.z then return Vector3.new(f.x,f.y,f.z)end end
local function GetRotation(f) if not f then return end if f.rotation then return f.rotation end if f.rx and f.ry and f.rz then return CFrame.Angles(f.rx,f.ry,f.rz)end end
local function ApplyPosition(pos,rot) if not pos or not RefreshCharacter()then return false end local corrected=pos+Vector3.new(0,CONFIG.GroundOffset,0) local target
if rot then target=CFrame.new(corrected)*rot else local look=rootPart.CFrame.LookVector local flat=Vector3.new(look.X,0,look.Z)
if flat.Magnitude<.01 then flat=Vector3.new(0,0,-1)else flat=flat.Unit end target=CFrame.lookAt(corrected,corrected+flat) end
pcall(function()character:PivotTo(target)end) return true end local function GetFrames(frames,elapsed) local count=#frames;if count<2 then return end
if elapsed<=frames[1].t then Playback.CurrentIndex=1;return frames[1],frames[2],0 end if elapsed>=frames[count].t then return frames[count],frames[count],1 end
local i=math.clamp(Playback.CurrentIndex,1,count-1) while i<count-1 and elapsed>frames[i+1].t do i+=1 end while i>1 and elapsed<frames[i].t do i-=1 end
Playback.CurrentIndex=i local a,b=frames[i],frames[i+1] local d=b.t-a.t local alpha=d>0 and math.clamp((elapsed-a.t)/d,0,1)or 0 return a,b,alpha end
local function HandleJump(f,e) if not f or not f.j or e-Playback.LastJump<CONFIG.JumpCooldown or not RefreshCharacter()then return end Playback.LastJump=e
humanoid.Jump=true pcall(function()humanoid:ChangeState(Enum.HumanoidStateType.Jumping)end) end local function StopPlayback(reason)
if Playback.Connection then Playback.Connection:Disconnect();Playback.Connection=nil end
if Playback.WalkConnection then Playback.WalkConnection:Disconnect();Playback.WalkConnection=nil end Playback.Running=false Playback.Route=nil Playback.CurrentIndex=1
Playback.LastJump=-math.huge Playback.Category=nil Playback.Parkour=nil Playback.Tower=nil Playback.TowerRoute=nil Playback.WalkingToStart=false
if RefreshCharacter()then humanoid:Move(Vector3.zero,false);humanoid.Jump=false end ClearLines()
if reason=="completed" then Notify("CONCLUÍDO","Rota finalizada!","Success") elseif reason=="cancelled" then Notify("PARADO","Reprodução interrompida.","Error")
elseif reason=="error" then Notify("ERRO","Não foi possível continuar.","Error")end end local function StartPlayback(data,cat,num,tower,towerRoute)
if Playback.Running then Notify("EM EXECUÇÃO","Pare a rota atual antes de iniciar outra.","Error");return end
if not data or#data<2 then Notify("ROTA INVÁLIDA","Essa rota não possui frames suficientes.","Error");return end
if not RefreshCharacter()then Notify("PERSONAGEM","Personagem não encontrado.","Error");return end local first=data[1] local fp=GetPosition(first)
if not fp then Notify("ERRO","Primeiro ponto da rota inválido.","Error");return end local target=fp+Vector3.new(0,CONFIG.GroundOffset,0) Playback.Running=true
Playback.WalkingToStart=true Playback.Route=data Playback.Category=cat Playback.Parkour=num Playback.Tower=tower Playback.TowerRoute=towerRoute Playback.CurrentIndex=1
ShowRouteLines(data) local name if tower then name=tower=="Torre 1" and "Torre 1" or "Torre 2 • "..towerRoute else name="Parkour "..num.." • "..cat end
Notify("INDO PARA O INÍCIO",name,"Orange") humanoid.WalkSpeed=CONFIG.WalkToSpeed humanoid:MoveTo(target) local started=os.clock()
Playback.WalkConnection=R.Heartbeat:Connect(function() if not Playback.Running or not Playback.WalkingToStart then return end
if not RefreshCharacter()then StopPlayback("error");return end if(rootPart.Position-target).Magnitude<=4 then
if Playback.WalkConnection then Playback.WalkConnection:Disconnect();Playback.WalkConnection=nil end Playback.WalkingToStart=false humanoid:Move(Vector3.zero,false)
Playback.StartClock=os.clock() Playback.CurrentIndex=1 Playback.LastJump=-math.huge Notify("EXECUTANDO",name,"Success") task.spawn(function()
while Playback.Running and not Playback.WalkingToStart do if not RefreshCharacter()then StopPlayback("error");break end local frames=Playback.Route
if not frames or#frames<2 then StopPlayback("error");break end local elapsed=(os.clock()-Playback.StartClock)*CONFIG.PlaybackSpeed local final=frames[#frames]
if elapsed>=final.t then ApplyPosition(GetPosition(final),GetRotation(final)) StopPlayback("completed") break end local a,b,alpha=GetFrames(frames,elapsed)
if not a or not b then break end local pa,pb=GetPosition(a),GetPosition(b) if not pa or not pb then StopPlayback("error");break end local pos=pa:Lerp(pb,alpha)
local ra,rb=GetRotation(a),GetRotation(b) local rot if ra and rb then rot=ra:Lerp(rb,alpha) elseif ra then rot=ra elseif rb then rot=rb end ApplyPosition(pos,rot)
HandleJump(a,elapsed) task.wait() end end) return end if os.clock()-started>60 then StopPlayback("error")end end) end local function SaveDirection()
if not RefreshCharacter()then Notify("ERRO","Personagem não encontrado.","Error") return end local look=rootPart.CFrame.LookVector local flat=Vector3.new(look.X,0,look.Z)
if flat.Magnitude<=0 then Notify("ERRO","Direção inválida.","Error") return end SavedDirection=flat.Unit Notify("DIREÇÃO SALVA","Direção guardada com sucesso!","Success")
end local function Turn(command) if Turning then Notify("AGUARDE","Já está girando.","Error") return end if not RefreshCharacter()then
Notify("ERRO","Personagem não encontrado.","Error") return end Turning=true local oldAutoRotate=humanoid.AutoRotate humanoid.AutoRotate=false local angle
if command=="DIREITA" then angle=math.rad(-90) elseif command=="ESQUERDA" then angle=math.rad(90) elseif command=="RETAGUARDA" then angle=math.rad(180) end if angle then
local pos=rootPart.Position local newCF=rootPart.CFrame*CFrame.Angles(0,angle,0) rootPart.CFrame=CFrame.new(pos)*(newCF-newCF.Position) end task.wait()
humanoid.AutoRotate=oldAutoRotate Turning=false Notify(command.." VOLVER!","Giro executado.","Success") end local function VanguardaVolver() if not SavedDirection then
Notify("ERRO","Salve uma direção primeiro.","Error") return end if not RefreshCharacter()then Notify("ERRO","Personagem não encontrado.","Error") return end
local pos=rootPart.Position local oldAutoRotate=humanoid.AutoRotate humanoid.AutoRotate=false rootPart.CFrame=CFrame.lookAt(pos,pos+SavedDirection) task.wait()
humanoid.AutoRotate=oldAutoRotate Notify("VANGUARDA VOLVER!","Retornou à direção salva.","Success") end local function EnviarNoChat(msg) msg=string.sub(msg,1,200)
if TCS.ChatVersion==Enum.ChatVersion.TextChatService then local canais=TCS:FindFirstChild("TextChannels") local canal=canais and canais:FindFirstChild("RBXGeneral")
if canal then canal:SendAsync(msg);return true end end local eventos=RS:FindFirstChild("DefaultChatSystemChatEvents")
local say=eventos and eventos:FindFirstChild("SayMessageRequest") if say then say:FireServer(msg,"All");return true end return false end
local function CorrigirTexto(texto) if not httpRequest then return nil,"Executor sem suporte a HTTP" end local corpo=HS:JSONEncode({ model=IA_CONFIG.Modelo, messages={
{role="system",content=IA_CONFIG.SystemPrompt}, {role="user",content=texto} }, temperature=.2 }) local resposta,terminou=nil,false task.spawn(function()
local ok,res=pcall(function() return httpRequest({ Url=IA_CONFIG.Endpoint, Method="POST", Headers={ ["Content-Type"]="application/json",
["Authorization"]="Bearer "..IA_CONFIG.ApiKey }, Body=corpo }) end) if ok then resposta=res end terminou=true end) local inicio=tick()
while not terminou and(tick()-inicio)<IA_CONFIG.Timeout do task.wait(.1)end if not terminou then return nil,"Tempo esgotado" end
if not resposta then return nil,"Falha na requisição" end if resposta.StatusCode~=200 then return nil,"HTTP "..tostring(resposta.StatusCode)end
local okJson,dados=pcall(function()return HS:JSONDecode(resposta.Body)end)
if not okJson or not dados.choices or not dados.choices[1]then return nil,"Resposta inválida" end local txt=dados.choices[1].message and dados.choices[1].message.content
if not txt or txt=="" then return nil,"Resposta vazia" end txt=txt:gsub("^%s+",""):gsub("%s+$","") txt=txt:gsub('^[""]+',""):gsub('[""]+$',"") return txt end
local Gui=_I("ScreenGui") Gui.Name="ZKY_PARKOUR" Gui.ResetOnSpawn=false Gui.IgnoreGuiInset=true Gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling Gui.Parent=PG
local Logo=_I("TextButton") Logo.Name="ZKY_Logo" Logo.Size=_UO(58,58) Logo.Position=_UO(12,65) Logo.BackgroundColor3=_RGB(10,10,10) Logo.BorderSizePixel=0 Logo.Text="🚀"
Logo.TextColor3=_K.White Logo.TextSize=26 Logo.Font=_GB Logo.AutoButtonColor=false Logo.Parent=Gui Corner(Logo,29) Stroke(Logo,_K.StrokeLight) local Main=_I("Frame")
Main.Name="Main" Main.AnchorPoint=_V2(.5,.5) Main.Position=UDim2.fromScale(.5,.5) Main.Size=UDim2.fromScale(.78,.65) Main.BackgroundColor3=_K.Background
Main.BorderSizePixel=0 Main.Visible=false Main.ClipsDescendants=true Main.ZIndex=10 Main.Parent=Gui Corner(Main,14) Stroke(Main,_K.Stroke) local Header=_I("Frame")
Header.Size=_U2(1,-16,0,54) Header.Position=_UO(8,8) Header.BackgroundColor3=_K.Panel Header.BorderSizePixel=0 Header.ZIndex=20 Header.Parent=Main Corner(Header,10)
Stroke(Header,_K.Stroke) local Title=_I("TextLabel") Title.BackgroundTransparency=1 Title.Position=_UO(13,7) Title.Size=_U2(.55,0,0,23) Title.Text="🚀 ZKY PARKOUR"
Title.TextColor3=_K.White Title.TextSize=17 Title.Font=_GB Title.TextXAlignment=_XL Title.ZIndex=22 Title.Parent=Header local Subtitle=_I("TextLabel")
Subtitle.BackgroundTransparency=1 Subtitle.Position=_UO(14,31) Subtitle.Size=_U2(.65,0,0,15) Subtitle.Text="Auto Parkour • V2.2" Subtitle.TextColor3=_K.DarkGray
Subtitle.TextSize=9 Subtitle.Font=_GM Subtitle.TextXAlignment=_XL Subtitle.ZIndex=22 Subtitle.Parent=Header local Version=_I("TextLabel") Version.BackgroundColor3=_K.Card
Version.AnchorPoint=_V2(.5,.5) Version.Position=_U2(.5,0,.5,0) Version.Size=_UO(55,25) Version.Text="V2.2" Version.TextColor3=_K.Gray Version.TextSize=10 Version.Font=_GB
Version.ZIndex=22 Version.Parent=Header Corner(Version,8) Stroke(Version,_K.Stroke) local Close=_I("TextButton") Close.Size=_UO(34,34) Close.Position=_U2(1,-42,.5,-17)
Close.BackgroundColor3=_K.Card Close.BorderSizePixel=0 Close.Text="×" Close.TextColor3=_K.Gray Close.TextSize=22 Close.Font=_GM Close.AutoButtonColor=false
Close.ZIndex=25 Close.Parent=Header Corner(Close,10) Stroke(Close,_K.Stroke) local Sidebar=_I("ScrollingFrame") Sidebar.Size=_U2(0,118,1,-78) Sidebar.Position=_UO(8,70)
Sidebar.BackgroundColor3=_K.Panel Sidebar.BorderSizePixel=0 Sidebar.ScrollBarThickness=2 Sidebar.ScrollBarImageColor3=_K.StrokeLight
Sidebar.AutomaticCanvasSize=Enum.AutomaticSize.Y Sidebar.ZIndex=20 Sidebar.Parent=Main Corner(Sidebar,10) Stroke(Sidebar,_K.Stroke) Padding(Sidebar,7,7,6,6)
local SideLayout=_I("UIListLayout") SideLayout.Padding=_UD(0,5) SideLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center SideLayout.Parent=Sidebar
local function SideButton(text,selected) local b=_I("TextButton") b.Size=_U2(1,0,0,39) b.BackgroundColor3=selected and _K.Selected or _K.Card b.BorderSizePixel=0
b.Text=text b.TextColor3=selected and _K.White or _K.Gray b.TextSize=9 b.Font=_GB b.TextXAlignment=_XL b.AutoButtonColor=false b.Parent=Sidebar Corner(b,7)
Padding(b,0,0,8,2) Stroke(b,_K.Stroke) return b end local creditosButton=SideButton("👑 CRÉDITOS",false) local parkourButton=SideButton("🏃 PARKOURS",true) local towerButton=SideButton("🏰 TORRES")
local taffsButton=SideButton("📝 TAFFS") local volversButton=SideButton("↪ VOLVERS",false) local iaButton=SideButton("🤖 IA CHAT",false) local selectedButton=parkourButton
local Content=_I("ScrollingFrame") Content.Size=_U2(1,-134,1,-78) Content.Position=_U2(0,126,0,70) Content.BackgroundColor3=_K.Panel Content.BorderSizePixel=0
Content.ScrollBarThickness=3 Content.ScrollBarImageColor3=_K.StrokeLight Content.AutomaticCanvasSize=Enum.AutomaticSize.Y Content.ZIndex=20 Content.Parent=Main
Corner(Content,10) Stroke(Content,_K.Stroke) local _CH=_I("Frame") _CH.Size=_U2(1,0,0,0) _CH.AutomaticSize=Enum.AutomaticSize.Y _CH.BackgroundTransparency=1
_CH.Parent=Content Padding(_CH,9,9,9,9) local ContentLayout=_I("UIListLayout") ContentLayout.Padding=_UD(0,7) ContentLayout.Parent=_CH local function ClearContent()
for _,c in ipairs(_CH:GetChildren())do if c:IsA("GuiObject")then c:Destroy()end end end local TAFFS_DATA={ { Name="CIE", Emoji="🕵️‍♂️", Color=_RGB(70,130,180), Fields={
{"🕵️‍♂️ CIE","Centro de Inteligência do Exército"}, {"👤 Criador","vicofjgfhf"}, {"👤 Sub criador","RIP_dabfj8w"}, {"👤 Comandante","eriqurrr."},
{"👤 Subcomandante","nohanrtop"}, {"📜 Lema","Inteligência para Vitória & Saber para Prever."}, {"💬 Saudação","Saudações, senhores Agentes."},
{"💬 Saudação","Saudações, senhores Fantasmas."}, {"💬 Saudação","Saudações, senhor Agente."}, {"💬 Saudação","Saudações, senhor Fantasma."} } }, { Name="REC MEC",
Emoji="🐎", Color=_RGB(220,180,60), Fields={ {"🐎 REC MEC","Regimento de Cavalaria Mecanizado"}, {"👤 Comandante","terro_2433."}, {"👤 Subcomandante","Contanum5bl"},
{"📜 Lema","Haverá sempre uma Cavalaria!, Aço na mente, motor no peito e honra na missão!"}, {"💬 Saudação","Saudações, senhores Cavaleiros."},
{"💬 Saudação","Saudações, senhor Cavaleiro."}, {"📋 Licença","Licença, senhores Cavaleiros."}, {"📋 Licença","Licença, senhor Cavaleiro."},
{"📋 Licença","Com licença, senhores Cavaleiros."}, {"📋 Licença","Com licença, senhor Cavaleiro."}, {"📢 Comando","ATENÇÃO TURNO, PREPARAR PARA MARCHAR!"},
{"📢 Comando","ATENÇÃO TURNO, MARCHEM!"}, {"📢 Comando","ATENÇÃO PELOTÃO, PREPARAR PARA MARCHAR!"}, {"📢 Comando","ATENÇÃO PELOTÃO, MARCHEM!"} } }, { Name="BPE",
Emoji="👮‍♂️", Color=_RGB(60,180,120), Fields={ {"👮‍♂️ BPE","Batalhão de Polícia do Exército"}, {"👤 Comandante","zCostasz."}, {"👤 Subcomandante","Matheuslindo587."},
{"📜 Lema","Orientar o Responsável, Corrigir o Irresponsável, Prender o Incorrigível."}, {"💬 Saudação","Saudações, senhores Policiais."},
{"💬 Saudação","Saudações, senhor Policial."} } }, { Name="BFE", Emoji="👻", Color=_RGB(200,70,70), Fields={ {"👻 BFE","Batalhão de Forças Especiais"},
{"👤 Criador","NATANHMELLO4."}, {"📅 Criado","1983"}, {"👤 Comandante","RenanFoxiy."}, {"👤 Subcomandante","TILAPIA_PROFISSIONAL."},
{"🛡️ Escudo","Fundo preto com bordas amarelas. No centro um paraquedas branco junto de uma faca vermelha, simbolizando operações especiais e combate."},
{"📜 Lema","Qualquer missão, em qualquer lugar, a qualquer hora, de qualquer maneira."}, {"💬 Saudação","Saudações, senhores Fantasmas."},
{"💬 Saudação","Saudações, senhor Fantasma."}, {"📋 Licença","Com licença, senhor Fantasma."}, {"📋 Licença","Licença, senhor Fantasma."} } }, { Name="CYBER", Emoji="💻",
Color=_RGB(150,100,200), Fields={ {"💻 CYBER","Comando de Defesa Cibernética"}, {"👤 Criador","wAnTee16j5156."}, {"👤 Donos","MaxTheJp1 | ItsMeLyrio | Gabriel2444q."},
{"👤 Comandante","highanddry98"}, {"👤 Subcomandante","Não tem."}, {"📜 Lema","Segurança no ciberespaço, soberania para a Nação."},
{"📜 Juramento","JURO GUARDAR SIGILO SOBRE TUDO QUE VER E OUVIR NO COMDCIBER!"}, {"💬 Saudação","Saudações, senhores Analistas."} } }, { Name="BAC", Emoji="💀",
Color=_RGB(220,100,50), Fields={ {"💀 BAC","Batalhão de Ações de Comandos"}, {"👤 Dono","MateusHgz."}, {"👤 Comandante","SasukePro202."}, {"👤 Subcomandante","DanielSxS2."},
{"📜 Lema","O máximo de confusão, morte e destruição na retaguarda do inimigo."}, {"💬 Saudação","Saudações, senhor Comando."},
{"💬 Saudação","Saudações, senhores Comandos."} } }, { Name="CAAT", Emoji="🌵", Color=_RGB(50,150,80), Fields={ {"🌵 CAAT","Batalhão de Infantaria de Caatinga"},
{"👤 Comandante","Não tem."}, {"👤 Subcomandante","gabrielcm04."}, {"📜 Lema","O pai cria, a mãe educa e a Caatinga elimina."},
{"💬 Saudação","Saudações, senhores Guardiões da Caatinga."} } } } local function CreateTAFFSCard(label,value,order,parent,color) local card=_I("Frame")
card.Size=_U2(1,0,0,48) card.BackgroundColor3=_K.Card card.BorderSizePixel=0 card.LayoutOrder=order card.Parent=parent Corner(card,8) Stroke(card,_K.Stroke,1)
local text=_I("TextLabel") text.BackgroundTransparency=1 text.Position=_UO(10,5) text.Size=_U2(1,-82,1,-10) text.Text=label..": "..value text.TextColor3=_K.White
text.TextSize=10 text.Font=_GM text.TextWrapped=true text.TextXAlignment=_XL text.TextYAlignment=Enum.TextYAlignment.Center text.Parent=card local copy=_I("TextButton")
copy.AnchorPoint=_V2(1,.5) copy.Position=_U2(1,-7,.5,0) copy.Size=_UO(58,29) copy.BackgroundColor3=_K.Success copy.BorderSizePixel=0 copy.Text="Copiar"
copy.TextColor3=_K.White copy.TextSize=9 copy.Font=_GB copy.AutoButtonColor=false copy.Parent=card Corner(copy,7) Stroke(copy,_K.StrokeLight,1)
copy.Activated:Connect(function() if typeof(setclipboard)~="function" then Notify("COPIAR","Seu executor não possui setclipboard.","Error") return end
local ok=pcall(function() setclipboard(value) end) if ok then copy.Text="✓" copy.BackgroundColor3=_K.Success Notify("COPIADO","Informação copiada.","Success")
task.delay(.9,function() if copy.Parent then copy.Text="Copiar" copy.BackgroundColor3=_K.Success end end) end end) end local function ShowTAFFS() CurrentPage="TAFFS"
ClearContent() local warningCard=_I("Frame") warningCard.Size=_U2(1,0,0,70) warningCard.BackgroundColor3=_RGB(45,35,20) warningCard.BorderSizePixel=0
warningCard.LayoutOrder=0 warningCard.Parent=_CH Corner(warningCard,8) Stroke(warningCard,_K.Orange,1.5) local warnIcon=_I("TextLabel") warnIcon.BackgroundTransparency=1
warnIcon.Position=_UO(12,8) warnIcon.Size=_UO(30,30) warnIcon.Text="⚠️" warnIcon.TextSize=20 warnIcon.TextColor3=_K.White warnIcon.Font=_GB warnIcon.TextXAlignment=_XC
warnIcon.TextYAlignment=Enum.TextYAlignment.Center warnIcon.Parent=warningCard local warnText=_I("TextLabel") warnText.BackgroundTransparency=1
warnText.Position=_UO(48,8) warnText.Size=_U2(1,-130,0,35) warnText.Text="Deseja adicionar as informações TAFFS em um menu secundário?" warnText.TextColor3=_K.White
warnText.TextSize=10 warnText.Font=_GB warnText.TextWrapped=true warnText.TextXAlignment=_XL warnText.TextYAlignment=Enum.TextYAlignment.Top warnText.Parent=warningCard
local simBtn=_I("TextButton") simBtn.AnchorPoint=_V2(1,.5) simBtn.Position=_U2(1,-12,.5,0) simBtn.Size=_UO(70,34) simBtn.BackgroundColor3=_K.Success
simBtn.BorderSizePixel=0 simBtn.Text="▶ SIM" simBtn.TextColor3=_K.White simBtn.TextSize=10 simBtn.Font=_GB simBtn.AutoButtonColor=false simBtn.Parent=warningCard
Corner(simBtn,8) simBtn.MouseButton1Click:Connect(function() local success,err=pcall(function() loadstring(game:HttpGet("https://pastebin.com/raw/yyp8u4Xt"))() end)
if success then Notify("MENU SECUNDÁRIO","TAFFS adicionado com sucesso!","Success") else Notify("ERRO","Falha ao carregar o menu secundário.","Error") end end)
local header=_I("Frame") header.Size=_U2(1,0,0,58) header.BackgroundColor3=_K.Card header.BorderSizePixel=0 header.LayoutOrder=1 header.Parent=_CH Corner(header,9)
Stroke(header,_K.StrokeLight,1) local title=_I("TextLabel") title.BackgroundTransparency=1 title.Position=_UO(12,7) title.Size=_U2(1,-24,0,25) title.Text="📝 TAFFS"
title.TextColor3=_K.White title.TextSize=16 title.Font=_GB title.TextXAlignment=_XL title.Parent=header local sub=_I("TextLabel") sub.BackgroundTransparency=1
sub.Position=_UO(13,34) sub.Size=_U2(1,-26,0,15) sub.Text="Informações das organizações militares" sub.TextColor3=_K.DarkGray sub.TextSize=9 sub.Font=_GM
sub.TextXAlignment=_XL sub.Parent=header for idx,div in ipairs(TAFFS_DATA)do local section=_I("Frame") section.Size=_U2(1,0,0,0)
section.AutomaticSize=Enum.AutomaticSize.Y section.BackgroundColor3=_K.Card section.BorderSizePixel=0 section.LayoutOrder=idx+1 section.Parent=_CH Corner(section,8)
Stroke(section,div.Color,2) local sectionLayout=_I("UIListLayout") sectionLayout.FillDirection=Enum.FillDirection.Vertical
sectionLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center sectionLayout.SortOrder=Enum.SortOrder.LayoutOrder sectionLayout.Padding=_UD(0,5)
sectionLayout.Parent=section local headerDiv=_I("Frame") headerDiv.Size=_U2(1,0,0,38) headerDiv.BackgroundColor3=div.Color headerDiv.BackgroundTransparency=0.2
headerDiv.BorderSizePixel=0 headerDiv.LayoutOrder=0 headerDiv.Parent=section Corner(headerDiv,8) local titleDiv=_I("TextLabel") titleDiv.BackgroundTransparency=1
titleDiv.Position=_UO(12,0) titleDiv.Size=_U2(1,-24,1,0) titleDiv.Text=div.Emoji.."  "..div.Name titleDiv.TextColor3=_K.White titleDiv.TextSize=14 titleDiv.Font=_GB
titleDiv.TextXAlignment=_XL titleDiv.TextYAlignment=Enum.TextYAlignment.Center titleDiv.Parent=headerDiv for i,field in ipairs(div.Fields)do
CreateTAFFSCard(field[1],field[2],i,section,div.Color) end end Content.CanvasPosition=_V2() end local function GetCategoryColor(c) if c=="Lento"then return _K.Success
elseif c=="Rápido"then return _K.White elseif c=="Mais Rápido"then return _K.Orange elseif c=="Sem Burla"then return _K.Gray end return _K.Gray end
local function ShowParkours() CurrentPage="Parkours" ClearContent() local tf=_I("Frame") tf.Size=_U2(1,0,0,48) tf.BackgroundColor3=_K.Card tf.BorderSizePixel=0
tf.LayoutOrder=0 tf.Parent=_CH Corner(tf,9) Stroke(tf,_K.StrokeLight) local title=_I("TextLabel") title.BackgroundTransparency=1 title.Position=_UO(12,6)
title.Size=_U2(1,-24,0,22) title.Text="🏃 PARKOURS DISPONÍVEIS" title.TextColor3=_K.White title.TextSize=15 title.Font=_GB title.TextXAlignment=_XL title.Parent=tf
local info=_I("TextLabel") info.BackgroundTransparency=1 info.Position=_UO(13,28) info.Size=_U2(1,-26,0,14) info.Text="Clique na seta para expandir as opções"
info.TextColor3=_K.DarkGray info.TextSize=9 info.Font=_GM info.TextXAlignment=_XL info.Parent=tf for num=1,4 do local row=_I("Frame") row.Size=_U2(1,0,0,45)
row.BackgroundColor3=_K.Card row.BorderSizePixel=0 row.LayoutOrder=num+1 row.Parent=_CH Corner(row,8) Stroke(row,_K.Stroke) local label=_I("TextLabel")
label.BackgroundTransparency=1 label.Position=_UO(10,0) label.Size=_U2(1,-105,1,0) label.Text="🏃 Parkour "..num label.TextColor3=_K.White label.TextSize=12 label.Font=_GB
label.TextXAlignment=_XL label.Parent=row local running=Playback.Running and Playback.Parkour==num and not Playback.Tower local start=_I("TextButton")
start.AnchorPoint=_V2(1,.5) start.Position=_U2(1,-42,.5,0) start.Size=_UO(78,30) start.BackgroundColor3=running and _K.Error or _K.Success start.BorderSizePixel=0
start.Text=running and "■ PARAR" or "▶ INICIAR" start.TextColor3=_K.White start.TextSize=9 start.Font=_GB start.AutoButtonColor=false start.ZIndex=5 start.Parent=row
Corner(start,7) local expand=_I("TextButton") expand.AnchorPoint=_V2(1,.5) expand.Position=_U2(1,-7,.5,0) expand.Size=_UO(27,31) expand.BackgroundTransparency=1
expand.BorderSizePixel=0 expand.Text=expandedParkour[num]and "▲" or "▼" expand.TextColor3=_K.Gray expand.TextSize=12 expand.Font=_GB expand.AutoButtonColor=false
expand.ZIndex=6 expand.Parent=row local ec=_I("Frame") ec.Size=_U2(1,0,0,expandedParkour[num]and 149 or 0) ec.BackgroundTransparency=1 ec.ClipsDescendants=true
ec.LayoutOrder=num+10 ec.Parent=_CH local el=_I("UIListLayout") el.Padding=_UD(0,5) el.Parent=ec for _,cat in ipairs(CategoryOrder)do local b=_I("TextButton")
b.Size=_U2(1,0,0,32) b.BackgroundColor3=_K.Panel b.BorderSizePixel=0 b.Text="   "..cat b.TextColor3=GetCategoryColor(cat) b.TextSize=10 b.Font=_GB b.TextXAlignment=_XL
b.AutoButtonColor=false b.Parent=ec Corner(b,7) local s=Stroke(b,_K.Stroke) if selectedCategory[num]==cat then b.BackgroundColor3=_K.SelectionRedDark
b.TextColor3=_K.SelectionRed s.Color=_K.SelectionRed s.Thickness=1.5 end b.MouseButton1Click:Connect(function() local rs=routes[cat] local route=rs and rs[num]
if not route then Notify("ROTA NÃO ENCONTRADA","Parkour "..num.." não existe em "..cat..".","Error") return end selectedCategory[num]=cat
Notify("ROTA SELECIONADA","Parkour "..num.." • "..cat,"Success") ShowParkours() end) end start.MouseButton1Click:Connect(function()
if Playback.Running and Playback.Parkour==num and not Playback.Tower then StopPlayback("cancelled") ShowParkours() return end local cat=selectedCategory[num]or "Lento"
selectedCategory[num]=cat local rs=routes[cat] local route=rs and rs[num] if not route then Notify("ROTA NÃO ENCONTRADA","Parkour "..num.." • "..cat,"Error") return end
StartPlayback(route,cat,num) task.wait(.1) ShowParkours() end) expand.MouseButton1Click:Connect(function() expandedParkour[num]=not expandedParkour[num] ShowParkours()
end) end Content.CanvasPosition=_V2() end local function ShowTowers() CurrentPage="Towers" ClearContent() local tf=_I("Frame") tf.Size=_U2(1,0,0,48)
tf.BackgroundColor3=_K.Card tf.BorderSizePixel=0 tf.LayoutOrder=0 tf.Parent=_CH Corner(tf,9) Stroke(tf,_K.StrokeLight) local title=_I("TextLabel")
title.BackgroundTransparency=1 title.Position=_UO(12,6) title.Size=_U2(1,-24,0,22) title.Text="🏰 TORRES DISPONÍVEIS" title.TextColor3=_K.White title.TextSize=15
title.Font=_GB title.TextXAlignment=_XL title.Parent=tf local info=_I("TextLabel") info.BackgroundTransparency=1 info.Position=_UO(13,28) info.Size=_U2(1,-26,0,14)
info.Text="Torre 1 direta • Torre 2 com quatro rotas" info.TextColor3=_K.DarkGray info.TextSize=9 info.Font=_GM info.TextXAlignment=_XL info.Parent=tf
local r1=_I("Frame") r1.Size=_U2(1,0,0,45) r1.BackgroundColor3=_K.Card r1.BorderSizePixel=0 r1.LayoutOrder=2 r1.Parent=_CH Corner(r1,8) Stroke(r1,_K.Stroke)
local l1=_I("TextLabel") l1.BackgroundTransparency=1 l1.Position=_UO(10,0) l1.Size=_U2(1,-105,1,0) l1.Text="🏰 Torre 1" l1.TextColor3=_K.White l1.TextSize=12 l1.Font=_GB
l1.TextXAlignment=_XL l1.Parent=r1 local run1=Playback.Running and Playback.Tower=="Torre 1" local b1=_I("TextButton") b1.AnchorPoint=_V2(1,.5) b1.Position=_U2(1,-8,.5,0)
b1.Size=_UO(78,30) b1.BackgroundColor3=run1 and _K.Error or _K.Success b1.BorderSizePixel=0 b1.Text=run1 and "■ PARAR" or "▶ INICIAR" b1.TextColor3=_K.White b1.TextSize=9
b1.Font=_GB b1.AutoButtonColor=false b1.Parent=r1 Corner(b1,7) b1.MouseButton1Click:Connect(function() if Playback.Running and Playback.Tower=="Torre 1" then
StopPlayback("cancelled") ShowTowers() return end local route=towerRoutes["Torre 1"]["Única"] if not route then
Notify("ROTA NÃO CARREGADA","A rota da Torre 1 não foi encontrada.","Error") return end StartPlayback(route,nil,nil,"Torre 1","Única") task.wait(.1) ShowTowers() end)
local r2=_I("Frame") r2.Size=_U2(1,0,0,45) r2.BackgroundColor3=_K.Card r2.BorderSizePixel=0 r2.LayoutOrder=3 r2.Parent=_CH Corner(r2,8) Stroke(r2,_K.Stroke)
local l2=_I("TextLabel") l2.BackgroundTransparency=1 l2.Position=_UO(10,0) l2.Size=_U2(1,-150,1,0) l2.Text="🏰 Torre 2" l2.TextColor3=_K.White l2.TextSize=12 l2.Font=_GB
l2.TextXAlignment=_XL l2.Parent=r2 local run2=Playback.Running and Playback.Tower=="Torre 2" local b2=_I("TextButton") b2.AnchorPoint=_V2(1,.5)
b2.Position=_U2(1,-42,.5,0) b2.Size=_UO(78,30) b2.BackgroundColor3=run2 and _K.Error or _K.Success b2.BorderSizePixel=0 b2.Text=run2 and "■ PARAR" or "▶ INICIAR"
b2.TextColor3=_K.White b2.TextSize=9 b2.Font=_GB b2.AutoButtonColor=false b2.Parent=r2 Corner(b2,7) local ex=_I("TextButton") ex.AnchorPoint=_V2(1,.5)
ex.Position=_U2(1,-7,.5,0) ex.Size=_UO(27,31) ex.BackgroundTransparency=1 ex.BorderSizePixel=0 ex.Text=expandedTower2 and "▲" or "▼" ex.TextColor3=_K.Gray ex.TextSize=12
ex.Font=_GB ex.AutoButtonColor=false ex.Parent=r2 local tc=_I("Frame") tc.Size=_U2(1,0,0,expandedTower2 and 149 or 0) tc.BackgroundTransparency=1 tc.ClipsDescendants=true
tc.LayoutOrder=4 tc.Parent=_CH local tl=_I("UIListLayout") tl.Padding=_UD(0,5) tl.Parent=tc for _,rn in ipairs(Tower2RouteOrder)do local b=_I("TextButton")
b.Size=_U2(1,0,0,32) b.BackgroundColor3=_K.Panel b.BorderSizePixel=0 b.Text="   "..rn b.TextColor3=_K.Gray b.TextSize=10 b.Font=_GB b.TextXAlignment=_XL
b.AutoButtonColor=false b.Parent=tc Corner(b,7) local s=Stroke(b,_K.Stroke) if selectedTower2Route==rn then b.BackgroundColor3=_K.SelectionRedDark
b.TextColor3=_K.SelectionRed s.Color=_K.SelectionRed s.Thickness=1.5 end b.MouseButton1Click:Connect(function() local route=towerRoutes["Torre 2"][rn] if not route then
Notify("ROTA NÃO CARREGADA","Torre 2 • "..rn,"Error") return end selectedTower2Route=rn Notify("ROTA SELECIONADA","Torre 2 • "..rn,"Success") ShowTowers() end) end
b2.MouseButton1Click:Connect(function() if Playback.Running and Playback.Tower=="Torre 2" then StopPlayback("cancelled") ShowTowers() return end
local rn=selectedTower2Route local route=towerRoutes["Torre 2"][rn] if not route then Notify("ROTA NÃO CARREGADA","Torre 2 • "..rn,"Error") return end
StartPlayback(route,nil,nil,"Torre 2",rn) task.wait(.1) ShowTowers() end) ex.MouseButton1Click:Connect(function() expandedTower2=not expandedTower2 ShowTowers() end)
Content.CanvasPosition=_V2() end local function ShowVolvers() CurrentPage="Volvers" ClearContent() local header=_I("Frame") header.Size=_U2(1,0,0,58)
header.BackgroundColor3=_K.Card header.BorderSizePixel=0 header.LayoutOrder=0 header.Parent=_CH Corner(header,9) Stroke(header,_K.StrokeLight,1)
local title=_I("TextLabel") title.BackgroundTransparency=1 title.Position=_UO(12,7) title.Size=_U2(1,-24,0,25) title.Text="↪ VOLVERS" title.TextColor3=_K.White
title.TextSize=16 title.Font=_GB title.TextXAlignment=_XL title.Parent=header local sub=_I("TextLabel") sub.BackgroundTransparency=1 sub.Position=_UO(13,34)
sub.Size=_U2(1,-26,0,15) sub.Text="Comandos de formação – ZAYK VOLVERS V2" sub.TextColor3=_K.DarkGray sub.TextSize=9 sub.Font=_GM sub.TextXAlignment=_XL sub.Parent=header
local warningCard=_I("Frame") warningCard.Size=_U2(1,0,0,70) warningCard.BackgroundColor3=_RGB(45,35,20) warningCard.BorderSizePixel=0 warningCard.LayoutOrder=1
warningCard.Parent=_CH Corner(warningCard,8) Stroke(warningCard,_K.Orange,1.5) local warnIcon=_I("TextLabel") warnIcon.BackgroundTransparency=1
warnIcon.Position=_UO(12,8) warnIcon.Size=_UO(30,30) warnIcon.Text="⚠️" warnIcon.TextSize=20 warnIcon.TextColor3=_K.White warnIcon.Font=_GB warnIcon.TextXAlignment=_XC
warnIcon.TextYAlignment=Enum.TextYAlignment.Center warnIcon.Parent=warningCard local warnText=_I("TextLabel") warnText.BackgroundTransparency=1
warnText.Position=_UO(48,8) warnText.Size=_U2(1,-130,0,35) warnText.Text="Deseja executar os comandos Volvers em um menu secundário?" warnText.TextColor3=_K.White
warnText.TextSize=10 warnText.Font=_GB warnText.TextWrapped=true warnText.TextXAlignment=_XL warnText.TextYAlignment=Enum.TextYAlignment.Top warnText.Parent=warningCard
local simBtn=_I("TextButton") simBtn.AnchorPoint=_V2(1,.5) simBtn.Position=_U2(1,-12,.5,0) simBtn.Size=_UO(70,34) simBtn.BackgroundColor3=_K.Success
simBtn.BorderSizePixel=0 simBtn.Text="▶ SIM" simBtn.TextColor3=_K.White simBtn.TextSize=10 simBtn.Font=_GB simBtn.AutoButtonColor=false simBtn.Parent=warningCard
Corner(simBtn,8) simBtn.MouseButton1Click:Connect(function() local success,err=pcall(function() loadstring(game:HttpGet("https://pastebin.com/raw/ZrzHAenq"))() end)
if success then Notify("MENU SECUNDÁRIO","Volver aberto com sucesso!","Success") else Notify("ERRO","Falha ao carregar o menu secundário.","Error") end end)
local commands={ { name="◆ SALVAR POSIÇÃO", desc="Salva somente para onde o personagem está olhando.", highlight=true, action=SaveDirection }, { name="DIREITA VOLVER!",
desc="Gira 90° para a direita.", highlight=false, action=function()Turn("DIREITA")end }, { name="ESQUERDA VOLVER!", desc="Gira 90° para a esquerda.", highlight=false,
action=function()Turn("ESQUERDA")end }, { name="RETAGUARDA VOLVER!", desc="Gira 180° para trás.", highlight=false, action=function()Turn("RETAGUARDA")end }, {
name="VANGUARDA VOLVER!", desc="Retorna à direção salva sem alterar sua posição.", highlight=false, action=VanguardaVolver } } for i,cmd in ipairs(commands)do
local card=_I("Frame") card.Size=_U2(1,0,0,55) card.BackgroundColor3=cmd.highlight and _RGB(38,38,38)or _K.Card card.BorderSizePixel=0 card.LayoutOrder=i+2
card.Parent=_CH Corner(card,8) local strokeColor=cmd.highlight and _K.Primary or _K.Stroke local strokeThick=cmd.highlight and 1.7 or 1
Stroke(card,strokeColor,strokeThick) local nameLabel=_I("TextLabel") nameLabel.BackgroundTransparency=1 nameLabel.Position=_UO(11,5) nameLabel.Size=_U2(1,-100,0,20)
nameLabel.Text=cmd.name nameLabel.TextColor3=_K.White nameLabel.TextSize=10 nameLabel.Font=Enum.Font.GothamBlack nameLabel.TextXAlignment=_XL nameLabel.Parent=card
local descLabel=_I("TextLabel") descLabel.BackgroundTransparency=1 descLabel.Position=_UO(11,26) descLabel.Size=_U2(1,-100,0,17) descLabel.Text=cmd.desc
descLabel.TextColor3=_K.Gray descLabel.TextSize=7 descLabel.Font=_GM descLabel.TextXAlignment=_XL descLabel.Parent=card local execBtn=_I("TextButton")
execBtn.AnchorPoint=_V2(1,.5) execBtn.Position=_U2(1,-8,.5,0) execBtn.Size=_UO(68,30) execBtn.BackgroundColor3=cmd.highlight and _K.Orange or _K.Success
execBtn.BorderSizePixel=0 execBtn.Text="▶ EXECUTAR" execBtn.TextColor3=_K.White execBtn.TextSize=8 execBtn.Font=_GB execBtn.AutoButtonColor=false execBtn.Parent=card
Corner(execBtn,7) execBtn.MouseButton1Click:Connect(function() cmd.action() end) card.MouseEnter:Connect(function() T:Create(card,TweenInfo.new(.12),{
BackgroundColor3=cmd.highlight and _RGB(48,48,48)or _K.CardHover }):Play() end) card.MouseLeave:Connect(function() T:Create(card,TweenInfo.new(.12),{
BackgroundColor3=cmd.highlight and _RGB(38,38,38)or _K.Card }):Play() end) end Content.CanvasPosition=_V2() end local iaOcupado=false local function ShowAutoCorrecao()
CurrentPage="AutoCorrecao" ClearContent() local header=_I("Frame") header.Size=_U2(1,0,0,58) header.BackgroundColor3=_K.Card header.BorderSizePixel=0 header.LayoutOrder=0
header.Parent=_CH Corner(header,9) Stroke(header,_K.StrokeLight,1) local title=_I("TextLabel") title.BackgroundTransparency=1 title.Position=_UO(12,7)
title.Size=_U2(1,-24,0,25) title.Text="🤖 IA CHAT" title.TextColor3=_K.White title.TextSize=16 title.Font=_GB title.TextXAlignment=_XL title.Parent=header
local sub=_I("TextLabel") sub.BackgroundTransparency=1 sub.Position=_UO(13,34) sub.Size=_U2(1,-26,0,15) sub.Text="Corrige o texto em português e envia no chat"
sub.TextColor3=_K.DarkGray sub.TextSize=9 sub.Font=_GM sub.TextXAlignment=_XL sub.Parent=header local warningCard=_I("Frame") warningCard.Size=_U2(1,0,0,70)
warningCard.BackgroundColor3=_RGB(45,35,20) warningCard.BorderSizePixel=0 warningCard.LayoutOrder=1 warningCard.Parent=_CH Corner(warningCard,8)
Stroke(warningCard,_K.Orange,1.5) local warnIcon=_I("TextLabel") warnIcon.BackgroundTransparency=1 warnIcon.Position=_UO(12,8) warnIcon.Size=_UO(30,30) warnIcon.Text="⚠️"
warnIcon.TextSize=20 warnIcon.TextColor3=_K.White warnIcon.Font=_GB warnIcon.TextXAlignment=_XC warnIcon.TextYAlignment=Enum.TextYAlignment.Center
warnIcon.Parent=warningCard local warnText=_I("TextLabel") warnText.BackgroundTransparency=1 warnText.Position=_UO(48,8) warnText.Size=_U2(1,-130,0,35)
warnText.Text="Deseja abrir a IA CHAT em um menu secundário?" warnText.TextColor3=_K.White warnText.TextSize=10 warnText.Font=_GB warnText.TextWrapped=true
warnText.TextXAlignment=_XL warnText.TextYAlignment=Enum.TextYAlignment.Top warnText.Parent=warningCard local simBtn=_I("TextButton") simBtn.AnchorPoint=_V2(1,.5)
simBtn.Position=_U2(1,-12,.5,0) simBtn.Size=_UO(70,34) simBtn.BackgroundColor3=_K.Success simBtn.BorderSizePixel=0 simBtn.Text="▶ SIM" simBtn.TextColor3=_K.White
simBtn.TextSize=10 simBtn.Font=_GB simBtn.AutoButtonColor=false simBtn.Parent=warningCard Corner(simBtn,8) simBtn.MouseButton1Click:Connect(function()
local success,err=pcall(function() loadstring(game:HttpGet("https://pastebin.com/raw/pp41hZjb"))() end) if success then
Notify("MENU SECUNDÁRIO","IA CHAT aberta com sucesso!","Success") else Notify("ERRO","Falha ao carregar o menu secundário.","Error") end end) local card=_I("Frame")
card.Size=_U2(1,0,0,140) card.BackgroundColor3=_K.Card card.BorderSizePixel=0 card.LayoutOrder=2 card.Parent=_CH Corner(card,8) Stroke(card,_K.Stroke,1)
local box=_I("TextBox") box.Position=_UO(10,10) box.Size=_U2(1,-20,0,56) box.BackgroundColor3=_K.Panel box.BorderSizePixel=0 box.PlaceholderText="Digite sua mensagem..."
box.PlaceholderColor3=_K.DarkGray box.Text="" box.TextColor3=_K.White box.TextSize=11 box.Font=_GM box.TextWrapped=true box.TextXAlignment=_XL
box.TextYAlignment=Enum.TextYAlignment.Top box.ClearTextOnFocus=false box.MultiLine=false box.Parent=card Corner(box,7) Stroke(box,_K.Stroke,1) Padding(box,6,6,8,8)
local send=_I("TextButton") send.Position=_UO(10,74) send.Size=_U2(1,-20,0,34) send.BackgroundColor3=_K.Success send.BorderSizePixel=0 send.Text="✨ CORRIGIR E ENVIAR"
send.TextColor3=_K.White send.TextSize=10 send.Font=_GB send.AutoButtonColor=false send.Parent=card Corner(send,7) local status=_I("TextLabel")
status.BackgroundTransparency=1 status.Position=_UO(10,114) status.Size=_U2(1,-20,0,18) status.Text="" status.TextColor3=_K.Gray status.TextSize=10 status.Font=_GM
status.TextXAlignment=_XL status.Parent=card local function setStatus(t,c) status.Text=t status.TextColor3=c end send.MouseButton1Click:Connect(function()
if iaOcupado then return end local texto=box.Text:gsub("^%s+",""):gsub("%s+$","") if texto=="" then setStatus("⚠️ Digite algo primeiro",_K.Orange) return end
iaOcupado=true send.Text="⏳ AGUARDE..." setStatus("🧠 Pensando...",_K.Gray) task.spawn(function() local corrigido,erro=CorrigirTexto(texto) if corrigido then
if EnviarNoChat(corrigido)then setStatus("✅ Corrigido e enviado!",_K.Success) box.Text="" Notify("IA CHAT","Mensagem enviada.","Success") else
setStatus("❌ Chat não encontrado",_K.Error) end else setStatus("❌ "..tostring(erro),_K.Error) end send.Text="✨ CORRIGIR E ENVIAR" iaOcupado=false end) end)
Content.CanvasPosition=_V2() end local function ShowCreditos() CurrentPage="Creditos" ClearContent() local link="https://discord.gg/NY2RfC7Kx"
local header=_I("Frame") header.Size=_U2(1,0,0,58) header.BackgroundColor3=_K.Card header.BorderSizePixel=0 header.LayoutOrder=0 header.Parent=_CH Corner(header,9)
Stroke(header,_K.StrokeLight,1) local title=_I("TextLabel") title.BackgroundTransparency=1 title.Position=_UO(12,7) title.Size=_U2(1,-24,0,25) title.Text="👑 CRÉDITOS"
title.TextColor3=_K.White title.TextSize=16 title.Font=_GB title.TextXAlignment=_XL title.Parent=header local sub=_I("TextLabel") sub.BackgroundTransparency=1
sub.Position=_UO(13,34) sub.Size=_U2(1,-26,0,15) sub.Text="Informações do desenvolvedor" sub.TextColor3=_K.DarkGray sub.TextSize=9 sub.Font=_GM
sub.TextXAlignment=_XL sub.Parent=header local dev=_I("Frame") dev.Size=_U2(1,0,0,70) dev.BackgroundColor3=_K.Card dev.BorderSizePixel=0 dev.LayoutOrder=1 dev.Parent=_CH
Corner(dev,8) Stroke(dev,_K.Stroke,1) local devT=_I("TextLabel") devT.BackgroundTransparency=1 devT.Position=_UO(11,8) devT.Size=_U2(1,-22,0,54)
devT.Text="Esse script foi desenvolvido pelo akira007p 🔵 discord" devT.TextColor3=_K.White devT.TextSize=11 devT.Font=_GB devT.TextWrapped=true devT.TextXAlignment=_XL
devT.TextYAlignment=Enum.TextYAlignment.Center devT.Parent=dev local srv=_I("Frame") srv.Size=_U2(1,0,0,70) srv.BackgroundColor3=_K.Card srv.BorderSizePixel=0
srv.LayoutOrder=2 srv.Parent=_CH Corner(srv,8) Stroke(srv,_K.Orange,1.5) local srvT=_I("TextLabel") srvT.BackgroundTransparency=1 srvT.Position=_UO(11,9)
srvT.Size=_U2(1,-100,0,20) srvT.Text="🔵 Servidor do Discord" srvT.TextColor3=_K.White srvT.TextSize=10 srvT.Font=Enum.Font.GothamBlack srvT.TextXAlignment=_XL srvT.Parent=srv
local srvL=_I("TextLabel") srvL.BackgroundTransparency=1 srvL.Position=_UO(11,32) srvL.Size=_U2(1,-100,0,28) srvL.Text=link srvL.TextColor3=_K.Gray srvL.TextSize=8
srvL.Font=_GM srvL.TextWrapped=true srvL.TextXAlignment=_XL srvL.TextYAlignment=Enum.TextYAlignment.Top srvL.Parent=srv local enter=_I("TextButton")
enter.AnchorPoint=_V2(1,.5) enter.Position=_U2(1,-8,.5,0) enter.Size=_UO(70,32) enter.BackgroundColor3=_RGB(88,101,242) enter.BorderSizePixel=0 enter.Text="▶ ENTRAR"
enter.TextColor3=_K.White enter.TextSize=9 enter.Font=_GB enter.AutoButtonColor=false enter.Parent=srv Corner(enter,8) enter.MouseButton1Click:Connect(function()
pcall(function() setclipboard(link) end) pcall(function() game:GetService("GuiService"):OpenBrowserWindow(link) end)
Notify("DISCORD","Link copiado! Cole no navegador se não abrir.","Success") end) Content.CanvasPosition=_V2() end
local function SelectButton(b) if selectedButton then selectedButton.BackgroundColor3=_K.Card selectedButton.TextColor3=_K.Gray end
selectedButton=b b.BackgroundColor3=_K.Selected b.TextColor3=_K.White end parkourButton.MouseButton1Click:Connect(function() SelectButton(parkourButton) ShowParkours()
end) towerButton.MouseButton1Click:Connect(function() SelectButton(towerButton) ShowTowers() end) taffsButton.MouseButton1Click:Connect(function()
SelectButton(taffsButton) ShowTAFFS() end) volversButton.MouseButton1Click:Connect(function() SelectButton(volversButton) ShowVolvers() end)
iaButton.MouseButton1Click:Connect(function() SelectButton(iaButton) ShowAutoCorrecao() end) creditosButton.MouseButton1Click:Connect(function() SelectButton(creditosButton) ShowCreditos() end) local LogoDragging=false local LogoDragStart,LogoStartPosition
Logo.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then LogoDragging=true
LogoDragStart=i.Position LogoStartPosition=Logo.Position i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then LogoDragging=false end end) end
end) U.InputChanged:Connect(function(i) if LogoDragging and(i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then
local d=i.Position-LogoDragStart Logo.Position=_U2(LogoStartPosition.X.Scale,LogoStartPosition.X.Offset+d.X,LogoStartPosition.Y.Scale,LogoStartPosition.Y.Offset+d.Y) end
end) local MainDragging=false local MainDragStart,MainStartPosition Header.InputBegan:Connect(function(i)
if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then MainDragging=true MainDragStart=i.Position
MainStartPosition=Main.Position i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then MainDragging=false end end) end end)
U.InputChanged:Connect(function(i) if MainDragging and(i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then
local d=i.Position-MainDragStart Main.Position=_U2(MainStartPosition.X.Scale,MainStartPosition.X.Offset+d.X,MainStartPosition.Y.Scale,MainStartPosition.Y.Offset+d.Y) end
end) local Opened=false local function OpenMenu() if Opened then return end Opened=true Main.Visible=true Main.Size=UDim2.fromScale(.25,.15) Main.BackgroundTransparency=1
T:Create(Main,TweenInfo.new(.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.fromScale(.78,.65),BackgroundTransparency=0}):Play() end
local function CloseMenu() if not Opened then return end Opened=false
local tw=T:Create(Main,TweenInfo.new(.25,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{Size=UDim2.fromScale(.25,.15),BackgroundTransparency=1}) tw:Play()
tw.Completed:Wait() if not Opened then Main.Visible=false end end Logo.MouseButton1Click:Connect(function() if Opened then CloseMenu()else OpenMenu()end end)
Close.MouseButton1Click:Connect(CloseMenu) local ShowLoja,ShowJJs do
local AC={Fundo=_RGB(10,10,14),Card=_RGB(20,20,28),Borda=_RGB(0,220,255),Texto=_RGB(240,240,250),Verde=_RGB(0,190,110),Vermelho=_RGB(220,50,70),Amarelo=_RGB(255,200,0),Cinza=_RGB(80,80,95)}
local tok=os.clock() PG:SetAttribute("ZKYArm",tok) local function vivo()return PG:GetAttribute("ZKYArm")==tok end local function N(c,p,par) local o=_I(c)
for k,v in pairs(p)do o[k]=v end o.Parent=par return o end local function rotulo(par,pos,size,txt,cor,ts,fonte,al)
return N("TextLabel",{BackgroundTransparency=1,Position=pos,Size=size,Text=txt,TextColor3=cor,TextSize=ts,Font=fonte,TextXAlignment=al or _XL},par) end
local function cabecalho(titulo,sub) local h=N("Frame",{Size=_U2(1,0,0,58),BackgroundColor3=_K.Card,BorderSizePixel=0,LayoutOrder=0},_CH) Corner(h,9)
Stroke(h,_K.StrokeLight,1) rotulo(h,_UO(12,7),_U2(1,-24,0,25),titulo,_K.White,16,_GB) rotulo(h,_UO(13,34),_U2(1,-26,0,15),sub,_K.DarkGray,9,_GM) end
local function ehVerde(c) if not c then return false end return c.G>0.2 and c.G>c.R*1.1 and c.G>c.B*1.1 end local function limpar(obj)
if not obj or not obj.Parent then return end if obj:IsA("Frame")then local area=obj.AbsoluteSize.X*obj.AbsoluteSize.Y
if ehVerde(obj.BackgroundColor3)or obj.BackgroundColor3==_RGB(0,0,0)then obj.BackgroundColor3=area>30000 and AC.Fundo or AC.Card end if area>5000 then
if not obj:FindFirstChildOfClass("UICorner")then _I("UICorner",obj).CornerRadius=_UD(0,10) end local s=obj:FindFirstChildOfClass("UIStroke")
if not s then s=_I("UIStroke",obj)end if ehVerde(s.Color)or s.Transparency>0.5 then s.Color=AC.Borda s.Thickness=1 s.Transparency=0.4 end end
elseif obj:IsA("ScrollingFrame")then obj.BorderSizePixel=0 obj.ScrollBarImageColor3=AC.Borda if ehVerde(obj.BackgroundColor3)then obj.BackgroundColor3=AC.Fundo end
elseif obj:IsA("TextLabel")then if ehVerde(obj.TextColor3)then obj.TextColor3=AC.Texto end elseif obj:IsA("TextButton")then
if ehVerde(obj.BackgroundColor3)then obj.BackgroundColor3=AC.Verde end if ehVerde(obj.TextColor3)then obj.TextColor3=Color3.new(1,1,1)end
if not obj:FindFirstChildOfClass("UICorner")then _I("UICorner",obj).CornerRadius=_UD(0,6) end elseif obj:IsA("ImageLabel")or obj:IsA("ImageButton")then
if ehVerde(obj.BackgroundColor3)then obj.BackgroundColor3=AC.Card end end end local function aplicarTema(gui) if not gui or not gui.Parent then return end
for _,obj in ipairs(gui:GetDescendants())do pcall(limpar,obj)end if not gui:FindFirstChild("AkiraMark")then
N("TextLabel",{Name="AkiraMark",Size=_U2(1,-20,0,16),Position=_U2(0,10,1,-18),BackgroundTransparency=1,Text="⚡ by Akira",TextColor3=AC.Borda,Font=_GB,TextSize=11,ZIndex=200},gui)
end end local function acharGui(nome) for _,g in ipairs(PG:GetChildren())do if g:IsA("ScreenGui")and g.Name==nome then return g end end
for _,g in ipairs(PG:GetDescendants())do if g:IsA("ScreenGui")and g.Name==nome then return g end end end local monitoradas={} local function obter(nome)
local g=monitoradas[nome] if g and g.Parent then return g end return acharGui(nome) end task.spawn(function() while vivo()do task.wait(0.5) local g=obter("GunShopGui")
if g and g~=monitoradas.GunShopGui then monitoradas.GunShopGui=g g:GetPropertyChangedSignal("Enabled"):Connect(function() if g.Enabled then task.wait(0.15) aplicarTema(g)
end end) end end end) task.spawn(function() while vivo()do task.wait(0.8) local g=obter("GunShopGui") if g and g.Enabled then pcall(aplicarTema,g)end end end)
local function abrirLoja() local g=obter("GunShopGui") if not g then Notify("ERRO","Loja de armas não encontrada no jogo.","Error") return end g.Enabled=true
task.wait(0.15) aplicarTema(g) CloseMenu() end ShowLoja=function() CurrentPage="Loja" ClearContent() cabecalho("🔫 LOJA DE ARMAS","Abre a loja de armas com visual dark")
local card=N("Frame",{Size=_U2(1,0,0,55),BackgroundColor3=_K.Card,BorderSizePixel=0,LayoutOrder=1},_CH) Corner(card,8) Stroke(card,AC.Borda,1.5)
rotulo(card,_UO(11,5),_U2(1,-100,0,20),"🔫 LOJA DE ARMAS",_K.White,10,Enum.Font.GothamBlack)
rotulo(card,_UO(11,26),_U2(1,-100,0,17),"Abre a loja de armas do jogo.",_K.Gray,7,_GM)
local btn=N("TextButton",{AnchorPoint=_V2(1,.5),Position=_U2(1,-8,.5,0),Size=_UO(68,30),BackgroundColor3=_K.Success,BorderSizePixel=0,Text="▶ ABRIR",TextColor3=_K.White,TextSize=8,Font=_GB,AutoButtonColor=false},card)
Corner(btn,7) btn.MouseButton1Click:Connect(abrirLoja) Content.CanvasPosition=_V2() end local ativo,VELOCIDADE,MAX_CLIQUES,META,META_ATIVA=false,29,2,40,true
local jjsFeitos,bolhasVistas,cliquesTotal,ultimaBolhaVista=0,{},0,0 local btnToggleRef,infoLbl,slFill,velValor local function setBtnEstado(ligado)
if not btnToggleRef or not btnToggleRef.Parent then return end if ligado then btnToggleRef.Text="PARAR" btnToggleRef.BackgroundColor3=AC.Vermelho else
btnToggleRef.Text="LIGAR" btnToggleRef.BackgroundColor3=AC.Verde end end local function clicarFiresignal(obj) if firesignal then pcall(function()
firesignal(obj.MouseButton1Down) firesignal(obj.MouseButton1Up) firesignal(obj.MouseButton1Click) end) return end pcall(function() obj.MouseButton1Down:Fire()
obj.MouseButton1Up:Fire() obj.MouseButton1Click:Fire() end) end local function ehBolha(obj) if obj.ClassName~="ImageButton" then return false end
if obj.Name~="InputTemplate" then return false end if not obj.Visible then return false end local s=obj.AbsoluteSize
if s.X<20 or s.Y<20 or s.X>200 or s.Y>200 then return false end local p=obj.AbsolutePosition if p.X<=0 or p.Y<=0 then return false end return true end
local function gerarID(obj) local pos=obj.AbsolutePosition local size=obj.AbsoluteSize local cx=pos.X+size.X/2 local cy=pos.Y+size.Y/2
return math.floor(cx/40).."_"..math.floor(cy/40) end task.spawn(function() while vivo()do if not ativo then task.wait(0.1) continue end
if META_ATIVA and jjsFeitos>=META then ativo=false setBtnEstado(false) task.wait(0.1) continue end local delayAtual=VELOCIDADE/100 local agora=tick()
for id,dados in pairs(bolhasVistas)do if agora-dados.t>2.5 then bolhasVistas[id]=nil end end local clicou=false for _,gui in ipairs(PG:GetChildren())do
if gui:IsA("ScreenGui")and gui~=Gui then for _,obj in ipairs(gui:GetDescendants())do if ehBolha(obj)then ultimaBolhaVista=tick() local id=gerarID(obj)
local dados=bolhasVistas[id] if not dados then bolhasVistas[id]={count=0,t=tick()} dados=bolhasVistas[id] end dados.t=tick() if dados.count<MAX_CLIQUES then
clicarFiresignal(obj) dados.count=dados.count+1 cliquesTotal=cliquesTotal+1 clicou=true if dados.count==1 then jjsFeitos=jjsFeitos+1 end break end end end end
if clicou then break end end if META_ATIVA and jjsFeitos==META-1 and(tick()-ultimaBolhaVista>2)then ativo=false setBtnEstado(false) task.wait(0.1) continue end
if clicou then task.wait(delayAtual)else task.wait(0.02)end end end) task.spawn(function() while vivo()do task.wait(0.3) if infoLbl and infoLbl.Parent then
infoLbl.Text=string.format("JJs: %d/%d",jjsFeitos,META) infoLbl.TextColor3=(jjsFeitos>=META and META_ATIVA)and AC.Verde or AC.Amarelo end end end)
local function atualizarVelocidade() if velValor and velValor.Parent then velValor.Text=tostring(VELOCIDADE)end
if slFill and slFill.Parent then slFill.Size=_U2((VELOCIDADE-1)/39,0,1,0)end end local function setVelocidade(v) VELOCIDADE=math.clamp(v,1,40) atualizarVelocidade() end
local function botao(par,pos,size,txt,bg,cor,ts,r)
local b=N("TextButton",{Position=pos,Size=size,BackgroundColor3=bg,Text=txt,TextColor3=cor,Font=_GB,TextSize=ts,BorderSizePixel=0,AutoButtonColor=false},par) Corner(b,r)
return b end ShowJJs=function() CurrentPage="JJs" ClearContent() cabecalho("🤸 AUTO JJs","Clica sozinho nas bolhas dos JJs")
local card=N("Frame",{Size=_U2(1,0,0,260),BackgroundColor3=_K.Card,BorderSizePixel=0,LayoutOrder=1},_CH) Corner(card,8) Stroke(card,_K.Stroke,1)
local GB,GM,CT=_GB,_GM,_XC infoLbl=rotulo(card,_UO(10,8),_U2(1,-20,0,26),string.format("JJs: %d/%d",jjsFeitos,META),AC.Amarelo,12,GB)
rotulo(card,_UO(10,40),_U2(0.5,0,0,16),"META:",_K.White,10,GB)
local metaBox=N("TextBox",{Size=_U2(0.3,0,0,22),Position=_U2(0.65,0,0,38),BackgroundColor3=_K.Panel,Text=tostring(META),TextColor3=_K.White,Font=GB,TextSize=11,BorderSizePixel=0,ClearTextOnFocus=false},card)
Corner(metaBox,5) metaBox.FocusLost:Connect(function() local v=tonumber(metaBox.Text) if v and v>0 then META=v else metaBox.Text=tostring(META)end end)
local metaBtn=botao(card,_UO(10,66),_U2(1,-20,0,22),META_ATIVA and "META: ON" or "META: OFF",META_ATIVA and AC.Verde or AC.Cinza,Color3.new(1,1,1),10,5)
metaBtn.MouseButton1Click:Connect(function() META_ATIVA=not META_ATIVA metaBtn.Text=META_ATIVA and "META: ON" or "META: OFF"
metaBtn.BackgroundColor3=META_ATIVA and AC.Verde or AC.Cinza end) rotulo(card,_UO(10,94),_U2(1,-20,0,14),"VELOCIDADE",_K.White,10,GB)
local sliderBg=N("Frame",{Size=_U2(1,-20,0,6),Position=_UO(10,112),BackgroundColor3=_K.Panel,BorderSizePixel=0},card) Corner(sliderBg,3)
slFill=N("Frame",{Size=_U2((VELOCIDADE-1)/39,0,1,0),BackgroundColor3=AC.Verde,BorderSizePixel=0},sliderBg) Corner(slFill,3)
rotulo(card,_UO(10,120),_U2(0.35,0,0,12),"RÁPIDO",_K.DarkGray,8,GM) rotulo(card,_U2(0.65,0,0,120),_U2(0.35,0,0,12),"LENTO",_K.DarkGray,8,GM,Enum.TextXAlignment.Right)
velValor=rotulo(card,_U2(0.35,0,0,119),_U2(0.3,0,0,14),tostring(VELOCIDADE),_K.White,12,GB,CT)
local btnMenos=botao(card,_UO(10,138),_U2(0.15,0,0,26),"−",_K.Panel,_K.White,18,5) rotulo(card,_U2(0.15,0,0,138),_U2(0.15,0,0,26),"-1",_K.DarkGray,10,GM,CT)
local btnMais=botao(card,_U2(0.85,0,0,138),_U2(0.15,0,0,26),"+",_K.Panel,_K.White,18,5) rotulo(card,_U2(0.7,0,0,138),_U2(0.15,0,0,26),"+1",_K.DarkGray,10,GM,CT)
btnMenos.MouseButton1Click:Connect(function()setVelocidade(VELOCIDADE-1)end) btnMais.MouseButton1Click:Connect(function()setVelocidade(VELOCIDADE+1)end)
rotulo(card,_UO(10,166),_U2(1,-20,0,12),"Recomendação: 29",AC.Amarelo,9,GM)
local btnToggle=botao(card,_UO(10,182),_U2(1,-20,0,36),"LIGAR",AC.Verde,Color3.new(1,1,1),14,6) btnToggleRef=btnToggle setBtnEstado(ativo)
btnToggle.MouseButton1Click:Connect(function() if not ativo and META_ATIVA and jjsFeitos>=META then jjsFeitos=0 cliquesTotal=0 bolhasVistas={} end ativo=not ativo
setBtnEstado(ativo) if ativo then ultimaBolhaVista=tick()end end) local btnReset=botao(card,_UO(10,222),_U2(1,-20,0,16),"RESETAR CONTADOR",_K.Panel,_K.DarkGray,9,4)
btnReset.MouseButton1Click:Connect(function() jjsFeitos=0 cliquesTotal=0 bolhasVistas={} end)
rotulo(card,_UO(10,242),_U2(1,-20,0,12),"Desenvolvido por Akira",_K.DarkGray,8,GM,Enum.TextXAlignment.Right) Content.CanvasPosition=_V2() end end
local lojaButton=SideButton("🔫 LOJA",false) lojaButton.MouseButton1Click:Connect(function() SelectButton(lojaButton) ShowLoja() end)
local jjButton=SideButton("🤸 AUTO JJs",false) jjButton.MouseButton1Click:Connect(function() SelectButton(jjButton) ShowJJs() end) task.defer(function() local loaded=0
for _,cat in ipairs(CategoryOrder)do if LoadCategory(cat)then loaded+=1 end end local lt1=LoadTowerRoute("Torre 1","Única") local lt2=0
for _,rn in ipairs(Tower2RouteOrder)do if LoadTowerRoute("Torre 2",rn)then lt2+=1 end end for i=1,4 do selectedCategory[i]="Lento" end ShowParkours()
Notify("ZKY PARKOUR",loaded.."/4 parkours • Torre 1: "..(lt1 and "OK" or "ERRO").." • Torre 2: "..lt2.."/4",loaded==4 and lt1 and lt2==4 and "Success" or "Error") end)
print("ZKY PARKOUR V2.2 carregado com sucesso!")