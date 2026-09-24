if _G.ZKY_KILL and type(_G.ZKY_KILL)=="function" then pcall(_G.ZKY_KILL) end
local _KILLED=false
_G.ZKY_KILL=function() _KILLED=true end
local function alive() return not _KILLED end
_G.ZKY_OK=false
do
local KEY="Akira007"
local LINK="https://discord.gg/NY2RfC7Kx"
local g=Instance.new("ScreenGui") g.Name="ZKYKey" g.ResetOnSpawn=false
pcall(function() g.Parent=(gethui and gethui()) or game:GetService("CoreGui") end)
if not g.Parent then g.Parent=game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") end
local f=Instance.new("Frame",g) f.Size=UDim2.new(0,280,0,220) f.Position=UDim2.new(.5,-140,.5,-110) f.BackgroundColor3=Color3.fromRGB(20,20,25)
Instance.new("UICorner",f).CornerRadius=UDim.new(0,10)
local t=Instance.new("TextLabel",f) t.Size=UDim2.new(1,0,0,36) t.BackgroundTransparency=1 t.Text="AKIRA MENU - KEY" t.TextColor3=Color3.new(1,1,1) t.Font=Enum.Font.GothamBold t.TextSize=16
local bx=Instance.new("TextBox",f) bx.Size=UDim2.new(1,-30,0,34) bx.Position=UDim2.new(0,15,0,42) bx.BackgroundColor3=Color3.fromRGB(35,35,42) bx.TextColor3=Color3.new(1,1,1) bx.PlaceholderText="Cole a key aqui" bx.Text="" bx.ClearTextOnFocus=false bx.Font=Enum.Font.Gotham bx.TextSize=14
Instance.new("UICorner",bx).CornerRadius=UDim.new(0,8)
local av=Instance.new("TextLabel",f) av.Size=UDim2.new(1,-30,0,40) av.Position=UDim2.new(0,15,0,84) av.BackgroundTransparency=1 av.Text="Pra pegar a key, entre no Discord" av.TextColor3=Color3.fromRGB(180,180,180) av.Font=Enum.Font.Gotham av.TextSize=12 av.TextWrapped=true
local bp=Instance.new("TextButton",f) bp.Size=UDim2.new(1,-30,0,34) bp.Position=UDim2.new(0,15,0,128) bp.BackgroundColor3=Color3.fromRGB(88,101,242) bp.Text="Pegar Key" bp.TextColor3=Color3.new(1,1,1) bp.Font=Enum.Font.GothamBold bp.TextSize=14
Instance.new("UICorner",bp).CornerRadius=UDim.new(0,8)
local bc=Instance.new("TextButton",f) bc.Size=UDim2.new(1,-30,0,34) bc.Position=UDim2.new(0,15,0,168) bc.BackgroundColor3=Color3.fromRGB(50,170,90) bc.Text="Check Key" bc.TextColor3=Color3.new(1,1,1) bc.Font=Enum.Font.GothamBold bc.TextSize=14
Instance.new("UICorner",bc).CornerRadius=UDim.new(0,8)
local st=Instance.new("TextLabel",f) st.Size=UDim2.new(1,-20,0,18) st.Position=UDim2.new(0,10,1,-20) st.BackgroundTransparency=1 st.Text="" st.TextColor3=Color3.fromRGB(200,200,200) st.Font=Enum.Font.Gotham st.TextSize=11
bp.MouseButton1Click:Connect(function() pcall(function() setclipboard(LINK) end) pcall(function() game:GetService("GuiService"):OpenBrowserWindow(LINK) end) st.Text="Link do Discord copiado!" end)
bc.MouseButton1Click:Connect(function() local d=bx.Text:gsub("%s","") if d:lower()==KEY:lower() then _G.ZKY_OK=true g:Destroy() else st.Text="Key inválida." end end)
end
repeat task.wait() until _G.ZKY_OK

local _I,_U2,_UO,_UD,_RGB,_V2,_GB,_GM,_XL,_XC=Instance.new,UDim2.new,UDim2.fromOffset,UDim.new,Color3.fromRGB,Vector2.new,Enum.Font.GothamBold,Enum.Font.GothamMedium,Enum.TextXAlignment.Left,Enum.TextXAlignment.Center
local P=game:GetService("Players") local T=game:GetService("TweenService") local U=game:GetService("UserInputService") local R=game:GetService("RunService")
local HS=game:GetService("HttpService") local TCS=game:GetService("TextChatService") local RS=game:GetService("ReplicatedStorage")
local Pl=P.LocalPlayer local PG=Pl:WaitForChild("PlayerGui")
local character,humanoid,rootPart

local CONFIG={LineThickness=.15,LineTransparency=.2,LineColor=_RGB(255,145,45),JumpCooldown=.28,PlaybackSpeed=1,WalkToSpeed=16,GroundOffset=1.66}
local MovementConfig={Modo="Dummy"}
local IA_CONFIG={ApiKey="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",Endpoint="https://api.groq.com/openai/v1/chat/completions",Modelo="openai/gpt-oss-120b",Timeout=15,MaxTokens=2048,SystemPrompt="Você é um corretor gramatical. Corrija a mensagem do usuário para português do Brasil, mantendo o significado e o tom original. Responda APENAS com a mensagem corrigida, sem explicações, aspas ou comentários extras."}
local IA_TEXTOS_CONFIG={ApiKey="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",Endpoint="https://api.groq.com/openai/v1/chat/completions",Modelo="openai/gpt-oss-120b",Timeout=20,SystemPrompt="Você é um gerador de textos curtos para um jogo de Roblox de roleplay militar do Exército Brasileiro (EB). Regras obrigatórias: (1) Escreva 100% em português do Brasil, sobre o tema exato que o usuário mandar, sem fugir do assunto. (2) O texto final deve ter entre 150 e 250 caracteres, em 2 a 3 frases curtas, tom sério, humano e patriótico, sem exageros nem clichês. (3) Nunca escreva raciocínio, explicações, introduções, saudações, aspas ou emojis. (4) A ÚNICA coisa que aparece na sua resposta é o texto final, envolto EXATAMENTE assim: <<<texto aqui>>>. Nada antes dos <<<, nada depois do >>>."}
local httpRequest=request or (syn and syn.request) or (http and http.request) or http_request

local Pastebins={Lento="https://pastebin.com/raw/M7DvRgTc",["Rápido"]="https://pastebin.com/raw/pBk8vYXE",["Mais Rápido"]="https://pastebin.com/raw/yz7gZmYr",["Sem Burla"]="https://pastebin.com/raw/N1j0iRDA"}
local CategoryOrder={"Lento","Rápido","Mais Rápido","Sem Burla"}
local TowerPastebins={["Torre 1"]={["Única"]="https://pastebin.com/raw/HxXb4Mr3"},["Torre 2"]={Frente="https://pastebin.com/raw/Y2arCYHb",["Atrás"]="https://pastebin.com/raw/rXxZX7CQ",Esquerda="https://pastebin.com/raw/FtpTHhGt",Direita="https://pastebin.com/raw/4u5Wjtkg"}}
local Tower2RouteOrder={"Frente","Atrás","Esquerda","Direita"}
local routes={Lento={},["Rápido"]={},["Mais Rápido"]={},["Sem Burla"]={}}
local towerRoutes={["Torre 1"]={},["Torre 2"]={Frente={},["Atrás"]={},Esquerda={},Direita={}}}
local selectedCategory={} for i=1,4 do selectedCategory[i]="Lento" end
local selectedTower2Route="Frente"
local CurrentPage="Creditos"
local lineFolder,linesVisible,mostrarLinhas,desativarDummies=true,true,false
local Playback={Running=false,Connection=nil,Route=nil,StartClock=0,CurrentIndex=1,LastJump=-math.huge,Category=nil,Parkour=nil,Tower=nil,TowerRoute=nil,WalkingToStart=false,WalkConnection=nil}
local SavedDirection,Turning=nil,false
local Old=PG:FindFirstChild("ZKY_PARKOUR") if Old then Old:Destroy() end
local _K={Background=_RGB(15,15,18),Panel=_RGB(20,20,25),Card=_RGB(24,24,30),Selected=_RGB(45,45,55),Stroke=_RGB(45,45,55),StrokeLight=_RGB(65,65,80),White=_RGB(240,240,245),Gray=_RGB(170,170,180),DarkGray=_RGB(115,115,125),Success=_RGB(80,210,125),Error=_RGB(230,85,85),Orange=_RGB(255,145,45),Primary=_RGB(185,185,185),Purple=_RGB(150,110,240),PurpleLight=_RGB(180,150,255)}
local function Corner(o,r) local c=_I("UICorner") c.CornerRadius=_UD(0,r) c.Parent=o end
local function Stroke(o,c,t) local s=_I("UIStroke") s.Color=c s.Thickness=t or 1 s.Parent=o return s end
local function Padding(o,t,b,l,rr) local p=_I("UIPadding") p.PaddingTop=_UD(0,t or 0) p.PaddingBottom=_UD(0,b or 0) p.PaddingLeft=_UD(0,l or 0) p.PaddingRight=_UD(0,rr or 0) p.Parent=o end

local NH=_I("Frame") NH.Name="Notifications" NH.AnchorPoint=_V2(1,1) NH.Position=_U2(1,-15,1,-15) NH.Size=_UO(270,300) NH.BackgroundTransparency=1 NH.ZIndex=200 NH.Parent=PG
local NL=_I("UIListLayout") NL.VerticalAlignment=Enum.VerticalAlignment.Bottom NL.HorizontalAlignment=Enum.HorizontalAlignment.Right NL.Padding=_UD(0,7) NL.Parent=NH
local function Notify(tt,msg,nt)
local c=_K.Gray if nt=="Success" then c=_K.Success elseif nt=="Error" then c=_K.Error elseif nt=="Orange" then c=_K.Orange end
local n=_I("Frame") n.Size=_UO(250,64) n.BackgroundColor3=_K.Panel n.BackgroundTransparency=1 n.ZIndex=201 n.Parent=NH Corner(n,10) local ns=Stroke(n,c) ns.Transparency=1
local a=_I("Frame") a.Size=_UO(3,38) a.AnchorPoint=_V2(0,.5) a.Position=_U2(0,7,.5,0) a.BackgroundColor3=c a.BackgroundTransparency=1 a.ZIndex=202 a.Parent=n Corner(a,5)
local t1=_I("TextLabel") t1.BackgroundTransparency=1 t1.Position=_UO(18,9) t1.Size=_U2(1,-28,0,18) t1.Text=tt t1.TextColor3=_K.White t1.TextSize=12 t1.Font=_GB t1.TextXAlignment=_XL t1.ZIndex=203 t1.Parent=n
local m1=_I("TextLabel") m1.BackgroundTransparency=1 m1.Position=_UO(18,30) m1.Size=_U2(1,-28,0,25) m1.Text=msg m1.TextColor3=_K.Gray m1.TextSize=9 m1.Font=_GM m1.TextWrapped=true m1.TextXAlignment=_XL m1.TextYAlignment=Enum.TextYAlignment.Center m1.ZIndex=203 m1.Parent=n
T:Create(n,TweenInfo.new(.35,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{BackgroundTransparency=0}):Play()
T:Create(ns,TweenInfo.new(.25),{Transparency=0}):Play()
T:Create(a,TweenInfo.new(.25),{BackgroundTransparency=0}):Play()
task.delay(2.8,function() if not n.Parent then return end local o=T:Create(n,TweenInfo.new(.3,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{BackgroundTransparency=1}) o:Play() T:Create(ns,TweenInfo.new(.2),{Transparency=1}):Play() T:Create(a,TweenInfo.new(.2),{BackgroundTransparency=1}):Play() o.Completed:Wait() if n.Parent then n:Destroy() end end)
end

local function RefreshCharacter()
character=Pl.Character if not character or not character.Parent then return false end
humanoid=character:FindFirstChildOfClass("Humanoid") rootPart=character:FindFirstChild("HumanoidRootPart")
return humanoid~=nil and rootPart~=nil
end
local walkTrack,walkAnimCache
Pl.CharacterAdded:Connect(function() task.wait(.2) RefreshCharacter() walkTrack=nil walkAnimCache=nil end)
RefreshCharacter()
local function iniciarAnimacaoAndar()
if not RefreshCharacter() then return end if walkTrack and walkTrack.IsPlaying then return end
local an=humanoid:FindFirstChildOfClass("Animator") if not an then an=_I("Animator") an.Parent=humanoid end
if not walkAnimCache then
local id=nil local ae=character:FindFirstChild("Animate")
if ae then local wf=ae:FindFirstChild("walk") if wf then local a=wf:FindFirstChildOfClass("Animation") if a then id=a.AnimationId end end end
if not id then id=(humanoid.RigType==Enum.HumanoidRigType.R15) and "rbxassetid://507777826" or "rbxassetid://180426354" end
local a=_I("Animation") a.AnimationId=id
local ok,tr=pcall(function() return an:LoadAnimation(a) end) if not ok or not tr then return end
tr.Looped=true tr.Priority=Enum.AnimationPriority.Movement walkAnimCache=tr
end
walkTrack=walkAnimCache pcall(function() walkTrack:Play() end)
end
local function pararAnimacaoAndar() if walkTrack then pcall(function() walkTrack:Stop() end) walkTrack=nil end end
local ultimaPosAnim,ultimoTempoMov=nil,0
task.spawn(function()
while alive() do
task.wait(0.08)
if RefreshCharacter() then
local pos=rootPart.Position
if ultimaPosAnim then local d=(pos-ultimaPosAnim).Magnitude if d>0.06 then ultimoTempoMov=os.clock() end end
ultimaPosAnim=pos
local noChao=humanoid.FloorMaterial~=Enum.Material.Air
local mov=(os.clock()-ultimoTempoMov)<0.2
local naRota=Playback.Running and not Playback.WalkingToStart
if naRota and noChao and mov then if not walkTrack or not walkTrack.IsPlaying then iniciarAnimacaoAndar() end
else if walkTrack and walkTrack.IsPlaying then pararAnimacaoAndar() end end
else ultimaPosAnim=nil if walkTrack and walkTrack.IsPlaying then pararAnimacaoAndar() end end
end
end)
local function Num(v) return v and tonumber(v) end
local function ParseRoutes(raw)
local parsed,blocks={},{} local sp=1
while true do local s=string.find(raw,"local Rota = {",sp) if not s then break end local b,e=0
for i=s,#raw do local ch=string.sub(raw,i,i) if ch=="{" then b+=1 elseif ch=="}" then b-=1 if b==0 then e=i break end end end
if not e then break end table.insert(blocks,string.sub(raw,s,e)) sp=e+1 end
for _,bl in ipairs(blocks) do
local frames,fs={},1
while true do
local p1,p2=string.find(bl,"{(.-)}",fs) if not p1 then break end
local f=string.sub(bl,p1,p2)
local t=string.match(f,"t%s*=%s*([%d%.%-]+)") local x=string.match(f,"x%s*=%s*([%d%.%-]+)") local y=string.match(f,"y%s*=%s*([%d%.%-]+)") local z=string.match(f,"z%s*=%s*([%d%.%-]+)")
local j=string.match(f,"j%s*=%s*([%w]+)") local rx=string.match(f,"rx%s*=%s*([%d%.%-]+)") local ry=string.match(f,"ry%s*=%s*([%d%.%-]+)") local rz=string.match(f,"rz%s*=%s*([%d%.%-]+)")
if t and x and y and z then
local q={t=Num(t),x=Num(x),y=Num(y),z=Num(z),j=j=="true",position=Vector3.new(Num(x),Num(y),Num(z)),rx=Num(rx),ry=Num(ry),rz=Num(rz)}
if q.rx and q.ry and q.rz then q.rotation=CFrame.Angles(q.rx,q.ry,q.rz) q.hasRotation=true else q.hasRotation=false end
table.insert(frames,q)
end
fs=p2+1
end
if #frames>=2 then table.sort(frames,function(a,b) return a.t<b.t end) table.insert(parsed,frames) end
end
return parsed
end
local function LoadCategory(cat)
local url=Pastebins[cat] if not url then return false end
local ok,raw=pcall(function() return game:HttpGet(url) end) if not ok or not raw then return false end
local p=ParseRoutes(raw) if #p==0 then return false end routes[cat]=p return true
end
local function LoadTowerRoute(tw,rt)
local d=TowerPastebins[tw] if not d then return false end local url=d[rt] if not url then return false end
local ok,raw=pcall(function() return game:HttpGet(url) end) if not ok or not raw then return false end
local p=ParseRoutes(raw) if #p==0 then return false end
towerRoutes[tw]=towerRoutes[tw] or {} towerRoutes[tw][rt]=p[1] return true
end
local function CreateLine(a,b)
if not a or not b then return end local d=b-a local dist=d.Magnitude if dist<.01 then return end
if not lineFolder then lineFolder=_I("Folder") lineFolder.Name="ZKY_RouteLines" lineFolder.Parent=workspace end
local l=_I("Part") l.Name="RouteSegment" l.Anchored=true l.CanCollide=false l.CanTouch=false l.CanQuery=false l.CastShadow=false l.Material=Enum.Material.Neon l.Color=CONFIG.LineColor
l.Transparency=(linesVisible and mostrarLinhas) and CONFIG.LineTransparency or 1
l.Size=Vector3.new(CONFIG.LineThickness,CONFIG.LineThickness,dist) l.CFrame=CFrame.lookAt((a+b)/2,b) l.Parent=lineFolder
end
local function ClearLines() if not lineFolder then return end for _,o in ipairs(lineFolder:GetChildren()) do o:Destroy() end end
local function ShowRouteLines(data) ClearLines() local last for _,f in ipairs(data) do local p=f.position if last then CreateLine(last,p) end last=p end end
local function GetPosition(f) if not f then return end if f.position then return f.position end if f.x and f.y and f.z then return Vector3.new(f.x,f.y,f.z) end end
local function GetRotation(f) if not f then return end if f.rotation then return f.rotation end if f.rx and f.ry and f.rz then return CFrame.Angles(f.rx,f.ry,f.rz) end end
local function ApplyPosition(pos,rot)
if not pos or not RefreshCharacter() then return false end
local c=pos+Vector3.new(0,CONFIG.GroundOffset,0) local target
if rot then target=CFrame.new(c)*rot
else local l=rootPart.CFrame.LookVector local fl=Vector3.new(l.X,0,l.Z) if fl.Magnitude<.01 then fl=Vector3.new(0,0,-1) else fl=fl.Unit end target=CFrame.lookAt(c,c+fl) end
pcall(function() character:PivotTo(target) end) return true
end
local function GetFrames(frames,el)
local n=#frames if n<2 then return end
if el<=frames[1].t then Playback.CurrentIndex=1 return frames[1],frames[2],0 end
if el>=frames[n].t then return frames[n],frames[n],1 end
local i=math.clamp(Playback.CurrentIndex,1,n-1)
while i<n-1 and el>frames[i+1].t do i+=1 end
while i>1 and el<frames[i].t do i-=1 end
Playback.CurrentIndex=i
local a,b=frames[i],frames[i+1] local d=b.t-a.t
local al=d>0 and math.clamp((el-a.t)/d,0,1) or 0
return a,b,al
end
local function HandleJump(f,e) if not f or not f.j or e-Playback.LastJump<CONFIG.JumpCooldown or not RefreshCharacter() then return end Playback.LastJump=e humanoid.Jump=true pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end) end
local function AndarAte(destino,cancel,term)
if not RefreshCharacter() then term(false) return end
humanoid.WalkSpeed=CONFIG.WalkToSpeed humanoid:MoveTo(destino)
local st=os.clock() local suc=false
while not cancel() and alive() do
if not RefreshCharacter() then break end
if (rootPart.Position-destino).Magnitude<=4 then suc=true break end
if os.clock()-st>60 then break end task.wait()
end
if RefreshCharacter() then humanoid:Move(Vector3.zero,false) end
term(suc and not cancel())
end
local DummyObj,RemoverDummy
local function CriarDummy(pos,rot)
RemoverDummy()
local alvo=rot and (CFrame.new(pos)*(rot-rot.Position)) or CFrame.new(pos)
local ok=false
if RefreshCharacter() then
local sv={} for _,d in ipairs(character:GetDescendants()) do sv[d]=d.Archivable pcall(function() d.Archivable=true end) end
local ck,cl=pcall(function() return character:Clone() end)
for i,v in pairs(sv) do pcall(function() i.Archivable=v end) end
if ck and cl then
for _,d in ipairs(cl:GetDescendants()) do
if d:IsA("Script") or d:IsA("LocalScript") or d:IsA("Shirt") or d:IsA("Pants") or d:IsA("ShirtGraphic") or d:IsA("Decal") then pcall(function() d:Destroy() end)
elseif d:IsA("BasePart") then d.CanCollide=false d.CanQuery=false d.CanTouch=false d.Massless=true d.Material=Enum.Material.ForceField d.Color=_RGB(0,255,140) d.Transparency=.35 end
end
local h=cl:FindFirstChildOfClass("Humanoid") if h then pcall(function() h.WalkSpeed=0 h.JumpPower=0 h.PlatformStand=true end) end
cl.PrimaryPart=cl.PrimaryPart or cl:FindFirstChild("HumanoidRootPart")
if cl.PrimaryPart then cl.Parent=workspace
local pk=pcall(function() cl:PivotTo(alvo) end)
if pk then
for _,d in ipairs(cl:GetDescendants()) do if d:IsA("BasePart") then d.Anchored=true end end
local hl=_I("Highlight") hl.FillColor=_RGB(0,255,140) hl.OutlineColor=_RGB(150,255,195) hl.FillTransparency=.55 hl.OutlineTransparency=0 hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop hl.Parent=cl
cl.Name="ZKY_Dummy" DummyObj=cl ok=true
else cl:Destroy() end
else cl:Destroy() end
end
end
if not ok then
local m=_I("Part") m.Name="ZKY_Dummy" m.Shape=Enum.PartType.Cylinder m.Size=Vector3.new(.4,6,6) m.CFrame=alvo*CFrame.Angles(0,0,math.rad(90))
m.Color=_RGB(0,255,130) m.Material=Enum.Material.Neon m.Transparency=.35 m.Anchored=true m.CanCollide=false m.CanQuery=false m.CanTouch=false m.Parent=workspace DummyObj=m
end
end
RemoverDummy=function() if DummyObj then pcall(function() DummyObj:Destroy() end) DummyObj=nil end end
local function StopPlayback(reason)
if Playback.Connection then Playback.Connection:Disconnect() Playback.Connection=nil end
if Playback.WalkConnection then Playback.WalkConnection:Disconnect() Playback.WalkConnection=nil end
RemoverDummy()
Playback.Running=false Playback.Route=nil Playback.CurrentIndex=1 Playback.LastJump=-math.huge Playback.Category=nil Playback.Parkour=nil Playback.Tower=nil Playback.TowerRoute=nil Playback.WalkingToStart=false
if RefreshCharacter() then humanoid:Move(Vector3.zero,false) humanoid.Jump=false pcall(function() humanoid.AutoRotate=true end) end
pararAnimacaoAndar() ClearLines()
if reason=="completed" then Notify("CONCLUÍDO","Rota finalizada!","Success")
elseif reason=="cancelled" then Notify("PARADO","Reprodução interrompida.","Error")
elseif reason=="error" then Notify("ERRO","Não foi possível continuar.","Error") end
end
local function IniciarExecucao(name)
if not Playback.Running then return end
Playback.WalkingToStart=false
if RefreshCharacter() then humanoid:Move(Vector3.zero,false) pcall(function() humanoid.AutoRotate=false end) end
Playback.StartClock=os.clock() Playback.CurrentIndex=1 Playback.LastJump=-math.huge
Notify("EXECUTANDO",name,"Success")
task.spawn(function()
while Playback.Running and not Playback.WalkingToStart and alive() do
if not RefreshCharacter() then StopPlayback("error") break end
local fr=Playback.Route if not fr or #fr<2 then StopPlayback("error") break end
local el=(os.clock()-Playback.StartClock)*CONFIG.PlaybackSpeed
local fin=fr[#fr]
if el>=fin.t then ApplyPosition(GetPosition(fin),GetRotation(fin)) StopPlayback("completed") break end
local a,b,al=GetFrames(fr,el) if not a or not b then break end
local pa,pb=GetPosition(a),GetPosition(b) if not pa or not pb then StopPlayback("error") break end
local pos=pa:Lerp(pb,al)
local ra,rb=GetRotation(a),GetRotation(b) local rot
if ra and rb then rot=ra:Lerp(rb,al) elseif ra then rot=ra elseif rb then rot=rb end
ApplyPosition(pos,rot) HandleJump(a,el) R.Heartbeat:Wait()
end
end)
end
local function StartPlayback(data,cat,num,tw,tr)
if Playback.Running then Notify("EM EXECUÇÃO","Pare a rota atual antes de iniciar outra.","Error") return end
if not data or #data<2 then Notify("ROTA INVÁLIDA","Essa rota não possui frames suficientes.","Error") return end
if not RefreshCharacter() then Notify("PERSONAGEM","Personagem não encontrado.","Error") return end
local fr=data[1] local fp=GetPosition(fr) if not fp then Notify("ERRO","Primeiro ponto da rota inválido.","Error") return end
local target=fp+Vector3.new(0,CONFIG.GroundOffset,0)
Playback.Running=true Playback.WalkingToStart=true Playback.Route=data Playback.Category=cat Playback.Parkour=num Playback.Tower=tw Playback.TowerRoute=tr Playback.CurrentIndex=1
ShowRouteLines(data)
local nm if tw then nm=tw=="Torre 1" and "Torre 1" or "Torre 2 • "..tr else nm="Parkour "..num.." • "..cat end
local usoDummy=MovementConfig.Modo=="Dummy" and not desativarDummies
if usoDummy then
Notify("MARCADOR CRIADO","Ande até o marcador verde para iniciar: "..nm,"Orange")
CriarDummy(target,GetRotation(fr))
Playback.WalkConnection=R.Heartbeat:Connect(function()
if not Playback.Running or not Playback.WalkingToStart then return end
if not RefreshCharacter() then StopPlayback("error") return end
if (rootPart.Position-target).Magnitude<=5 then
if Playback.WalkConnection then Playback.WalkConnection:Disconnect() Playback.WalkConnection=nil end
RemoverDummy() IniciarExecucao(nm)
end
end)
else
Notify("INDO PARA O INÍCIO",nm,"Orange")
task.spawn(function()
AndarAte(target,function() return not Playback.Running end,function(s) if not Playback.Running then return end if not s then StopPlayback("error") return end IniciarExecucao(nm) end)
end)
end
end
local function SaveDirection()
if not RefreshCharacter() then Notify("ERRO","Personagem não encontrado.","Error") return end
local l=rootPart.CFrame.LookVector local fl=Vector3.new(l.X,0,l.Z) if fl.Magnitude<=0 then Notify("ERRO","Direção inválida.","Error") return end
SavedDirection=fl.Unit Notify("DIREÇÃO SALVA","Direção guardada com sucesso!","Success")
end
local function Turn(cmd)
if Turning then Notify("AGUARDE","Já está girando.","Error") return end
if not RefreshCharacter() then Notify("ERRO","Personagem não encontrado.","Error") return end
Turning=true local oa=humanoid.AutoRotate humanoid.AutoRotate=false
local ang
if cmd=="DIREITA" then ang=math.rad(-90) elseif cmd=="ESQUERDA" then ang=math.rad(90) elseif cmd=="RETAGUARDA" then ang=math.rad(180) end
if ang then local p=rootPart.Position local nf=rootPart.CFrame*CFrame.Angles(0,ang,0) rootPart.CFrame=CFrame.new(p)*(nf-nf.Position) end
task.wait() humanoid.AutoRotate=oa Turning=false
Notify(cmd.." VOLVER!","Giro executado.","Success")
end
local function VanguardaVolver()
if not SavedDirection then Notify("ERRO","Salve uma direção primeiro.","Error") return end
if not RefreshCharacter() then Notify("ERRO","Personagem não encontrado.","Error") return end
local p=rootPart.Position local oa=humanoid.AutoRotate humanoid.AutoRotate=false
rootPart.CFrame=CFrame.lookAt(p,p+SavedDirection) task.wait() humanoid.AutoRotate=oa
Notify("VANGUARDA VOLVER!","Retornou à direção salva.","Success")
end
local function EnviarNoChat(msg)
msg=string.sub(msg,1,200)
if TCS.ChatVersion==Enum.ChatVersion.TextChatService then
local cs=TCS:FindFirstChild("TextChannels") local c=cs and cs:FindFirstChild("RBXGeneral")
if c then c:SendAsync(msg) return true end
end
local ev=RS:FindFirstChild("DefaultChatSystemChatEvents") local sm=ev and ev:FindFirstChild("SayMessageRequest")
if sm then sm:FireServer(msg,"All") return true end
return false
end
local function CorrigirTexto(texto)
if not httpRequest then return nil,"Executor sem suporte a HTTP" end
local corpo=HS:JSONEncode({model=IA_CONFIG.Modelo,messages={{role="system",content=IA_CONFIG.SystemPrompt},{role="user",content=texto}},temperature=.2,max_tokens=IA_CONFIG.MaxTokens or 2048})
local resp,fin=nil,false
task.spawn(function()
local ok,r=pcall(function() return httpRequest({Url=IA_CONFIG.Endpoint,Method="POST",Headers={["Content-Type"]="application/json",["Authorization"]="Bearer "..IA_CONFIG.ApiKey},Body=corpo}) end)
if ok then resp=r end fin=true
end)
local ini=os.clock()
while not fin and (os.clock()-ini)<IA_CONFIG.Timeout do task.wait(.1) end
if not fin then return nil,"Tempo esgotado" end
if not resp then return nil,"Falha na requisição" end
if not resp.Body then return nil,"Resposta vazia do servidor" end
if resp.StatusCode~=200 then return nil,"HTTP "..tostring(resp.StatusCode) end
local okj,dd=pcall(function() return HS:JSONDecode(resp.Body) end)
if not okj or not dd.choices or not dd.choices[1] then return nil,"Resposta inválida" end
local tx=dd.choices[1].message and dd.choices[1].message.content
if not tx or tx=="" then return nil,"Resposta vazia" end
tx=tx:gsub("^%s+",""):gsub("%s+$","") tx=tx:gsub('^["\']+',""):gsub('["\']+$',"")
return tx
end
local function GerarTextoPronto(tema)
if not httpRequest then return nil,"Executor sem suporte a HTTP" end
if not tema or tema=="" then return nil,"Tema vazio" end
local corpo=HS:JSONEncode({model=IA_TEXTOS_CONFIG.Modelo,messages={{role="system",content=IA_TEXTOS_CONFIG.SystemPrompt},{role="user",content="Tema: "..tema}},temperature=.6,max_tokens=1200})
local resp,fin=nil,false
task.spawn(function()
local ok,r=pcall(function() return httpRequest({Url=IA_TEXTOS_CONFIG.Endpoint,Method="POST",Headers={["Content-Type"]="application/json",["Authorization"]="Bearer "..IA_TEXTOS_CONFIG.ApiKey},Body=corpo}) end)
if ok then resp=r end fin=true
end)
local ini=os.clock()
while not fin and (os.clock()-ini)<IA_TEXTOS_CONFIG.Timeout do task.wait(.1) end
if not fin then return nil,"Tempo esgotado" end
if not resp then return nil,"Falha na requisição" end
if not resp.Body then return nil,"Resposta vazia do servidor" end
if resp.StatusCode~=200 then return nil,"HTTP "..tostring(resp.StatusCode) end
local okj,dd=pcall(function() return HS:JSONDecode(resp.Body) end)
if not okj or not dd.choices or not dd.choices[1] then return nil,"Resposta inválida" end
local msg=dd.choices[1].message if not msg then return nil,"Resposta vazia" end
local tx=msg.content or ""
local ex=tx:match("<<<(.-)>>>")
if not ex and msg.reasoning then ex=msg.reasoning:match("<<<(.-)>>>") end
if not ex or ex:gsub("%s+","")=="" then return nil,"A IA não formatou a resposta corretamente. Tente gerar de novo." end
local fn=ex:gsub("^%s+",""):gsub("%s+$","") fn=fn:gsub('^["\']+',""):gsub('["\']+$',"")
if fn=="" or #fn>400 then return nil,"A IA não formatou corretamente. Tente de novo." end
return fn
end

-- GUI + UI
local Gui=_I("ScreenGui") Gui.Name="ZKY_PARKOUR" Gui.ResetOnSpawn=false Gui.IgnoreGuiInset=true Gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling Gui.Parent=PG
local Logo=_I("TextButton") Logo.Name="ZKY_Logo" Logo.Size=_UO(58,58) Logo.Position=_UO(12,65) Logo.BackgroundColor3=_RGB(10,10,10) Logo.Text="🚀" Logo.TextColor3=_K.White Logo.TextSize=26 Logo.Font=_GB Logo.AutoButtonColor=false Logo.Parent=Gui Corner(Logo,29) Stroke(Logo,_K.StrokeLight)
local Main=_I("Frame") Main.Name="Main" Main.AnchorPoint=_V2(.5,.5) Main.Position=UDim2.fromScale(.5,.5) Main.Size=UDim2.fromScale(.78,.65) Main.BackgroundColor3=_K.Background Main.Visible=false Main.ClipsDescendants=true Main.ZIndex=10 Main.Parent=Gui Corner(Main,14) Stroke(Main,_K.Stroke)
local Header=_I("Frame") Header.Size=_U2(1,-16,0,54) Header.Position=_UO(8,8) Header.BackgroundColor3=_K.Panel Header.ZIndex=20 Header.Parent=Main Corner(Header,10) Stroke(Header,_K.Stroke)
local Title=_I("TextLabel") Title.BackgroundTransparency=1 Title.Position=_UO(13,7) Title.Size=_U2(.55,0,0,23) Title.Text="🚀 AKIRA MENU" Title.TextColor3=_K.White Title.TextSize=17 Title.Font=_GB Title.TextXAlignment=_XL Title.ZIndex=22 Title.Parent=Header
local Subtitle=_I("TextLabel") Subtitle.BackgroundTransparency=1 Subtitle.Position=_UO(14,31) Subtitle.Size=_U2(.65,0,0,15) Subtitle.Text="Auto Parkour • Akira" Subtitle.TextColor3=_K.DarkGray Subtitle.TextSize=9 Subtitle.Font=_GM Subtitle.TextXAlignment=_XL Subtitle.ZIndex=22 Subtitle.Parent=Header
local Version=_I("TextLabel") Version.BackgroundColor3=_K.Card Version.AnchorPoint=_V2(.5,.5) Version.Position=_U2(.5,0,.5,0) Version.Size=_UO(55,25) Version.Text="V2.7" Version.TextColor3=_K.Gray Version.TextSize=10 Version.Font=_GB Version.ZIndex=22 Version.Parent=Header Corner(Version,8) Stroke(Version,_K.Stroke)
local Close=_I("TextButton") Close.Size=_UO(34,34) Close.Position=_U2(1,-42,.5,-17) Close.BackgroundColor3=_K.Card Close.Text="×" Close.TextColor3=_K.Gray Close.TextSize=22 Close.Font=_GM Close.AutoButtonColor=false Close.ZIndex=25 Close.Parent=Header Corner(Close,10) Stroke(Close,_K.Stroke)
local Sidebar=_I("ScrollingFrame") Sidebar.Size=_U2(0,118,1,-78) Sidebar.Position=_UO(8,70) Sidebar.BackgroundColor3=_K.Panel Sidebar.ScrollBarThickness=2 Sidebar.ScrollBarImageColor3=_K.StrokeLight Sidebar.AutomaticCanvasSize=Enum.AutomaticSize.Y Sidebar.ZIndex=20 Sidebar.Parent=Main Corner(Sidebar,10) Stroke(Sidebar,_K.Stroke) Padding(Sidebar,7,7,6,6)
local SL=_I("UIListLayout") SL.Padding=_UD(0,5) SL.HorizontalAlignment=Enum.HorizontalAlignment.Center SL.Parent=Sidebar
local function SideButton(text,sel)
local b=_I("TextButton") b.Size=_U2(1,0,0,39) b.BackgroundColor3=sel and _K.Selected or _K.Card b.Text=text b.TextColor3=sel and _K.White or _K.Gray b.TextSize=9 b.Font=_GB b.TextXAlignment=_XL b.AutoButtonColor=false b.Parent=Sidebar Corner(b,7) Padding(b,0,0,8,2) Stroke(b,_K.Stroke)
return b
end
local creditosButton=SideButton("👑 CRÉDITOS",true)
local ebDeltaButton=SideButton("🚀 EB DELTA",false)
local taffsButton=SideButton("📝 TAFFS",false)
local volversButton=SideButton("↪ VOLVERS",false)
local iaButton=SideButton("🤖 IA CHAT",false)
local combateButton=SideButton("🎯 COMBATE",false)
local textosButton=SideButton("📚 TEXTOS PRONTOS",false)
local lojaButton=SideButton("🔫 LOJA",false)
local extrasButton=SideButton("🔓 EXTRAS",false)
local selectedButton=creditosButton
local Content=_I("ScrollingFrame") Content.Size=_U2(1,-134,1,-78) Content.Position=_U2(0,126,0,70) Content.BackgroundColor3=_K.Panel Content.ScrollBarThickness=3 Content.ScrollBarImageColor3=_K.StrokeLight Content.AutomaticCanvasSize=Enum.AutomaticSize.Y Content.ZIndex=20 Content.Parent=Main Corner(Content,10) Stroke(Content,_K.Stroke)
local _CH=_I("Frame") _CH.Size=_U2(1,0,0,0) _CH.AutomaticSize=Enum.AutomaticSize.Y _CH.BackgroundTransparency=1 _CH.Parent=Content Padding(_CH,9,9,9,9)
local CL=_I("UIListLayout") CL.Padding=_UD(0,7) CL.Parent=_CH
local function ClearContent() for _,c in ipairs(_CH:GetChildren()) do if c:IsA("GuiObject") then c:Destroy() end end end

local UI={}
function UI.Help(p) local h=_I("TextButton",p) h.Size=_UO(14,14) h.BackgroundColor3=_RGB(35,35,45) h.Text="?" h.TextColor3=_K.DarkGray h.Font=_GB h.TextSize=9 h.AutoButtonColor=false h.ZIndex=5 Corner(h,7) return h end
function UI.Toggle(parent,ord,txt,ini,cb)
local row=_I("Frame",parent) row.Size=_U2(1,0,0,28) row.BackgroundTransparency=1 row.LayoutOrder=ord
local lb=_I("TextLabel",row) lb.BackgroundTransparency=1 lb.Size=_U2(1,-90,1,0) lb.Text=txt lb.TextColor3=_K.Gray lb.Font=_GM lb.TextSize=10 lb.TextXAlignment=_XL
local hp=UI.Help(row) hp.AnchorPoint=_V2(1,.5) hp.Position=_U2(1,-48,.5,0)
local sw=_I("TextButton",row) sw.AnchorPoint=_V2(1,.5) sw.Position=_U2(1,0,.5,0) sw.Size=_UO(38,20) sw.BackgroundColor3=_RGB(40,40,50) sw.Text="" sw.AutoButtonColor=false Corner(sw,10)
local bol=_I("Frame",sw) bol.Size=_UO(14,14) bol.Position=_UO(3,3) bol.BackgroundColor3=_RGB(120,120,130) Corner(bol,7)
local e=ini
local function ap(v) e=v if v then sw.BackgroundColor3=_K.Purple bol.Position=_UO(21,3) bol.BackgroundColor3=_RGB(255,255,255) else sw.BackgroundColor3=_RGB(40,40,50) bol.Position=_UO(3,3) bol.BackgroundColor3=_RGB(120,120,130) end end
ap(e) sw.MouseButton1Click:Connect(function() ap(not e) cb(e) end) row.SetToggle=ap return row
end
function UI.Slider(parent,ord,tit,val,mn,mx,dec,cb)
local wrap=_I("Frame",parent) wrap.Size=_U2(1,0,0,50) wrap.BackgroundTransparency=1 wrap.LayoutOrder=ord
local lb=_I("TextLabel",wrap) lb.BackgroundTransparency=1 lb.Size=_U2(1,-60,0,14) lb.Text=tit lb.TextColor3=_K.Gray lb.Font=_GM lb.TextSize=10 lb.TextXAlignment=_XL
local vl=_I("TextLabel",wrap) vl.AnchorPoint=_V2(1,0) vl.Position=_U2(1,-22,0,0) vl.Size=_UO(50,14) vl.BackgroundTransparency=1 vl.Text=dec and string.format("%.2f",val) or tostring(val) vl.TextColor3=_K.White vl.Font=_GB vl.TextSize=10 vl.TextXAlignment=Enum.TextXAlignment.Right
local hp=UI.Help(wrap) hp.AnchorPoint=_V2(1,0) hp.Position=_U2(1,0,0,0)
local bb=_I("Frame",wrap) bb.Position=_UO(0,24) bb.Size=_U2(1,0,0,6) bb.BackgroundColor3=_RGB(35,35,45) Corner(bb,3)
local p0=(val-mn)/(mx-mn)
local fl=_I("Frame",bb) fl.Size=_U2(p0,0,1,0) fl.BackgroundColor3=_K.Purple Corner(fl,3)
local kn=_I("Frame",bb) kn.AnchorPoint=_V2(.5,.5) kn.Position=_U2(p0,0,.5,0) kn.Size=_UO(12,12) kn.BackgroundColor3=_RGB(255,255,255) kn.ZIndex=2 Corner(kn,6)
local hit=_I("TextButton",wrap) hit.Position=_UO(0,16) hit.Size=_U2(1,0,0,24) hit.BackgroundTransparency=1 hit.Text="" hit.AutoButtonColor=false
local dr=false
local function upd(x) local p=math.clamp((x-bb.AbsolutePosition.X)/math.max(bb.AbsoluteSize.X,1),0,1) local v if dec then v=mn+(mx-mn)*p vl.Text=string.format("%.2f",v) else v=math.floor(mn+(mx-mn)*p+.5) vl.Text=tostring(v) end fl.Size=_U2(p,0,1,0) kn.Position=_U2(p,0,.5,0) cb(v) end
hit.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then Content.ScrollingEnabled=false dr=true upd(i.Position.X) end end)
U.InputChanged:Connect(function(i) if dr and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then upd(i.Position.X) end end)
U.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then if dr then dr=false Content.ScrollingEnabled=true end end end)
end
function UI.TextBox(parent,ord,lb,ph,val,cb)
local wrap=_I("Frame",parent) wrap.Size=_U2(1,0,0,54) wrap.BackgroundTransparency=1 wrap.LayoutOrder=ord
local l=_I("TextLabel",wrap) l.BackgroundTransparency=1 l.Size=_U2(1,-20,0,14) l.Text=lb l.TextColor3=_K.Gray l.Font=_GM l.TextSize=10 l.TextXAlignment=_XL
local hp=UI.Help(wrap) hp.AnchorPoint=_V2(1,0) hp.Position=_U2(1,0,0,0)
local b=_I("TextBox",wrap) b.Position=_UO(0,20) b.Size=_U2(1,0,0,30) b.BackgroundColor3=_RGB(18,18,24) b.Text=val or "" b.PlaceholderText=ph or "" b.PlaceholderColor3=_K.DarkGray b.TextColor3=_K.White b.Font=_GM b.TextSize=10 b.TextXAlignment=_XL b.ClearTextOnFocus=false Corner(b,6) Stroke(b,_K.Stroke,1) Padding(b,0,0,10,10)
b.FocusLost:Connect(function() cb(b.Text) end) return b
end
function UI.ActionButton(parent,ord,txt,bg,cb)
local b=_I("TextButton",parent) b.Size=_U2(1,0,0,32) b.BackgroundColor3=bg or _RGB(30,30,40) b.Text=txt b.TextColor3=_K.White b.Font=_GB b.TextSize=10 b.AutoButtonColor=false b.LayoutOrder=ord Corner(b,6) Stroke(b,_K.Stroke,1) b.MouseButton1Click:Connect(cb) return b
end
function UI.Card(parent,ord,tit)
local c=_I("Frame",parent) c.Size=_U2(1,0,0,0) c.AutomaticSize=Enum.AutomaticSize.Y c.BackgroundColor3=_RGB(22,22,28) c.LayoutOrder=ord Corner(c,8)
Padding(c,14,14,14,14)
local l=_I("UIListLayout",c) l.Padding=_UD(0,12) l.SortOrder=Enum.SortOrder.LayoutOrder l.Parent=c
if tit then
local hw=_I("Frame",c) hw.Size=_U2(1,0,0,20) hw.BackgroundTransparency=1 hw.LayoutOrder=-1
local h=_I("TextLabel",hw) h.BackgroundTransparency=1 h.Size=_U2(1,0,0,16) h.Text=tit h.TextColor3=_K.White h.Font=_GB h.TextSize=12 h.TextXAlignment=_XL
local ln=_I("Frame",hw) ln.Position=_UO(0,18) ln.Size=_U2(0,36,0,2) ln.BackgroundColor3=_K.Purple Corner(ln,1)
end
return c
end
local function CreateTwoColumns(parent,ord)
local cont=_I("Frame",parent) cont.Size=_U2(1,0,0,0) cont.AutomaticSize=Enum.AutomaticSize.Y cont.BackgroundTransparency=1 cont.LayoutOrder=ord
local l=_I("UIListLayout",cont) l.FillDirection=Enum.FillDirection.Horizontal l.Padding=_UD(0,10) l.SortOrder=Enum.SortOrder.LayoutOrder l.Parent=cont
local c1=_I("Frame",cont) c1.Size=_U2(.5,-5,0,0) c1.AutomaticSize=Enum.AutomaticSize.Y c1.BackgroundTransparency=1 c1.LayoutOrder=1
local l1=_I("UIListLayout",c1) l1.Padding=_UD(0,10) l1.SortOrder=Enum.SortOrder.LayoutOrder l1.Parent=c1
local c2=_I("Frame",cont) c2.Size=_U2(.5,-5,0,0) c2.AutomaticSize=Enum.AutomaticSize.Y c2.BackgroundTransparency=1 c2.LayoutOrder=2
local l2=_I("UIListLayout",c2) l2.Padding=_UD(0,10) l2.SortOrder=Enum.SortOrder.LayoutOrder l2.Parent=c2
return c1,c2
end

-- TAFFS
local TAFFS_DATA={
{Name="TAF (CIGS)",Emoji="🐅",Color=_RGB(255,180,50),Fields={{"🐅 TAF","Teste de Aptidão Física: CIGS"},{"🎖️ Comandante","Sagas"},{"🎖️ Subcomandante","Deselegant"},{"📜 Lema","Treinar para resistir & Combater para vencer."},{"🫡 Pronomes","Saudações, senhor Guerreiro de Selva. / Saudações, senhores Guerreiros de Selva."},{"🌿 Início","Retirar boina, dar saudações ao instrutor e passar pelos escudos."}}},
{Name="CIE",Emoji="🕵️‍♂️",Color=_RGB(70,130,180),Fields={{"🕵️‍♂️ CIE","Agente."},{"👤 Criador","vicofjgfhf"},{"👤 Sub criador","RIP_dabfj8w"},{"🎖️ Comandante","eriqurrr."},{"🎖️ Subcomandante","Rodrigopao8"},{"🫡 Saudações","Saudações, senhores Agentes. / Saudações, senhores Fantasmas. / Saudações, senhor Agente. / Saudações, senhor Fantasma."},{"📜 Lema CIE","Inteligência para Vitória & Saber para Prever."}}},
{Name="REC MEC",Emoji="🐎",Color=_RGB(220,180,60),Fields={{"🐎 REC MEC","Cavaleiros."},{"👤 Comandante","terro_2433."},{"🎖️ Subcomandante","Contanum5bl"},{"📜 Lema","Haverá sempre uma Cavalaria!, Aço na mente, motor no peito e honra na missão!"},{"🫡 Saudações","Saudações, senhores Cavaleiros. / Saudações, senhor Cavaleiro."},{"🎖️ Licença","Licença, senhores Cavaleiros. / Licença, senhor Cavaleiro."},{"🫡 Com licença","Com licença, senhores Cavaleiros. / Com licença, senhor Cavaleiro."},{"📢 Comandos","ATENÇÃO TURNO, PREPARAR PARA MARCHAR! / ATENÇÃO TURNO, MARCHEM! / ATENÇÃO PELOTÃO, PREPARAR PARA MARCHAR! / ATENÇÃO PELOTÃO, MARCHEM!"}}},
{Name="BPE",Emoji="🛡️",Color=_RGB(60,180,120),Fields={{"🛡️ BPE","Polícia do Exército"},{"👤 Comandante","zCostasz."},{"🎖️ Subcomandante","Matheuslindo587."},{"📜 Lema","Orientar o Responsável, Corrigir o Irresponsável, Prender o Incorrigível."},{"🫡 Pronomes / Saudações","Saudações, senhores Policiais. / Saudações, senhor Policial."}}},
{Name="BFE (Fantasma)",Emoji="👻",Color=_RGB(200,70,70),Fields={{"👻 BFE","Fantasma."},{"👤 Criador","NATANHMELLO4."},{"📅 Criado","1983."},{"🛡️ Escudo","O escudo do BFE possui fundo preto com bordas amarelas. No centro, há um paraquedas branco junto de uma faca vermelha, simbolizando operações especiais e combate. Na parte inferior, aparece a faixa de Forças Especiais."},{"👤 Comandante","RenanFoxiy."},{"🎖️ Subcomandante","TILAPIA_PROFISSIONAL."},{"📜 Lema","Qualquer missão, em qualquer lugar, a qualquer hora, de qualquer maneira."},{"🫡 Saudações","Saudações, senhores Fantasmas. / Saudações, senhor Fantasma."},{"🎖️ Licença","Com licença, senhores Fantasmas. / Com licença, senhor Fantasma."}}},
{Name="BIP",Emoji="🪂",Color=_RGB(200,200,100),Fields={{"🪂 BIP","Batalhão de Infantaria Paraquedista."},{"👤 Comandante",""},{"🎖️ Subcomandante",""},{"📜 Lema","Paraquedistas, sempre prontos para a missão, do céu ao chão."},{"🎯 Missão","Manter a tropa pronta para atuar em missões aeroterrestres, com disciplina, coragem e prontidão."},{"🫡 Saudações","Saudações, senhores Paraquedistas. / Saudações, senhor Paraquedista."},{"🎖️ Licença","Com licença, senhores Paraquedistas. / Com licença, senhor Paraquedista."},{"🪂 Grito de Guerra","PARAQUEDISTA!"}}},
{Name="BSE",Emoji="🦉",Color=_RGB(100,150,200),Fields={{"🦉 BSE","Batalhão Sentinela De Elite"},{"👤 Comandante","aizedamanga9149"},{"🎖️ Subcomandante","davisilva0194"},{"📜 Lema","Sentinela de Elite, firmes na missão; honra e disciplina, nossa tradição!"},{"🫡 Saudações","Saudações, senhores sentinelas! / Saudações, senhor sentinela! / Saudações, nobres sentinelas! / Saudações, nobre sentinela!"},{"🎖️ Com licença","Com licença, senhor sentinela! / Com licença, nobres sentinelas! / Com licença, nobre sentinela!"}}},
{Name="BAC",Emoji="💀",Color=_RGB(220,100,50),Fields={{"💀 INFORMAÇÕES BAC","Batalhão de Ações de Comandos"},{"👑 Dono","MateusHgz"},{"🎖️ Comandante","SasukeePro202."},{"🎖️ Subcomandante","DanielSxS2."},{"📜 Lema da BAC","O máximo de confusão, morte e destruição na retaguarda do inimigo."},{"🫡 Saudações","Saudações, senhor Comando. / Saudações, senhores Comandos."}}},
{Name="CYBER",Emoji="💻",Color=_RGB(150,100,200),Fields={{"💻 CYBER","Comando de Defesa Cibernética."},{"🫡 Saudações","Saudações, senhores Analistas."},{"👤 Criador","wAnTee16j5156."},{"👑 Dono","MaxTheJp1. / ItsMeLyrio. / Gabriel2444q."},{"🎖️ Comandante","highanddry98"},{"🎖️ Subcomandante","Não tem."},{"📜 Lema","Segurança no ciberespaço, soberania para a Nação."},{"🛡️ JURAMENTO","JURO GUARDAR SIGILO SOBRE TUDO QUE VER E OUVRIR NO COMDCIBER!"}}},
{Name="CAATINGA",Emoji="🌵",Color=_RGB(50,150,80),Fields={{"🌵 CAATINGA","Guardiões da Caatinga."},{"👤 Comandante","Gabrielcm04"},{"🎖️ Subcomandante","Plk_Ln17"},{"📜 Lema","O pai cria, a mãe educa e a Caatinga elimina."},{"🫡 Saudação","Saudações, senhores guardiões da Caatinga."}}}
}
local function CreateTAFFSCard(lb,val,ord,parent,cor)
local c=_I("Frame") c.Size=_U2(1,0,0,48) c.BackgroundColor3=_K.Card c.LayoutOrder=ord c.Parent=parent Corner(c,8) Stroke(c,_K.Stroke,1)
local tx=_I("TextLabel") tx.BackgroundTransparency=1 tx.Position=_UO(10,5) tx.Size=_U2(1,-82,1,-10) tx.Text=lb..": "..val tx.TextColor3=_K.White tx.TextSize=10 tx.Font=_GM tx.TextWrapped=true tx.TextXAlignment=_XL tx.TextYAlignment=Enum.TextYAlignment.Center tx.Parent=c
local cp=_I("TextButton") cp.AnchorPoint=_V2(1,.5) cp.Position=_U2(1,-7,.5,0) cp.Size=_UO(58,29) cp.BackgroundColor3=_K.Success cp.Text="Copiar" cp.TextColor3=_K.White cp.TextSize=9 cp.Font=_GB cp.AutoButtonColor=false cp.Parent=c Corner(cp,7) Stroke(cp,_K.StrokeLight,1)
cp.Activated:Connect(function() if typeof(setclipboard)~="function" then Notify("COPIAR","Seu executor não possui setclipboard.","Error") return end local ok=pcall(function() setclipboard(val) end) if ok then cp.Text="✓" Notify("COPIADO","Informação copiada.","Success") task.delay(.9,function() if cp.Parent then cp.Text="Copiar" end end) end end)
end
local function ShowTAFFS()
CurrentPage="TAFFS" ClearContent()
local hd=_I("Frame") hd.Size=_U2(1,0,0,58) hd.BackgroundColor3=_K.Card hd.LayoutOrder=0 hd.Parent=_CH Corner(hd,9) Stroke(hd,_K.StrokeLight,1)
local t=_I("TextLabel",hd) t.BackgroundTransparency=1 t.Position=_UO(12,7) t.Size=_U2(1,-24,0,25) t.Text="📝 TAFFS" t.TextColor3=_K.White t.TextSize=16 t.Font=_GB t.TextXAlignment=_XL
local s=_I("TextLabel",hd) s.BackgroundTransparency=1 s.Position=_UO(13,34) s.Size=_U2(1,-26,0,15) s.Text="Informações das organizações militares" s.TextColor3=_K.DarkGray s.TextSize=9 s.Font=_GM s.TextXAlignment=_XL
for idx,div in ipairs(TAFFS_DATA) do
local sec=_I("Frame") sec.Size=_U2(1,0,0,0) sec.AutomaticSize=Enum.AutomaticSize.Y sec.BackgroundColor3=_K.Card sec.LayoutOrder=idx sec.Parent=_CH Corner(sec,8) Stroke(sec,div.Color,2)
local sl=_I("UIListLayout",sec) sl.HorizontalAlignment=Enum.HorizontalAlignment.Center sl.SortOrder=Enum.SortOrder.LayoutOrder sl.Padding=_UD(0,5)
local hd2=_I("Frame",sec) hd2.Size=_U2(1,0,0,38) hd2.BackgroundColor3=div.Color hd2.BackgroundTransparency=0.2 hd2.LayoutOrder=0 Corner(hd2,8)
local td=_I("TextLabel",hd2) td.BackgroundTransparency=1 td.Position=_UO(12,0) td.Size=_U2(1,-24,1,0) td.Text=div.Emoji.."  "..div.Name td.TextColor3=_K.White td.TextSize=14 td.Font=_GB td.TextXAlignment=_XL td.TextYAlignment=Enum.TextYAlignment.Center
for i,fld in ipairs(div.Fields) do CreateTAFFSCard(fld[1],fld[2],i,sec,div.Color) end
end
Content.CanvasPosition=_V2()
end

-- EXTRAS
local zoomUnlockAtivo=false
local zoomOriginalMax=Pl.CameraMaxZoomDistance
local function setZoomUnlock(v) zoomUnlockAtivo=v if v then Pl.CameraMaxZoomDistance=1000 else Pl.CameraMaxZoomDistance=zoomOriginalMax end end
local function ShowExtras()
CurrentPage="Extras" ClearContent()
local c1,c2=CreateTwoColumns(_CH,1)
local c=UI.Card(c1,1,"🔍 Zoom Unlock")
UI.Toggle(c,1,"Tirar limite de zoom",zoomUnlockAtivo,function(v) setZoomUnlock(v) if v then Notify("ZOOM","Limite removido (máx 1000).","Success") else Notify("ZOOM","Zoom restaurado.","Orange") end end)
local d=_I("TextLabel",c) d.Size=_U2(1,0,0,50) d.BackgroundTransparency=1 d.Text="Permite afastar a câmera muito mais do que o normal, para enxergar o mapa todo." d.TextColor3=_K.Gray d.Font=_GM d.TextSize=10 d.TextWrapped=true d.TextXAlignment=_XL d.TextYAlignment=Enum.TextYAlignment.Top d.LayoutOrder=2
Content.CanvasPosition=_V2()
end

-- EB DELTA
local EBDeltaSubPage="Parkour"
local function ShowParkoursContent()
local c1,c2=CreateTwoColumns(_CH,1)
local function mk(parent,num)
local c=UI.Card(parent,num,"Parkour "..num)
UI.Dropdown(c,1,"Velocidade",CategoryOrder,selectedCategory[num] or "Lento",function(op) selectedCategory[num]=op end)
local run=Playback.Running and Playback.Parkour==num and not Playback.Tower
UI.ActionButton(c,2,run and "Parar" or ("Iniciar Parkour "..num),_RGB(28,28,36),function()
if Playback.Running and Playback.Parkour==num and not Playback.Tower then StopPlayback("cancelled") ShowEBDelta() return end
local cat=selectedCategory[num] or "Lento" local rs=routes[cat] local rt=rs and rs[num]
if not rt then Notify("ROTA NÃO ENCONTRADA","Parkour "..num.." • "..cat,"Error") return end
StartPlayback(rt,cat,num) task.wait(.1) ShowEBDelta()
end)
end
mk(c1,1) mk(c2,2) mk(c1,3) mk(c2,4)
end
local function ShowTowersContent()
local c1,c2=CreateTwoColumns(_CH,1)
do
local c=UI.Card(c1,1,"Torre 1")
UI.Dropdown(c,1,"Versão",{"Única"},"Única",function(op) end)
local run=Playback.Running and Playback.Tower=="Torre 1"
UI.ActionButton(c,2,run and "Parar" or "Iniciar Torre 1",_RGB(28,28,36),function()
if Playback.Running and Playback.Tower=="Torre 1" then StopPlayback("cancelled") ShowEBDelta() return end
local rt=towerRoutes["Torre 1"]["Única"]
if not rt then Notify("ROTA NÃO CARREGADA","Torre 1 não encontrada.","Error") return end
StartPlayback(rt,nil,nil,"Torre 1","Única") task.wait(.1) ShowEBDelta()
end)
end
do
local c=UI.Card(c2,1,"Torre 2")
UI.Dropdown(c,1,"Versão",Tower2RouteOrder,selectedTower2Route,function(op) selectedTower2Route=op end)
local run=Playback.Running and Playback.Tower=="Torre 2"
UI.ActionButton(c,2,run and "Parar" or "Iniciar Torre 2",_RGB(28,28,36),function()
if Playback.Running and Playback.Tower=="Torre 2" then StopPlayback("cancelled") ShowEBDelta() return end
local rt=towerRoutes["Torre 2"][selectedTower2Route]
if not rt then Notify("ROTA NÃO CARREGADA","Torre 2 • "..selectedTower2Route,"Error") return end
StartPlayback(rt,nil,nil,"Torre 2",selectedTower2Route) task.wait(.1) ShowEBDelta()
end)
end
end
local ShowAutomacaoContent
do
local ativo,VELOCIDADE,MAX_CLIQUES,META,META_ATIVA=false,53,2,308,true
local jjsFeitos,bolhasVistas,cliquesTotal,ultimaBolhaVista=0,{},0,0
local btnToggleRef,infoLbl
local function setBtnEstado(v) if not btnToggleRef or not btnToggleRef.Parent then return end btnToggleRef.Text=v and "Parar Auto JJS" or "Iniciar Auto JJS" end
local function clicarFS(obj)
if firesignal then pcall(firesignal,obj.MouseButton1Down) pcall(firesignal,obj.MouseButton1Up) pcall(firesignal,obj.MouseButton1Click) return end
pcall(function() obj.MouseButton1Down:Fire() end) pcall(function() obj.MouseButton1Up:Fire() end) pcall(function() obj.MouseButton1Click:Fire() end)
end
local function ehBolha(obj)
if not obj:IsA("ImageButton") then return false end
if not obj.Visible then return false end
local s=obj.AbsoluteSize if s.X<20 or s.Y<20 or s.X>200 or s.Y>200 then return false end
local p=obj.AbsolutePosition if p.X<=0 or p.Y<=0 then return false end
if obj.Name=="InputTemplate" then return true end
return false
end
local function gerarID(obj) local pos=obj.AbsolutePosition local size=obj.AbsoluteSize return math.floor((pos.X+size.X/2)/40).."_"..math.floor((pos.Y+size.Y/2)/40) end
task.spawn(function()
while alive() do
task.wait(0.08)
if not ativo then continue end
if META_ATIVA and jjsFeitos>=META then ativo=false setBtnEstado(false) Notify("AUTO JJS","Meta atingida: "..jjsFeitos.."/"..META,"Success") continue end
local del=VELOCIDADE/100 local ag=tick()
for id,dd in pairs(bolhasVistas) do if ag-dd.t>2.5 then bolhasVistas[id]=nil end end
local clicou=false
for _,gui in ipairs(PG:GetChildren()) do
if gui:IsA("ScreenGui") and gui~=Gui then
for _,obj in ipairs(gui:GetDescendants()) do
if ehBolha(obj) then
ultimaBolhaVista=tick() local id=gerarID(obj)
local dd=bolhasVistas[id] if not dd then bolhasVistas[id]={count=0,t=tick()} dd=bolhasVistas[id] end
dd.t=tick()
if dd.count<MAX_CLIQUES then clicarFS(obj) dd.count=dd.count+1 cliquesTotal=cliquesTotal+1 clicou=true if dd.count==1 then jjsFeitos=jjsFeitos+1 end end
end
end
end
end
if clicou then task.wait(del) else task.wait(.02) end
end
end)
task.spawn(function()
while alive() do
task.wait(0.3)
if infoLbl and infoLbl.Parent then
if META_ATIVA then infoLbl.Text=string.format("JJs: %d/%d",jjsFeitos,META) infoLbl.TextColor3=(jjsFeitos>=META) and _K.Success or _K.Orange
else infoLbl.Text=string.format("JJs: %d (sem meta)",jjsFeitos) infoLbl.TextColor3=_K.PurpleLight end
end
end
end)
ShowAutomacaoContent=function()
local c=UI.Card(_CH,1,"Auto JJS")
UI.Toggle(c,1,"Ativar Auto JJS",ativo,function(v) ativo=v end)
local metaBox
local function upd()
if not metaBox then return end
if META_ATIVA then metaBox.TextEditable=true metaBox.TextColor3=_K.White metaBox.BackgroundColor3=_RGB(18,18,24) metaBox.PlaceholderColor3=_K.DarkGray
else metaBox.TextEditable=false metaBox.TextColor3=_K.DarkGray metaBox.BackgroundColor3=_RGB(13,13,17) metaBox.PlaceholderColor3=_RGB(70,70,80) end
end
UI.Toggle(c,2,"Ativar Meta",META_ATIVA,function(v)
META_ATIVA=v upd()
if v then Notify("AUTO JJS","Meta ativada. Alvo: "..META,"Success") else Notify("AUTO JJS","Meta desativada.","Orange") end
end)
metaBox=UI.TextBox(c,3,"Quantidade Limite Exata","Ex: 308",tostring(META),function(t) local v=tonumber(t) if v and v>0 then META=v end end)
upd()
UI.Slider(c,4,"Delay",VELOCIDADE,1,100,false,function(v) VELOCIDADE=v end)
infoLbl=_I("TextLabel",c) infoLbl.Size=_U2(1,0,0,14) infoLbl.BackgroundTransparency=1 infoLbl.Text=META_ATIVA and ("JJs: 0/"..META) or "JJs: 0 (sem meta)" infoLbl.TextColor3=_K.Orange infoLbl.Font=_GB infoLbl.TextSize=10 infoLbl.TextXAlignment=_XL infoLbl.LayoutOrder=5
btnToggleRef=UI.ActionButton(c,6,"Iniciar Auto JJS",_RGB(28,28,36),function()
if not ativo and jjsFeitos>=META then jjsFeitos=0 cliquesTotal=0 bolhasVistas={} end
ativo=not ativo setBtnEstado(ativo) if ativo then ultimaBolhaVista=tick() end
end)
UI.ActionButton(c,7,"Resetar Contador",_RGB(24,24,30),function() jjsFeitos=0 cliquesTotal=0 bolhasVistas={} Notify("AUTO JJS","Contador resetado.","Success") end)
end
end
local function ShowConfiguracaoContent()
local c=UI.Card(_CH,1,"Geral")
UI.Toggle(c,1,"Desativar Dummies (Ir Direto/MoveTo)",desativarDummies,function(v) desativarDummies=v MovementConfig.Modo=v and "Direto" or "Dummy" end)
UI.Toggle(c,2,"Mostrar Linhas (Apenas Parkour)",mostrarLinhas,function(v) mostrarLinhas=v linesVisible=v end)
UI.ActionButton(c,3,"Limpar Dummies e Rotas Pendentes",_RGB(30,30,40),function() if Playback.Running then StopPlayback("cancelled") end RemoverDummy() ClearLines() Notify("LIMPEZA","Dummies e rotas removidos.","Success") end)
end
function ShowEBDelta()
CurrentPage="EBDelta" ClearContent()
local hb=_I("Frame",_CH) hb.Size=_U2(1,0,0,30) hb.BackgroundTransparency=1 hb.LayoutOrder=0
local hl=_I("UIListLayout",hb) hl.FillDirection=Enum.FillDirection.Horizontal hl.Padding=_UD(0,18) hl.VerticalAlignment=Enum.VerticalAlignment.Center
local tabs={{Nome="Parkours",Id="Parkour"},{Nome="Torres",Id="Torres"},{Nome="Configurações",Id="Configuracao"},{Nome="Automações",Id="Automacao"}}
for _,tab in ipairs(tabs) do
local sel=EBDeltaSubPage==tab.Id
local b=_I("TextButton",hb) b.Size=_UO(110,28) b.BackgroundTransparency=1 b.Text=tab.Nome b.TextColor3=sel and _K.White or _K.DarkGray b.Font=_GB b.TextSize=12 b.AutoButtonColor=false b.TextXAlignment=Enum.TextXAlignment.Center
b.MouseButton1Click:Connect(function() EBDeltaSubPage=tab.Id ShowEBDelta() end)
if sel then local ln=_I("Frame",b) ln.AnchorPoint=_V2(.5,1) ln.Position=_U2(.5,0,1,-2) ln.Size=_U2(.6,0,0,2) ln.BackgroundColor3=_K.Purple Corner(ln,1) end
end
if EBDeltaSubPage=="Torres" then ShowTowersContent()
elseif EBDeltaSubPage=="Parkour" then ShowParkoursContent()
elseif EBDeltaSubPage=="Automacao" then ShowAutomacaoContent()
else ShowConfiguracaoContent() end
Content.CanvasPosition=_V2()
end

-- VOLVERS
local function ShowVolvers()
CurrentPage="Volvers" ClearContent()
local hd=_I("Frame") hd.Size=_U2(1,0,0,58) hd.BackgroundColor3=_K.Card hd.LayoutOrder=0 hd.Parent=_CH Corner(hd,9) Stroke(hd,_K.StrokeLight,1)
local t=_I("TextLabel",hd) t.BackgroundTransparency=1 t.Position=_UO(12,7) t.Size=_U2(1,-24,0,25) t.Text="↪ VOLVERS" t.TextColor3=_K.White t.TextSize=16 t.Font=_GB t.TextXAlignment=_XL
local s=_I("TextLabel",hd) s.BackgroundTransparency=1 s.Position=_UO(13,34) s.Size=_U2(1,-26,0,15) s.Text="Comandos de formação – ZAYK VOLVERS V2" s.TextColor3=_K.DarkGray s.TextSize=9 s.Font=_GM s.TextXAlignment=_XL
local wc=_I("Frame") wc.Size=_U2(1,0,0,70) wc.BackgroundColor3=_RGB(45,35,20) wc.LayoutOrder=1 wc.Parent=_CH Corner(wc,8) Stroke(wc,_K.Orange,1.5)
local wi=_I("TextLabel",wc) wi.BackgroundTransparency=1 wi.Position=_UO(12,8) wi.Size=_UO(30,30) wi.Text="⚠️" wi.TextSize=20 wi.TextColor3=_K.White wi.Font=_GB wi.TextXAlignment=_XC wi.TextYAlignment=Enum.TextYAlignment.Center
local wt=_I("TextLabel",wc) wt.BackgroundTransparency=1 wt.Position=_UO(48,8) wt.Size=_U2(1,-130,0,35) wt.Text="Deseja executar os comandos Volvers em um menu secundário?" wt.TextColor3=_K.White wt.TextSize=10 wt.Font=_GB wt.TextWrapped=true wt.TextXAlignment=_XL wt.TextYAlignment=Enum.TextYAlignment.Top
local sb=_I("TextButton",wc) sb.AnchorPoint=_V2(1,.5) sb.Position=_U2(1,-12,.5,0) sb.Size=_UO(70,34) sb.BackgroundColor3=_K.Success sb.Text="▶ SIM" sb.TextColor3=_K.White sb.TextSize=10 sb.Font=_GB sb.AutoButtonColor=false Corner(sb,8)
sb.MouseButton1Click:Connect(function() local ok=pcall(function() loadstring(game:HttpGet("https://pastebin.com/raw/ZrzHAenq"))() end) if ok then Notify("MENU SECUNDÁRIO","Volver aberto!","Success") else Notify("ERRO","Falha ao carregar.","Error") end end)
local cmds={{name="◆ SALVAR POSIÇÃO",desc="Salva somente para onde o personagem está olhando.",hl=true,action=SaveDirection},{name="DIREITA VOLVER!",desc="Gira 90° para a direita.",action=function() Turn("DIREITA") end},{name="ESQUERDA VOLVER!",desc="Gira 90° para a esquerda.",action=function() Turn("ESQUERDA") end},{name="RETAGUARDA VOLVER!",desc="Gira 180° para trás.",action=function() Turn("RETAGUARDA") end},{name="VANGUARDA VOLVER!",desc="Retorna à direção salva.",action=VanguardaVolver}}
for i,cmd in ipairs(cmds) do
local c=_I("Frame") c.Size=_U2(1,0,0,55) c.BackgroundColor3=cmd.hl and _RGB(38,38,38) or _K.Card c.LayoutOrder=i+2 c.Parent=_CH Corner(c,8) Stroke(c,cmd.hl and _K.Primary or _K.Stroke,cmd.hl and 1.7 or 1)
local nl=_I("TextLabel",c) nl.BackgroundTransparency=1 nl.Position=_UO(11,5) nl.Size=_U2(1,-100,0,20) nl.Text=cmd.name nl.TextColor3=_K.White nl.TextSize=10 nl.Font=Enum.Font.GothamBlack nl.TextXAlignment=_XL
local dl=_I("TextLabel",c) dl.BackgroundTransparency=1 dl.Position=_UO(11,26) dl.Size=_U2(1,-100,0,17) dl.Text=cmd.desc dl.TextColor3=_K.Gray dl.TextSize=7 dl.Font=_GM dl.TextXAlignment=_XL
local eb=_I("TextButton",c) eb.AnchorPoint=_V2(1,.5) eb.Position=_U2(1,-8,.5,0) eb.Size=_UO(68,30) eb.BackgroundColor3=cmd.hl and _K.Orange or _K.Success eb.Text="▶ EXECUTAR" eb.TextColor3=_K.White eb.TextSize=8 eb.Font=_GB eb.AutoButtonColor=false Corner(eb,7)
eb.MouseButton1Click:Connect(function() cmd.action() end)
end
Content.CanvasPosition=_V2()
end

-- IA CHAT
local iaOcupado=false
local function ShowAutoCorrecao()
CurrentPage="AutoCorrecao" ClearContent()
local hd=_I("Frame") hd.Size=_U2(1,0,0,58) hd.BackgroundColor3=_K.Card hd.LayoutOrder=0 hd.Parent=_CH Corner(hd,9) Stroke(hd,_K.StrokeLight,1)
local t=_I("TextLabel",hd) t.BackgroundTransparency=1 t.Position=_UO(12,7) t.Size=_U2(1,-24,0,25) t.Text="🤖 IA CHAT" t.TextColor3=_K.White t.TextSize=16 t.Font=_GB t.TextXAlignment=_XL
local s=_I("TextLabel",hd) s.BackgroundTransparency=1 s.Position=_UO(13,34) s.Size=_U2(1,-26,0,15) s.Text="Corrige o texto em português e envia no chat" s.TextColor3=_K.DarkGray s.TextSize=9 s.Font=_GM s.TextXAlignment=_XL
local wc=_I("Frame") wc.Size=_U2(1,0,0,70) wc.BackgroundColor3=_RGB(45,35,20) wc.LayoutOrder=1 wc.Parent=_CH Corner(wc,8) Stroke(wc,_K.Orange,1.5)
local wi=_I("TextLabel",wc) wi.BackgroundTransparency=1 wi.Position=_UO(12,8) wi.Size=_UO(30,30) wi.Text="⚠️" wi.TextSize=20 wi.TextColor3=_K.White wi.Font=_GB wi.TextXAlignment=_XC wi.TextYAlignment=Enum.TextYAlignment.Center
local wt=_I("TextLabel",wc) wt.BackgroundTransparency=1 wt.Position=_UO(48,8) wt.Size=_U2(1,-130,0,35) wt.Text="Deseja abrir a IA CHAT em um menu secundário?" wt.TextColor3=_K.White wt.TextSize=10 wt.Font=_GB wt.TextWrapped=true wt.TextXAlignment=_XL wt.TextYAlignment=Enum.TextYAlignment.Top
local sb=_I("TextButton",wc) sb.AnchorPoint=_V2(1,.5) sb.Position=_U2(1,-12,.5,0) sb.Size=_UO(70,34) sb.BackgroundColor3=_K.Success sb.Text="▶ SIM" sb.TextColor3=_K.White sb.TextSize=10 sb.Font=_GB sb.AutoButtonColor=false Corner(sb,8)
sb.MouseButton1Click:Connect(function() local ok=pcall(function() loadstring(game:HttpGet("https://pastebin.com/raw/pp41hZjb"))() end) if ok then Notify("MENU SECUNDÁRIO","IA CHAT aberta!","Success") else Notify("ERRO","Falha ao carregar.","Error") end end)
local c=_I("Frame") c.Size=_U2(1,0,0,140) c.BackgroundColor3=_K.Card c.LayoutOrder=2 c.Parent=_CH Corner(c,8) Stroke(c,_K.Stroke,1)
local bx=_I("TextBox",c) bx.Position=_UO(10,10) bx.Size=_U2(1,-20,0,56) bx.BackgroundColor3=_K.Panel bx.PlaceholderText="Digite sua mensagem..." bx.PlaceholderColor3=_K.DarkGray bx.Text="" bx.TextColor3=_K.White bx.TextSize=11 bx.Font=_GM bx.TextWrapped=true bx.TextXAlignment=_XL bx.TextYAlignment=Enum.TextYAlignment.Top bx.ClearTextOnFocus=false Corner(bx,7) Stroke(bx,_K.Stroke,1) Padding(bx,6,6,8,8)
local sn=_I("TextButton",c) sn.Position=_UO(10,74) sn.Size=_U2(1,-20,0,34) sn.BackgroundColor3=_K.Success sn.Text="✨ CORRIGIR E ENVIAR" sn.TextColor3=_K.White sn.TextSize=10 sn.Font=_GB sn.AutoButtonColor=false Corner(sn,7)
local stt=_I("TextLabel",c) stt.BackgroundTransparency=1 stt.Position=_UO(10,114) stt.Size=_U2(1,-20,0,18) stt.Text="" stt.TextColor3=_K.Gray stt.TextSize=10 stt.Font=_GM stt.TextXAlignment=_XL
local function ss(t2,c2) stt.Text=t2 stt.TextColor3=c2 end
sn.MouseButton1Click:Connect(function()
if iaOcupado then return end
local tx=bx.Text:gsub("^%s+",""):gsub("%s+$","")
if tx=="" then ss("⚠️ Digite algo primeiro",_K.Orange) return end
iaOcupado=true sn.Text="⏳ AGUARDE..." ss("🧠 Pensando...",_K.Gray)
task.spawn(function()
local co,er=CorrigirTexto(tx)
if co then if EnviarNoChat(co) then ss("✅ Corrigido e enviado!",_K.Success) bx.Text="" Notify("IA CHAT","Mensagem enviada.","Success") else ss("❌ Chat não encontrado",_K.Error) end
else ss("❌ "..tostring(er),_K.Error) end
sn.Text="✨ CORRIGIR E ENVIAR" iaOcupado=false
end)
end)
Content.CanvasPosition=_V2()
end

-- CRÉDITOS
local function ShowCreditos()
CurrentPage="Creditos" ClearContent()
local link="https://discord.gg/NY2RfC7Kx"
local c=UI.Card(_CH,1,"👑 CRÉDITOS")
local dv=_I("Frame",c) dv.Size=_U2(1,0,0,50) dv.BackgroundColor3=_RGB(18,18,24) dv.LayoutOrder=1 Corner(dv,6) Stroke(dv,_K.Stroke,1)
local dt=_I("TextLabel",dv) dt.BackgroundTransparency=1 dt.Position=_UO(12,0) dt.Size=_U2(1,-24,1,0) dt.Text="Esse script foi desenvolvido pelo akira007p 🔵 discord" dt.TextColor3=_K.White dt.Font=_GB dt.TextSize=11 dt.TextWrapped=true dt.TextXAlignment=_XL dt.TextYAlignment=Enum.TextYAlignment.Center
local sv=_I("Frame",c) sv.Size=_U2(1,0,0,60) sv.BackgroundColor3=_RGB(18,18,24) sv.LayoutOrder=2 Corner(sv,6) Stroke(sv,_K.Orange,1)
local svt=_I("TextLabel",sv) svt.BackgroundTransparency=1 svt.Position=_UO(12,8) svt.Size=_U2(1,-100,0,20) svt.Text="🔵 Servidor do Discord" svt.TextColor3=_K.White svt.Font=_GB svt.TextSize=11 svt.TextXAlignment=_XL
local svl=_I("TextLabel",sv) svl.BackgroundTransparency=1 svl.Position=_UO(12,30) svl.Size=_U2(1,-100,0,20) svl.Text=link svl.TextColor3=_K.Gray svl.TextSize=9 svl.Font=_GM svl.TextXAlignment=_XL
local en=_I("TextButton",sv) en.AnchorPoint=_V2(1,.5) en.Position=_U2(1,-10,.5,0) en.Size=_UO(75,32) en.BackgroundColor3=_RGB(88,101,242) en.Text="▶ ENTRAR" en.TextColor3=_K.White en.TextSize=9 en.Font=_GB en.AutoButtonColor=false Corner(en,6)
en.MouseButton1Click:Connect(function() pcall(function() setclipboard(link) end) pcall(function() game:GetService("GuiService"):OpenBrowserWindow(link) end) Notify("DISCORD","Link copiado!","Success") end)
Content.CanvasPosition=_V2()
end

-- TEXTOS PRONTOS
local CARD_COLORS={{Header=_RGB(59,130,246),Body=_RGB(35,35,35)},{Header=_RGB(239,68,68),Body=_RGB(45,30,30)},{Header=_RGB(16,185,129),Body=_RGB(30,40,35)},{Header=_RGB(245,158,11),Body=_RGB(45,40,30)},{Header=_RGB(139,92,246),Body=_RGB(35,30,45)}}
local C_T={Fundo=_RGB(25,25,25),Painel=_RGB(35,35,35),Borda=_RGB(50,50,50),Texto=_RGB(255,255,255),TextoDim=_RGB(160,160,160),Verde=_RGB(16,185,129),VerdeHover=_RGB(52,211,153)}
local TEXTOS_PRONTOS={
{Titulo="POR QUE O EB É IMPORTANTE PRA SOCIEDADE?",Texto="O EB não é apenas farda e arma: é o braço forte que guarda a pátria, socorre em tragédias, forma cidadãos de honra e defende a soberania. Sem ele, não há paz social nem futuro seguro pra ninguém."},
{Titulo="POR QUE VOCÊ QUER SUBIR DE PATENTE?",Texto="Quero subir de patente pra ajudar mais a tropa, aprender a liderar direito e fazer por merecer a confiança dos meus superiores. Não é por status, é por vontade de servir melhor."},
{Titulo="POR QUE SERVIR AO EXÉRCITO BRASILEIRO?",Texto="Sirvo ao Exército porque acredito no Brasil e quero fazer parte de algo maior que eu. É onde aprendo disciplina, honra e o valor de proteger quem não pode se proteger sozinho."},
{Titulo="COMO VOCÊ VÊ SUA JORNADA COMO MILITAR NO FUTURO?",Texto="Quero subir uma patente de cada vez, aprender com os oficiais mais experientes e um dia poder treinar os novatos. Pretendo ficar até onde conseguir, sempre honrando a farda."}
}
local function criarTextoCard(tema,ord,cor)
local c=_I("Frame",_CH) c.Size=_U2(1,0,0,0) c.AutomaticSize=Enum.AutomaticSize.Y c.BackgroundColor3=cor.Body c.LayoutOrder=ord Corner(c,8) Stroke(c,cor.Header,.5,.7) c.ClipsDescendants=true
_I("UIListLayout",c).SortOrder=Enum.SortOrder.LayoutOrder
local ch=_I("Frame",c) ch.Size=_U2(1,0,0,0) ch.AutomaticSize=Enum.AutomaticSize.Y ch.BackgroundColor3=cor.Header ch.LayoutOrder=1
local ph=_I("UIPadding",ch) ph.PaddingTop=_UD(0,8) ph.PaddingBottom=_UD(0,8) ph.PaddingLeft=_UD(0,12) ph.PaddingRight=_UD(0,12)
local tt=_I("TextLabel",ch) tt.Size=_U2(1,0,0,0) tt.AutomaticSize=Enum.AutomaticSize.Y tt.BackgroundTransparency=1 tt.Text="🤫 "..tema.Titulo tt.TextColor3=C_T.Texto tt.Font=_GB tt.TextSize=12 tt.TextXAlignment=_XL tt.TextWrapped=true
local cb=_I("Frame",c) cb.Size=_U2(1,0,0,0) cb.AutomaticSize=Enum.AutomaticSize.Y cb.BackgroundColor3=cor.Body cb.LayoutOrder=2
local pb=_I("UIPadding",cb) pb.PaddingTop=_UD(0,12) pb.PaddingBottom=_UD(0,12) pb.PaddingLeft=_UD(0,12) pb.PaddingRight=_UD(0,12)
local bl=_I("UIListLayout",cb) bl.Padding=_UD(0,12) bl.SortOrder=Enum.SortOrder.LayoutOrder
local tx=_I("TextLabel",cb) tx.Size=_U2(1,0,0,0) tx.AutomaticSize=Enum.AutomaticSize.Y tx.BackgroundTransparency=1 tx.Text=tema.Texto tx.TextColor3=C_T.TextoDim tx.Font=_GM tx.TextSize=11 tx.TextXAlignment=_XL tx.TextWrapped=true tx.LineHeight=1.2
local bc=_I("Frame",cb) bc.Size=_U2(1,0,0,28) bc.BackgroundTransparency=1
local btc=_I("TextButton",bc) btc.Size=_UO(75,28) btc.Position=_U2(1,0,0,0) btc.AnchorPoint=Vector2.new(1,0) btc.BackgroundColor3=C_T.Verde btc.Text="Copiar" btc.TextColor3=C_T.Texto btc.Font=_GB btc.TextSize=11 btc.AutoButtonColor=false Corner(btc,6)
btc.MouseButton1Click:Connect(function() if setclipboard then pcall(setclipboard,tema.Texto) btc.Text="Copiado!" task.wait(1.5) btc.Text="Copiar" end end)
end
function ShowTextosProntos()
CurrentPage="TextosProntos" ClearContent()
local hd=_I("Frame",_CH) hd.Size=_U2(1,0,0,58) hd.BackgroundColor3=C_T.Painel hd.LayoutOrder=0 Corner(hd,9) Stroke(hd,C_T.Borda,1)
local t=_I("TextLabel",hd) t.BackgroundTransparency=1 t.Position=_UO(12,7) t.Size=_U2(1,-24,0,25) t.Text="📋 TEXTOS PRONTOS + IA" t.TextColor3=C_T.Texto t.TextSize=16 t.Font=_GB t.TextXAlignment=_XL
local s=_I("TextLabel",hd) s.BackgroundTransparency=1 s.Position=_UO(13,34) s.Size=_U2(1,-26,0,15) s.Text="Informações militares e gerador de texto inteligente" s.TextColor3=C_T.TextoDim s.TextSize=9 s.Font=_GM s.TextXAlignment=_XL
for i,tema in ipairs(TEXTOS_PRONTOS) do criarTextoCard(tema,i,CARD_COLORS[((i-1)%#CARD_COLORS)+1]) end
local ac=_I("Frame",_CH) ac.Size=_U2(1,0,0,0) ac.AutomaticSize=Enum.AutomaticSize.Y ac.BackgroundColor3=_RGB(30,30,40) ac.LayoutOrder=999 Corner(ac,8) Stroke(ac,_RGB(139,92,246),1,.5) ac.ClipsDescendants=true
_I("UIListLayout",ac).SortOrder=Enum.SortOrder.LayoutOrder
local ah=_I("Frame",ac) ah.Size=_U2(1,0,0,35) ah.BackgroundColor3=_RGB(139,92,246) ah.LayoutOrder=1 Corner(ah,8)
local at=_I("TextLabel",ah) at.Size=_U2(1,-20,0,20) at.Position=_UO(10,8) at.BackgroundTransparency=1 at.Text="🤖 GERADOR DE TEXTO IA (EB)" at.TextColor3=C_T.Texto at.Font=_GB at.TextSize=12 at.TextXAlignment=_XL
local ab=_I("Frame",ac) ab.Size=_U2(1,0,0,0) ab.AutomaticSize=Enum.AutomaticSize.Y ab.BackgroundColor3=_RGB(30,30,40) ab.LayoutOrder=2
local ap=_I("UIPadding",ab) ap.PaddingTop=_UD(0,10) ap.PaddingBottom=_UD(0,10) ap.PaddingLeft=_UD(0,10) ap.PaddingRight=_UD(0,10)
local abl=_I("UIListLayout",ab) abl.Padding=_UD(0,10) abl.SortOrder=Enum.SortOrder.LayoutOrder
local ib=_I("TextBox",ab) ib.Size=_U2(1,0,0,30) ib.BackgroundColor3=C_T.Fundo ib.PlaceholderText="Digite o tema (ex: Por que servir ao EB?)" ib.PlaceholderColor3=C_T.TextoDim ib.Text="" ib.TextColor3=C_T.Texto ib.Font=_GM ib.TextSize=11 ib.TextXAlignment=_XL Corner(ib,6)
local bg=_I("TextButton",ab) bg.Size=_U2(1,0,0,35) bg.BackgroundColor3=_RGB(139,92,246) bg.Text="⚡ GERAR TEXTO" bg.TextColor3=C_T.Texto bg.Font=_GB bg.TextSize=12 bg.AutoButtonColor=false Corner(bg,8) Stroke(bg,_RGB(167,139,250),1,.2)
local ol=_I("TextLabel",ab) ol.Size=_U2(1,0,0,0) ol.AutomaticSize=Enum.AutomaticSize.Y ol.BackgroundTransparency=1 ol.Text="A resposta da IA aparecerá aqui..." ol.TextColor3=C_T.TextoDim ol.Font=_GM ol.TextSize=11 ol.TextXAlignment=_XL ol.TextWrapped=true ol.LineHeight=1.2
local abt=_I("Frame",ab) abt.Size=_U2(1,0,0,28) abt.BackgroundTransparency=1 abt.LayoutOrder=4
local bci=_I("TextButton",abt) bci.Size=_UO(75,28) bci.Position=_U2(1,0,0,0) bci.AnchorPoint=Vector2.new(1,0) bci.BackgroundColor3=C_T.Painel bci.Text="Copiar" bci.TextColor3=C_T.TextoDim bci.Font=_GB bci.TextSize=11 bci.AutoButtonColor=false Corner(bci,6)
local ta=nil
bg.MouseButton1Click:Connect(function()
local td=ib.Text
if td=="" then ol.Text="⚠️ Por favor, digite um tema primeiro." ol.TextColor3=_RGB(245,158,11) return end
ol.Text="⏳ Gerando texto... aguarde." ol.TextColor3=_RGB(245,158,11) bci.BackgroundColor3=C_T.Painel bci.TextColor3=C_T.TextoDim ta=nil
task.spawn(function()
local tg,er=GerarTextoPronto(td)
if tg then ta=tg ol.Text=tg ol.TextColor3=C_T.Texto bci.BackgroundColor3=C_T.Verde bci.TextColor3=C_T.Texto
else ol.Text="❌ Erro: "..tostring(er) ol.TextColor3=_RGB(239,68,68) end
end)
end)
bci.MouseButton1Click:Connect(function() if not ta then return end if setclipboard then pcall(setclipboard,ta) bci.Text="Copiado!" task.wait(1.5) bci.Text="Copiar" end end)
Content.CanvasPosition=_V2()
end

-- COMBATE
local Cam=workspace.CurrentCamera
local AIM_CONFIG={Ativo=false,MostrarFOV=false,FOV=43,RingTransparency=0.3,Cor=Color3.fromRGB(150,80,255),Thickness=2,OffsetX=0,OffsetY=-47,ParteAlvo="Cabeça"}
local HB_CONFIG={Ativo=false,Visual=true,Tamanho=2,Transparencia=0.5,Cor=_RGB(255,0,0),Material="Neon"}
local HB_Original={}
local HB_Tok=os.clock()
PG:SetAttribute("ZKYHitbox",HB_Tok)
local AimFOVring
pcall(function() AimFOVring=Drawing.new("Circle") AimFOVring.Visible=false AimFOVring.Thickness=AIM_CONFIG.Thickness AimFOVring.Color=AIM_CONFIG.Cor AimFOVring.Filled=false AimFOVring.Radius=AIM_CONFIG.FOV end)
local function AIM_getCentro() return Vector2.new(Cam.ViewportSize.X/2+AIM_CONFIG.OffsetX,Cam.ViewportSize.Y/2+AIM_CONFIG.OffsetY) end
local function AIM_pegarTronco(ch) if not ch then return nil end return ch:FindFirstChild("Torso") or ch:FindFirstChild("UpperTorso") or ch:FindFirstChild("LowerTorso") or ch:FindFirstChild("Head") end
local function AIM_pegarParte(ch)
if not ch then return nil end
if AIM_CONFIG.ParteAlvo=="Cabeça" then return ch:FindFirstChild("Head") or ch:FindFirstChild("HumanoidRootPart")
elseif AIM_CONFIG.ParteAlvo=="Tronco" then return AIM_pegarTronco(ch) end
return ch:FindFirstChild("Head")
end
local function AIM_getClosest()
local near,last=nil,math.huge
local cen=AIM_getCentro()
for _,p in ipairs(P:GetPlayers()) do
if p~=Pl then
local pt=AIM_pegarParte(p.Character)
if pt then
local ep,vi=Cam:WorldToViewportPoint(pt.Position)
if vi then local d=(Vector2.new(ep.X,ep.Y)-cen).Magnitude if d<last and d<=AIM_CONFIG.FOV then last=d near=p end end
end
end
end
return near
end
local function AIM_lookAt(tg)
local cp=Cam.CFrame.Position local di=(tg-cp).Unit
local fr=math.rad(Cam.FieldOfView) local vx,vy=Cam.ViewportSize.X,Cam.ViewportSize.Y
local ox=-math.atan((AIM_CONFIG.OffsetX/vx)*2*math.tan(fr/2))
local oy=math.atan((AIM_CONFIG.OffsetY/vy)*2*math.tan(fr/2))
local cf=CFrame.new(cp,cp+di) cf=cf*CFrame.Angles(oy,ox,0) Cam.CFrame=cf
end
R.RenderStepped:Connect(function()
if AimFOVring then
AimFOVring.Visible=AIM_CONFIG.MostrarFOV or AIM_CONFIG.Ativo
AimFOVring.Radius=AIM_CONFIG.FOV AimFOVring.Color=AIM_CONFIG.Cor AimFOVring.Thickness=AIM_CONFIG.Thickness AimFOVring.Position=AIM_getCentro() AimFOVring.Transparency=AIM_CONFIG.RingTransparency
end
if not AIM_CONFIG.Ativo then return end
local cl=AIM_getClosest()
if cl then local pt=AIM_pegarParte(cl.Character) if pt then AIM_lookAt(pt.Position) end end
end)
local function HB_Salvar(ch)
if HB_Original[ch] then return end
local hrp=ch:FindFirstChild("HumanoidRootPart") if not hrp then return end
HB_Original[ch]={Size=hrp.Size,Transparency=hrp.Transparency,Color=hrp.Color,Material=hrp.Material,CanCollide=hrp.CanCollide}
end
local function HB_Aplicar(ch)
if not ch then return end if ch==character then return end
local hrp=ch:FindFirstChild("HumanoidRootPart") if not hrp then return end
HB_Salvar(ch)
pcall(function() hrp.Size=Vector3.new(HB_CONFIG.Tamanho,HB_CONFIG.Tamanho,HB_CONFIG.Tamanho) hrp.Transparency=HB_CONFIG.Visual and HB_CONFIG.Transparencia or 1 hrp.Color=HB_CONFIG.Cor hrp.Material=Enum.Material.Neon hrp.CanCollide=false end)
end
local function HB_Restaurar(ch)
if not ch then return end
local o=HB_Original[ch] if not o then return end
local hrp=ch:FindFirstChild("HumanoidRootPart")
if hrp then pcall(function() hrp.Size=o.Size hrp.Transparency=o.Transparency hrp.Color=o.Color hrp.Material=o.Material hrp.CanCollide=o.CanCollide end) end
HB_Original[ch]=nil
end
local HB_Conn
HB_Conn=R.Heartbeat:Connect(function()
if PG:GetAttribute("ZKYHitbox")~=HB_Tok then HB_Conn:Disconnect() for c in pairs(HB_Original) do HB_Restaurar(c) end return end
if HB_CONFIG.Ativo then
for _,p in ipairs(P:GetPlayers()) do if p~=Pl and p.Character and p.Character.Parent then HB_Aplicar(p.Character) end end
for ch in pairs(HB_Original) do if not ch.Parent then HB_Restaurar(ch) end end
else for ch in pairs(HB_Original) do HB_Restaurar(ch) end end
end)
function ShowCombate()
CurrentPage="Combate" ClearContent()
local c1,c2=CreateTwoColumns(_CH,0)
local hc=UI.Card(c1,1,"🎯 Hitbox Modificador")
UI.Toggle(hc,1,"Ativar Hitbox",HB_CONFIG.Ativo,function(v) HB_CONFIG.Ativo=v Notify("HITBOX",v and "Ativado." or "Desativado.",v and "Success" or "Error") end)
UI.Slider(hc,2,"Tamanho",HB_CONFIG.Tamanho,1,20,false,function(v) HB_CONFIG.Tamanho=v end)
UI.Slider(hc,3,"Transparência",math.floor(HB_CONFIG.Transparencia*10+.5),0,10,false,function(v) HB_CONFIG.Transparencia=v/10 end)
local cr=_I("Frame",hc) cr.Size=_U2(1,0,0,26) cr.BackgroundTransparency=1 cr.LayoutOrder=4
local clb=_I("TextLabel",cr) clb.BackgroundTransparency=1 clb.Size=_U2(1,-90,1,0) clb.Text="Cor da Hitbox" clb.TextColor3=_K.Gray clb.Font=_GM clb.TextSize=10 clb.TextXAlignment=_XL
local chh=UI.Help(cr) chh.AnchorPoint=_V2(1,.5) chh.Position=_U2(1,-40,.5,0)
local csw=_I("TextButton",cr) csw.AnchorPoint=_V2(1,.5) csw.Position=_U2(1,0,.5,0) csw.Size=_UO(34,18) csw.BackgroundColor3=HB_CONFIG.Cor csw.Text="" csw.AutoButtonColor=false Corner(csw,4) Stroke(csw,_K.Stroke,1)
local presets={_RGB(255,0,0),_RGB(0,255,100),_RGB(0,150,255),_RGB(255,200,0),_RGB(255,0,255),_RGB(150,80,255),_RGB(255,255,255),_RGB(0,0,0)}
local pf=_I("Frame",hc) pf.Size=_U2(1,0,0,18) pf.BackgroundTransparency=1 pf.LayoutOrder=5
local pfl=_I("UIListLayout",pf) pfl.FillDirection=Enum.FillDirection.Horizontal pfl.Padding=_UD(0,4)
for _,co in ipairs(presets) do
local b=_I("TextButton",pf) b.Size=_UO(16,16) b.BackgroundColor3=co b.Text="" b.AutoButtonColor=false Corner(b,4) Stroke(b,_K.Stroke,1)
b.MouseButton1Click:Connect(function() HB_CONFIG.Cor=co csw.BackgroundColor3=co end)
end
local ac=UI.Card(c2,1,"🎯 Aim")
UI.Toggle(ac,1,"Ativar Aimbot",AIM_CONFIG.Ativo,function(v) AIM_CONFIG.Ativo=v end)
UI.Toggle(ac,2,"Mostrar FOV",AIM_CONFIG.MostrarFOV,function(v) AIM_CONFIG.MostrarFOV=v end)
local aw=_I("Frame",ac) aw.Size=_U2(1,0,0,44) aw.BackgroundTransparency=1 aw.LayoutOrder=3
local al=_I("TextLabel",aw) al.BackgroundTransparency=1 al.Size=_U2(1,-20,0,14) al.Text="Parte do Alvo" al.TextColor3=_K.Gray al.Font=_GM al.TextSize=10 al.TextXAlignment=_XL
local bf=_I("Frame",aw) bf.Position=_UO(0,20) bf.Size=_U2(1,0,0,24) bf.BackgroundTransparency=1
local bfl=_I("UIListLayout",bf) bfl.FillDirection=Enum.FillDirection.Horizontal bfl.Padding=_UD(0,4)
local ops={"Cabeça","Tronco"} local bts={}
local function upd()
for _,it in ipairs(bts) do
if it.Nome==AIM_CONFIG.ParteAlvo then it.Btn.BackgroundColor3=_RGB(60,40,110) it.Btn.TextColor3=_K.PurpleLight it.Stroke.Color=_K.Purple
else it.Btn.BackgroundColor3=_RGB(30,30,40) it.Btn.TextColor3=_K.Gray it.Stroke.Color=_K.Stroke end
end
end
for _,nm in ipairs(ops) do
local b=_I("TextButton",bf) b.Size=_U2(.5,-2,1,0) b.BackgroundColor3=_RGB(30,30,40) b.Text=nm b.TextColor3=_K.Gray b.Font=_GB b.TextSize=10 b.AutoButtonColor=false Corner(b,6)
local s=Stroke(b,_K.Stroke,1) table.insert(bts,{Btn=b,Nome=nm,Stroke=s})
b.MouseButton1Click:Connect(function() AIM_CONFIG.ParteAlvo=nm upd() end)
end
upd()
UI.Slider(ac,4,"Tamanho FOV",AIM_CONFIG.FOV,20,200,false,function(v) AIM_CONFIG.FOV=v end)
UI.Slider(ac,5,"Transparência",AIM_CONFIG.RingTransparency,0,1,true,function(v) AIM_CONFIG.RingTransparency=v end)
local cw=_I("Frame",ac) cw.Size=_U2(1,0,0,34) cw.BackgroundTransparency=1 cw.LayoutOrder=6
local cl2=_I("TextLabel",cw) cl2.BackgroundTransparency=1 cl2.Size=_U2(1,0,0,14) cl2.Text="Cor do FOV" cl2.TextColor3=_K.Gray cl2.Font=_GM cl2.TextSize=10 cl2.TextXAlignment=_XL
local ci=_I("Frame",cw) ci.Position=_UO(0,18) ci.Size=_U2(1,0,0,16) ci.BackgroundTransparency=1
local cil=_I("UIListLayout",ci) cil.FillDirection=Enum.FillDirection.Horizontal cil.Padding=_UD(0,4)
local cores={_RGB(150,80,255),_RGB(255,0,0),_RGB(0,255,100),_RGB(255,200,0),_RGB(0,200,255),_RGB(255,0,255),_RGB(255,255,255)}
for _,co in ipairs(cores) do
local b=_I("TextButton",ci) b.Size=_UO(16,16) b.BackgroundColor3=co b.Text="" b.AutoButtonColor=false Corner(b,4) Stroke(b,_K.Stroke,1)
b.MouseButton1Click:Connect(function() AIM_CONFIG.Cor=co end)
end
Content.CanvasPosition=_V2()
end

-- LOJA
local ShowLoja
do
local AC={Fundo=_RGB(10,10,14),Card=_RGB(20,20,28),Borda=_RGB(0,220,255),Texto=_RGB(240,240,250),Verde=_RGB(0,190,110)}
local tok=os.clock()
PG:SetAttribute("ZKYArm",tok)
local function vivo() return PG:GetAttribute("ZKYArm")==tok and alive() end
local function ehVerde(c) if not c then return false end return c.G>0.2 and c.G>c.R*1.1 and c.G>c.B*1.1 end
local function limpar(obj)
if not obj or not obj.Parent then return end
if obj:IsA("Frame") then
local area=obj.AbsoluteSize.X*obj.AbsoluteSize.Y
if ehVerde(obj.BackgroundColor3) or obj.BackgroundColor3==_RGB(0,0,0) then obj.BackgroundColor3=area>30000 and AC.Fundo or AC.Card end
if area>5000 then
if not obj:FindFirstChildOfClass("UICorner") then _I("UICorner",obj).CornerRadius=_UD(0,10) end
local s=obj:FindFirstChildOfClass("UIStroke") if not s then s=_I("UIStroke",obj) end
if ehVerde(s.Color) or s.Transparency>0.5 then s.Color=AC.Borda s.Thickness=1 s.Transparency=0.4 end
end
elseif obj:IsA("ScrollingFrame") then obj.ScrollBarImageColor3=AC.Borda if ehVerde(obj.BackgroundColor3) then obj.BackgroundColor3=AC.Fundo end
elseif obj:IsA("TextLabel") then if ehVerde(obj.TextColor3) then obj.TextColor3=AC.Texto end
elseif obj:IsA("TextButton") then
if ehVerde(obj.BackgroundColor3) then obj.BackgroundColor3=AC.Verde end
if ehVerde(obj.TextColor3) then obj.TextColor3=Color3.new(1,1,1) end
if not obj:FindFirstChildOfClass("UICorner") then _I("UICorner",obj).CornerRadius=_UD(0,6) end
elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then if ehVerde(obj.BackgroundColor3) then obj.BackgroundColor3=AC.Card end end
end
local function aplicarTema(gui)
if not gui or not gui.Parent then return end
for _,obj in ipairs(gui:GetDescendants()) do pcall(limpar,obj) end
if not gui:FindFirstChild("AkiraMark") then
local m=_I("TextLabel",gui) m.Name="AkiraMark" m.Size=_U2(1,-20,0,16) m.Position=_U2(0,10,1,-18) m.BackgroundTransparency=1 m.Text="⚡ by Akira" m.TextColor3=AC.Borda m.Font=_GB m.TextSize=11 m.ZIndex=200
end
end
local function acharGui(nome)
for _,g in ipairs(PG:GetChildren()) do if g:IsA("ScreenGui") and g.Name==nome then return g end end
for _,g in ipairs(PG:GetDescendants()) do if g:IsA("ScreenGui") and g.Name==nome then return g end end
end
local monitoradas={}
local function obter(nome) local g=monitoradas[nome] if g and g.Parent then return g end return acharGui(nome) end
task.spawn(function() while vivo() do task.wait(0.5) local g=obter("GunShopGui") if g and g~=monitoradas.GunShopGui then monitoradas.GunShopGui=g g:GetPropertyChangedSignal("Enabled"):Connect(function() if g.Enabled then task.wait(0.15) aplicarTema(g) end end) end end end)
task.spawn(function() while vivo() do task.wait(0.8) local g=obter("GunShopGui") if g and g.Enabled then pcall(aplicarTema,g) end end end)
local function abrirLoja() local g=obter("GunShopGui") if not g then Notify("ERRO","Loja não encontrada.","Error") return end g.Enabled=true task.wait(0.15) aplicarTema(g) end
ShowLoja=function()
CurrentPage="Loja" ClearContent()
local c=UI.Card(_CH,0,"🔫 Loja de Armas")
local lb=_I("TextLabel",c) lb.Size=_U2(1,0,0,40) lb.BackgroundTransparency=1 lb.Text="Abre a loja de armas do jogo com visual dark." lb.TextColor3=_K.Gray lb.Font=_GM lb.TextSize=10 lb.TextWrapped=true lb.TextXAlignment=_XL lb.TextYAlignment=Enum.TextYAlignment.Top lb.LayoutOrder=1
UI.ActionButton(c,2,"▶ Abrir Loja",_RGB(30,30,40),abrirLoja)
Content.CanvasPosition=_V2()
end
end

-- SELEÇÃO DE ABA
local function SelectButton(b)
if selectedButton then selectedButton.BackgroundColor3=_K.Card selectedButton.TextColor3=_K.Gray end
selectedButton=b b.BackgroundColor3=_K.Selected b.TextColor3=_K.White
end
extrasButton.MouseButton1Click:Connect(function() SelectButton(extrasButton) ShowExtras() end)
ebDeltaButton.MouseButton1Click:Connect(function() SelectButton(ebDeltaButton) ShowEBDelta() end)
taffsButton.MouseButton1Click:Connect(function() SelectButton(taffsButton) ShowTAFFS() end)
volversButton.MouseButton1Click:Connect(function() SelectButton(volversButton) ShowVolvers() end)
iaButton.MouseButton1Click:Connect(function() SelectButton(iaButton) ShowAutoCorrecao() end)
combateButton.MouseButton1Click:Connect(function() SelectButton(combateButton) ShowCombate() end)
textosButton.MouseButton1Click:Connect(function() SelectButton(textosButton) ShowTextosProntos() end)
creditosButton.MouseButton1Click:Connect(function() SelectButton(creditosButton) ShowCreditos() end)
lojaButton.MouseButton1Click:Connect(function() SelectButton(lojaButton) ShowLoja() end)

-- ARRASTAR
local LD=false local LDS,LSP
Logo.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then LD=true LDS=i.Position LSP=Logo.Position i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then LD=false end end) end end)
U.InputChanged:Connect(function(i) if LD and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then local d=i.Position-LDS Logo.Position=_U2(LSP.X.Scale,LSP.X.Offset+d.X,LSP.Y.Scale,LSP.Y.Offset+d.Y) end end)
local MD=false local MDS,MSP
Header.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then MD=true MDS=i.Position MSP=Main.Position i.Changed:Connect(function() if i.UserInputState==Enum.UserInputState.End then MD=false end end) end end)
U.InputChanged:Connect(function(i) if MD and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then local d=i.Position-MDS Main.Position=_U2(MSP.X.Scale,MSP.X.Offset+d.X,MSP.Y.Scale,MSP.Y.Offset+d.Y) end end)
local Opened=false
local function OpenMenu()
if Opened then return end
Opened=true Main.Visible=true Main.Size=UDim2.fromScale(.25,.15) Main.BackgroundTransparency=1
T:Create(Main,TweenInfo.new(.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.fromScale(.78,.65),BackgroundTransparency=0}):Play()
end
local function CloseMenu()
if not Opened then return end Opened=false
local tw=T:Create(Main,TweenInfo.new(.25,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{Size=UDim2.fromScale(.25,.15),BackgroundTransparency=1})
tw:Play() tw.Completed:Wait() if not Opened then Main.Visible=false end
end
Logo.MouseButton1Click:Connect(function() if Opened then CloseMenu() else OpenMenu() end end)
Close.MouseButton1Click:Connect(CloseMenu)

-- CARREGAR ROTAS
task.defer(function()
local ld=0
for _,cat in ipairs(CategoryOrder) do if LoadCategory(cat) then ld+=1 end end
local lt1=LoadTowerRoute("Torre 1","Única") local lt2=0
for _,rn in ipairs(Tower2RouteOrder) do if LoadTowerRoute("Torre 2",rn) then lt2+=1 end end
ShowCreditos()
Notify("ZKY PARKOUR",ld.."/4 parkours • Torre 1: "..(lt1 and "OK" or "ERRO").." • Torre 2: "..lt2.."/4",ld==4 and lt1 and lt2==4 and "Success" or "Error")
end)
print("AKIRA MENU V2.7 carregado!")