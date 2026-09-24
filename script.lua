_G.ZKY_OK = false
do
local _0x06FB =string.char(65,107,105,114,97,48,48,55)local _0x78A4 =string.char(104,116,116,112,115,58,47,47,100,105,115,99,111,114,100,46,103,103,47,78,89,50,82,102,67,55,75,120)local _0x6B2C = Instance.new(string.char(83,99,114,101,101,110,71,117,105))
_0x6B2C.Name =string.char(90,75,89,75,101,121)_0x6B2C.ResetOnSpawn = false
pcall(function() _0x6B2C.Parent = (gethui and gethui()) or game:GetService(string.char(67,111,114,101,71,117,105)) end)
if not _0x6B2C.Parent then
_0x6B2C.Parent = game:GetService(string.char(80,108,97,121,101,114,115)).LocalPlayer:WaitForChild(string.char(80,108,97,121,101,114,71,117,105))
end
local _0x5DD5 = Instance.new(string.char(70,114,97,109,101), _0x6B2C)
_0x5DD5.Size = UDim2.new(0, 280, 0, 220)
_0x5DD5.Position = UDim2.new(0.5, -140, 0.5, -110)
_0x5DD5.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Instance.new(string.char(85,73,67,111,114,110,101,114), _0x5DD5).CornerRadius = UDim.new(0, 10)
local _0xA76E = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _0x5DD5)
_0xA76E.Size = UDim2.new(1, 0, 0, 36)
_0xA76E.BackgroundTransparency = 1
_0xA76E.Text =string.char(65,75,73,82,65,32,77,69,78,85,32,45,32,75,69,89)_0xA76E.TextColor3 = Color3.new(1, 1, 1)
_0xA76E.Font = Enum.Font.GothamBold
_0xA76E.TextSize = 16
local _0x5A1C = Instance.new(string.char(84,101,120,116,66,111,120), _0x5DD5)
_0x5A1C.Size = UDim2.new(1, -30, 0, 34)
_0x5A1C.Position = UDim2.new(0, 15, 0, 42)
_0x5A1C.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
_0x5A1C.TextColor3 = Color3.new(1, 1, 1)
_0x5A1C.PlaceholderText =string.char(67,111,108,101,32,97,32,107,101,121,32,97,113,117,105)_0x5A1C.Text =""_0x5A1C.ClearTextOnFocus = false
_0x5A1C.Font = Enum.Font.Gotham
_0x5A1C.TextSize = 14
Instance.new(string.char(85,73,67,111,114,110,101,114), _0x5A1C).CornerRadius = UDim.new(0, 8)
local _0x014F = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _0x5DD5)
_0x014F.Size = UDim2.new(1, -30, 0, 40)
_0x014F.Position = UDim2.new(0, 15, 0, 84)
_0x014F.BackgroundTransparency = 1
_0x014F.Text =string.char(80,114,97,32,112,101,103,97,114,32,97,32,107,101,121,44,32,101,110,116,114,101,32,110,111,32,68,105,115,99,111,114,100)_0x014F.TextColor3 = Color3.fromRGB(180, 180, 180)
_0x014F.Font = Enum.Font.Gotham
_0x014F.TextSize = 12
_0x014F.TextWrapped = true
local _0xBAA1 = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _0x5DD5)
_0xBAA1.Size = UDim2.new(1, -30, 0, 34)
_0xBAA1.Position = UDim2.new(0, 15, 0, 128)
_0xBAA1.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
_0xBAA1.Text =string.char(80,101,103,97,114,32,75,101,121)_0xBAA1.TextColor3 = Color3.new(1, 1, 1)
_0xBAA1.Font = Enum.Font.GothamBold
_0xBAA1.TextSize = 14
Instance.new(string.char(85,73,67,111,114,110,101,114), _0xBAA1).CornerRadius = UDim.new(0, 8)
local _0x84D4 = Instance.new(string.char(84,101,120,116,66,117,116,116,111,110), _0x5DD5)
_0x84D4.Size = UDim2.new(1, -30, 0, 34)
_0x84D4.Position = UDim2.new(0, 15, 0, 168)
_0x84D4.BackgroundColor3 = Color3.fromRGB(50, 170, 90)
_0x84D4.Text =string.char(67,104,101,99,107,32,75,101,121)_0x84D4.TextColor3 = Color3.new(1, 1, 1)
_0x84D4.Font = Enum.Font.GothamBold
_0x84D4.TextSize = 14
Instance.new(string.char(85,73,67,111,114,110,101,114), _0x84D4).CornerRadius = UDim.new(0, 8)
local _0x279B = Instance.new(string.char(84,101,120,116,76,97,98,101,108), _0x5DD5)
_0x279B.Size = UDim2.new(1, -20, 0, 18)
_0x279B.Position = UDim2.new(0, 10, 1, -20)
_0x279B.BackgroundTransparency = 1
_0x279B.Text =""_0x279B.TextColor3 = Color3.fromRGB(200, 200, 200)
_0x279B.Font = Enum.Font.Gotham
_0x279B.TextSize = 11
_0xBAA1.MouseButton1Click:Connect(function()
pcall(function() setclipboard(_0x78A4) end)
pcall(function() game:GetService(string.char(71,117,105,83,101,114,118,105,99,101)):OpenBrowserWindow(_0x78A4) end)
_0x279B.Text =string.char(76,105,110,107,32,100,111,32,68,105,115,99,111,114,100,32,99,111,112,105,97,100,111,33)end)
_0x84D4.MouseButton1Click:Connect(function()
local _0x8BEB = _0x5A1C.Text:gsub(string.char(37,115),"")
if _0x8BEB:lower() == _0x06FB:lower() then
_G.ZKY_OK = true
_0x6B2C:Destroy()
else
_0x279B.Text =string.char(75,101,121,32,105,110,118,195,161,108,105,100,97,46)end
end)
end
repeat task.wait() until _G.ZKY_OKlocal _0x4524,_0x7303,_0xEA31,_0xEA4A,_0x2E5E,_0x426D,_0x5ED4,_0xC9E5,_0xC25C,_0x666C = Instance.new,UDim2.new,UDim2.fromOffset,UDim.new,Color3.fromRGB,Vector2.new,Enum.Font.GothamBold,Enum.Font.GothamMedium,Enum.TextXAlignment.Left,Enum.TextXAlignment.Center
local _0xB2C0 = game:GetService(string.char(80,108,97,121,101,114,115))
local _0xA77C = game:GetService(string.char(84,119,101,101,110,83,101,114,118,105,99,101))
local _0x4E58 = game:GetService(string.char(85,115,101,114,73,110,112,117,116,83,101,114,118,105,99,101))
local _0x187D = game:GetService(string.char(82,117,110,83,101,114,118,105,99,101))
local _0xEE02 = game:GetService(string.char(72,116,116,112,83,101,114,118,105,99,101))
local _0xB781 = game:GetService(string.char(84,101,120,116,67,104,97,116,83,101,114,118,105,99,101))
local _0x6E26 = game:GetService(string.char(82,101,112,108,105,99,97,116,101,100,83,116,111,114,97,103,101))
local _0x0DAF = _0xB2C0.LocalPlayer
local _0x3228 = _0x0DAF:WaitForChild(string.char(80,108,97,121,101,114,71,117,105))
local _0x617C,_0x0660,_0x8240local _0x4E7A = {
LineThickness = .15,
LineTransparency = .2,
LineColor = _0x2E5E(255,145,45),
JumpCooldown = .28,
PlaybackSpeed = 1,
WalkToSpeed = 16,
GroundOffset = 1.66
}
local _0x0F3F = { Modo =string.char(68,117,109,109,121)}local _0x87FF = {
ApiKey =string.char(103,115,107,95,84,121,103,115,76,99,54,112,85,105,77,72,116,109,98,57,71,114,50,101,87,71,100,121,98,51,70,89,89,99,110,48,56,82,71,121,81,50,110,52,113,118,109,82,51,52,71,81,75,55,81,48),
Endpoint =string.char(104,116,116,112,115,58,47,47,97,112,105,46,103,114,111,113,46,99,111,109,47,111,112,101,110,97,105,47,118,49,47,99,104,97,116,47,99,111,109,112,108,101,116,105,111,110,115),
Modelo =string.char(111,112,101,110,97,105,47,103,112,116,45,111,115,115,45,49,50,48,98),
Timeout = 15,
MaxTokens = 2048,
SystemPrompt =string.char(86,111,99,195,170,32,195,169,32,117,109,32,99,111,114,114,101,116,111,114,32,103,114,97,109,97,116,105,99,97,108,32,101,120,116,114,101,109,97,109,101,110,116,101,32,114,105,103,111,114,111,115,111,32,100,101,32,112,111,114,116,117,103,117,195,170,115,32,100,111,32,66,114,97,115,105,108,46,32,67,111,114,114,105,106,97,32,84,79,68,79,83,32,111,115,32,101,114,114,111,115,32,100,97,32,109,101,110,115,97,103,101,109,32,100,111,32,117,115,117,195,161,114,105,111,44,32,115,101,109,32,100,101,105,120,97,114,32,112,97,115,115,97,114,32,110,101,110,104,117,109,44,32,105,110,99,108,117,105,110,100,111,58,32,108,101,116,114,97,115,32,109,97,105,195,186,115,99,117,108,97,115,32,110,111,32,105,110,195,173,99,105,111,32,100,101,32,102,114,97,115,101,115,32,101,32,101,109,32,110,111,109,101,115,32,112,114,195,179,112,114,105,111,115,59,32,116,111,100,111,115,32,111,115,32,97,99,101,110,116,111,115,32,103,114,195,161,102,105,99,111,115,32,40,97,103,117,100,111,44,32,99,105,114,99,117,110,102,108,101,120,111,44,32,116,105,108,44,32,99,114,97,115,101,41,32,101,32,97,32,99,101,100,105,108,104,97,59,32,116,111,100,97,32,97,32,112,111,110,116,117,97,195,167,195,163,111,44,32,99,111,109,111,32,118,195,173,114,103,117,108,97,115,44,32,112,111,110,116,111,115,32,102,105,110,97,105,115,44,32,112,111,110,116,111,115,32,100,101,32,105,110,116,101,114,114,111,103,97,195,167,195,163,111,32,101,32,100,101,32,101,120,99,108,97,109,97,195,167,195,163,111,59,32,99,111,110,99,111,114,100,195,162,110,99,105,97,32,118,101,114,98,97,108,32,101,32,110,111,109,105,110,97,108,59,32,111,114,116,111,103,114,97,102,105,97,32,101,32,115,101,112,97,114,97,195,167,195,163,111,32,100,101,32,112,97,108,97,118,114,97,115,46,32,78,195,163,111,32,100,101,105,120,101,32,110,101,110,104,117,109,97,32,112,97,108,97,118,114,97,32,115,101,109,32,97,99,101,110,116,111,32,111,117,32,115,101,109,32,109,97,105,195,186,115,99,117,108,97,32,111,110,100,101,32,102,111,114,32,110,101,99,101,115,115,195,161,114,105,111,44,32,110,101,109,32,110,101,110,104,117,109,97,32,102,114,97,115,101,32,115,101,109,32,112,111,110,116,117,97,195,167,195,163,111,32,102,105,110,97,108,46,32,78,195,163,111,32,114,101,115,117,109,97,44,32,110,195,163,111,32,114,101,101,115,99,114,101,118,97,32,111,32,101,115,116,105,108,111,44,32,110,195,163,111,32,109,117,100,101,32,111,32,115,105,103,110,105,102,105,99,97,100,111,44,32,111,32,116,111,109,32,110,101,109,32,111,32,116,97,109,97,110,104,111,32,100,97,32,109,101,110,115,97,103,101,109,58,32,97,112,101,110,97,115,32,99,111,114,114,105,106,97,32,97,32,103,114,97,109,195,161,116,105,99,97,44,32,97,32,111,114,116,111,103,114,97,102,105,97,32,101,32,97,32,112,111,110,116,117,97,195,167,195,163,111,44,32,109,97,110,116,101,110,100,111,32,97,115,32,109,101,115,109,97,115,32,112,97,108,97,118,114,97,115,32,115,101,109,112,114,101,32,113,117,101,32,112,111,115,115,195,173,118,101,108,46,32,82,101,115,112,111,110,100,97,32,65,80,69,78,65,83,32,99,111,109,32,97,32,109,101,110,115,97,103,101,109,32,99,111,114,114,105,103,105,100,97,44,32,115,101,109,32,101,120,112,108,105,99,97,195,167,195,181,101,115,44,32,97,115,112,97,115,44,32,99,111,109,101,110,116,195,161,114,105,111,115,32,101,120,116,114,97,115,32,111,117,32,113,117,97,108,113,117,101,114,32,116,101,120,116,111,32,97,100,105,99,105,111,110,97,108,46)}local _0xF922 = {
ApiKey =string.char(103,115,107,95,84,121,103,115,76,99,54,112,85,105,77,72,116,109,98,57,71,114,50,101,87,71,100,121,98,51,70,89,89,99,110,48,56,82,71,121,81,50,110,52,113,118,109,82,51,52,71,81,75,55,81,48),
Endpoint =string.char(104,116,116,112,115,58,47,47,97,112,105,46,103,114,111,113,46,99,111,109,47,111,112,101,110,97,105,47,118,49,47,99,104,97,116,47,99,111,109,112,108,101,116,105,111,110,115),
Modelo =string.char(111,112,101,110,97,105,47,103,112,116,45,111,115,115,45,49,50,48,98),
Timeout = 20,
MaxTokens = 2048,
SystemPrompt =string.char(86,111,99,195,170,32,195,169,32,117,109,32,103,101,114,97,100,111,114,32,100,101,32,116,101,120,116,111,115,32,100,111,32,69,120,195,169,114,99,105,116,111,32,66,114,97,115,105,108,101,105,114,111,32,101,109,32,117,109,32,106,111,103,111,32,100,101,32,82,111,98,108,111,120,32,40,114,111,108,101,112,108,97,121,32,109,105,108,105,116,97,114,41,46,32,79,32,117,115,117,195,161,114,105,111,32,118,97,105,32,116,101,32,100,97,114,32,117,109,32,84,69,77,65,46,32,86,111,99,195,170,32,100,101,118,101,32,101,115,99,114,101,118,101,114,32,117,109,32,116,101,120,116,111,32,99,117,114,116,111,44,32,104,117,109,97,110,111,44,32,103,114,97,109,97,116,105,99,97,108,109,101,110,116,101,32,112,101,114,102,101,105,116,111,32,101,32,112,97,116,114,105,195,179,116,105,99,111,32,115,111,98,114,101,32,101,120,97,116,97,109,101,110,116,101,32,101,115,115,101,32,116,101,109,97,46,32,82,69,71,82,65,83,32,79,66,82,73,71,65,84,195,147,82,73,65,83,58,32,40,49,41,32,79,32,116,101,120,116,111,32,68,69,86,69,32,116,101,114,32,101,110,116,114,101,32,49,53,48,32,101,32,50,49,48,32,99,97,114,97,99,116,101,114,101,115,44,32,99,111,110,116,97,110,100,111,32,101,115,112,97,195,167,111,115,46,32,40,50,41,32,77,195,161,120,105,109,111,32,51,32,102,114,97,115,101,115,32,99,117,114,116,97,115,46,32,40,51,41,32,70,105,113,117,101,32,49,48,48,37,32,102,105,101,108,32,97,111,32,116,101,109,97,32,112,101,100,105,100,111,44,32,115,101,109,32,102,117,103,105,114,32,100,111,32,97,115,115,117,110,116,111,46,32,40,52,41,32,84,111,109,32,109,105,108,105,116,97,114,32,114,101,97,108,105,115,116,97,44,32,110,97,116,117,114,97,108,32,101,32,104,117,109,97,110,111,44,32,115,101,109,32,101,120,97,103,101,114,111,115,32,110,101,109,32,99,108,105,99,104,195,170,115,46,32,40,53,41,32,83,101,109,32,115,97,117,100,97,195,167,195,181,101,115,44,32,115,101,109,32,97,115,112,97,115,44,32,115,101,109,32,101,109,111,106,105,115,44,32,115,101,109,32,102,111,114,109,97,116,97,195,167,195,163,111,44,32,115,101,109,32,105,110,116,114,111,100,117,195,167,195,181,101,115,46,32,40,54,41,32,82,101,115,112,111,110,100,97,32,65,80,69,78,65,83,32,99,111,109,32,111,32,116,101,120,116,111,32,102,105,110,97,108,44,32,110,97,100,97,32,109,97,105,115,46)}
local _0xF949 = request or (syn and syn.request) or (http and http.request) or http_request
local _0xB19D = {
Lento =string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,77,55,68,118,82,103,84,99),
[string.char(82,195,161,112,105,100,111)] =string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,112,66,107,56,118,89,88,69),
[string.char(77,97,105,115,32,82,195,161,112,105,100,111)] =string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,121,122,55,103,90,109,89,114),
[string.char(83,101,109,32,66,117,114,108,97)] =string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,78,49,106,48,105,82,68,65)}
local _0xA36A = {string.char(76,101,110,116,111),string.char(82,195,161,112,105,100,111),string.char(77,97,105,115,32,82,195,161,112,105,100,111),string.char(83,101,109,32,66,117,114,108,97)}
local _0x14BB = {
[string.char(84,111,114,114,101,32,49)] = {[string.char(195,154,110,105,99,97)]=string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,72,120,88,98,52,77,114,51)},
[string.char(84,111,114,114,101,32,50)] = {
Frente =string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,89,50,97,114,67,89,72,98),
[string.char(65,116,114,195,161,115)] =string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,114,88,120,90,88,55,67,81),
Esquerda =string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,70,116,112,84,72,104,71,116),
Direita =string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,52,117,53,87,106,116,107,103)}
}
local _0xF051 = {string.char(70,114,101,110,116,101),string.char(65,116,114,195,161,115),string.char(69,115,113,117,101,114,100,97),string.char(68,105,114,101,105,116,97)}
local _0xCBC9 = {Lento={},[string.char(82,195,161,112,105,100,111)]={},[string.char(77,97,105,115,32,82,195,161,112,105,100,111)]={},[string.char(83,101,109,32,66,117,114,108,97)]={}}
local _0xBD9D = {[string.char(84,111,114,114,101,32,49)]={},[string.char(84,111,114,114,101,32,50)]={Frente={},[string.char(65,116,114,195,161,115)]={},Esquerda={},Direita={}}}
local _0xAA13 = {}
for _0xA98B=1,4 do _0xAA13[_0xA98B]=string.char(76,101,110,116,111)end
local _0x7994 =string.char(70,114,101,110,116,101)local _0x04FA =string.char(69,66,68,101,108,116,97)local _0x6000
local _0x3654 = true
local _0x69E3 = true
local _0xC53C = false
local _0x75F5 = {
Running = false, Connection = nil, Route = nil, StartClock = 0,
CurrentIndex = 1, LastJump = -math.huge, Category = nil, Parkour = nil,
Tower = nil, TowerRoute = nil, WalkingToStart = false, WalkConnection = nil
}
local _0xD945 = nil
local _0xD8E0 = false
local _0xA64C = _0x3228:FindFirstChild(string.char(90,75,89,95,80,65,82,75,79,85,82))
if _0xA64C then _0xA64C:Destroy() end
local _0xA737 = {
Background = _0x2E5E(15,15,18), Panel = _0x2E5E(20,20,25), Card = _0x2E5E(24,24,30),
CardHover = _0x2E5E(32,32,40), Selected = _0x2E5E(45,45,55), _0x1A8B = _0x2E5E(45,45,55),
StrokeLight = _0x2E5E(65,65,80), White = _0x2E5E(240,240,245), Gray = _0x2E5E(170,170,180),
DarkGray = _0x2E5E(115,115,125), Success = _0x2E5E(80,210,125), Error = _0x2E5E(230,85,85),
Orange = _0x2E5E(255,145,45), SelectionRed = _0x2E5E(225,70,70), SelectionRedDark = _0x2E5E(75,32,32),
Primary = _0x2E5E(185,185,185), Purple = _0x2E5E(150,110,240), PurpleLight = _0x2E5E(180,150,255)
}
local function _0xF6BF(_0x330E,r) local _0x5B52=_0x4524(string.char(85,73,67,111,114,110,101,114)) _0x5B52.CornerRadius=_0xEA4A(0,r) _0x5B52.Parent=_0x330E end
local function _0x1A8B(_0x330E,_0x5B52,_0xA76E) local _0x7808=_0x4524(string.char(85,73,83,116,114,111,107,101)) _0x7808.Color=_0x5B52 _0x7808.Thickness=_0xA76E or 1 _0x7808.Parent=_0x330E return _0x7808 end
local function _0x995E(_0x330E,_0xA76E,_0xE9E5,_0xE2AD,rr)
local _0xEC82=_0x4524(string.char(85,73,80,97,100,100,105,110,103))
_0xEC82.PaddingTop=_0xEA4A(0,_0xA76E or 0) _0xEC82.PaddingBottom=_0xEA4A(0,_0xE9E5 or 0)
_0xEC82.PaddingLeft=_0xEA4A(0,_0xE2AD or 0) _0xEC82.PaddingRight=_0xEA4A(0,rr or 0)
_0xEC82.Parent=_0x330E
endlocal _0xA076 = _0x4524(string.char(70,114,97,109,101))
_0xA076.Name=string.char(78,111,116,105,102,105,99,97,116,105,111,110,115)_0xA076.AnchorPoint=_0x426D(1,1) _0xA076.Position=_0x7303(1,-15,1,-15)
_0xA076.Size=_0xEA31(270,300) _0xA076.BackgroundTransparency=1 _0xA076.ZIndex=200 _0xA076.Parent=_0x3228
local _0x6076 = _0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116))
_0x6076.VerticalAlignment=Enum.VerticalAlignment.Bottom
_0x6076.HorizontalAlignment=Enum.HorizontalAlignment.Right
_0x6076.Padding=_0xEA4A(0,7) _0x6076.Parent=_0xA076
local function _0xF45C(tt,_0x4DEA,nt)
local _0x5B52=_0xA737.Gray
if nt==string.char(83,117,99,99,101,115,115)then _0x5B52=_0xA737.Success
elseif nt==string.char(69,114,114,111,114)then _0x5B52=_0xA737.Error
elseif nt==string.char(79,114,97,110,103,101)then _0x5B52=_0xA737.Orange end
local _0x1DE2=_0x4524(string.char(70,114,97,109,101)) _0x1DE2.Size=_0xEA31(250,64) _0x1DE2.BackgroundColor3=_0xA737.Panel
_0x1DE2.BorderSizePixel=0 _0x1DE2.BackgroundTransparency=1 _0x1DE2.ZIndex=201 _0x1DE2.Parent=_0xA076
_0xF6BF(_0x1DE2,10) local _0xA6FB=_0x1A8B(_0x1DE2,_0x5B52) _0xA6FB.Transparency=1
local _0x5F86=_0x4524(string.char(70,114,97,109,101)) _0x5F86.Size=_0xEA31(3,38) _0x5F86.AnchorPoint=_0x426D(0,.5)
_0x5F86.Position=_0x7303(0,7,.5,0) _0x5F86.BackgroundColor3=_0x5B52 _0x5F86.BorderSizePixel=0
_0x5F86.BackgroundTransparency=1 _0x5F86.ZIndex=202 _0x5F86.Parent=_0x1DE2 _0xF6BF(_0x5F86,5)
local _0xD25A=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0xD25A.BackgroundTransparency=1 _0xD25A.Position=_0xEA31(18,9) _0xD25A.Size=_0x7303(1,-28,0,18)
_0xD25A.Text=tt _0xD25A.TextColor3=_0xA737.White _0xD25A.TextSize=12 _0xD25A.Font=_0x5ED4
_0xD25A.TextXAlignment=_0xC25C _0xD25A.ZIndex=203 _0xD25A.Parent=_0x1DE2
local _0x64FB=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0x64FB.BackgroundTransparency=1 _0x64FB.Position=_0xEA31(18,30) _0x64FB.Size=_0x7303(1,-28,0,25)
_0x64FB.Text=_0x4DEA _0x64FB.TextColor3=_0xA737.Gray _0x64FB.TextSize=9 _0x64FB.Font=_0xC9E5
_0x64FB.TextWrapped=true _0x64FB.TextXAlignment=_0xC25C _0x64FB.TextYAlignment=Enum.TextYAlignment.Center
_0x64FB.ZIndex=203 _0x64FB.Parent=_0x1DE2
_0x1DE2.Position=_0x7303(1,270,0,0)
_0xA77C:Create(_0x1DE2,TweenInfo.new(.35,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{Position=_0x7303(),BackgroundTransparency=0}):Play()
_0xA77C:Create(_0xA6FB,TweenInfo.new(.25),{Transparency=0}):Play()
_0xA77C:Create(_0x5F86,TweenInfo.new(.25),{BackgroundTransparency=0}):Play()
task.delay(2.8,function()
if not _0x1DE2.Parent then return end
local _0x330E=_0xA77C:Create(_0x1DE2,TweenInfo.new(.3,Enum.EasingStyle.Quart,Enum.EasingDirection.In),{Position=_0x7303(1,270),BackgroundTransparency=1})
_0x330E:Play()
_0xA77C:Create(_0xA6FB,TweenInfo.new(.2),{Transparency=1}):Play()
_0xA77C:Create(_0x5F86,TweenInfo.new(.2),{BackgroundTransparency=1}):Play()
_0x330E.Completed:Wait()
if _0x1DE2.Parent then _0x1DE2:Destroy() end
end)
endlocal function _0xFBBE()
_0x617C=_0x0DAF.Character
if not _0x617C or not _0x617C.Parent then return false end
_0x0660=_0x617C:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
_0x8240=_0x617C:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
return _0x0660~=nil and _0x8240~=nil
endlocal _0x9DB0
local _0x3251
_0x0DAF.CharacterAdded:Connect(function()
task.wait(.2)
_0xFBBE()
_0x9DB0 = nil
_0x3251 = nil
end)
_0xFBBE()
local function _0x6A3D()
if not _0xFBBE() then return end
if _0x9DB0 and _0x9DB0.IsPlaying then return end
local _0x7D57 = _0x0660:FindFirstChildOfClass(string.char(65,110,105,109,97,116,111,114))
if not _0x7D57 then
_0x7D57 = _0x4524(string.char(65,110,105,109,97,116,111,114))
_0x7D57.Parent = _0x0660
end
if not _0x3251 then
local _0x19B5 = nil
local _0x4893 = _0x617C:FindFirstChild(string.char(65,110,105,109,97,116,101))
if _0x4893 then
local _0x1C60 = _0x4893:FindFirstChild(string.char(119,97,108,107))
if _0x1C60 then
local _0x3BB9 = _0x1C60:FindFirstChildOfClass(string.char(65,110,105,109,97,116,105,111,110))
if _0x3BB9 then _0x19B5 = _0x3BB9.AnimationId end
end
end
if not _0x19B5 then
local _0xCB33 = _0x0660.RigType == Enum.HumanoidRigType.R15
_0x19B5 = _0xCB33 andstring.char(114,98,120,97,115,115,101,116,105,100,58,47,47,53,48,55,55,55,55,56,50,54)orstring.char(114,98,120,97,115,115,101,116,105,100,58,47,47,49,56,48,52,50,54,51,53,52)end
local _0x8C35, _0xD839 = pcall(function()
local _0x3BB9 = _0x4524(string.char(65,110,105,109,97,116,105,111,110))
_0x3BB9.AnimationId = _0x19B5
return _0x7D57:LoadAnimation(_0x3BB9)
end)
if not _0x8C35 or not _0xD839 then return end
_0xD839.Looped = true
_0xD839.Priority = Enum.AnimationPriority.Movement
_0x3251 = _0xD839
end
_0x9DB0 = _0x3251
pcall(function() _0x9DB0:Play() end)
end
local function _0xCDC1()
if _0x9DB0 then
pcall(function() _0x9DB0:Stop() end)
_0x9DB0 = nil
end
endlocal _0xC845
local _0x1036 = 0
task.spawn(function()
while true do
task.wait(0.08)
if _0xFBBE() then
local _0x4166 = _0x8240.Position
if _0xC845 then
local _0x73FC = (_0x4166 - _0xC845).Magnitude
if _0x73FC > 0.06 then
_0x1036 = os.clock()
end
end
_0xC845 = _0x4166
local _0x0157 = _0x0660.FloorMaterial ~= Enum.Material.Air
local _0x8417 = (os.clock() - _0x1036) < 0.2
local _0x66E9 = _0x75F5.Running and not _0x75F5.WalkingToStart
if _0x66E9 and _0x0157 and _0x8417 then
if not _0x9DB0 or not _0x9DB0.IsPlaying then
_0x6A3D()
end
else
if _0x9DB0 and _0x9DB0.IsPlaying then
_0xCDC1()
end
end
else
_0xC845 = nil
if _0x9DB0 and _0x9DB0.IsPlaying then
_0xCDC1()
end
end
end
end)
local function _0xE5E4(_0xB138) return _0xB138 and tonumber(_0xB138) end
local function _0xEF10(_0x972A)
local _0xD846,_0xD0FC={},{} local _0x29C3=1
while true do
local _0x7808=string.find(_0x972A,string.char(108,111,99,97,108,32,82,111,116,97,32,61,32,123),_0x29C3)
if not _0x7808 then break end
local _0xE9E5,_0xA95A=0
for _0xA98B=_0x7808,#_0x972A do
local _0xBA7E=string.sub(_0x972A,_0xA98B,_0xA98B)
if _0xBA7E==string.char(123)then _0xE9E5+=1
elseif _0xBA7E==string.char(125)then _0xE9E5-=1; if _0xE9E5==0 then _0xA95A=_0xA98B; break end end
end
if not _0xA95A then break end
table.insert(_0xD0FC,string.sub(_0x972A,_0x7808,_0xA95A))
_0x29C3=_0xA95A+1
end
for _,block in ipairs(_0xD0FC) do
local _0x0880,_0x8AE3={},1
while true do
local _0xD02F,_0x4B7D=string.find(block,string.char(123,40,46,45,41,125),_0x8AE3)
if not _0xD02F then break end
local _0x5DD5=string.sub(block,_0xD02F,_0x4B7D)
local _0xA76E=string.match(_0x5DD5,string.char(116,37,115,42,61,37,115,42,40,91,37,100,37,46,37,45,93,43,41))
local _0x20CC=string.match(_0x5DD5,string.char(120,37,115,42,61,37,115,42,40,91,37,100,37,46,37,45,93,43,41))
local _0xD61C=string.match(_0x5DD5,string.char(121,37,115,42,61,37,115,42,40,91,37,100,37,46,37,45,93,43,41))
local _0xAFA3=string.match(_0x5DD5,string.char(122,37,115,42,61,37,115,42,40,91,37,100,37,46,37,45,93,43,41))
local _0x9A18=string.match(_0x5DD5,string.char(106,37,115,42,61,37,115,42,40,91,37,119,93,43,41))
local _0xD7CB=string.match(_0x5DD5,string.char(114,120,37,115,42,61,37,115,42,40,91,37,100,37,46,37,45,93,43,41))
local _0xE808=string.match(_0x5DD5,string.char(114,121,37,115,42,61,37,115,42,40,91,37,100,37,46,37,45,93,43,41))
local _0x367B=string.match(_0x5DD5,string.char(114,122,37,115,42,61,37,115,42,40,91,37,100,37,46,37,45,93,43,41))
if _0xA76E and _0x20CC and _0xD61C and _0xAFA3 then
local _0x6340={_0xA76E=_0xE5E4(_0xA76E),_0x20CC=_0xE5E4(_0x20CC),_0xD61C=_0xE5E4(_0xD61C),_0xAFA3=_0xE5E4(_0xAFA3),_0x9A18=_0x9A18==string.char(116,114,117,101),
position=Vector3.new(_0xE5E4(_0x20CC),_0xE5E4(_0xD61C),_0xE5E4(_0xAFA3)),
_0xD7CB=_0xE5E4(_0xD7CB),_0xE808=_0xE5E4(_0xE808),_0x367B=_0xE5E4(_0x367B)}
if _0x6340.rx and _0x6340.ry and _0x6340.rz then
_0x6340.rotation=CFrame.Angles(_0x6340.rx,_0x6340.ry,_0x6340.rz); _0x6340.hasRotation=true
else _0x6340.hasRotation=false end
table.insert(_0x0880,_0x6340)
end
_0x8AE3=_0x4B7D+1
end
if #_0x0880>=2 then
table.sort(_0x0880,function(_0x5F86,_0xE9E5) return _0x5F86.t<_0xE9E5.t end)
table.insert(_0xD846,_0x0880)
end
end
return _0xD846
end
local function _0x5047(_0x2833)
local _0x2323=_0xB19D[_0x2833]; if not _0x2323 then return false end
local _0x8C35,_0x972A=pcall(function() return game:HttpGet(_0x2323) end)
if not _0x8C35 or not _0x972A then return false end
local _0xEC82=_0xEF10(_0x972A); if #_0xEC82==0 then return false end
_0xCBC9[_0x2833]=_0xEC82; return true
end
local function _0xDC92(tower,_0xD20D)
local _0xEB91=_0x14BB[tower]; if not _0xEB91 then return false end
local _0x2323=_0xEB91[_0xD20D]; if not _0x2323 then return false end
local _0x8C35,_0x972A=pcall(function() return game:HttpGet(_0x2323) end)
if not _0x8C35 or not _0x972A then return false end
local _0xEC82=_0xEF10(_0x972A); if #_0xEC82==0 then return false end
_0xBD9D[tower]=_0xBD9D[tower] or {}
_0xBD9D[tower][_0xD20D]=_0xEC82[1]
return true
end
local function _0x3C0E(_0x5F86,_0xE9E5)
if not _0x5F86 or not _0xE9E5 then return end
local _0xEB91=_0xE9E5-_0x5F86; local _0x92E8=_0xEB91.Magnitude; if _0x92E8<.01 then return end
if not _0x6000 then
_0x6000=_0x4524(string.char(70,111,108,100,101,114)); _0x6000.Name=string.char(90,75,89,95,82,111,117,116,101,76,105,110,101,115); _0x6000.Parent=workspace
end
local _0xE2AD=_0x4524(string.char(80,97,114,116)) _0xE2AD.Name=string.char(82,111,117,116,101,83,101,103,109,101,110,116)_0xE2AD.Anchored=true _0xE2AD.CanCollide=false
_0xE2AD.CanTouch=false _0xE2AD.CanQuery=false _0xE2AD.CastShadow=false
_0xE2AD.Material=Enum.Material.Neon _0xE2AD.Color=_0x4E7A.LineColor
_0xE2AD.Transparency=(_0x3654 and _0x69E3) and _0x4E7A.LineTransparency or 1
_0xE2AD.Size=Vector3.new(_0x4E7A.LineThickness,_0x4E7A.LineThickness,_0x92E8)
_0xE2AD.CFrame=CFrame.lookAt((_0x5F86+_0xE9E5)/2,_0xE9E5)
_0xE2AD.Parent=_0x6000
end
local function _0xCACA()
if not _0x6000 then return end
for _,_0x330E in ipairs(_0x6000:GetChildren()) do _0x330E:Destroy() end
end
local function _0xE95B(data)
_0xCACA(); local _0x7CED
for _,_0x5DD5 in ipairs(data) do
local _0xEC82=_0x5DD5.position
if _0x7CED then _0x3C0E(_0x7CED,_0xEC82) end
_0x7CED=_0xEC82
end
end
local function _0x1B17(_0x5DD5)
if not _0x5DD5 then return end
if _0x5DD5.position then return _0x5DD5.position end
if _0x5DD5.x and _0x5DD5.y and _0x5DD5.z then return Vector3.new(_0x5DD5.x,_0x5DD5.y,_0x5DD5.z) end
end
local function _0x021B(_0x5DD5)
if not _0x5DD5 then return end
if _0x5DD5.rotation then return _0x5DD5.rotation end
if _0x5DD5.rx and _0x5DD5.ry and _0x5DD5.rz then return CFrame.Angles(_0x5DD5.rx,_0x5DD5.ry,_0x5DD5.rz) end
end
local function _0x8CF1(_0x4166,_0x71B2)
if not _0x4166 or not _0xFBBE() then return false end
local _0x5709=_0x4166+Vector3.new(0,_0x4E7A.GroundOffset,0)
local _0x38C2
if _0x71B2 then
_0x38C2=CFrame.new(_0x5709)*_0x71B2
else
local _0x9D9B=_0x8240.CFrame.LookVector
local _0x855D=Vector3.new(_0x9D9B.X,0,_0x9D9B.Z)
if _0x855D.Magnitude<.01 then _0x855D=Vector3.new(0,0,-1) else _0x855D=_0x855D.Unit end
_0x38C2=CFrame.lookAt(_0x5709,_0x5709+_0x855D)
end
pcall(function() _0x617C:PivotTo(_0x38C2) end)
return true
end
local function _0xD7DD(_0x0880,_0x76A7)
local _0xC7BB=#_0x0880; if _0xC7BB<2 then return end
if _0x76A7<=_0x0880[1].t then _0x75F5.CurrentIndex=1; return _0x0880[1],_0x0880[2],0 end
if _0x76A7>=_0x0880[_0xC7BB].t then return _0x0880[_0xC7BB],_0x0880[_0xC7BB],1 end
local _0xA98B=math.clamp(_0x75F5.CurrentIndex,1,_0xC7BB-1)
while _0xA98B<_0xC7BB-1 and _0x76A7>_0x0880[_0xA98B+1].t do _0xA98B+=1 end
while _0xA98B>1 and _0x76A7<_0x0880[_0xA98B].t do _0xA98B-=1 end
_0x75F5.CurrentIndex=_0xA98B
local _0x5F86,_0xE9E5=_0x0880[_0xA98B],_0x0880[_0xA98B+1]
local _0xEB91=_0xE9E5.t-_0x5F86.t
local _0x30D7=_0xEB91>0 and math.clamp((_0x76A7-_0x5F86.t)/_0xEB91,0,1) or 0
return _0x5F86,_0xE9E5,_0x30D7
end
local function _0x581D(_0x5DD5,_0xA95A)
if not _0x5DD5 or not _0x5DD5.j or _0xA95A-_0x75F5.LastJump<_0x4E7A.JumpCooldown or not _0xFBBE() then return end
_0x75F5.LastJump=_0xA95A
_0x0660.Jump=true
pcall(function() _0x0660:ChangeState(Enum.HumanoidStateType.Jumping) end)
end
local function _0x968D(destino,estaCancelado,aoTerminar)
if not _0xFBBE() then aoTerminar(false) return end
_0x0660.WalkSpeed=_0x4E7A.WalkToSpeed
_0x0660:MoveTo(destino)
local _0x7706=os.clock() local _0x0CB7=false
while not estaCancelado() do
if not _0xFBBE() then break end
if (_0x8240.Position-destino).Magnitude<=4 then _0x0CB7=true break end
if os.clock()-_0x7706>60 then break end
task.wait()
end
if _0xFBBE() then _0x0660:Move(Vector3.zero,false) end
aoTerminar(_0x0CB7 and not estaCancelado())
end
local _0x377A
local _0xCF32
local function _0x1B08(_0x4166,_0x71B2)
_0xCF32()
local _0x1942 = _0x71B2 and (CFrame.new(_0x4166)*(_0x71B2-_0x71B2.Position)) or CFrame.new(_0x4166)
local _0x8C35=false
if _0xFBBE() then
local _0x9FFA={}
for _,_0xEB91 in ipairs(_0x617C:GetDescendants()) do
_0x9FFA[_0xEB91]=_0xEB91.Archivable
pcall(function() _0xEB91.Archivable=true end)
end
local _0xFD0E,_0xB365=pcall(function() return _0x617C:Clone() end)
for inst,valor in pairs(_0x9FFA) do
pcall(function() inst.Archivable=valor end)
end
if _0xFD0E and _0xB365 then
for _,_0xEB91 in ipairs(_0xB365:GetDescendants()) do
if _0xEB91:IsA(string.char(83,99,114,105,112,116)) or _0xEB91:IsA(string.char(76,111,99,97,108,83,99,114,105,112,116)) then pcall(function() _0xEB91:Destroy() end)
elseif _0xEB91:IsA(string.char(83,104,105,114,116)) or _0xEB91:IsA(string.char(80,97,110,116,115)) or _0xEB91:IsA(string.char(83,104,105,114,116,71,114,97,112,104,105,99)) or _0xEB91:IsA(string.char(68,101,99,97,108)) then pcall(function() _0xEB91:Destroy() end)
elseif _0xEB91:IsA(string.char(66,97,115,101,80,97,114,116)) then
_0xEB91.CanCollide=false _0xEB91.CanQuery=false _0xEB91.CanTouch=false _0xEB91.Massless=true
_0xEB91.Material=Enum.Material.ForceField _0xEB91.Color=_0x2E5E(0,255,140) _0xEB91.Transparency=.35
end
end
local _0xF74A=_0xB365:FindFirstChildOfClass(string.char(72,117,109,97,110,111,105,100))
if _0xF74A then pcall(function() _0xF74A.WalkSpeed=0 _0xF74A.JumpPower=0 _0xF74A.PlatformStand=true end) end
_0xB365.PrimaryPart=_0xB365.PrimaryPart or _0xB365:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if _0xB365.PrimaryPart then
_0xB365.Parent=workspace
local _0x5528=pcall(function() _0xB365:PivotTo(_0x1942) end)
if _0x5528 then
for _,_0xEB91 in ipairs(_0xB365:GetDescendants()) do
if _0xEB91:IsA(string.char(66,97,115,101,80,97,114,116)) then _0xEB91.Anchored=true end
end
local _0x13F2=_0x4524(string.char(72,105,103,104,108,105,103,104,116))
_0x13F2.FillColor=_0x2E5E(0,255,140) _0x13F2.OutlineColor=_0x2E5E(150,255,195)
_0x13F2.FillTransparency=.55 _0x13F2.OutlineTransparency=0
_0x13F2.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop _0x13F2.Parent=_0xB365
_0xB365.Name=string.char(90,75,89,95,68,117,109,109,121)_0x377A=_0xB365 _0x8C35=true
else _0xB365:Destroy() end
else _0xB365:Destroy() end
end
end
if not _0x8C35 then
local _0x62D6=_0x4524(string.char(80,97,114,116))
_0x62D6.Name=string.char(90,75,89,95,68,117,109,109,121)_0x62D6.Shape=Enum.PartType.Cylinder
_0x62D6.Size=Vector3.new(.4,6,6)
_0x62D6.CFrame=_0x1942*CFrame.Angles(0,0,math.rad(90))
_0x62D6.Color=_0x2E5E(0,255,130) _0x62D6.Material=Enum.Material.Neon
_0x62D6.Transparency=.35 _0x62D6.Anchored=true
_0x62D6.CanCollide=false _0x62D6.CanQuery=false _0x62D6.CanTouch=false
_0x62D6.Parent=workspace _0x377A=_0x62D6
end
end
_0xCF32=function() if _0x377A then pcall(function() _0x377A:Destroy() end) _0x377A=nil end end
local function _0x62C2(reason)
if _0x75F5.Connection then _0x75F5.Connection:Disconnect(); _0x75F5.Connection=nil end
if _0x75F5.WalkConnection then _0x75F5.WalkConnection:Disconnect(); _0x75F5.WalkConnection=nil end
_0xCF32()
_0x75F5.Running=false _0x75F5.Route=nil _0x75F5.CurrentIndex=1
_0x75F5.LastJump=-math.huge _0x75F5.Category=nil _0x75F5.Parkour=nil
_0x75F5.Tower=nil _0x75F5.TowerRoute=nil _0x75F5.WalkingToStart=false
if _0xFBBE() then
_0x0660:Move(Vector3.zero,false); _0x0660.Jump=false
pcall(function() _0x0660.AutoRotate=true end)
end
_0xCDC1()
_0xCACA()
if reason==string.char(99,111,109,112,108,101,116,101,100)then _0xF45C(string.char(67,79,78,67,76,85,195,141,68,79),string.char(82,111,116,97,32,102,105,110,97,108,105,122,97,100,97,33),string.char(83,117,99,99,101,115,115))
elseif reason==string.char(99,97,110,99,101,108,108,101,100)then _0xF45C(string.char(80,65,82,65,68,79),string.char(82,101,112,114,111,100,117,195,167,195,163,111,32,105,110,116,101,114,114,111,109,112,105,100,97,46),string.char(69,114,114,111,114))
elseif reason==string.char(101,114,114,111,114)then _0xF45C(string.char(69,82,82,79),string.char(78,195,163,111,32,102,111,105,32,112,111,115,115,195,173,118,101,108,32,99,111,110,116,105,110,117,97,114,46),string.char(69,114,114,111,114)) end
end
local function _0x11C2(_0x08FC)
if not _0x75F5.Running then return end
_0x75F5.WalkingToStart = false
if _0xFBBE() then
_0x0660:Move(Vector3.zero, false)
pcall(function() _0x0660.AutoRotate = false end)
end
_0x75F5.StartClock = os.clock()
_0x75F5.CurrentIndex = 1
_0x75F5.LastJump = -math.huge
_0xF45C(string.char(69,88,69,67,85,84,65,78,68,79), _0x08FC,string.char(83,117,99,99,101,115,115))
task.spawn(function()
while _0x75F5.Running and not _0x75F5.WalkingToStart do
if not _0xFBBE() then _0x62C2(string.char(101,114,114,111,114)); break end
local _0x0880 = _0x75F5.Route
if not _0x0880 or #_0x0880 < 2 then _0x62C2(string.char(101,114,114,111,114)); break end
local _0x76A7 = (os.clock() - _0x75F5.StartClock) * _0x4E7A.PlaybackSpeed
local _0x9593 = _0x0880[#_0x0880]
if _0x76A7 >= _0x9593.t then
_0x8CF1(_0x1B17(_0x9593), _0x021B(_0x9593))
_0x62C2(string.char(99,111,109,112,108,101,116,101,100))
break
end
local _0x5F86, _0xE9E5, _0x30D7 = _0xD7DD(_0x0880, _0x76A7)
if not _0x5F86 or not _0xE9E5 then break end
local _0xD8EE, _0x9871 = _0x1B17(_0x5F86), _0x1B17(_0xE9E5)
if not _0xD8EE or not _0x9871 then _0x62C2(string.char(101,114,114,111,114)); break end
local _0x4166 = _0xD8EE:Lerp(_0x9871, _0x30D7)
local _0xFF97, _0x9BA2 = _0x021B(_0x5F86), _0x021B(_0xE9E5)
local _0x71B2
if _0xFF97 and _0x9BA2 then _0x71B2 = _0xFF97:Lerp(_0x9BA2, _0x30D7)
elseif _0xFF97 then _0x71B2 = _0xFF97
elseif _0x9BA2 then _0x71B2 = _0x9BA2 end
_0x8CF1(_0x4166, _0x71B2)
_0x581D(_0x5F86, _0x76A7)
_0x187D.Heartbeat:Wait()
end
end)
end
local function _0x1412(data, _0x2833, num, tower, towerRoute)
if _0x75F5.Running then
_0xF45C(string.char(69,77,32,69,88,69,67,85,195,135,195,131,79),string.char(80,97,114,101,32,97,32,114,111,116,97,32,97,116,117,97,108,32,97,110,116,101,115,32,100,101,32,105,110,105,99,105,97,114,32,111,117,116,114,97,46),string.char(69,114,114,111,114))
return
end
if not data or #data < 2 then
_0xF45C(string.char(82,79,84,65,32,73,78,86,195,129,76,73,68,65),string.char(69,115,115,97,32,114,111,116,97,32,110,195,163,111,32,112,111,115,115,117,105,32,102,114,97,109,101,115,32,115,117,102,105,99,105,101,110,116,101,115,46),string.char(69,114,114,111,114))
return
end
if not _0xFBBE() then
_0xF45C(string.char(80,69,82,83,79,78,65,71,69,77),string.char(80,101,114,115,111,110,97,103,101,109,32,110,195,163,111,32,101,110,99,111,110,116,114,97,100,111,46),string.char(69,114,114,111,114))
return
end
local _0x43E3 = data[1]
local _0x221A = _0x1B17(_0x43E3)
if not _0x221A then _0xF45C(string.char(69,82,82,79),string.char(80,114,105,109,101,105,114,111,32,112,111,110,116,111,32,100,97,32,114,111,116,97,32,105,110,118,195,161,108,105,100,111,46),string.char(69,114,114,111,114)); return end
local _0x38C2 = _0x221A + Vector3.new(0, _0x4E7A.GroundOffset, 0)
_0x75F5.Running = true
_0x75F5.WalkingToStart = true
_0x75F5.Route = data
_0x75F5.Category = _0x2833
_0x75F5.Parkour = num
_0x75F5.Tower = tower
_0x75F5.TowerRoute = towerRoute
_0x75F5.CurrentIndex = 1
_0xE95B(data)
local _0x08FC
if tower then
_0x08FC = tower ==string.char(84,111,114,114,101,32,49)andstring.char(84,111,114,114,101,32,49)orstring.char(84,111,114,114,101,32,50,32,226,128,162,32).. towerRoute
else
_0x08FC =string.char(80,97,114,107,111,117,114,32).. num ..string.char(32,226,128,162,32).. _0x2833
end
local _0x26AA = _0x0F3F.Modo ==string.char(68,117,109,109,121)and not _0xC53C
if _0x26AA then
_0xF45C(string.char(77,65,82,67,65,68,79,82,32,67,82,73,65,68,79),string.char(65,110,100,101,32,97,116,195,169,32,111,32,109,97,114,99,97,100,111,114,32,118,101,114,100,101,32,112,97,114,97,32,105,110,105,99,105,97,114,58,32).. _0x08FC,string.char(79,114,97,110,103,101))
_0x1B08(_0x38C2, _0x021B(_0x43E3))
_0x75F5.WalkConnection = _0x187D.Heartbeat:Connect(function()
if not _0x75F5.Running or not _0x75F5.WalkingToStart then return end
if not _0xFBBE() then _0x62C2(string.char(101,114,114,111,114)); return end
if (_0x8240.Position - _0x38C2).Magnitude <= 5 then
if _0x75F5.WalkConnection then
_0x75F5.WalkConnection:Disconnect()
_0x75F5.WalkConnection = nil
end
_0xCF32()
_0x11C2(_0x08FC)
end
end)
else
_0xF45C(string.char(73,78,68,79,32,80,65,82,65,32,79,32,73,78,195,141,67,73,79), _0x08FC,string.char(79,114,97,110,103,101))
task.spawn(function()
_0x968D(_0x38C2, function() return not _0x75F5.Running end, function(_0x0CB7)
if not _0x75F5.Running then return end
if not _0x0CB7 then _0x62C2(string.char(101,114,114,111,114)) return end
_0x11C2(_0x08FC)
end)
end)
end
end
local function _0x463E()
if not _0xFBBE() then _0xF45C(string.char(69,82,82,79),string.char(80,101,114,115,111,110,97,103,101,109,32,110,195,163,111,32,101,110,99,111,110,116,114,97,100,111,46),string.char(69,114,114,111,114)) return end
local _0x9D9B=_0x8240.CFrame.LookVector
local _0x855D=Vector3.new(_0x9D9B.X,0,_0x9D9B.Z)
if _0x855D.Magnitude<=0 then _0xF45C(string.char(69,82,82,79),string.char(68,105,114,101,195,167,195,163,111,32,105,110,118,195,161,108,105,100,97,46),string.char(69,114,114,111,114)) return end
_0xD945=_0x855D.Unit
_0xF45C(string.char(68,73,82,69,195,135,195,131,79,32,83,65,76,86,65),string.char(68,105,114,101,195,167,195,163,111,32,103,117,97,114,100,97,100,97,32,99,111,109,32,115,117,99,101,115,115,111,33),string.char(83,117,99,99,101,115,115))
end
local function _0x7F42(command)
if _0xD8E0 then _0xF45C(string.char(65,71,85,65,82,68,69),string.char(74,195,161,32,101,115,116,195,161,32,103,105,114,97,110,100,111,46),string.char(69,114,114,111,114)) return end
if not _0xFBBE() then _0xF45C(string.char(69,82,82,79),string.char(80,101,114,115,111,110,97,103,101,109,32,110,195,163,111,32,101,110,99,111,110,116,114,97,100,111,46),string.char(69,114,114,111,114)) return end
_0xD8E0=true
local _0x9F50=_0x0660.AutoRotate _0x0660.AutoRotate=false
local _0x8D15
if command==string.char(68,73,82,69,73,84,65)then _0x8D15=math.rad(-90)
elseif command==string.char(69,83,81,85,69,82,68,65)then _0x8D15=math.rad(90)
elseif command==string.char(82,69,84,65,71,85,65,82,68,65)then _0x8D15=math.rad(180) end
if _0x8D15 then
local _0x4166=_0x8240.Position
local _0xA31A=_0x8240.CFrame*CFrame.Angles(0,_0x8D15,0)
_0x8240.CFrame=CFrame.new(_0x4166)*(_0xA31A-_0xA31A.Position)
end
task.wait()
_0x0660.AutoRotate=_0x9F50
_0xD8E0=false
_0xF45C(command..string.char(32,86,79,76,86,69,82,33),string.char(71,105,114,111,32,101,120,101,99,117,116,97,100,111,46),string.char(83,117,99,99,101,115,115))
end
local function _0x38DC()
if not _0xD945 then _0xF45C(string.char(69,82,82,79),string.char(83,97,108,118,101,32,117,109,97,32,100,105,114,101,195,167,195,163,111,32,112,114,105,109,101,105,114,111,46),string.char(69,114,114,111,114)) return end
if not _0xFBBE() then _0xF45C(string.char(69,82,82,79),string.char(80,101,114,115,111,110,97,103,101,109,32,110,195,163,111,32,101,110,99,111,110,116,114,97,100,111,46),string.char(69,114,114,111,114)) return end
local _0x4166=_0x8240.Position
local _0x9F50=_0x0660.AutoRotate _0x0660.AutoRotate=false
_0x8240.CFrame=CFrame.lookAt(_0x4166,_0x4166+_0xD945)
task.wait()
_0x0660.AutoRotate=_0x9F50
_0xF45C(string.char(86,65,78,71,85,65,82,68,65,32,86,79,76,86,69,82,33),string.char(82,101,116,111,114,110,111,117,32,195,160,32,100,105,114,101,195,167,195,163,111,32,115,97,108,118,97,46),string.char(83,117,99,99,101,115,115))
end
local function _0x8850(_0x4DEA)
_0x4DEA=string.sub(_0x4DEA,1,200)
if _0xB781.ChatVersion==Enum.ChatVersion.TextChatService then
local _0xEA1B=_0xB781:FindFirstChild(string.char(84,101,120,116,67,104,97,110,110,101,108,115))
local _0x43E5=_0xEA1B and _0xEA1B:FindFirstChild(string.char(82,66,88,71,101,110,101,114,97,108))
if _0x43E5 then _0x43E5:SendAsync(_0x4DEA); return true end
end
local _0x651F=_0x6E26:FindFirstChild(string.char(68,101,102,97,117,108,116,67,104,97,116,83,121,115,116,101,109,67,104,97,116,69,118,101,110,116,115))
local _0x0570=_0x651F and _0x651F:FindFirstChild(string.char(83,97,121,77,101,115,115,97,103,101,82,101,113,117,101,115,116))
if _0x0570 then _0x0570:FireServer(_0x4DEA,string.char(65,108,108)); return true end
return false
endlocal function _0xC9E9(_0xB596)
if not _0xF949 then return nil,string.char(69,120,101,99,117,116,111,114,32,115,101,109,32,115,117,112,111,114,116,101,32,97,32,72,84,84,80)end
local _0xBAE4=_0xEE02:JSONEncode({
model=_0x87FF.Modelo,
messages={
{role=string.char(115,121,115,116,101,109),content=_0x87FF.SystemPrompt},
{role=string.char(117,115,101,114),content=_0xB596}
},
temperature=.2,
max_tokens=_0x87FF.MaxTokens or 2048
})
local _0xBF84,_0x4E8D=nil,false
task.spawn(function()
local _0x8C35,_0xD14A=pcall(function()
return _0xF949({
Url=_0x87FF.Endpoint, Method=string.char(80,79,83,84),
Headers={[string.char(67,111,110,116,101,110,116,45,84,121,112,101)]=string.char(97,112,112,108,105,99,97,116,105,111,110,47,106,115,111,110),[string.char(65,117,116,104,111,114,105,122,97,116,105,111,110)]=string.char(66,101,97,114,101,114,32)..IA_CONFIG.ApiKey},
Body=_0xBAE4
})
end)
if _0x8C35 then _0xBF84=_0xD14A end
_0x4E8D=true
end)
local _0x4B9F=os.clock()
while not _0x4E8D and (os.clock()-_0x4B9F)<_0x87FF.Timeout do task.wait(.1) end
if not _0x4E8D then return nil,string.char(84,101,109,112,111,32,101,115,103,111,116,97,100,111)end
if not _0xBF84 then return nil,string.char(70,97,108,104,97,32,110,97,32,114,101,113,117,105,115,105,195,167,195,163,111)end
if not _0xBF84.Body then return nil,string.char(82,101,115,112,111,115,116,97,32,118,97,122,105,97,32,100,111,32,115,101,114,118,105,100,111,114)end
if _0xBF84.StatusCode~=200 then return nil,string.char(72,84,84,80,32)..tostring(_0xBF84.StatusCode) end
local _0xECD1,_0x30DF=pcall(function() return _0xEE02:JSONDecode(_0xBF84.Body) end)
if not _0xECD1 or not _0x30DF.choices or not _0x30DF.choices[1] then return nil,string.char(82,101,115,112,111,115,116,97,32,105,110,118,195,161,108,105,100,97)end
local _0x4DEA = _0x30DF.choices[1].message
if not _0x4DEA then return nil,string.char(82,101,115,112,111,115,116,97,32,118,97,122,105,97)end
local _0x8F93 = _0x4DEA.content
if not _0x8F93 or _0x8F93==""then return nil,string.char(82,101,115,112,111,115,116,97,32,118,97,122,105,97,32,40,97,117,109,101,110,116,101,32,77,97,120,84,111,107,101,110,115,41)end
_0x8F93=_0x8F93:gsub(string.char(94,37,115,43),""):gsub(string.char(37,115,43,36),"")
_0x8F93=_0x8F93:gsub(string.char(94,91,34,39,93,43),""):gsub(string.char(91,34,39,93,43,36),"")
return _0x8F93
endlocal function _0xEFAE(tema)
if not _0xF949 then return nil,string.char(69,120,101,99,117,116,111,114,32,115,101,109,32,115,117,112,111,114,116,101,32,97,32,72,84,84,80)end
if not tema or tema==""then return nil,string.char(84,101,109,97,32,118,97,122,105,111)end
local _0xBAE4 = _0xEE02:JSONEncode({
model = _0xF922.Modelo,
messages = {
{ role =string.char(115,121,115,116,101,109), content = _0xF922.SystemPrompt },
{ role =string.char(117,115,101,114), content =string.char(84,101,109,97,58,32).. tema }
},
temperature = 0.85,
max_tokens = _0xF922.MaxTokens or 2048
})
local _0xBF84, _0x4E8D = nil, false
task.spawn(function()
local _0x8C35, _0xD14A = pcall(function()
return _0xF949({
Url = _0xF922.Endpoint,
Method =string.char(80,79,83,84),
Headers = {
[string.char(67,111,110,116,101,110,116,45,84,121,112,101)] =string.char(97,112,112,108,105,99,97,116,105,111,110,47,106,115,111,110),
[string.char(65,117,116,104,111,114,105,122,97,116,105,111,110)] =string.char(66,101,97,114,101,114,32).. _0xF922.ApiKey
},
Body = _0xBAE4
})
end)
if _0x8C35 then _0xBF84 = _0xD14A end
_0x4E8D = true
end)
local _0x4B9F = os.clock()
while not _0x4E8D and (os.clock() - _0x4B9F) < _0xF922.Timeout do
task.wait(0.1)
end
if not _0x4E8D then return nil,string.char(84,101,109,112,111,32,101,115,103,111,116,97,100,111)end
if not _0xBF84 then return nil,string.char(70,97,108,104,97,32,110,97,32,114,101,113,117,105,115,105,195,167,195,163,111)end
if not _0xBF84.Body then return nil,string.char(82,101,115,112,111,115,116,97,32,118,97,122,105,97,32,100,111,32,115,101,114,118,105,100,111,114)end
if _0xBF84.StatusCode ~= 200 then return nil,string.char(72,84,84,80,32).. tostring(_0xBF84.StatusCode) end
local _0xECD1, _0x30DF = pcall(function()
return _0xEE02:JSONDecode(_0xBF84.Body)
end)
if not _0xECD1 or not _0x30DF.choices or not _0x30DF.choices[1] then
return nil,string.char(82,101,115,112,111,115,116,97,32,105,110,118,195,161,108,105,100,97)end
local _0x4DEA = _0x30DF.choices[1].message
if not _0x4DEA then return nil,string.char(82,101,115,112,111,115,116,97,32,118,97,122,105,97)endlocal _0x8F93 = _0x4DEA.content
if not _0x8F93 or _0x8F93 ==""then return nil,string.char(82,101,115,112,111,115,116,97,32,118,97,122,105,97,32,40,97,117,109,101,110,116,101,32,77,97,120,84,111,107,101,110,115,41)end
_0x8F93 = _0x8F93:gsub(string.char(94,37,115,43),""):gsub(string.char(37,115,43,36),"")
_0x8F93 = _0x8F93:gsub(string.char(94,91,34,39,93,43),""):gsub(string.char(91,34,39,93,43,36),"")
_0x8F93 = _0x8F93:gsub(string.char(94,84,101,109,97,58,37,115,42),"")
_0x8F93 = _0x8F93:gsub(string.char(94,84,101,120,116,111,58,37,115,42),"")
if #_0x8F93 > 220 then
_0x8F93 = _0x8F93:sub(1, 220)
end
return _0x8F93
endlocal _0x7675=_0x4524(string.char(83,99,114,101,101,110,71,117,105))
_0x7675.Name=string.char(90,75,89,95,80,65,82,75,79,85,82)_0x7675.ResetOnSpawn=false _0x7675.IgnoreGuiInset=true
_0x7675.ZIndexBehavior=Enum.ZIndexBehavior.Sibling _0x7675.Parent=_0x3228
local _0x3B21=_0x4524(string.char(84,101,120,116,66,117,116,116,111,110))
_0x3B21.Name=string.char(90,75,89,95,76,111,103,111)_0x3B21.Size=_0xEA31(58,58) _0x3B21.Position=_0xEA31(12,65)
_0x3B21.BackgroundColor3=_0x2E5E(10,10,10) _0x3B21.BorderSizePixel=0 _0x3B21.Text=string.char(239,191,189,239,191,189)_0x3B21.TextColor3=_0xA737.White _0x3B21.TextSize=26 _0x3B21.Font=_0x5ED4
_0x3B21.AutoButtonColor=false _0x3B21.Parent=_0x7675 _0xF6BF(_0x3B21,29) _0x1A8B(_0x3B21,_0xA737.StrokeLight)
local _0x5B0B=_0x4524(string.char(70,114,97,109,101))
_0x5B0B.Name=string.char(77,97,105,110)_0x5B0B.AnchorPoint=_0x426D(.5,.5) _0x5B0B.Position=UDim2.fromScale(.5,.5)
_0x5B0B.Size=UDim2.fromScale(.78,.65) _0x5B0B.BackgroundColor3=_0xA737.Background
_0x5B0B.BorderSizePixel=0 _0x5B0B.Visible=false _0x5B0B.ClipsDescendants=true
_0x5B0B.ZIndex=10 _0x5B0B.Parent=_0x7675 _0xF6BF(_0x5B0B,14) _0x1A8B(_0x5B0B,_0xA737.Stroke)
local _0xDBB5=_0x4524(string.char(70,114,97,109,101))
_0xDBB5.Size=_0x7303(1,-16,0,54) _0xDBB5.Position=_0xEA31(8,8) _0xDBB5.BackgroundColor3=_0xA737.Panel
_0xDBB5.BorderSizePixel=0 _0xDBB5.ZIndex=20 _0xDBB5.Parent=_0x5B0B
_0xF6BF(_0xDBB5,10) _0x1A8B(_0xDBB5,_0xA737.Stroke)
local _0xA72F=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0xA72F.BackgroundTransparency=1 _0xA72F.Position=_0xEA31(13,7) _0xA72F.Size=_0x7303(.55,0,0,23)
_0xA72F.Text=string.char(239,191,189,239,191,189,32,65,75,73,82,65,32,77,69,78,85)_0xA72F.TextColor3=_0xA737.White _0xA72F.TextSize=17
_0xA72F.Font=_0x5ED4 _0xA72F.TextXAlignment=_0xC25C _0xA72F.ZIndex=22 _0xA72F.Parent=_0xDBB5
local _0x287F=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0x287F.BackgroundTransparency=1 _0x287F.Position=_0xEA31(14,31) _0x287F.Size=_0x7303(.65,0,0,15)
_0x287F.Text=string.char(65,117,116,111,32,80,97,114,107,111,117,114,32,226,128,162,32,65,107,105,114,97)_0x287F.TextColor3=_0xA737.DarkGray
_0x287F.TextSize=9 _0x287F.Font=_0xC9E5 _0x287F.TextXAlignment=_0xC25C _0x287F.ZIndex=22 _0x287F.Parent=_0xDBB5
local _0xD660=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0xD660.BackgroundColor3=_0xA737.Card _0xD660.AnchorPoint=_0x426D(.5,.5)
_0xD660.Position=_0x7303(.5,0,.5,0) _0xD660.Size=_0xEA31(55,25) _0xD660.Text=string.char(86,50,46,50,46,49)_0xD660.TextColor3=_0xA737.Gray _0xD660.TextSize=10 _0xD660.Font=_0x5ED4
_0xD660.ZIndex=22 _0xD660.Parent=_0xDBB5 _0xF6BF(_0xD660,8) _0x1A8B(_0xD660,_0xA737.Stroke)
local _0xD337=_0x4524(string.char(84,101,120,116,66,117,116,116,111,110))
_0xD337.Size=_0xEA31(34,34) _0xD337.Position=_0x7303(1,-42,.5,-17)
_0xD337.BackgroundColor3=_0xA737.Card _0xD337.BorderSizePixel=0 _0xD337.Text=string.char(195,151)_0xD337.TextColor3=_0xA737.Gray _0xD337.TextSize=22 _0xD337.Font=_0xC9E5
_0xD337.AutoButtonColor=false _0xD337.ZIndex=25 _0xD337.Parent=_0xDBB5
_0xF6BF(_0xD337,10) _0x1A8B(_0xD337,_0xA737.Stroke)
local _0xAB86=_0x4524(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101))
_0xAB86.Size=_0x7303(0,118,1,-78) _0xAB86.Position=_0xEA31(8,70)
_0xAB86.BackgroundColor3=_0xA737.Panel _0xAB86.BorderSizePixel=0
_0xAB86.ScrollBarThickness=2 _0xAB86.ScrollBarImageColor3=_0xA737.StrokeLight
_0xAB86.AutomaticCanvasSize=Enum.AutomaticSize.Y _0xAB86.ZIndex=20 _0xAB86.Parent=_0x5B0B
_0xF6BF(_0xAB86,10) _0x1A8B(_0xAB86,_0xA737.Stroke) _0x995E(_0xAB86,7,7,6,6)
local _0xCF3F=_0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116))
_0xCF3F.Padding=_0xEA4A(0,5)
_0xCF3F.HorizontalAlignment=Enum.HorizontalAlignment.Center
_0xCF3F.Parent=_0xAB86
local function _0xB9BF(_0x2B3F,selected)
local _0xE9E5=_0x4524(string.char(84,101,120,116,66,117,116,116,111,110))
_0xE9E5.Size=_0x7303(1,0,0,39)
_0xE9E5.BackgroundColor3=selected and _0xA737.Selected or _0xA737.Card
_0xE9E5.BorderSizePixel=0 _0xE9E5.Text=_0x2B3F
_0xE9E5.TextColor3=selected and _0xA737.White or _0xA737.Gray
_0xE9E5.TextSize=9 _0xE9E5.Font=_0x5ED4 _0xE9E5.TextXAlignment=_0xC25C _0xE9E5.AutoButtonColor=false
_0xE9E5.Parent=_0xAB86 _0xF6BF(_0xE9E5,7) _0x995E(_0xE9E5,0,0,8,2) _0x1A8B(_0xE9E5,_0xA737.Stroke)
return _0xE9E5
end
local _0xDAF5 = _0xB9BF(string.char(239,191,189,239,191,189,32,67,82,195,137,68,73,84,79,83), false)
local _0x4E6B = _0xB9BF(string.char(239,191,189,239,191,189,32,69,66,32,68,69,76,84,65), true)
local _0xE20E = _0xB9BF(string.char(239,191,189,239,191,189,32,84,65,70,70,83))
local _0xD47A = _0xB9BF(string.char(226,134,170,32,86,79,76,86,69,82,83), false)
local _0x4CAF = _0xB9BF(string.char(239,191,189,239,191,189,32,73,65,32,67,72,65,84), false)
local _0x07FE = _0xB9BF(string.char(239,191,189,239,191,189,32,67,79,77,66,65,84,69), false)
local _0x8EDF = _0xB9BF(string.char(239,191,189,239,191,189,32,84,69,88,84,79,83,32,80,82,79,78,84,79,83), false)
local _0x874B = _0xB9BF(string.char(239,191,189,239,191,189,32,76,79,74,65), false)
local _0xA513 = _0x4E6B
local _0x30D4=_0x4524(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101))
_0x30D4.Size=_0x7303(1,-134,1,-78) _0x30D4.Position=_0x7303(0,126,0,70)
_0x30D4.BackgroundColor3=_0xA737.Panel _0x30D4.BorderSizePixel=0
_0x30D4.ScrollBarThickness=3 _0x30D4.ScrollBarImageColor3=_0xA737.StrokeLight
_0x30D4.AutomaticCanvasSize=Enum.AutomaticSize.Y _0x30D4.ZIndex=20 _0x30D4.Parent=_0x5B0B
_0xF6BF(_0x30D4,10) _0x1A8B(_0x30D4,_0xA737.Stroke)
local _0xA5D6=_0x4524(string.char(70,114,97,109,101))
_0xA5D6.Size=_0x7303(1,0,0,0) _0xA5D6.AutomaticSize=Enum.AutomaticSize.Y
_0xA5D6.BackgroundTransparency=1 _0xA5D6.Parent=_0x30D4
_0x995E(_0xA5D6,9,9,9,9)
local _0xD116=_0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116))
_0xD116.Padding=_0xEA4A(0,7) _0xD116.Parent=_0xA5D6
local function _0xC52E()
for _,_0x5B52 in ipairs(_0xA5D6:GetChildren()) do
if _0x5B52:IsA(string.char(71,117,105,79,98,106,101,99,116)) then _0x5B52:Destroy() end
end
endlocal _0x2857 = {}
function _0x2857.Help(parent)
local _0x360A = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), parent)
_0x360A.Size = _0xEA31(14,14)
_0x360A.BackgroundColor3 = _0x2E5E(35,35,45)
_0x360A.BorderSizePixel = 0
_0x360A.Text =string.char(63)_0x360A.TextColor3 = _0xA737.DarkGray
_0x360A.Font = _0x5ED4
_0x360A.TextSize = 9
_0x360A.AutoButtonColor = false
_0x360A.ZIndex = 5
_0xF6BF(_0x360A, 7)
return _0x360A
end
function _0x2857.Toggle(parent, ordem, _0xB596, inicial, callback)
local _0x92DA = _0x4524(string.char(70,114,97,109,101), parent)
_0x92DA.Size = _0x7303(1,0,0,28)
_0x92DA.BackgroundTransparency = 1
_0x92DA.LayoutOrder = ordem
local _0x695B = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0x92DA)
_0x695B.BackgroundTransparency = 1
_0x695B.Position = _0xEA31(0,0)
_0x695B.Size = _0x7303(1,-90,1,0)
_0x695B.Text = _0xB596
_0x695B.TextColor3 = _0xA737.Gray
_0x695B.Font = _0xC9E5
_0x695B.TextSize = 10
_0x695B.TextXAlignment = _0xC25C
local _0x47BF = _0x2857.Help(_0x92DA)
_0x47BF.AnchorPoint = _0x426D(1,0.5)
_0x47BF.Position = _0x7303(1,-48,0.5,0)
local _0x5772 = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), _0x92DA)
_0x5772.AnchorPoint = _0x426D(1,.5)
_0x5772.Position = _0x7303(1,0,.5,0)
_0x5772.Size = _0xEA31(38,20)
_0x5772.BackgroundColor3 = _0x2E5E(40,40,50)
_0x5772.BorderSizePixel = 0
_0x5772.Text =""_0x5772.AutoButtonColor = false
_0xF6BF(_0x5772, 10)
local _0x4695 = _0x4524(string.char(70,114,97,109,101), _0x5772)
_0x4695.Size = _0xEA31(14,14)
_0x4695.Position = _0xEA31(3,3)
_0x4695.BackgroundColor3 = _0x2E5E(120,120,130)
_0x4695.BorderSizePixel = 0
_0xF6BF(_0x4695, 7)
local _0x1C74 = inicial
local function _0x3F7A(_0xB138)
_0x1C74 = _0xB138
if _0xB138 then
_0x5772.BackgroundColor3 = _0xA737.Purple
_0x4695.Position = _0xEA31(21,3)
_0x4695.BackgroundColor3 = _0x2E5E(255,255,255)
else
_0x5772.BackgroundColor3 = _0x2E5E(40,40,50)
_0x4695.Position = _0xEA31(3,3)
_0x4695.BackgroundColor3 = _0x2E5E(120,120,130)
end
end
_0x3F7A(_0x1C74)
_0x5772.MouseButton1Click:Connect(function() _0x3F7A(not _0x1C74) callback(_0x1C74) end)
return _0x92DA
end
function _0x2857.Dropdown(parent, ordem, label, _0x96EF, atual, callback)
local _0xEA19 = _0x4524(string.char(70,114,97,109,101), parent)
_0xEA19.Size = _0x7303(1,0,0,0)
_0xEA19.AutomaticSize = Enum.AutomaticSize.Y
_0xEA19.BackgroundTransparency = 1
_0xEA19.LayoutOrder = ordem
local _0x31CC = _0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _0xEA19)
_0x31CC.Padding = _0xEA4A(0,6)
_0x31CC.SortOrder = Enum.SortOrder.LayoutOrder
_0x31CC.Parent = _0xEA19
local _0x92DA = _0x4524(string.char(70,114,97,109,101), _0xEA19)
_0x92DA.Size = _0x7303(1,0,0,14)
_0x92DA.BackgroundTransparency = 1
_0x92DA.LayoutOrder = 1
local _0x695B = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0x92DA)
_0x695B.BackgroundTransparency = 1
_0x695B.Size = _0x7303(1,-20,1,0)
_0x695B.Text = label
_0x695B.TextColor3 = _0xA737.Gray
_0x695B.Font = _0xC9E5
_0x695B.TextSize = 10
_0x695B.TextXAlignment = _0xC25C
local _0x47BF = _0x2857.Help(_0x92DA)
_0x47BF.AnchorPoint = _0x426D(1,.5)
_0x47BF.Position = _0x7303(1,0,.5,0)
local _0x5A1C = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), _0xEA19)
_0x5A1C.Size = _0x7303(1,0,0,30)
_0x5A1C.BackgroundColor3 = _0x2E5E(18,18,24)
_0x5A1C.BorderSizePixel = 0
_0x5A1C.Text =""_0x5A1C.AutoButtonColor = false
_0x5A1C.LayoutOrder = 2
_0xF6BF(_0x5A1C, 6)
_0x1A8B(_0x5A1C, _0xA737.Stroke, 1)
local _0x6293 = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0x5A1C)
_0x6293.BackgroundTransparency = 1
_0x6293.Position = _0xEA31(10,0)
_0x6293.Size = _0x7303(1,-30,1,0)
_0x6293.Text = atual
_0x6293.TextColor3 = _0xA737.White
_0x6293.Font = _0x5ED4
_0x6293.TextSize = 10
_0x6293.TextXAlignment = _0xC25C
local _0x9CA9 = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0x5A1C)
_0x9CA9.AnchorPoint = _0x426D(1,.5)
_0x9CA9.Position = _0x7303(1,-10,.5,0)
_0x9CA9.Size = _0xEA31(14,14)
_0x9CA9.BackgroundTransparency = 1
_0x9CA9.Text =string.char(226,150,188)_0x9CA9.TextColor3 = _0xA737.DarkGray
_0x9CA9.Font = _0x5ED4
_0x9CA9.TextSize = 9
local _0xCF33 = _0x4524(string.char(70,114,97,109,101), _0xEA19)
_0xCF33.Size = _0x7303(1,0,0,0)
_0xCF33.BackgroundColor3 = _0x2E5E(16,16,22)
_0xCF33.BorderSizePixel = 0
_0xCF33.ClipsDescendants = true
_0xCF33.LayoutOrder = 3
_0xCF33.Visible = false
_0xF6BF(_0xCF33, 6)
_0x1A8B(_0xCF33, _0xA737.Stroke, 1)
local _0xFFB1 = _0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _0xCF33)
_0xFFB1.Padding = _0xEA4A(0,1)
_0xFFB1.SortOrder = Enum.SortOrder.LayoutOrder
_0xFFB1.Parent = _0xCF33
local _0xC5DA = 26
local _0x8492 = #_0x96EF * _0xC5DA
local _0xEF64 = { aberto=false }
local function _0x6E68()
_0xEF64.aberto = false
_0xCF33.Visible = false
_0xCF33.Size = _0x7303(1,0,0,0)
end
local function _0xDADD()
_0xEF64.aberto = true
_0xCF33.Visible = true
_0xCF33.Size = _0x7303(1,0,0,_0x8492)
end
for _0xA98B,op in ipairs(_0x96EF) do
local _0xE9E5 = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), _0xCF33)
_0xE9E5.Size = _0x7303(1,0,0,_0xC5DA)
_0xE9E5.BackgroundColor3 = _0x2E5E(16,16,22)
_0xE9E5.BorderSizePixel = 0
_0xE9E5.Text =string.char(32,32,32)..op
_0xE9E5.TextColor3 = (op==atual) and _0xA737.PurpleLight or _0xA737.Gray
_0xE9E5.Font = _0x5ED4
_0xE9E5.TextSize = 10
_0xE9E5.TextXAlignment = _0xC25C
_0xE9E5.AutoButtonColor = false
_0xE9E5.LayoutOrder = _0xA98B
_0xE9E5.MouseEnter:Connect(function() _0xE9E5.BackgroundColor3 = _0x2E5E(28,28,36) end)
_0xE9E5.MouseLeave:Connect(function() _0xE9E5.BackgroundColor3 = _0x2E5E(16,16,22) end)
_0xE9E5.MouseButton1Click:Connect(function()
_0x6293.Text = op
callback(op)
_0x6E68()
end)
end
_0x5A1C.MouseButton1Click:Connect(function()
if _0xEF64.aberto then _0x6E68() else _0xDADD() end
end)
end
function _0x2857.Slider(parent, ordem, titulo, valor, min, max, isDec, callback)
local _0xEA19 = _0x4524(string.char(70,114,97,109,101), parent)
_0xEA19.Size = _0x7303(1,0,0,50)
_0xEA19.BackgroundTransparency = 1
_0xEA19.LayoutOrder = ordem
local _0x695B = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0xEA19)
_0x695B.BackgroundTransparency = 1
_0x695B.Position = _0xEA31(0,0)
_0x695B.Size = _0x7303(1,-60,0,14)
_0x695B.Text = titulo
_0x695B.TextColor3 = _0xA737.Gray
_0x695B.Font = _0xC9E5
_0x695B.TextSize = 10
_0x695B.TextXAlignment = _0xC25C
local _0x83D5 = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0xEA19)
_0x83D5.AnchorPoint = _0x426D(1,0)
_0x83D5.Position = _0x7303(1,-22,0,0)
_0x83D5.Size = _0xEA31(50,14)
_0x83D5.BackgroundTransparency = 1
_0x83D5.Text = isDec and string.format(string.char(37,46,50,102),valor) or tostring(valor)
_0x83D5.TextColor3 = _0xA737.White
_0x83D5.Font = _0x5ED4
_0x83D5.TextSize = 10
_0x83D5.TextXAlignment = Enum.TextXAlignment.Right
local _0x47BF = _0x2857.Help(_0xEA19)
_0x47BF.AnchorPoint = _0x426D(1,0)
_0x47BF.Position = _0x7303(1,0,0,0)
local _0x8BD3 = _0x4524(string.char(70,114,97,109,101), _0xEA19)
_0x8BD3.Position = _0xEA31(0,24)
_0x8BD3.Size = _0x7303(1,0,0,6)
_0x8BD3.BackgroundColor3 = _0x2E5E(35,35,45)
_0x8BD3.BorderSizePixel = 0
_0xF6BF(_0x8BD3, 3)
local _0xE6FB = (valor-min)/(max-min)
local _0x85E6 = _0x4524(string.char(70,114,97,109,101), _0x8BD3)
_0x85E6.Size = _0x7303(_0xE6FB,0,1,0)
_0x85E6.BackgroundColor3 = _0xA737.Purple
_0x85E6.BorderSizePixel = 0
_0xF6BF(_0x85E6, 3)
local _0xF7CF = _0x4524(string.char(70,114,97,109,101), _0x8BD3)
_0xF7CF.AnchorPoint = _0x426D(.5,.5)
_0xF7CF.Position = _0x7303(_0xE6FB,0,.5,0)
_0xF7CF.Size = _0xEA31(12,12)
_0xF7CF.BackgroundColor3 = _0x2E5E(255,255,255)
_0xF7CF.BorderSizePixel = 0
_0xF7CF.ZIndex = 2
_0xF6BF(_0xF7CF, 6)
local _0xFCF6 = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), _0xEA19)
_0xFCF6.Position = _0xEA31(0,16)
_0xFCF6.Size = _0x7303(1,0,0,24)
_0xFCF6.BackgroundTransparency = 1
_0xFCF6.Text =""_0xFCF6.AutoButtonColor = false
local _0xC360 = false
local function _0x2E1B(_0x20CC)
local _0x45A1 = math.clamp((_0x20CC-_0x8BD3.AbsolutePosition.X)/math.max(_0x8BD3.AbsoluteSize.X,1),0,1)
local _0xB138
if isDec then
_0xB138 = min + (max-min)*_0x45A1
_0x83D5.Text = string.format(string.char(37,46,50,102),_0xB138)
else
_0xB138 = math.floor(min + (max-min)*_0x45A1 + .5)
_0x83D5.Text = tostring(_0xB138)
end
_0x85E6.Size = _0x7303(_0x45A1,0,1,0)
_0xF7CF.Position = _0x7303(_0x45A1,0,.5,0)
callback(_0xB138)
end
_0xFCF6.InputBegan:Connect(function(_0xA98B)
if _0xA98B.UserInputType==Enum.UserInputType.MouseButton1 or _0xA98B.UserInputType==Enum.UserInputType.Touch then
_0x30D4.ScrollingEnabled=false _0xC360=true
_0x2E1B(_0xA98B.Position.X)
end
end)
_0x4E58.InputChanged:Connect(function(_0xA98B)
if _0xC360 and (_0xA98B.UserInputType==Enum.UserInputType.MouseMovement or _0xA98B.UserInputType==Enum.UserInputType.Touch) then
_0x2E1B(_0xA98B.Position.X)
end
end)
_0x4E58.InputEnded:Connect(function(_0xA98B)
if _0xA98B.UserInputType==Enum.UserInputType.MouseButton1 or _0xA98B.UserInputType==Enum.UserInputType.Touch then
if _0xC360 then _0xC360=false _0x30D4.ScrollingEnabled=true end
end
end)
end
function _0x2857.TextBox(parent, ordem, label, placeholder, valor, callback)
local _0xEA19 = _0x4524(string.char(70,114,97,109,101), parent)
_0xEA19.Size = _0x7303(1,0,0,54)
_0xEA19.BackgroundTransparency = 1
_0xEA19.LayoutOrder = ordem
local _0x695B = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0xEA19)
_0x695B.BackgroundTransparency = 1
_0x695B.Position = _0xEA31(0,0)
_0x695B.Size = _0x7303(1,-20,0,14)
_0x695B.Text = label
_0x695B.TextColor3 = _0xA737.Gray
_0x695B.Font = _0xC9E5
_0x695B.TextSize = 10
_0x695B.TextXAlignment = _0xC25C
local _0x47BF = _0x2857.Help(_0xEA19)
_0x47BF.AnchorPoint = _0x426D(1,0)
_0x47BF.Position = _0x7303(1,0,0,0)
local _0x5A1C = _0x4524(string.char(84,101,120,116,66,111,120), _0xEA19)
_0x5A1C.Position = _0xEA31(0,20)
_0x5A1C.Size = _0x7303(1,0,0,30)
_0x5A1C.BackgroundColor3 = _0x2E5E(18,18,24)
_0x5A1C.BorderSizePixel = 0
_0x5A1C.Text = valor or""_0x5A1C.PlaceholderText = placeholder or""_0x5A1C.PlaceholderColor3 = _0xA737.DarkGray
_0x5A1C.TextColor3 = _0xA737.White
_0x5A1C.Font = _0xC9E5
_0x5A1C.TextSize = 10
_0x5A1C.TextXAlignment = _0xC25C
_0x5A1C.ClearTextOnFocus = false
_0xF6BF(_0x5A1C, 6)
_0x1A8B(_0x5A1C, _0xA737.Stroke, 1)
_0x995E(_0x5A1C, 0,0,10,10)
_0x5A1C.FocusLost:Connect(function() callback(_0x5A1C.Text) end)
return _0x5A1C
end
function _0x2857.ActionButton(parent, ordem, _0xB596, corBg, callback)
local _0xE9E5 = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), parent)
_0xE9E5.Size = _0x7303(1,0,0,32)
_0xE9E5.BackgroundColor3 = corBg or _0x2E5E(30,30,40)
_0xE9E5.BorderSizePixel = 0
_0xE9E5.Text = _0xB596
_0xE9E5.TextColor3 = _0xA737.White
_0xE9E5.Font = _0x5ED4
_0xE9E5.TextSize = 10
_0xE9E5.AutoButtonColor = false
_0xE9E5.LayoutOrder = ordem
_0xF6BF(_0xE9E5, 6)
_0x1A8B(_0xE9E5, _0xA737.Stroke, 1)
_0xE9E5.MouseButton1Click:Connect(callback)
return _0xE9E5
end
function _0x2857.Card(parent, ordem, titulo)
local _0x3F04 = _0x4524(string.char(70,114,97,109,101), parent)
_0x3F04.Size = _0x7303(1,0,0,0)
_0x3F04.AutomaticSize = Enum.AutomaticSize.Y
_0x3F04.BackgroundColor3 = _0x2E5E(22,22,28)
_0x3F04.BorderSizePixel = 0
_0x3F04.LayoutOrder = ordem
_0xF6BF(_0x3F04, 8)
_0x995E(_0x3F04, 14, 14, 14, 14)
local _0x31CC = _0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _0x3F04)
_0x31CC.Padding = _0xEA4A(0,12)
_0x31CC.SortOrder = Enum.SortOrder.LayoutOrder
_0x31CC.Parent = _0x3F04
if titulo then
local _0x65EC = _0x4524(string.char(70,114,97,109,101), _0x3F04)
_0x65EC.Size = _0x7303(1,0,0,20)
_0x65EC.BackgroundTransparency = 1
_0x65EC.LayoutOrder = -1
local _0x360A = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0x65EC)
_0x360A.BackgroundTransparency = 1
_0x360A.Position = _0xEA31(0,0)
_0x360A.Size = _0x7303(1,0,0,16)
_0x360A.Text = titulo
_0x360A.TextColor3 = _0xA737.White
_0x360A.Font = _0x5ED4
_0x360A.TextSize = 12
_0x360A.TextXAlignment = _0xC25C
local _0x7E62 = _0x4524(string.char(70,114,97,109,101), _0x65EC)
_0x7E62.Position = _0xEA31(0,18)
_0x7E62.Size = _0x7303(0,36,0,2)
_0x7E62.BackgroundColor3 = _0xA737.Purple
_0x7E62.BorderSizePixel = 0
_0xF6BF(_0x7E62, 1)
end
return _0x3F04
end
local function _0x07A7(parent, ordem)
local _0x530D = _0x4524(string.char(70,114,97,109,101), parent)
_0x530D.Size = _0x7303(1,0,0,0)
_0x530D.AutomaticSize = Enum.AutomaticSize.Y
_0x530D.BackgroundTransparency = 1
_0x530D.LayoutOrder = ordem
local _0x31CC = _0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _0x530D)
_0x31CC.FillDirection = Enum.FillDirection.Horizontal
_0x31CC.Padding = _0xEA4A(0, 10)
_0x31CC.SortOrder = Enum.SortOrder.LayoutOrder
_0x31CC.Parent = _0x530D
local _0xA6AE = _0x4524(string.char(70,114,97,109,101), _0x530D)
_0xA6AE.Size = _0x7303(0.5, -5, 0, 0)
_0xA6AE.AutomaticSize = Enum.AutomaticSize.Y
_0xA6AE.BackgroundTransparency = 1
_0xA6AE.LayoutOrder = 1
local _0x0505 = _0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _0xA6AE)
_0x0505.Padding = _0xEA4A(0, 10)
_0x0505.SortOrder = Enum.SortOrder.LayoutOrder
_0x0505.Parent = _0xA6AE
local _0x7CB8 = _0x4524(string.char(70,114,97,109,101), _0x530D)
_0x7CB8.Size = _0x7303(0.5, -5, 0, 0)
_0x7CB8.AutomaticSize = Enum.AutomaticSize.Y
_0x7CB8.BackgroundTransparency = 1
_0x7CB8.LayoutOrder = 2
local _0xD84B = _0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _0x7CB8)
_0xD84B.Padding = _0xEA4A(0, 10)
_0xD84B.SortOrder = Enum.SortOrder.LayoutOrder
_0xD84B.Parent = _0x7CB8
return _0xA6AE, _0x7CB8
endlocal _0x2667 = {
{ Name=string.char(84,65,70,32,40,67,73,71,83,41), Emoji=string.char(239,191,189,239,191,189), Color=_0x2E5E(255, 180, 50), Fields={
{string.char(239,191,189,239,191,189,32,84,65,70),string.char(84,101,115,116,101,32,100,101,32,65,112,116,105,100,195,163,111,32,70,195,173,115,105,99,97,58,32,67,73,71,83)},
{string.char(239,191,189,239,191,189,239,184,143,32,67,111,109,97,110,100,97,110,116,101),string.char(83,97,103,97,115)},
{string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101),string.char(68,101,115,101,108,101,103,97,110,116)},
{string.char(239,191,189,239,191,189,32,76,101,109,97),string.char(84,114,101,105,110,97,114,32,112,97,114,97,32,114,101,115,105,115,116,105,114,32,38,32,67,111,109,98,97,116,101,114,32,112,97,114,97,32,118,101,110,99,101,114,46)},
{string.char(239,191,189,239,191,189,32,80,114,111,110,111,109,101,115),string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,71,117,101,114,114,101,105,114,111,32,100,101,32,83,101,108,118,97,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,71,117,101,114,114,101,105,114,111,115,32,100,101,32,83,101,108,118,97,46)},
{string.char(239,191,189,239,191,189,32,73,110,195,173,99,105,111),string.char(82,101,116,105,114,97,114,32,98,111,105,110,97,44,32,100,97,114,32,115,97,117,100,97,195,167,195,181,101,115,32,97,111,32,105,110,115,116,114,117,116,111,114,32,101,32,112,97,115,115,97,114,32,112,101,108,111,115,32,101,115,99,117,100,111,115,46)}
}},
{ Name=string.char(67,73,69), Emoji=string.char(239,191,189,239,191,189,239,184,143,226,128,141,226,153,130,239,184,143), Color=_0x2E5E(70,130,180), Fields={
{string.char(239,191,189,239,191,189,239,184,143,226,128,141,226,153,130,239,184,143,32,67,73,69),string.char(65,103,101,110,116,101,46)},
{string.char(239,191,189,239,191,189,32,67,114,105,97,100,111,114),string.char(118,105,99,111,102,106,103,102,104,102)},
{string.char(239,191,189,239,191,189,32,83,117,98,32,99,114,105,97,100,111,114),string.char(82,73,80,95,100,97,98,102,106,56,119)},
{string.char(239,191,189,239,191,189,239,184,143,32,67,111,109,97,110,100,97,110,116,101),string.char(101,114,105,113,117,114,114,114,46)},
{string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101),string.char(82,111,100,114,105,103,111,112,97,111,56)},
{string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,181,101,115),string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,65,103,101,110,116,101,115,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,70,97,110,116,97,115,109,97,115,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,65,103,101,110,116,101,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,70,97,110,116,97,115,109,97,46)},
{string.char(239,191,189,239,191,189,32,76,101,109,97,32,67,73,69),string.char(73,110,116,101,108,105,103,195,170,110,99,105,97,32,112,97,114,97,32,86,105,116,195,179,114,105,97,32,38,32,83,97,98,101,114,32,112,97,114,97,32,80,114,101,118,101,114,46)}
}},
{ Name=string.char(82,69,67,32,77,69,67), Emoji=string.char(239,191,189,239,191,189), Color=_0x2E5E(220,180,60), Fields={
{string.char(239,191,189,239,191,189,32,82,69,67,32,77,69,67),string.char(67,97,118,97,108,101,105,114,111,115,46)},
{string.char(239,191,189,239,191,189,32,67,111,109,97,110,100,97,110,116,101),string.char(116,101,114,114,111,95,50,52,51,51,46)},
{string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101),string.char(67,111,110,116,97,110,117,109,53,98,108)},
{string.char(239,191,189,239,191,189,32,76,101,109,97),string.char(72,97,118,101,114,195,161,32,115,101,109,112,114,101,32,117,109,97,32,67,97,118,97,108,97,114,105,97,33,44,32,65,195,167,111,32,110,97,32,109,101,110,116,101,44,32,109,111,116,111,114,32,110,111,32,112,101,105,116,111,32,101,32,104,111,110,114,97,32,110,97,32,109,105,115,115,195,163,111,33)},
{string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,181,101,115),string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,67,97,118,97,108,101,105,114,111,115,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,67,97,118,97,108,101,105,114,111,46)},
{string.char(239,191,189,239,191,189,239,184,143,32,76,105,99,101,110,195,167,97),string.char(76,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,101,115,32,67,97,118,97,108,101,105,114,111,115,46,32,47,32,76,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,32,67,97,118,97,108,101,105,114,111,46)},
{string.char(239,191,189,239,191,189,32,67,111,109,32,108,105,99,101,110,195,167,97),string.char(67,111,109,32,108,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,101,115,32,67,97,118,97,108,101,105,114,111,115,46,32,47,32,67,111,109,32,108,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,32,67,97,118,97,108,101,105,114,111,46)},
{string.char(239,191,189,239,191,189,32,67,111,109,97,110,100,111,115),string.char(65,84,69,78,195,135,195,131,79,32,84,85,82,78,79,44,32,80,82,69,80,65,82,65,82,32,80,65,82,65,32,77,65,82,67,72,65,82,33,32,47,32,65,84,69,78,195,135,195,131,79,32,84,85,82,78,79,44,32,77,65,82,67,72,69,77,33,32,47,32,65,84,69,78,195,135,195,131,79,32,80,69,76,79,84,195,131,79,44,32,80,82,69,80,65,82,65,82,32,80,65,82,65,32,77,65,82,67,72,65,82,33,32,47,32,65,84,69,78,195,135,195,131,79,32,80,69,76,79,84,195,131,79,44,32,77,65,82,67,72,69,77,33)}
}},
{ Name=string.char(66,80,69), Emoji=string.char(239,191,189,239,191,189,239,184,143), Color=_0x2E5E(60,180,120), Fields={
{string.char(239,191,189,239,191,189,239,184,143,32,66,80,69),string.char(80,111,108,195,173,99,105,97,32,100,111,32,69,120,195,169,114,99,105,116,111)},
{string.char(239,191,189,239,191,189,32,67,111,109,97,110,100,97,110,116,101),string.char(122,67,111,115,116,97,115,122,46)},
{string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101),string.char(77,97,116,104,101,117,115,108,105,110,100,111,53,56,55,46)},
{string.char(239,191,189,239,191,189,32,76,101,109,97),string.char(79,114,105,101,110,116,97,114,32,111,32,82,101,115,112,111,110,115,195,161,118,101,108,44,32,67,111,114,114,105,103,105,114,32,111,32,73,114,114,101,115,112,111,110,115,195,161,118,101,108,44,32,80,114,101,110,100,101,114,32,111,32,73,110,99,111,114,114,105,103,195,173,118,101,108,46)},
{string.char(239,191,189,239,191,189,32,80,114,111,110,111,109,101,115,32,47,32,83,97,117,100,97,195,167,195,181,101,115),string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,80,111,108,105,99,105,97,105,115,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,80,111,108,105,99,105,97,108,46)}
}},
{ Name=string.char(66,70,69,32,40,70,97,110,116,97,115,109,97,41), Emoji=string.char(239,191,189,239,191,189), Color=_0x2E5E(200,70,70), Fields={
{string.char(239,191,189,239,191,189,32,66,70,69),string.char(70,97,110,116,97,115,109,97,46)},
{string.char(239,191,189,239,191,189,32,67,114,105,97,100,111,114),string.char(78,65,84,65,78,72,77,69,76,76,79,52,46)},
{string.char(239,191,189,239,191,189,32,67,114,105,97,100,111),string.char(49,57,56,51,46)},
{string.char(239,191,189,239,191,189,239,184,143,32,69,115,99,117,100,111),string.char(79,32,101,115,99,117,100,111,32,100,111,32,66,70,69,32,112,111,115,115,117,105,32,102,117,110,100,111,32,112,114,101,116,111,32,99,111,109,32,98,111,114,100,97,115,32,97,109,97,114,101,108,97,115,46,32,78,111,32,99,101,110,116,114,111,44,32,104,195,161,32,117,109,32,112,97,114,97,113,117,101,100,97,115,32,98,114,97,110,99,111,32,106,117,110,116,111,32,100,101,32,117,109,97,32,102,97,99,97,32,118,101,114,109,101,108,104,97,44,32,115,105,109,98,111,108,105,122,97,110,100,111,32,111,112,101,114,97,195,167,195,181,101,115,32,101,115,112,101,99,105,97,105,115,32,101,32,99,111,109,98,97,116,101,46,32,78,97,32,112,97,114,116,101,32,105,110,102,101,114,105,111,114,44,32,97,112,97,114,101,99,101,32,97,32,102,97,105,120,97,32,100,101,32,70,111,114,195,167,97,115,32,69,115,112,101,99,105,97,105,115,46)},
{string.char(239,191,189,239,191,189,32,67,111,109,97,110,100,97,110,116,101),string.char(82,101,110,97,110,70,111,120,105,121,46)},
{string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101),string.char(84,73,76,65,80,73,65,95,80,82,79,70,73,83,83,73,79,78,65,76,46)},
{string.char(239,191,189,239,191,189,32,76,101,109,97),string.char(81,117,97,108,113,117,101,114,32,109,105,115,115,195,163,111,44,32,101,109,32,113,117,97,108,113,117,101,114,32,108,117,103,97,114,44,32,97,32,113,117,97,108,113,117,101,114,32,104,111,114,97,44,32,100,101,32,113,117,97,108,113,117,101,114,32,109,97,110,101,105,114,97,46)},
{string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,181,101,115),string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,70,97,110,116,97,115,109,97,115,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,70,97,110,116,97,115,109,97,46)},
{string.char(239,191,189,239,191,189,239,184,143,32,76,105,99,101,110,195,167,97),string.char(67,111,109,32,108,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,101,115,32,70,97,110,116,97,115,109,97,115,46,32,47,32,67,111,109,32,108,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,32,70,97,110,116,97,115,109,97,46)}
}},
{ Name=string.char(66,73,80), Emoji=string.char(239,191,189,239,191,189), Color=_0x2E5E(200, 200, 100), Fields={
{string.char(239,191,189,239,191,189,32,66,73,80),string.char(66,97,116,97,108,104,195,163,111,32,100,101,32,73,110,102,97,110,116,97,114,105,97,32,80,97,114,97,113,117,101,100,105,115,116,97,46)},
{string.char(239,191,189,239,191,189,32,67,111,109,97,110,100,97,110,116,101),""},
{string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101),""},
{string.char(239,191,189,239,191,189,32,76,101,109,97),string.char(80,97,114,97,113,117,101,100,105,115,116,97,115,44,32,115,101,109,112,114,101,32,112,114,111,110,116,111,115,32,112,97,114,97,32,97,32,109,105,115,115,195,163,111,44,32,100,111,32,99,195,169,117,32,97,111,32,99,104,195,163,111,46)},
{string.char(239,191,189,239,191,189,32,77,105,115,115,195,163,111),string.char(77,97,110,116,101,114,32,97,32,116,114,111,112,97,32,112,114,111,110,116,97,32,112,97,114,97,32,97,116,117,97,114,32,101,109,32,109,105,115,115,195,181,101,115,32,97,101,114,111,116,101,114,114,101,115,116,114,101,115,44,32,99,111,109,32,100,105,115,99,105,112,108,105,110,97,44,32,99,111,114,97,103,101,109,32,101,32,112,114,111,110,116,105,100,195,163,111,46)},
{string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,181,101,115),string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,80,97,114,97,113,117,101,100,105,115,116,97,115,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,80,97,114,97,113,117,101,100,105,115,116,97,46)},
{string.char(239,191,189,239,191,189,239,184,143,32,76,105,99,101,110,195,167,97),string.char(67,111,109,32,108,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,101,115,32,80,97,114,97,113,117,101,100,105,115,116,97,115,46,32,47,32,67,111,109,32,108,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,32,80,97,114,97,113,117,101,100,105,115,116,97,46)},
{string.char(239,191,189,239,191,189,32,71,114,105,116,111,32,100,101,32,71,117,101,114,114,97),string.char(80,65,82,65,81,85,69,68,73,83,84,65,33)}
}},
{ Name=string.char(66,83,69), Emoji=string.char(239,191,189,239,191,189), Color=_0x2E5E(100, 150, 200), Fields={
{string.char(239,191,189,239,191,189,32,66,83,69),string.char(66,97,116,97,108,104,195,163,111,32,83,101,110,116,105,110,101,108,97,32,68,101,32,69,108,105,116,101)},
{string.char(239,191,189,239,191,189,32,67,111,109,97,110,100,97,110,116,101),string.char(97,105,122,101,100,97,109,97,110,103,97,57,49,52,57)},
{string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101),string.char(100,97,118,105,115,105,108,118,97,48,49,57,52)},
{string.char(239,191,189,239,191,189,32,76,101,109,97),string.char(83,101,110,116,105,110,101,108,97,32,100,101,32,69,108,105,116,101,44,32,102,105,114,109,101,115,32,110,97,32,109,105,115,115,195,163,111,59,32,104,111,110,114,97,32,101,32,100,105,115,99,105,112,108,105,110,97,44,32,110,111,115,115,97,32,116,114,97,100,105,195,167,195,163,111,33)},
{string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,181,101,115),string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,115,101,110,116,105,110,101,108,97,115,33,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,115,101,110,116,105,110,101,108,97,33,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,110,111,98,114,101,115,32,115,101,110,116,105,110,101,108,97,115,33,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,110,111,98,114,101,32,115,101,110,116,105,110,101,108,97,33)},
{string.char(239,191,189,239,191,189,239,184,143,32,67,111,109,32,108,105,99,101,110,195,167,97),string.char(67,111,109,32,108,105,99,101,110,195,167,97,44,32,115,101,110,104,111,114,32,115,101,110,116,105,110,101,108,97,33,32,47,32,67,111,109,32,108,105,99,101,110,195,167,97,44,32,110,111,98,114,101,115,32,115,101,110,116,105,110,101,108,97,115,33,32,47,32,67,111,109,32,108,105,99,101,110,195,167,97,44,32,110,111,98,114,101,32,115,101,110,116,105,110,101,108,97,33)}
}},
{ Name=string.char(66,65,67), Emoji=string.char(239,191,189,239,191,189), Color=_0x2E5E(220,100,50), Fields={
{string.char(239,191,189,239,191,189,32,73,78,70,79,82,77,65,195,135,195,149,69,83,32,66,65,67),string.char(66,97,116,97,108,104,195,163,111,32,100,101,32,65,195,167,195,181,101,115,32,100,101,32,67,111,109,97,110,100,111,115)},
{string.char(239,191,189,239,191,189,32,68,111,110,111),string.char(77,97,116,101,117,115,72,103,122)},
{string.char(239,191,189,239,191,189,239,184,143,32,67,111,109,97,110,100,97,110,116,101),string.char(83,97,115,117,107,101,101,80,114,111,50,48,50,46)},
{string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101),string.char(68,97,110,105,101,108,83,120,83,50,46)},
{string.char(239,191,189,239,191,189,32,76,101,109,97,32,100,97,32,66,65,67),string.char(79,32,109,195,161,120,105,109,111,32,100,101,32,99,111,110,102,117,115,195,163,111,44,32,109,111,114,116,101,32,101,32,100,101,115,116,114,117,105,195,167,195,163,111,32,110,97,32,114,101,116,97,103,117,97,114,100,97,32,100,111,32,105,110,105,109,105,103,111,46)},
{string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,181,101,115),string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,32,67,111,109,97,110,100,111,46,32,47,32,83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,67,111,109,97,110,100,111,115,46)}
}},
{ Name=string.char(67,89,66,69,82), Emoji=string.char(239,191,189,239,191,189), Color=_0x2E5E(150,100,200), Fields={
{string.char(239,191,189,239,191,189,32,67,89,66,69,82),string.char(67,111,109,97,110,100,111,32,100,101,32,68,101,102,101,115,97,32,67,105,98,101,114,110,195,169,116,105,99,97,46)},
{string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,181,101,115),string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,65,110,97,108,105,115,116,97,115,46)},
{string.char(239,191,189,239,191,189,32,67,114,105,97,100,111,114),string.char(119,65,110,84,101,101,49,54,106,53,49,53,54,46)},
{string.char(239,191,189,239,191,189,32,68,111,110,111),string.char(77,97,120,84,104,101,74,112,49,46,32,47,32,73,116,115,77,101,76,121,114,105,111,46,32,47,32,71,97,98,114,105,101,108,50,52,52,52,113,46)},
{string.char(239,191,189,239,191,189,239,184,143,32,67,111,109,97,110,100,97,110,116,101),string.char(104,105,103,104,97,110,100,100,114,121,57,56)},
{string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101),string.char(78,195,163,111,32,116,101,109,46)},
{string.char(239,191,189,239,191,189,32,76,101,109,97),string.char(83,101,103,117,114,97,110,195,167,97,32,110,111,32,99,105,98,101,114,101,115,112,97,195,167,111,44,32,115,111,98,101,114,97,110,105,97,32,112,97,114,97,32,97,32,78,97,195,167,195,163,111,46)},
{string.char(239,191,189,239,191,189,239,184,143,32,74,85,82,65,77,69,78,84,79),string.char(74,85,82,79,32,71,85,65,82,68,65,82,32,83,73,71,73,76,79,32,83,79,66,82,69,32,84,85,68,79,32,81,85,69,32,86,69,82,32,69,32,79,85,86,82,73,82,32,78,79,32,67,79,77,68,67,73,66,69,82,33)}
}},
{ Name=string.char(67,65,65,84,73,78,71,65), Emoji=string.char(239,191,189,239,191,189), Color=_0x2E5E(50,150,80), Fields={
{string.char(239,191,189,239,191,189,32,67,65,65,84,73,78,71,65),string.char(71,117,97,114,100,105,195,181,101,115,32,100,97,32,67,97,97,116,105,110,103,97,46)},
{string.char(239,191,189,239,191,189,32,67,111,109,97,110,100,97,110,116,101),string.char(71,97,98,114,105,101,108,99,109,48,52)},
{string.char(239,191,189,239,191,189,239,184,143,32,83,117,98,99,111,109,97,110,100,97,110,116,101),string.char(80,108,107,95,76,110,49,55)},
{string.char(239,191,189,239,191,189,32,76,101,109,97),string.char(79,32,112,97,105,32,99,114,105,97,44,32,97,32,109,195,163,101,32,101,100,117,99,97,32,101,32,97,32,67,97,97,116,105,110,103,97,32,101,108,105,109,105,110,97,46)},
{string.char(239,191,189,239,191,189,32,83,97,117,100,97,195,167,195,163,111),string.char(83,97,117,100,97,195,167,195,181,101,115,44,32,115,101,110,104,111,114,101,115,32,103,117,97,114,100,105,195,181,101,115,32,100,97,32,67,97,97,116,105,110,103,97,46)}
}}
}
local function _0x1115(label,value,order,parent,color)
local _0x3F04=_0x4524(string.char(70,114,97,109,101))
_0x3F04.Size=_0x7303(1,0,0,48) _0x3F04.BackgroundColor3=_0xA737.Card
_0x3F04.BorderSizePixel=0 _0x3F04.LayoutOrder=order _0x3F04.Parent=parent
_0xF6BF(_0x3F04,8) _0x1A8B(_0x3F04,_0xA737.Stroke,1)
local _0x2B3F=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0x2B3F.BackgroundTransparency=1 _0x2B3F.Position=_0xEA31(10,5) _0x2B3F.Size=_0x7303(1,-82,1,-10)
_0x2B3F.Text=label..string.char(58,32)..value _0x2B3F.TextColor3=_0xA737.White
_0x2B3F.TextSize=10 _0x2B3F.Font=_0xC9E5 _0x2B3F.TextWrapped=true
_0x2B3F.TextXAlignment=_0xC25C _0x2B3F.TextYAlignment=Enum.TextYAlignment.Center _0x2B3F.Parent=_0x3F04
local _0xC9EC=_0x4524(string.char(84,101,120,116,66,117,116,116,111,110))
_0xC9EC.AnchorPoint=_0x426D(1,.5) _0xC9EC.Position=_0x7303(1,-7,.5,0)
_0xC9EC.Size=_0xEA31(58,29) _0xC9EC.BackgroundColor3=_0xA737.Success _0xC9EC.BorderSizePixel=0
_0xC9EC.Text=string.char(67,111,112,105,97,114)_0xC9EC.TextColor3=_0xA737.White _0xC9EC.TextSize=9
_0xC9EC.Font=_0x5ED4 _0xC9EC.AutoButtonColor=false _0xC9EC.Parent=_0x3F04
_0xF6BF(_0xC9EC,7) _0x1A8B(_0xC9EC,_0xA737.StrokeLight,1)
_0xC9EC.Activated:Connect(function()
if typeof(setclipboard)~=string.char(102,117,110,99,116,105,111,110)then
_0xF45C(string.char(67,79,80,73,65,82),string.char(83,101,117,32,101,120,101,99,117,116,111,114,32,110,195,163,111,32,112,111,115,115,117,105,32,115,101,116,99,108,105,112,98,111,97,114,100,46),string.char(69,114,114,111,114))
return
end
local _0x8C35=pcall(function() setclipboard(value) end)
if _0x8C35 then
_0xC9EC.Text=string.char(226,156,147)_0xC9EC.BackgroundColor3=_0xA737.Success
_0xF45C(string.char(67,79,80,73,65,68,79),string.char(73,110,102,111,114,109,97,195,167,195,163,111,32,99,111,112,105,97,100,97,46),string.char(83,117,99,99,101,115,115))
task.delay(.9,function()
if _0xC9EC.Parent then _0xC9EC.Text=string.char(67,111,112,105,97,114)_0xC9EC.BackgroundColor3=_0xA737.Success end
end)
end
end)
end
local function _0x685A()
_0x04FA=string.char(84,65,70,70,83)_0xC52E()
local _0xABA7=_0x4524(string.char(70,114,97,109,101))
_0xABA7.Size=_0x7303(1,0,0,70) _0xABA7.BackgroundColor3=_0x2E5E(45,35,20)
_0xABA7.BorderSizePixel=0 _0xABA7.LayoutOrder=0 _0xABA7.Parent=_0xA5D6
_0xF6BF(_0xABA7,8) _0x1A8B(_0xABA7,_0xA737.Orange,1.5)
local _0x8D4E=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0x8D4E.BackgroundTransparency=1 _0x8D4E.Position=_0xEA31(12,8) _0x8D4E.Size=_0xEA31(30,30)
_0x8D4E.Text=string.char(226,154,160,239,184,143)_0x8D4E.TextSize=20 _0x8D4E.TextColor3=_0xA737.White
_0x8D4E.Font=_0x5ED4 _0x8D4E.TextXAlignment=_0x666C
_0x8D4E.TextYAlignment=Enum.TextYAlignment.Center _0x8D4E.Parent=_0xABA7
local _0x8D67=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0x8D67.BackgroundTransparency=1 _0x8D67.Position=_0xEA31(48,8)
_0x8D67.Size=_0x7303(1,-130,0,35)
_0x8D67.Text=string.char(68,101,115,101,106,97,32,97,100,105,99,105,111,110,97,114,32,97,115,32,105,110,102,111,114,109,97,195,167,195,181,101,115,32,84,65,70,70,83,32,101,109,32,117,109,32,109,101,110,117,32,115,101,99,117,110,100,195,161,114,105,111,63)_0x8D67.TextColor3=_0xA737.White _0x8D67.TextSize=10 _0x8D67.Font=_0x5ED4
_0x8D67.TextWrapped=true _0x8D67.TextXAlignment=_0xC25C
_0x8D67.TextYAlignment=Enum.TextYAlignment.Top _0x8D67.Parent=_0xABA7
local _0xD479=_0x4524(string.char(84,101,120,116,66,117,116,116,111,110))
_0xD479.AnchorPoint=_0x426D(1,.5) _0xD479.Position=_0x7303(1,-12,.5,0)
_0xD479.Size=_0xEA31(70,34) _0xD479.BackgroundColor3=_0xA737.Success
_0xD479.BorderSizePixel=0 _0xD479.Text=string.char(226,150,182,32,83,73,77)_0xD479.TextColor3=_0xA737.White
_0xD479.TextSize=10 _0xD479.Font=_0x5ED4 _0xD479.AutoButtonColor=false _0xD479.Parent=_0xABA7
_0xF6BF(_0xD479,8)
_0xD479.MouseButton1Click:Connect(function()
local _0x8C35 = pcall(function()
loadstring(game:HttpGet(string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,121,121,112,56,117,52,88,116)))()
end)
if _0x8C35 then _0xF45C(string.char(77,69,78,85,32,83,69,67,85,78,68,195,129,82,73,79),string.char(84,65,70,70,83,32,97,100,105,99,105,111,110,97,100,111,32,99,111,109,32,115,117,99,101,115,115,111,33),string.char(83,117,99,99,101,115,115))
else _0xF45C(string.char(69,82,82,79),string.char(70,97,108,104,97,32,97,111,32,99,97,114,114,101,103,97,114,32,111,32,109,101,110,117,32,115,101,99,117,110,100,195,161,114,105,111,46),string.char(69,114,114,111,114)) end
end)
local _0x4170=_0x4524(string.char(70,114,97,109,101))
_0x4170.Size=_0x7303(1,0,0,58) _0x4170.BackgroundColor3=_0xA737.Card _0x4170.BorderSizePixel=0
_0x4170.LayoutOrder=1 _0x4170.Parent=_0xA5D6 _0xF6BF(_0x4170,9) _0x1A8B(_0x4170,_0xA737.StrokeLight,1)
local _0x1FA2=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0x1FA2.BackgroundTransparency=1 _0x1FA2.Position=_0xEA31(12,7) _0x1FA2.Size=_0x7303(1,-24,0,25)
_0x1FA2.Text=string.char(239,191,189,239,191,189,32,84,65,70,70,83)_0x1FA2.TextColor3=_0xA737.White _0x1FA2.TextSize=16
_0x1FA2.Font=_0x5ED4 _0x1FA2.TextXAlignment=_0xC25C _0x1FA2.Parent=_0x4170
local _0xC389=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0xC389.BackgroundTransparency=1 _0xC389.Position=_0xEA31(13,34) _0xC389.Size=_0x7303(1,-26,0,15)
_0xC389.Text=string.char(73,110,102,111,114,109,97,195,167,195,181,101,115,32,100,97,115,32,111,114,103,97,110,105,122,97,195,167,195,181,101,115,32,109,105,108,105,116,97,114,101,115)_0xC389.TextColor3=_0xA737.DarkGray
_0xC389.TextSize=9 _0xC389.Font=_0xC9E5 _0xC389.TextXAlignment=_0xC25C _0xC389.Parent=_0x4170
for idx,div in ipairs(_0x2667) do
local _0x619B=_0x4524(string.char(70,114,97,109,101))
_0x619B.Size=_0x7303(1,0,0,0) _0x619B.AutomaticSize=Enum.AutomaticSize.Y
_0x619B.BackgroundColor3=_0xA737.Card _0x619B.BorderSizePixel=0
_0x619B.LayoutOrder=idx+1 _0x619B.Parent=_0xA5D6
_0xF6BF(_0x619B,8) _0x1A8B(_0x619B,div.Color,2)
local _0x7227=_0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116))
_0x7227.FillDirection=Enum.FillDirection.Vertical
_0x7227.HorizontalAlignment=Enum.HorizontalAlignment.Center
_0x7227.SortOrder=Enum.SortOrder.LayoutOrder
_0x7227.Padding=_0xEA4A(0,5) _0x7227.Parent=_0x619B
local _0xFCD3=_0x4524(string.char(70,114,97,109,101))
_0xFCD3.Size=_0x7303(1,0,0,38) _0xFCD3.BackgroundColor3=div.Color
_0xFCD3.BackgroundTransparency=0.2 _0xFCD3.BorderSizePixel=0
_0xFCD3.LayoutOrder=0 _0xFCD3.Parent=_0x619B _0xF6BF(_0xFCD3,8)
local _0xBD5E=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0xBD5E.BackgroundTransparency=1 _0xBD5E.Position=_0xEA31(12,0)
_0xBD5E.Size=_0x7303(1,-24,1,0) _0xBD5E.Text=div.Emoji..string.char(32,32)..div.Name
_0xBD5E.TextColor3=_0xA737.White _0xBD5E.TextSize=14 _0xBD5E.Font=_0x5ED4
_0xBD5E.TextXAlignment=_0xC25C _0xBD5E.TextYAlignment=Enum.TextYAlignment.Center
_0xBD5E.Parent=_0xFCD3
for _0xA98B,field in ipairs(div.Fields) do
_0x1115(field[1],field[2],_0xA98B,_0x619B,div.Color)
end
end
_0x30D4.CanvasPosition=_0x426D()
endlocal _0x3C19 =string.char(80,97,114,107,111,117,114)local function _0x77FB()
local _0xA6AE, _0x7CB8 = _0x07A7(_0xA5D6, 1)
local function _0x2211(parent, num)
local _0x3F04 = _0x2857.Card(parent, num,string.char(80,97,114,107,111,117,114,32)..num)
local _0x944E = _0xAA13[num] orstring.char(76,101,110,116,111)_0x2857.Dropdown(_0x3F04, 1,string.char(86,101,108,111,99,105,100,97,100,101), _0xA36A, _0x944E, function(op)
_0xAA13[num] = op
end)
local _0xD867 = _0x75F5.Running and _0x75F5.Parkour==num and not _0x75F5.Tower
_0x2857.ActionButton(_0x3F04, 2, _0xD867 andstring.char(80,97,114,97,114)or (string.char(73,110,105,99,105,97,114,32,80,97,114,107,111,117,114,32)..num),
_0x2E5E(28,28,36), function()
if _0x75F5.Running and _0x75F5.Parkour==num and not _0x75F5.Tower then
_0x62C2(string.char(99,97,110,99,101,108,108,101,100)); ShowEBDelta(); return
end
local _0x2833 = _0xAA13[num] orstring.char(76,101,110,116,111)local _0x5168 = _0xCBC9[_0x2833]
local _0xD20D = _0x5168 and _0x5168[num]
if not _0xD20D then
_0xF45C(string.char(82,79,84,65,32,78,195,131,79,32,69,78,67,79,78,84,82,65,68,65),string.char(80,97,114,107,111,117,114,32)..num..string.char(32,226,128,162,32)..cat,string.char(69,114,114,111,114))
return
end
_0x1412(_0xD20D, _0x2833, num)
task.wait(.1) ShowEBDelta()
end)
end
_0x2211(_0xA6AE, 1)
_0x2211(_0x7CB8, 2)
_0x2211(_0xA6AE, 3)
_0x2211(_0x7CB8, 4)
end
local function _0x5714()
local _0xA6AE, _0x7CB8 = _0x07A7(_0xA5D6, 1)
do
local _0x3F04 = _0x2857.Card(_0xA6AE, 1,string.char(84,111,114,114,101,32,49))
_0x2857.Dropdown(_0x3F04, 1,string.char(86,101,114,115,195,163,111), {string.char(195,154,110,105,99,97)},string.char(195,154,110,105,99,97), function(op) end)
local _0xD867 = _0x75F5.Running and _0x75F5.Tower==string.char(84,111,114,114,101,32,49)_0x2857.ActionButton(_0x3F04, 2, _0xD867 andstring.char(80,97,114,97,114)orstring.char(73,110,105,99,105,97,114,32,84,111,114,114,101,32,49),
_0x2E5E(28,28,36), function()
if _0x75F5.Running and _0x75F5.Tower==string.char(84,111,114,114,101,32,49)then
_0x62C2(string.char(99,97,110,99,101,108,108,101,100)); ShowEBDelta(); return
end
local _0xD20D = _0xBD9D[string.char(84,111,114,114,101,32,49)][string.char(195,154,110,105,99,97)]
if not _0xD20D then
_0xF45C(string.char(82,79,84,65,32,78,195,131,79,32,67,65,82,82,69,71,65,68,65),string.char(65,32,114,111,116,97,32,100,97,32,84,111,114,114,101,32,49,32,110,195,163,111,32,102,111,105,32,101,110,99,111,110,116,114,97,100,97,46),string.char(69,114,114,111,114))
return
end
_0x1412(_0xD20D, nil, nil,string.char(84,111,114,114,101,32,49),string.char(195,154,110,105,99,97))
task.wait(.1) ShowEBDelta()
end)
end
do
local _0x3F04 = _0x2857.Card(_0x7CB8, 1,string.char(84,111,114,114,101,32,50))
_0x2857.Dropdown(_0x3F04, 1,string.char(86,101,114,115,195,163,111), _0xF051, _0x7994, function(op)
_0x7994 = op
end)
local _0xD867 = _0x75F5.Running and _0x75F5.Tower==string.char(84,111,114,114,101,32,50)_0x2857.ActionButton(_0x3F04, 2, _0xD867 andstring.char(80,97,114,97,114)orstring.char(73,110,105,99,105,97,114,32,84,111,114,114,101,32,50),
_0x2E5E(28,28,36), function()
if _0x75F5.Running and _0x75F5.Tower==string.char(84,111,114,114,101,32,50)then
_0x62C2(string.char(99,97,110,99,101,108,108,101,100)); ShowEBDelta(); return
end
local _0xD20D = _0xBD9D[string.char(84,111,114,114,101,32,50)][_0x7994]
if not _0xD20D then
_0xF45C(string.char(82,79,84,65,32,78,195,131,79,32,67,65,82,82,69,71,65,68,65),string.char(84,111,114,114,101,32,50,32,226,128,162,32)..selectedTower2Route,string.char(69,114,114,111,114))
return
end
_0x1412(_0xD20D, nil, nil,string.char(84,111,114,114,101,32,50), _0x7994)
task.wait(.1) ShowEBDelta()
end)
end
endlocal _0x1636
do
local _0x0631,_0xB03F,_0x6FC2,_0x29EF,_0xEF2F=false,53,2,308,true
local _0xE704,_0x8F01,_0xB8EC,_0xD431=0,{},0,0
local _0x4ECA,_0x4550
local function _0x45AE(ligado)
if not _0x4ECA or not _0x4ECA.Parent then return end
_0x4ECA.Text = ligado andstring.char(80,97,114,97,114,32,65,117,116,111,32,74,74,83)orstring.char(73,110,105,99,105,97,114,32,65,117,116,111,32,74,74,83)endlocal function _0xA77E(obj)
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
local function _0x3F26(obj)
if obj.ClassName~=string.char(73,109,97,103,101,66,117,116,116,111,110)then return false end
if obj.Name~=string.char(73,110,112,117,116,84,101,109,112,108,97,116,101)then return false end
if not obj.Visible then return false end
local _0x7808=obj.AbsoluteSize
if _0x7808.X<20 or _0x7808.Y<20 or _0x7808.X>200 or _0x7808.Y>200 then return false end
local _0xEC82=obj.AbsolutePosition
if _0xEC82.X<=0 or _0xEC82.Y<=0 then return false end
return true
end
local function _0x2958(obj)
local _0x4166=obj.AbsolutePosition local _0x4B9A=obj.AbsoluteSize
local _0xA932=_0x4166.X+_0x4B9A.X/2 local _0xDE0D=_0x4166.Y+_0x4B9A.Y/2
return math.floor(_0xA932/40)..string.char(95)..math.floor(_0xDE0D/40)
endtask.spawn(function()
while true do
task.wait(0.08)
if not _0x0631 then continue end
if _0xEF2F and _0xE704 >= _0x29EF then
_0x0631 = false
_0x45AE(false)
_0xF45C(string.char(65,85,84,79,32,74,74,83),string.char(77,101,116,97,32,97,116,105,110,103,105,100,97,58,32)..jjsFeitos..string.char(47)..META,string.char(83,117,99,99,101,115,115))
continue
end
local _0x929D=_0xB03F/100
local _0xD1C7=tick()
for _0x8D80,_0x30DF in pairs(_0x8F01) do
if _0xD1C7-_0x30DF.t>2.5 then _0x8F01[_0x8D80]=nil end
end
local _0x0610=false
for _,_0x6B2C in ipairs(_0x3228:GetChildren()) do
if _0x6B2C:IsA(string.char(83,99,114,101,101,110,71,117,105)) and _0x6B2C~=_0x7675 then
for _,obj in ipairs(_0x6B2C:GetDescendants()) do
if _0x3F26(obj) then
_0xD431=tick()
local _0x8D80=_0x2958(obj)
local _0x30DF=_0x8F01[_0x8D80]
if not _0x30DF then
_0x8F01[_0x8D80]={_0xC7BB=0,_0xA76E=tick()}
_0x30DF=_0x8F01[_0x8D80]
end
_0x30DF.t=tick()
if _0x30DF.count<_0x6FC2 then
_0xA77E(obj)
_0x30DF.count=_0x30DF.count+1
_0xB8EC=_0xB8EC+1
_0x0610=true
if _0x30DF.count==1 then _0xE704=_0xE704+1 end
end
end
end
end
end
if _0x0610 then task.wait(_0x929D) else task.wait(0.02) end
end
end)
task.spawn(function()
while true do
task.wait(0.3)
if _0x4550 and _0x4550.Parent then
if _0xEF2F then
_0x4550.Text=string.format(string.char(74,74,115,58,32,37,100,47,37,100),_0xE704,_0x29EF)
_0x4550.TextColor3 = (_0xE704>=_0x29EF) and _0xA737.Success or _0xA737.Orange
else
_0x4550.Text=string.format(string.char(74,74,115,58,32,37,100,32,40,115,101,109,32,109,101,116,97,41),_0xE704)
_0x4550.TextColor3 = _0xA737.PurpleLight
end
end
end
end)
_0x1636=function()
local _0x3F04 = _0x2857.Card(_0xA5D6, 1,string.char(65,117,116,111,32,74,74,83))
_0x2857.Toggle(_0x3F04, 1,string.char(65,116,105,118,97,114,32,65,117,116,111,32,74,74,83), _0x0631, function(_0xB138) _0x0631 = _0xB138 end)
local _0xCA0F
local function _0x8028()
if not _0xCA0F then return end
if _0xEF2F then
_0xCA0F.TextEditable = true
_0xCA0F.TextColor3 = _0xA737.White
_0xCA0F.BackgroundColor3 = _0x2E5E(18,18,24)
_0xCA0F.PlaceholderColor3 = _0xA737.DarkGray
else
_0xCA0F.TextEditable = false
_0xCA0F.TextColor3 = _0xA737.DarkGray
_0xCA0F.BackgroundColor3 = _0x2E5E(13,13,17)
_0xCA0F.PlaceholderColor3 = _0x2E5E(70,70,80)
end
end
_0x2857.Toggle(_0x3F04, 2,string.char(65,116,105,118,97,114,32,77,101,116,97), _0xEF2F, function(_0xB138)
_0xEF2F = _0xB138
_0x8028()
if _0xB138 then
_0xF45C(string.char(65,85,84,79,32,74,74,83),string.char(77,101,116,97,32,97,116,105,118,97,100,97,46,32,65,108,118,111,58,32)..META,string.char(83,117,99,99,101,115,115))
else
_0xF45C(string.char(65,85,84,79,32,74,74,83),string.char(77,101,116,97,32,100,101,115,97,116,105,118,97,100,97,46,32,67,97,109,112,111,32,98,108,111,113,117,101,97,100,111,46),string.char(79,114,97,110,103,101))
end
end)
_0xCA0F = _0x2857.TextBox(_0x3F04, 3,string.char(81,117,97,110,116,105,100,97,100,101,32,76,105,109,105,116,101,32,69,120,97,116,97),string.char(69,120,58,32,51,48,56), tostring(_0x29EF), function(_0x8F93)
local _0xB138 = tonumber(_0x8F93)
if _0xB138 and _0xB138>0 then _0x29EF=_0xB138 end
end)
_0x8028()
_0x2857.Slider(_0x3F04, 4,string.char(68,101,108,97,121), _0xB03F, 1, 100, false, function(_0xB138) _0xB03F = _0xB138 end)
_0x4550 = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0x3F04)
_0x4550.Size = _0x7303(1,0,0,14)
_0x4550.BackgroundTransparency = 1
_0x4550.Text = _0xEF2F and (string.char(74,74,115,58,32,48,47)..META) orstring.char(74,74,115,58,32,48,32,40,115,101,109,32,109,101,116,97,41)_0x4550.TextColor3 = _0xA737.Orange
_0x4550.Font = _0x5ED4
_0x4550.TextSize = 10
_0x4550.TextXAlignment = _0xC25C
_0x4550.LayoutOrder = 5
_0x4ECA = _0x2857.ActionButton(_0x3F04, 6,string.char(73,110,105,99,105,97,114,32,65,117,116,111,32,74,74,83), _0x2E5E(28,28,36), function()
if not _0x0631 and _0xE704 >= _0x29EF then
_0xE704 = 0
_0xB8EC = 0
_0x8F01 = {}
end
_0x0631 = not _0x0631
_0x45AE(_0x0631)
if _0x0631 then _0xD431=tick() end
end)
_0x2857.ActionButton(_0x3F04, 7,string.char(82,101,115,101,116,97,114,32,67,111,110,116,97,100,111,114), _0x2E5E(24,24,30), function()
_0xE704 = 0
_0xB8EC = 0
_0x8F01 = {}
_0xF45C(string.char(65,85,84,79,32,74,74,83),string.char(67,111,110,116,97,100,111,114,32,114,101,115,101,116,97,100,111,46),string.char(83,117,99,99,101,115,115))
end)
end
end
local function _0x94FE()
local _0x3F04 = _0x2857.Card(_0xA5D6, 1,string.char(71,101,114,97,108))
_0x2857.Toggle(_0x3F04, 1,string.char(68,101,115,97,116,105,118,97,114,32,68,117,109,109,105,101,115,32,40,73,114,32,68,105,114,101,116,111,47,77,111,118,101,84,111,41), _0xC53C, function(_0xB138)
_0xC53C = _0xB138
_0x0F3F.Modo = _0xB138 andstring.char(68,105,114,101,116,111)orstring.char(68,117,109,109,121)end)
_0x2857.Toggle(_0x3F04, 2,string.char(77,111,115,116,114,97,114,32,76,105,110,104,97,115,32,40,65,112,101,110,97,115,32,80,97,114,107,111,117,114,41), _0x69E3, function(_0xB138)
_0x69E3 = _0xB138
_0x3654 = _0xB138
end)
_0x2857.ActionButton(_0x3F04, 3,string.char(76,105,109,112,97,114,32,68,117,109,109,105,101,115,32,101,32,82,111,116,97,115,32,80,101,110,100,101,110,116,101,115), _0x2E5E(30,30,40), function()
if _0x75F5.Running then _0x62C2(string.char(99,97,110,99,101,108,108,101,100)) end
_0xCF32()
_0xCACA()
_0xF45C(string.char(76,73,77,80,69,90,65),string.char(68,117,109,109,105,101,115,32,101,32,114,111,116,97,115,32,112,101,110,100,101,110,116,101,115,32,114,101,109,111,118,105,100,111,115,46),string.char(83,117,99,99,101,115,115))
end)
end
function ShowEBDelta()
_0x04FA =string.char(69,66,68,101,108,116,97)_0xC52E()
local _0xFF13 = _0x4524(string.char(70,114,97,109,101), _0xA5D6)
_0xFF13.Size = _0x7303(1,0,0,30)
_0xFF13.BackgroundTransparency = 1
_0xFF13.LayoutOrder = 0
local _0xEC42 = _0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _0xFF13)
_0xEC42.FillDirection = Enum.FillDirection.Horizontal
_0xEC42.Padding = _0xEA4A(0,18)
_0xEC42.VerticalAlignment = Enum.VerticalAlignment.Center
_0xEC42.Parent = _0xFF13
local _0x3EB7 = {
{Nome=string.char(80,97,114,107,111,117,114,115), Id=string.char(80,97,114,107,111,117,114)},
{Nome=string.char(84,111,114,114,101,115), Id=string.char(84,111,114,114,101,115)},
{Nome=string.char(67,111,110,102,105,103,117,114,97,195,167,195,181,101,115), Id=string.char(67,111,110,102,105,103,117,114,97,99,97,111)},
{Nome=string.char(65,117,116,111,109,97,195,167,195,181,101,115), Id=string.char(65,117,116,111,109,97,99,97,111)}
}
for _, tab in ipairs(_0x3EB7) do
local _0x0A89 = _0x3C19 == tab.Id
local _0xE9E5 = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), _0xFF13)
_0xE9E5.Size = _0xEA31(110, 28)
_0xE9E5.BackgroundTransparency = 1
_0xE9E5.Text = tab.Nome
_0xE9E5.TextColor3 = _0x0A89 and _0xA737.White or _0xA737.DarkGray
_0xE9E5.Font = _0x5ED4
_0xE9E5.TextSize = 12
_0xE9E5.AutoButtonColor = false
_0xE9E5.TextXAlignment = Enum.TextXAlignment.Center
_0xE9E5.MouseButton1Click:Connect(function()
_0x3C19 = tab.Id
ShowEBDelta()
end)
if _0x0A89 then
local _0x7E62 = _0x4524(string.char(70,114,97,109,101), _0xE9E5)
_0x7E62.AnchorPoint = _0x426D(0.5,1)
_0x7E62.Position = _0x7303(0.5,0,1,-2)
_0x7E62.Size = _0x7303(0.6,0,0,2)
_0x7E62.BackgroundColor3 = _0xA737.Purple
_0x7E62.BorderSizePixel = 0
_0xF6BF(_0x7E62,1)
end
end
if _0x3C19==string.char(84,111,114,114,101,115)then
_0x5714()
elseif _0x3C19==string.char(80,97,114,107,111,117,114)then
_0x77FB()
elseif _0x3C19==string.char(65,117,116,111,109,97,99,97,111)then
_0x1636()
else
_0x94FE()
end
_0x30D4.CanvasPosition=_0x426D()
endlocal function _0xC085()
_0x04FA=string.char(86,111,108,118,101,114,115)_0xC52E()
local _0x4170=_0x4524(string.char(70,114,97,109,101))
_0x4170.Size=_0x7303(1,0,0,58) _0x4170.BackgroundColor3=_0xA737.Card _0x4170.BorderSizePixel=0
_0x4170.LayoutOrder=0 _0x4170.Parent=_0xA5D6 _0xF6BF(_0x4170,9) _0x1A8B(_0x4170,_0xA737.StrokeLight,1)
local _0x1FA2=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0x1FA2.BackgroundTransparency=1 _0x1FA2.Position=_0xEA31(12,7) _0x1FA2.Size=_0x7303(1,-24,0,25)
_0x1FA2.Text=string.char(226,134,170,32,86,79,76,86,69,82,83)_0x1FA2.TextColor3=_0xA737.White _0x1FA2.TextSize=16
_0x1FA2.Font=_0x5ED4 _0x1FA2.TextXAlignment=_0xC25C _0x1FA2.Parent=_0x4170
local _0xC389=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0xC389.BackgroundTransparency=1 _0xC389.Position=_0xEA31(13,34) _0xC389.Size=_0x7303(1,-26,0,15)
_0xC389.Text=string.char(67,111,109,97,110,100,111,115,32,100,101,32,102,111,114,109,97,195,167,195,163,111,32,226,128,147,32,90,65,89,75,32,86,79,76,86,69,82,83,32,86,50)_0xC389.TextColor3=_0xA737.DarkGray
_0xC389.TextSize=9 _0xC389.Font=_0xC9E5 _0xC389.TextXAlignment=_0xC25C _0xC389.Parent=_0x4170
local _0xABA7=_0x4524(string.char(70,114,97,109,101))
_0xABA7.Size=_0x7303(1,0,0,70) _0xABA7.BackgroundColor3=_0x2E5E(45,35,20)
_0xABA7.BorderSizePixel=0 _0xABA7.LayoutOrder=1 _0xABA7.Parent=_0xA5D6
_0xF6BF(_0xABA7,8) _0x1A8B(_0xABA7,_0xA737.Orange,1.5)
local _0x8D4E=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0x8D4E.BackgroundTransparency=1 _0x8D4E.Position=_0xEA31(12,8) _0x8D4E.Size=_0xEA31(30,30)
_0x8D4E.Text=string.char(226,154,160,239,184,143)_0x8D4E.TextSize=20 _0x8D4E.TextColor3=_0xA737.White
_0x8D4E.Font=_0x5ED4 _0x8D4E.TextXAlignment=_0x666C
_0x8D4E.TextYAlignment=Enum.TextYAlignment.Center _0x8D4E.Parent=_0xABA7
local _0x8D67=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0x8D67.BackgroundTransparency=1 _0x8D67.Position=_0xEA31(48,8)
_0x8D67.Size=_0x7303(1,-130,0,35)
_0x8D67.Text=string.char(68,101,115,101,106,97,32,101,120,101,99,117,116,97,114,32,111,115,32,99,111,109,97,110,100,111,115,32,86,111,108,118,101,114,115,32,101,109,32,117,109,32,109,101,110,117,32,115,101,99,117,110,100,195,161,114,105,111,63)_0x8D67.TextColor3=_0xA737.White _0x8D67.TextSize=10 _0x8D67.Font=_0x5ED4
_0x8D67.TextWrapped=true _0x8D67.TextXAlignment=_0xC25C
_0x8D67.TextYAlignment=Enum.TextYAlignment.Top _0x8D67.Parent=_0xABA7
local _0xD479=_0x4524(string.char(84,101,120,116,66,117,116,116,111,110))
_0xD479.AnchorPoint=_0x426D(1,.5) _0xD479.Position=_0x7303(1,-12,.5,0)
_0xD479.Size=_0xEA31(70,34) _0xD479.BackgroundColor3=_0xA737.Success
_0xD479.BorderSizePixel=0 _0xD479.Text=string.char(226,150,182,32,83,73,77)_0xD479.TextColor3=_0xA737.White
_0xD479.TextSize=10 _0xD479.Font=_0x5ED4 _0xD479.AutoButtonColor=false _0xD479.Parent=_0xABA7
_0xF6BF(_0xD479,8)
_0xD479.MouseButton1Click:Connect(function()
local _0x8C35 = pcall(function()
loadstring(game:HttpGet(string.char(104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,90,114,122,72,65,101,110,113)))()
end)
if _0x8C35 then _0xF45C(string.char(77,69,78,85,32,83,69,67,85,78,68,195,129,82,73,79),string.char(86,111,108,118,101,114,32,97,98,101,114,116,111,32,99,111,109,32,115,117,99,101,115,115,111,33),string.char(83,117,99,99,101,115,115))
else _0xF45C(string.char(69,82,82,79),string.char(70,97,108,104,97,32,97,111,32,99,97,114,114,101,103,97,114,32,111,32,109,101,110,117,32,115,101,99,117,110,100,195,161,114,105,111,46),string.char(69,114,114,111,114)) end
end)
local _0x2FDD={
{ _0x08FC=string.char(226,151,134,32,83,65,76,86,65,82,32,80,79,83,73,195,135,195,131,79), desc=string.char(83,97,108,118,97,32,115,111,109,101,110,116,101,32,112,97,114,97,32,111,110,100,101,32,111,32,112,101,114,115,111,110,97,103,101,109,32,101,115,116,195,161,32,111,108,104,97,110,100,111,46), highlight=true, action=_0x463E },
{ _0x08FC=string.char(68,73,82,69,73,84,65,32,86,79,76,86,69,82,33), desc=string.char(71,105,114,97,32,57,48,194,176,32,112,97,114,97,32,97,32,100,105,114,101,105,116,97,46), highlight=false, action=function() _0x7F42(string.char(68,73,82,69,73,84,65)) end },
{ _0x08FC=string.char(69,83,81,85,69,82,68,65,32,86,79,76,86,69,82,33), desc=string.char(71,105,114,97,32,57,48,194,176,32,112,97,114,97,32,97,32,101,115,113,117,101,114,100,97,46), highlight=false, action=function() _0x7F42(string.char(69,83,81,85,69,82,68,65)) end },
{ _0x08FC=string.char(82,69,84,65,71,85,65,82,68,65,32,86,79,76,86,69,82,33), desc=string.char(71,105,114,97,32,49,56,48,194,176,32,112,97,114,97,32,116,114,195,161,115,46), highlight=false, action=function() _0x7F42(string.char(82,69,84,65,71,85,65,82,68,65)) end },
{ _0x08FC=string.char(86,65,78,71,85,65,82,68,65,32,86,79,76,86,69,82,33), desc=string.char(82,101,116,111,114,110,97,32,195,160,32,100,105,114,101,195,167,195,163,111,32,115,97,108,118,97,32,115,101,109,32,97,108,116,101,114,97,114,32,115,117,97,32,112,111,115,105,195,167,195,163,111,46), highlight=false, action=_0x38DC }
}
for _0xA98B,cmd in ipairs(_0x2FDD) do
local _0x3F04=_0x4524(string.char(70,114,97,109,101))
_0x3F04.Size=_0x7303(1,0,0,55)
_0x3F04.BackgroundColor3=cmd.highlight and _0x2E5E(38,38,38) or _0xA737.Card
_0x3F04.BorderSizePixel=0 _0x3F04.LayoutOrder=_0xA98B+2 _0x3F04.Parent=_0xA5D6
_0xF6BF(_0x3F04,8)
_0x1A8B(_0x3F04, cmd.highlight and _0xA737.Primary or _0xA737.Stroke, cmd.highlight and 1.7 or 1)
local _0x37F8=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0x37F8.BackgroundTransparency=1 _0x37F8.Position=_0xEA31(11,5)
_0x37F8.Size=_0x7303(1,-100,0,20) _0x37F8.Text=cmd.name
_0x37F8.TextColor3=_0xA737.White _0x37F8.TextSize=10
_0x37F8.Font=Enum.Font.GothamBlack _0x37F8.TextXAlignment=_0xC25C _0x37F8.Parent=_0x3F04
local _0x3C78=_0x4524(string.char(84,101,120,116,76,97,98,101,108))
_0x3C78.BackgroundTransparency=1 _0x3C78.Position=_0xEA31(11,26)
_0x3C78.Size=_0x7303(1,-100,0,17) _0x3C78.Text=cmd.desc
_0x3C78.TextColor3=_0xA737.Gray _0x3C78.TextSize=7 _0x3C78.Font=_0xC9E5
_0x3C78.TextXAlignment=_0xC25C _0x3C78.Parent=_0x3F04
local _0x74A9=_0x4524(string.char(84,101,120,116,66,117,116,116,111,110))
_0x74A9.AnchorPoint=_0x426D(1,.5) _0x74A9.Position=_0x7303(1,-8,.5,0)
_0x74A9.Size=_0xEA31(68,30)
_0x74A9.BackgroundColor3=cmd.highlight and _0xA737.Orange or _0xA737.Success
_0x74A9.BorderSizePixel=0 _0x74A9.Text=string.char(226,150,182,32,69,88,69,67,85,84,65,82)_0x74A9.TextColor3=_0xA737.White
_0x74A9.TextSize=8 _0x74A9.Font=_0x5ED4 _0x74A9.AutoButtonColor=false _0x74A9.Parent=_0x3F04
_0xF6BF(_0x74A9,7)
_0x74A9.MouseButton1Click:Connect(function() cmd.action() end)
end
_0x30D4.CanvasPosition=_0x426D()
endlocal _0x44F9=false
local function _0x35FC()
_0x04FA=string.char(65,117,116,111,67,111,114,114,101,99,97,111)_0xC52E()
local _0x3F04 = _0x2857.Card(_0xA5D6, 1,string.char(239,191,189,239,191,189,32,73,65,32,67,72,65,84))
local _0x6217 = _0x4524(string.char(70,114,97,109,101), _0x3F04)
_0x6217.Size = _0x7303(1,0,0,140)
_0x6217.BackgroundColor3 = _0x2E5E(18,18,24)
_0x6217.BorderSizePixel = 0
_0x6217.LayoutOrder = 1
_0xF6BF(_0x6217, 6)
_0x1A8B(_0x6217, _0xA737.Stroke, 1)
local _0x5A1C = _0x4524(string.char(84,101,120,116,66,111,120), _0x6217)
_0x5A1C.Position = _0xEA31(10,10)
_0x5A1C.Size = _0x7303(1,-20,0,60)
_0x5A1C.BackgroundColor3 = _0x2E5E(14,14,18)
_0x5A1C.BorderSizePixel = 0
_0x5A1C.PlaceholderText =string.char(68,105,103,105,116,101,32,115,117,97,32,109,101,110,115,97,103,101,109,46,46,46)_0x5A1C.PlaceholderColor3 = _0xA737.DarkGray
_0x5A1C.Text =""_0x5A1C.TextColor3 = _0xA737.White
_0x5A1C.TextSize = 11
_0x5A1C.Font = _0xC9E5
_0x5A1C.TextWrapped = true
_0x5A1C.TextXAlignment = _0xC25C
_0x5A1C.TextYAlignment = Enum.TextYAlignment.Top
_0x5A1C.ClearTextOnFocus = false
_0x5A1C.MultiLine = false
_0xF6BF(_0x5A1C, 6)
_0x995E(_0x5A1C, 6,6,8,8)
local _0x06E5 = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), _0x6217)
_0x06E5.Position = _0xEA31(10,78)
_0x06E5.Size = _0x7303(1,-20,0,32)
_0x06E5.BackgroundColor3 = _0xA737.Purple
_0x06E5.BorderSizePixel = 0
_0x06E5.Text =string.char(226,156,168,32,67,111,114,114,105,103,105,114,32,101,32,69,110,118,105,97,114)_0x06E5.TextColor3 = _0xA737.White
_0x06E5.TextSize = 10
_0x06E5.Font = _0x5ED4
_0x06E5.AutoButtonColor = false
_0xF6BF(_0x06E5, 6)
local _0x525E = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0x6217)
_0x525E.BackgroundTransparency = 1
_0x525E.Position = _0xEA31(10,116)
_0x525E.Size = _0x7303(1,-20,0,18)
_0x525E.Text =""_0x525E.TextColor3 = _0xA737.Gray
_0x525E.TextSize = 10
_0x525E.Font = _0xC9E5
_0x525E.TextXAlignment = _0xC25C
local function _0xC368(_0xA76E,_0x5B52) _0x525E.Text=_0xA76E _0x525E.TextColor3=_0x5B52 end
_0x06E5.MouseButton1Click:Connect(function()
if _0x44F9 then return end
local _0xB596=_0x5A1C.Text:gsub(string.char(94,37,115,43),""):gsub(string.char(37,115,43,36),"")
if _0xB596==""then _0xC368(string.char(226,154,160,239,184,143,32,68,105,103,105,116,101,32,97,108,103,111,32,112,114,105,109,101,105,114,111),_0xA737.Orange) return end
_0x44F9=true _0x06E5.Text=string.char(226,143,179,32,65,103,117,97,114,100,101,46,46,46)_0xC368(string.char(239,191,189,239,191,189,32,80,101,110,115,97,110,100,111,46,46,46),_0xA737.Gray)
task.spawn(function()
local _0xBF39,_0xBC3B=_0xC9E9(_0xB596)
if _0xBF39 then
if _0x8850(_0xBF39) then
_0xC368(string.char(226,156,133,32,67,111,114,114,105,103,105,100,111,32,101,32,101,110,118,105,97,100,111,33),_0xA737.Success)
_0x5A1C.Text=""_0xF45C(string.char(73,65,32,67,72,65,84),string.char(77,101,110,115,97,103,101,109,32,101,110,118,105,97,100,97,46),string.char(83,117,99,99,101,115,115))
else
_0xC368(string.char(226,157,140,32,67,104,97,116,32,110,195,163,111,32,101,110,99,111,110,116,114,97,100,111),_0xA737.Error)
end
else
_0xC368(string.char(226,157,140,32)..tostring(_0xBC3B),_0xA737.Error)
end
_0x06E5.Text=string.char(226,156,168,32,67,111,114,114,105,103,105,114,32,101,32,69,110,118,105,97,114)_0x44F9=false
end)
end)
_0x30D4.CanvasPosition=_0x426D()
endlocal function _0x0672()
_0x04FA=string.char(67,114,101,100,105,116,111,115)_0xC52E()
local _0x7A7B=string.char(104,116,116,112,115,58,47,47,100,105,115,99,111,114,100,46,103,103,47,78,89,50,82,102,67,55,75,120)local _0x3F04 = _0x2857.Card(_0xA5D6, 1,string.char(239,191,189,239,191,189,32,67,82,195,137,68,73,84,79,83))
local _0xE265 = _0x4524(string.char(70,114,97,109,101), _0x3F04)
_0xE265.Size = _0x7303(1,0,0,50)
_0xE265.BackgroundColor3 = _0x2E5E(18,18,24)
_0xE265.BorderSizePixel = 0
_0xE265.LayoutOrder = 1
_0xF6BF(_0xE265,6) _0x1A8B(_0xE265,_0xA737.Stroke,1)
local _0x69CD = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0xE265)
_0x69CD.BackgroundTransparency = 1
_0x69CD.Position = _0xEA31(12,0)
_0x69CD.Size = _0x7303(1,-24,1,0)
_0x69CD.Text =string.char(69,115,115,101,32,115,99,114,105,112,116,32,102,111,105,32,100,101,115,101,110,118,111,108,118,105,100,111,32,112,101,108,111,32,97,107,105,114,97,48,48,55,112,32,239,191,189,239,191,189,32,100,105,115,99,111,114,100)_0x69CD.TextColor3 = _0xA737.White
_0x69CD.Font = _0x5ED4
_0x69CD.TextSize = 11
_0x69CD.TextWrapped = true
_0x69CD.TextXAlignment = _0xC25C
_0x69CD.TextYAlignment = Enum.TextYAlignment.Center
local _0xB5E0 = _0x4524(string.char(70,114,97,109,101), _0x3F04)
_0xB5E0.Size = _0x7303(1,0,0,60)
_0xB5E0.BackgroundColor3 = _0x2E5E(18,18,24)
_0xB5E0.BorderSizePixel = 0
_0xB5E0.LayoutOrder = 2
_0xF6BF(_0xB5E0,6) _0x1A8B(_0xB5E0,_0xA737.Orange,1)
local _0x08D4 = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0xB5E0)
_0x08D4.BackgroundTransparency = 1
_0x08D4.Position = _0xEA31(12,8)
_0x08D4.Size = _0x7303(1,-100,0,20)
_0x08D4.Text =string.char(239,191,189,239,191,189,32,83,101,114,118,105,100,111,114,32,100,111,32,68,105,115,99,111,114,100)_0x08D4.TextColor3 = _0xA737.White
_0x08D4.Font = _0x5ED4
_0x08D4.TextSize = 11
_0x08D4.TextXAlignment = _0xC25C
local _0xA442 = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0xB5E0)
_0xA442.BackgroundTransparency = 1
_0xA442.Position = _0xEA31(12,30)
_0xA442.Size = _0x7303(1,-100,0,20)
_0xA442.Text = _0x7A7B
_0xA442.TextColor3 = _0xA737.Gray
_0xA442.TextSize = 9
_0xA442.Font = _0xC9E5
_0xA442.TextXAlignment = _0xC25C
local _0x8493 = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), _0xB5E0)
_0x8493.AnchorPoint = _0x426D(1,.5)
_0x8493.Position = _0x7303(1,-10,.5,0)
_0x8493.Size = _0xEA31(75,32)
_0x8493.BackgroundColor3 = _0x2E5E(88,101,242)
_0x8493.BorderSizePixel = 0
_0x8493.Text =string.char(226,150,182,32,69,78,84,82,65,82)_0x8493.TextColor3 = _0xA737.White
_0x8493.TextSize = 9
_0x8493.Font = _0x5ED4
_0x8493.AutoButtonColor = false
_0xF6BF(_0x8493,6)
_0x8493.MouseButton1Click:Connect(function()
pcall(function() setclipboard(_0x7A7B) end)
pcall(function() game:GetService(string.char(71,117,105,83,101,114,118,105,99,101)):OpenBrowserWindow(_0x7A7B) end)
_0xF45C(string.char(68,73,83,67,79,82,68),string.char(76,105,110,107,32,99,111,112,105,97,100,111,33,32,67,111,108,101,32,110,111,32,110,97,118,101,103,97,100,111,114,32,115,101,32,110,195,163,111,32,97,98,114,105,114,46),string.char(83,117,99,99,101,115,115))
end)
_0x30D4.CanvasPosition=_0x426D()
enddo
local _0xDC82 = {
{ _0xDBB5 = _0x2E5E(59, 130, 246), Body = _0x2E5E(35, 35, 35) },
{ _0xDBB5 = _0x2E5E(239, 68, 68), Body = _0x2E5E(45, 30, 30) },
{ _0xDBB5 = _0x2E5E(16, 185, 129), Body = _0x2E5E(30, 40, 35) },
{ _0xDBB5 = _0x2E5E(245, 158, 11), Body = _0x2E5E(45, 40, 30) },
{ _0xDBB5 = _0x2E5E(139, 92, 246), Body = _0x2E5E(35, 30, 45) },
}
local _0x2A01 = {
Fundo = _0x2E5E(25, 25, 25),
Painel = _0x2E5E(35, 35, 35),
Borda = _0x2E5E(50, 50, 50),
Texto = _0x2E5E(255, 255, 255),
TextoDim = _0x2E5E(160, 160, 160),
Verde = _0x2E5E(16, 185, 129),
VerdeHover = _0x2E5E(52, 211, 153),
}
local _0x93A1 = {
{ Titulo =string.char(80,79,82,32,81,85,69,32,79,32,69,66,32,195,137,32,73,77,80,79,82,84,65,78,84,69,32,80,82,65,32,83,79,67,73,69,68,65,68,69,63), Texto =string.char(79,32,69,66,32,110,195,163,111,32,195,169,32,97,112,101,110,97,115,32,102,97,114,100,97,32,101,32,97,114,109,97,58,32,195,169,32,111,32,98,114,97,195,167,111,32,102,111,114,116,101,32,113,117,101,32,103,117,97,114,100,97,32,97,32,112,195,161,116,114,105,97,44,32,115,111,99,111,114,114,101,32,101,109,32,116,114,97,103,195,169,100,105,97,115,44,32,102,111,114,109,97,32,99,105,100,97,100,195,163,111,115,32,100,101,32,104,111,110,114,97,32,101,32,100,101,102,101,110,100,101,32,97,32,115,111,98,101,114,97,110,105,97,46,32,83,101,109,32,101,108,101,44,32,110,195,163,111,32,104,195,161,32,112,97,122,32,115,111,99,105,97,108,32,110,101,109,32,102,117,116,117,114,111,32,115,101,103,117,114,111,32,112,114,97,32,110,105,110,103,117,195,169,109,46)},
{ Titulo =string.char(80,79,82,32,81,85,69,32,86,79,67,195,138,32,81,85,69,82,32,83,85,66,73,82,32,68,69,32,80,65,84,69,78,84,69,63), Texto =string.char(81,117,101,114,111,32,115,117,98,105,114,32,100,101,32,112,97,116,101,110,116,101,32,112,114,97,32,97,106,117,100,97,114,32,109,97,105,115,32,97,32,116,114,111,112,97,44,32,97,112,114,101,110,100,101,114,32,97,32,108,105,100,101,114,97,114,32,100,105,114,101,105,116,111,32,101,32,102,97,122,101,114,32,112,111,114,32,109,101,114,101,99,101,114,32,97,32,99,111,110,102,105,97,110,195,167,97,32,100,111,115,32,109,101,117,115,32,115,117,112,101,114,105,111,114,101,115,46,32,78,195,163,111,32,195,169,32,112,111,114,32,115,116,97,116,117,115,44,32,195,169,32,112,111,114,32,118,111,110,116,97,100,101,32,100,101,32,115,101,114,118,105,114,32,109,101,108,104,111,114,46)},
{ Titulo =string.char(80,79,82,32,81,85,69,32,83,69,82,86,73,82,32,65,79,32,69,88,195,137,82,67,73,84,79,32,66,82,65,83,73,76,69,73,82,79,63), Texto =string.char(83,105,114,118,111,32,97,111,32,69,120,195,169,114,99,105,116,111,32,112,111,114,113,117,101,32,97,99,114,101,100,105,116,111,32,110,111,32,66,114,97,115,105,108,32,101,32,113,117,101,114,111,32,102,97,122,101,114,32,112,97,114,116,101,32,100,101,32,97,108,103,111,32,109,97,105,111,114,32,113,117,101,32,101,117,46,32,195,137,32,111,110,100,101,32,97,112,114,101,110,100,111,32,100,105,115,99,105,112,108,105,110,97,44,32,104,111,110,114,97,32,101,32,111,32,118,97,108,111,114,32,100,101,32,112,114,111,116,101,103,101,114,32,113,117,101,109,32,110,195,163,111,32,112,111,100,101,32,115,101,32,112,114,111,116,101,103,101,114,32,115,111,122,105,110,104,111,46)},
{ Titulo =string.char(67,79,77,79,32,86,79,67,195,138,32,86,195,138,32,83,85,65,32,74,79,82,78,65,68,65,32,67,79,77,79,32,77,73,76,73,84,65,82,32,78,79,32,70,85,84,85,82,79,63), Texto =string.char(81,117,101,114,111,32,115,117,98,105,114,32,117,109,97,32,112,97,116,101,110,116,101,32,100,101,32,99,97,100,97,32,118,101,122,44,32,97,112,114,101,110,100,101,114,32,99,111,109,32,111,115,32,111,102,105,99,105,97,105,115,32,109,97,105,115,32,101,120,112,101,114,105,101,110,116,101,115,32,101,32,117,109,32,100,105,97,32,112,111,100,101,114,32,116,114,101,105,110,97,114,32,111,115,32,110,111,118,97,116,111,115,46,32,80,114,101,116,101,110,100,111,32,102,105,99,97,114,32,97,116,195,169,32,111,110,100,101,32,99,111,110,115,101,103,117,105,114,44,32,115,101,109,112,114,101,32,104,111,110,114,97,110,100,111,32,97,32,102,97,114,100,97,46)},
}
local function _0x1F5D(tema, ordem, cor)
local _0x3F04 = _0x4524(string.char(70,114,97,109,101), _0xA5D6)
_0x3F04.Size = _0x7303(1, 0, 0, 0)
_0x3F04.AutomaticSize = Enum.AutomaticSize.Y
_0x3F04.BackgroundColor3 = cor.Body
_0x3F04.BorderSizePixel = 0
_0x3F04.LayoutOrder = ordem
_0xF6BF(_0x3F04, 8)
_0x1A8B(_0x3F04, cor.Header, 0.5, 0.7)
_0x3F04.ClipsDescendants = true
_0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _0x3F04).SortOrder = Enum.SortOrder.LayoutOrder
local _0x8927 = _0x4524(string.char(70,114,97,109,101), _0x3F04)
_0x8927.Size = _0x7303(1, 0, 0, 0)
_0x8927.AutomaticSize = Enum.AutomaticSize.Y
_0x8927.BackgroundColor3 = cor.Header
_0x8927.BorderSizePixel = 0
_0x8927.LayoutOrder = 1
local _0x7FBD = _0x4524(string.char(85,73,80,97,100,100,105,110,103), _0x8927)
_0x7FBD.PaddingTop = _0xEA4A(0, 8) _0x7FBD.PaddingBottom = _0xEA4A(0, 8)
_0x7FBD.PaddingLeft = _0xEA4A(0, 12) _0x7FBD.PaddingRight = _0xEA4A(0, 12)
local _0x9E64 = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0x8927)
_0x9E64.Size = _0x7303(1, 0, 0, 0)
_0x9E64.AutomaticSize = Enum.AutomaticSize.Y
_0x9E64.BackgroundTransparency = 1
_0x9E64.Text =string.char(239,191,189,239,191,189,32).. tema.Titulo
_0x9E64.TextColor3 = _0x2A01.Texto _0x9E64.Font = _0x5ED4
_0x9E64.TextSize = 12 _0x9E64.TextXAlignment = _0xC25C
_0x9E64.TextWrapped = true
local _0xE032 = _0x4524(string.char(70,114,97,109,101), _0x3F04)
_0xE032.Size = _0x7303(1, 0, 0, 0)
_0xE032.AutomaticSize = Enum.AutomaticSize.Y
_0xE032.BackgroundColor3 = cor.Body
_0xE032.BorderSizePixel = 0 _0xE032.LayoutOrder = 2
local _0xAFC4 = _0x4524(string.char(85,73,80,97,100,100,105,110,103), _0xE032)
_0xAFC4.PaddingTop = _0xEA4A(0, 12) _0xAFC4.PaddingBottom = _0xEA4A(0, 12)
_0xAFC4.PaddingLeft = _0xEA4A(0, 12) _0xAFC4.PaddingRight = _0xEA4A(0, 12)
local _0x2A56 = _0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _0xE032)
_0x2A56.Padding = _0xEA4A(0, 12) _0x2A56.SortOrder = Enum.SortOrder.LayoutOrder
local _0x3F05 = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0xE032)
_0x3F05.Size = _0x7303(1, 0, 0, 0)
_0x3F05.AutomaticSize = Enum.AutomaticSize.Y
_0x3F05.BackgroundTransparency = 1
_0x3F05.Text = tema.Texto _0x3F05.TextColor3 = _0x2A01.TextoDim
_0x3F05.Font = _0xC9E5 _0x3F05.TextSize = 11
_0x3F05.TextXAlignment = _0xC25C _0x3F05.TextWrapped = true
_0x3F05.LineHeight = 1.2
local _0xB016 = _0x4524(string.char(70,114,97,109,101), _0xE032)
_0xB016.Size = _0x7303(1, 0, 0, 28)
_0xB016.BackgroundTransparency = 1
local _0x892B = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), _0xB016)
_0x892B.Size = _0xEA31(75, 28) _0x892B.Position = _0x7303(1, 0, 0, 0)
_0x892B.AnchorPoint = Vector2.new(1, 0)
_0x892B.BackgroundColor3 = _0x2A01.Verde _0x892B.Text =string.char(67,111,112,105,97,114)_0x892B.TextColor3 = _0x2A01.Texto _0x892B.Font = _0x5ED4
_0x892B.TextSize = 11 _0x892B.BorderSizePixel = 0
_0x892B.AutoButtonColor = false _0xF6BF(_0x892B, 6)
_0x892B.MouseEnter:Connect(function() _0x892B.BackgroundColor3 = _0x2A01.VerdeHover end)
_0x892B.MouseLeave:Connect(function() _0x892B.BackgroundColor3 = _0x2A01.Verde end)
_0x892B.MouseButton1Click:Connect(function()
if setclipboard then
pcall(setclipboard, tema.Texto)
_0x892B.Text =string.char(67,111,112,105,97,100,111,33)_0x892B.BackgroundColor3 = _0x2A01.VerdeHover
task.wait(1.5)
_0x892B.Text =string.char(67,111,112,105,97,114)_0x892B.BackgroundColor3 = _0x2A01.Verde
end
end)
end
function ShowTextosProntos()
_0x04FA =string.char(84,101,120,116,111,115,80,114,111,110,116,111,115)_0xC52E()
local _0x4170 = _0x4524(string.char(70,114,97,109,101), _0xA5D6)
_0x4170.Size = _0x7303(1, 0, 0, 58)
_0x4170.BackgroundColor3 = _0x2A01.Painel
_0x4170.BorderSizePixel = 0
_0x4170.LayoutOrder = 0
_0xF6BF(_0x4170, 9) _0x1A8B(_0x4170, _0x2A01.Borda, 1)
local _0x1FA2 = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0x4170)
_0x1FA2.BackgroundTransparency = 1
_0x1FA2.Position = _0xEA31(12, 7) _0x1FA2.Size = _0x7303(1, -24, 0, 25)
_0x1FA2.Text =string.char(239,191,189,239,191,189,32,84,69,88,84,79,83,32,80,82,79,78,84,79,83,32,43,32,73,65)_0x1FA2.TextColor3 = _0x2A01.Texto _0x1FA2.TextSize = 16
_0x1FA2.Font = _0x5ED4 _0x1FA2.TextXAlignment = _0xC25C
local _0xC389 = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0x4170)
_0xC389.BackgroundTransparency = 1
_0xC389.Position = _0xEA31(13, 34) _0xC389.Size = _0x7303(1, -26, 0, 15)
_0xC389.Text =string.char(73,110,102,111,114,109,97,195,167,195,181,101,115,32,109,105,108,105,116,97,114,101,115,32,101,32,103,101,114,97,100,111,114,32,100,101,32,116,101,120,116,111,32,105,110,116,101,108,105,103,101,110,116,101)_0xC389.TextColor3 = _0x2A01.TextoDim _0xC389.TextSize = 9
_0xC389.Font = _0xC9E5 _0xC389.TextXAlignment = _0xC25C
for _0xA98B, tema in ipairs(_0x93A1) do
local _0x360E = ((_0xA98B - 1) % #_0xDC82) + 1
_0x1F5D(tema, _0xA98B, _0xDC82[_0x360E])
end
local _0xC309 = _0x4524(string.char(70,114,97,109,101), _0xA5D6)
_0xC309.Size = _0x7303(1, 0, 0, 0)
_0xC309.AutomaticSize = Enum.AutomaticSize.Y
_0xC309.BackgroundColor3 = _0x2E5E(30, 30, 40)
_0xC309.BorderSizePixel = 0
_0xC309.LayoutOrder = 999
_0xF6BF(_0xC309, 8)
_0x1A8B(_0xC309, _0x2E5E(139, 92, 246), 1, 0.5)
_0xC309.ClipsDescendants = true
local _0xF4F4 = _0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _0xC309)
_0xF4F4.SortOrder = Enum.SortOrder.LayoutOrder
local _0xF4EC = _0x4524(string.char(70,114,97,109,101), _0xC309)
_0xF4EC.Size = _0x7303(1, 0, 0, 35)
_0xF4EC.BackgroundColor3 = _0x2E5E(139, 92, 246)
_0xF4EC.BorderSizePixel = 0
_0xF4EC.LayoutOrder = 1
_0xF6BF(_0xF4EC, 8)
local _0x4B5A = _0x4524(string.char(70,114,97,109,101), _0xF4EC)
_0x4B5A.Size = _0x7303(1, 0, 0.5, 0)
_0x4B5A.Position = _0x7303(0, 0.5, 0, 0)
_0x4B5A.BackgroundColor3 = _0x2E5E(139, 92, 246)
_0x4B5A.BorderSizePixel = 0
local _0x82DA = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0xF4EC)
_0x82DA.Size = _0x7303(1, -20, 0, 20)
_0x82DA.Position = _0xEA31(10, 8)
_0x82DA.BackgroundTransparency = 1
_0x82DA.Text =string.char(239,191,189,239,191,189,32,71,69,82,65,68,79,82,32,68,69,32,84,69,88,84,79,32,73,65,32,40,69,66,41)_0x82DA.TextColor3 = _0x2A01.Texto
_0x82DA.Font = _0x5ED4 _0x82DA.TextSize = 12 _0x82DA.TextXAlignment = _0xC25C
local _0x6B4C = _0x4524(string.char(70,114,97,109,101), _0xC309)
_0x6B4C.Size = _0x7303(1, 0, 0, 0)
_0x6B4C.AutomaticSize = Enum.AutomaticSize.Y
_0x6B4C.BackgroundColor3 = _0x2E5E(30, 30, 40)
_0x6B4C.BorderSizePixel = 0
_0x6B4C.LayoutOrder = 2
local _0xA7C3 = _0x4524(string.char(85,73,80,97,100,100,105,110,103), _0x6B4C)
_0xA7C3.PaddingTop = _0xEA4A(0, 10) _0xA7C3.PaddingBottom = _0xEA4A(0, 10)
_0xA7C3.PaddingLeft = _0xEA4A(0, 10) _0xA7C3.PaddingRight = _0xEA4A(0, 10)
local _0x3D48 = _0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _0x6B4C)
_0x3D48.Padding = _0xEA4A(0, 10)
_0x3D48.SortOrder = Enum.SortOrder.LayoutOrder
local _0x49DD = _0x4524(string.char(84,101,120,116,66,111,120), _0x6B4C)
_0x49DD.Size = _0x7303(1, 0, 0, 30)
_0x49DD.BackgroundColor3 = _0x2A01.Fundo
_0x49DD.PlaceholderText =string.char(68,105,103,105,116,101,32,111,32,116,101,109,97,32,40,101,120,58,32,80,111,114,32,113,117,101,32,115,101,114,118,105,114,32,97,111,32,69,66,63,41)_0x49DD.PlaceholderColor3 = _0x2A01.TextoDim
_0x49DD.Text =""_0x49DD.TextColor3 = _0x2A01.Texto
_0x49DD.Font = _0xC9E5 _0x49DD.TextSize = 11
_0x49DD.TextXAlignment = _0xC25C _0x49DD.BorderSizePixel = 0
_0xF6BF(_0x49DD, 6)
local _0xD0AD = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), _0x6B4C)
_0xD0AD.Size = _0x7303(1, 0, 0, 35)
_0xD0AD.BackgroundColor3 = _0x2E5E(139, 92, 246)
_0xD0AD.Text =string.char(226,154,161,32,71,69,82,65,82,32,84,69,88,84,79)_0xD0AD.TextColor3 = _0x2A01.Texto _0xD0AD.Font = _0x5ED4
_0xD0AD.TextSize = 12 _0xD0AD.BorderSizePixel = 0
_0xD0AD.AutoButtonColor = false _0xF6BF(_0xD0AD, 8)
_0x1A8B(_0xD0AD, _0x2E5E(167, 139, 250), 1, 0.2)
local _0x1B21 = _0x4524(string.char(85,73,71,114,97,100,105,101,110,116), _0xD0AD)
_0x1B21.Color = ColorSequence.new(_0x2E5E(139, 92, 246), _0x2E5E(109, 40, 217))
_0x1B21.Rotation = 90
_0xD0AD.MouseEnter:Connect(function() _0xD0AD.BackgroundColor3 = _0x2E5E(167, 139, 250) end)
_0xD0AD.MouseLeave:Connect(function() _0xD0AD.BackgroundColor3 = _0x2E5E(139, 92, 246) end)
local _0xB77E = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0x6B4C)
_0xB77E.Size = _0x7303(1, 0, 0, 0)
_0xB77E.AutomaticSize = Enum.AutomaticSize.Y
_0xB77E.BackgroundTransparency = 1
_0xB77E.Text =string.char(65,32,114,101,115,112,111,115,116,97,32,100,97,32,73,65,32,97,112,97,114,101,99,101,114,195,161,32,97,113,117,105,46,46,46)_0xB77E.TextColor3 = _0x2A01.TextoDim _0xB77E.Font = _0xC9E5
_0xB77E.TextSize = 11 _0xB77E.TextXAlignment = _0xC25C
_0xB77E.TextWrapped = true _0xB77E.LineHeight = 1.2
local _0xD1D8 = _0x4524(string.char(70,114,97,109,101), _0x6B4C)
_0xD1D8.Size = _0x7303(1, 0, 0, 28)
_0xD1D8.BackgroundTransparency = 1
_0xD1D8.LayoutOrder = 4
local _0x8567 = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), _0xD1D8)
_0x8567.Size = _0xEA31(75, 28) _0x8567.Position = _0x7303(1, 0, 0, 0)
_0x8567.AnchorPoint = Vector2.new(1, 0)
_0x8567.BackgroundColor3 = _0x2A01.Painel _0x8567.Text =string.char(67,111,112,105,97,114)_0x8567.TextColor3 = _0x2A01.TextoDim _0x8567.Font = _0x5ED4
_0x8567.TextSize = 11 _0x8567.BorderSizePixel = 0
_0x8567.AutoButtonColor = false _0xF6BF(_0x8567, 6)
_0x8567.MouseEnter:Connect(function()
if _0x8567.BackgroundColor3 == _0x2A01.Verde then _0x8567.BackgroundColor3 = _0x2A01.VerdeHover end
end)
_0x8567.MouseLeave:Connect(function()
if _0x8567.BackgroundColor3 == _0x2A01.VerdeHover then _0x8567.BackgroundColor3 = _0x2A01.Verde end
end)
local _0x06F8 = nil
_0xD0AD.MouseButton1Click:Connect(function()
local _0xE512 = _0x49DD.Text
if _0xE512 ==""then
_0xB77E.Text =string.char(226,154,160,239,184,143,32,80,111,114,32,102,97,118,111,114,44,32,100,105,103,105,116,101,32,117,109,32,116,101,109,97,32,112,114,105,109,101,105,114,111,46)_0xB77E.TextColor3 = _0x2E5E(245, 158, 11)
return
end
_0xB77E.Text =string.char(226,143,179,32,71,101,114,97,110,100,111,32,116,101,120,116,111,46,46,46,32,97,103,117,97,114,100,101,46)_0xB77E.TextColor3 = _0x2E5E(245, 158, 11)
_0x8567.BackgroundColor3 = _0x2A01.Painel
_0x8567.TextColor3 = _0x2A01.TextoDim
_0x06F8 = nil
task.spawn(function()
local _0xC8A0, _0xBC3B = _0xEFAE(_0xE512)
if _0xC8A0 then
_0x06F8 = _0xC8A0
_0xB77E.Text = _0xC8A0
_0xB77E.TextColor3 = _0x2A01.Texto
_0x8567.BackgroundColor3 = _0x2A01.Verde
_0x8567.TextColor3 = _0x2A01.Texto
else
_0xB77E.Text =string.char(226,157,140,32,69,114,114,111,58,32).. tostring(_0xBC3B)
_0xB77E.TextColor3 = _0x2E5E(239, 68, 68)
end
end)
end)
_0x8567.MouseButton1Click:Connect(function()
if not _0x06F8 then return end
if setclipboard then
pcall(setclipboard, _0x06F8)
_0x8567.Text =string.char(67,111,112,105,97,100,111,33)_0x8567.BackgroundColor3 = _0x2A01.VerdeHover
task.wait(1.5)
_0x8567.Text =string.char(67,111,112,105,97,114)_0x8567.BackgroundColor3 = _0x2A01.Verde
end
end)
_0x30D4.CanvasPosition = _0x426D()
end
endlocal _0x8148 = workspace.CurrentCamera
local _0xED34 = {
Ativo=false, MostrarFOV=false, FOV=43, RingTransparency=0.3,
Cor=Color3.fromRGB(150,80,255), Thickness=2,
OffsetX=0, OffsetY=-47, ParteAlvo=string.char(67,97,98,101,195,167,97)}
local _0xD2C5 = {
Ativo=false, Visual=true, Tamanho=2, Transparencia=0.5,
Cor=_0x2E5E(255,0,0), Material=string.char(78,101,111,110)}
local _0x3561 = {}
local _0x4B75 = os.clock()
_0x3228:SetAttribute(string.char(90,75,89,72,105,116,98,111,120), _0x4B75)
local _0x5E2B
pcall(function()
_0x5E2B = Drawing.new(string.char(67,105,114,99,108,101))
_0x5E2B.Visible=false
_0x5E2B.Thickness=_0xED34.Thickness
_0x5E2B.Color=_0xED34.Cor
_0x5E2B.Filled=false
_0x5E2B.Radius=_0xED34.FOV
end)
local function _0xEC31()
return Vector2.new(
_0x8148.ViewportSize.X/2 + _0xED34.OffsetX,
_0x8148.ViewportSize.Y/2 + _0xED34.OffsetY
)
end
local function _0x4622(char)
if not char then return nil end
return char:FindFirstChild(string.char(84,111,114,115,111))
or char:FindFirstChild(string.char(85,112,112,101,114,84,111,114,115,111))
or char:FindFirstChild(string.char(76,111,119,101,114,84,111,114,115,111))
or char:FindFirstChild(string.char(72,101,97,100))
end
local function _0x07AE(char)
if not char then return nil end
if _0xED34.ParteAlvo==string.char(67,97,98,101,195,167,97)then
return char:FindFirstChild(string.char(72,101,97,100)) or char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
elseif _0xED34.ParteAlvo==string.char(84,114,111,110,99,111)then
return _0x4622(char)
end
return char:FindFirstChild(string.char(72,101,97,100))
end
local function _0x8681()
local _0x3D0B,_0x7CED = nil, math.huge
local _0x9B95 = _0xEC31()
for _,_0xEC82 in ipairs(_0xB2C0:GetPlayers()) do
if _0xEC82 ~= _0x0DAF then
local _0x180C = _0x07AE(_0xEC82.Character)
if _0x180C then
local _0x93B3,_0x2C12 = _0x8148:WorldToViewportPoint(_0x180C.Position)
if _0x2C12 then
local _0xEB91 = (Vector2.new(_0x93B3.X,_0x93B3.Y) - _0x9B95).Magnitude
if _0xEB91 < _0x7CED and _0xEB91 <= _0xED34.FOV then
_0x7CED = _0xEB91
_0x3D0B = _0xEC82
end
end
end
end
end
return _0x3D0B
end
local function _0xF915(_0x38C2)
local _0x04B4 = _0x8148.CFrame.Position
local _0x4366 = (_0x38C2 - _0x04B4).Unit
local _0x850C = math.rad(_0x8148.FieldOfView)
local _0x0346, _0x2F25 = _0x8148.ViewportSize.X, _0x8148.ViewportSize.Y
local _0x5111 = -math.atan((_0xED34.OffsetX/_0x0346)*2*math.tan(_0x850C/2))
local _0xA226 = math.atan((_0xED34.OffsetY/_0x2F25)*2*math.tan(_0x850C/2))
local _0x72CB = CFrame.new(_0x04B4, _0x04B4 + _0x4366)
_0x72CB = _0x72CB * CFrame.Angles(_0xA226, _0x5111, 0)
_0x8148.CFrame = _0x72CB
end
_0x187D.RenderStepped:Connect(function()
if _0x5E2B then
_0x5E2B.Visible = _0xED34.MostrarFOV or _0xED34.Ativo
_0x5E2B.Radius = _0xED34.FOV
_0x5E2B.Color = _0xED34.Cor
_0x5E2B.Thickness = _0xED34.Thickness
_0x5E2B.Position = _0xEC31()
_0x5E2B.Transparency = _0xED34.RingTransparency
end
if not _0xED34.Ativo then return end
local _0x105B = _0x8681()
if _0x105B then
local _0x180C = _0x07AE(_0x105B.Character)
if _0x180C then _0xF915(_0x180C.Position) end
end
end)
local function _0xAC6C(char)
if _0x3561[char] then return end
local _0x9265 = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if not _0x9265 then return end
_0x3561[char] = {Size=_0x9265.Size, Transparency=_0x9265.Transparency,
Color=_0x9265.Color, Material=_0x9265.Material, CanCollide=_0x9265.CanCollide}
end
local function _0x7531(char)
if not char then return end
if char == _0x617C then return end
local _0x9265 = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if not _0x9265 then return end
_0xAC6C(char)
pcall(function()
_0x9265.Size = Vector3.new(_0xD2C5.Tamanho,_0xD2C5.Tamanho,_0xD2C5.Tamanho)
_0x9265.Transparency = _0xD2C5.Visual and _0xD2C5.Transparencia or 1
_0x9265.Color = _0xD2C5.Cor
_0x9265.Material = Enum.Material.Neon
_0x9265.CanCollide = false
end)
end
local function _0x7F06(char)
if not char then return end
local _0x5C8B = _0x3561[char]
if not _0x5C8B then return end
local _0x9265 = char:FindFirstChild(string.char(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116))
if _0x9265 then
pcall(function()
_0x9265.Size = _0x5C8B.Size _0x9265.Transparency = _0x5C8B.Transparency
_0x9265.Color = _0x5C8B.Color _0x9265.Material = _0x5C8B.Material
_0x9265.CanCollide = _0x5C8B.CanCollide
end)
end
_0x3561[char] = nil
end
local _0x97CE
_0x97CE = _0x187D.Heartbeat:Connect(function()
if _0x3228:GetAttribute(string.char(90,75,89,72,105,116,98,111,120)) ~= _0x4B75 then
_0x97CE:Disconnect()
for _0x5B52 in pairs(_0x3561) do _0x7F06(_0x5B52) end
return
end
if _0xD2C5.Ativo then
for _,_0xEC82 in ipairs(_0xB2C0:GetPlayers()) do
if _0xEC82 ~= _0x0DAF and _0xEC82.Character and _0xEC82.Character.Parent then
_0x7531(_0xEC82.Character)
end
end
for char in pairs(_0x3561) do
if not char.Parent then _0x7F06(char) end
end
else
for char in pairs(_0x3561) do _0x7F06(char) end
end
end)
function ShowCombate()
_0x04FA =string.char(67,111,109,98,97,116,101)_0xC52E()
_0x30D4.ScrollingEnabled = true
local _0xA6AE, _0x7CB8 = _0x07A7(_0xA5D6, 0)
local _0xFCD7 = _0x2857.Card(_0xA6AE, 1,string.char(239,191,189,239,191,189,32,72,105,116,98,111,120,32,77,111,100,105,102,105,99,97,100,111,114))
_0x2857.Toggle(_0xFCD7, 1,string.char(65,116,105,118,97,114,32,72,105,116,98,111,120), _0xD2C5.Ativo, function(_0xB138)
_0xD2C5.Ativo = _0xB138
_0xF45C(string.char(72,73,84,66,79,88), _0xB138 andstring.char(65,116,105,118,97,100,111,46)orstring.char(68,101,115,97,116,105,118,97,100,111,46), _0xB138 andstring.char(83,117,99,99,101,115,115)orstring.char(69,114,114,111,114))
end)
_0x2857.Slider(_0xFCD7, 2,string.char(84,97,109,97,110,104,111), _0xD2C5.Tamanho, 1, 20, false, function(_0xB138) _0xD2C5.Tamanho = _0xB138 end)
_0x2857.Slider(_0xFCD7, 3,string.char(84,114,97,110,115,112,97,114,195,170,110,99,105,97), math.floor(_0xD2C5.Transparencia*10+.5), 0, 10, false,
function(_0xB138) _0xD2C5.Transparencia = _0xB138/10 end)
local _0x21E6 = _0x4524(string.char(70,114,97,109,101), _0xFCD7)
_0x21E6.Size = _0x7303(1,0,0,26)
_0x21E6.BackgroundTransparency = 1
_0x21E6.LayoutOrder = 4
local _0x9F98 = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0x21E6)
_0x9F98.BackgroundTransparency = 1
_0x9F98.Size = _0x7303(1,-90,1,0)
_0x9F98.Text =string.char(67,111,114,32,100,97,32,72,105,116,98,111,120)_0x9F98.TextColor3 = _0xA737.Gray
_0x9F98.Font = _0xC9E5
_0x9F98.TextSize = 10
_0x9F98.TextXAlignment = _0xC25C
local _0x7035 = _0x2857.Help(_0x21E6)
_0x7035.AnchorPoint = _0x426D(1,.5)
_0x7035.Position = _0x7303(1,-40,.5,0)
local _0xE34A = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), _0x21E6)
_0xE34A.AnchorPoint = _0x426D(1,.5)
_0xE34A.Position = _0x7303(1,0,.5,0)
_0xE34A.Size = _0xEA31(34,18)
_0xE34A.BackgroundColor3 = _0xD2C5.Cor
_0xE34A.BorderSizePixel = 0
_0xE34A.Text =""_0xE34A.AutoButtonColor = false
_0xF6BF(_0xE34A, 4) _0x1A8B(_0xE34A, _0xA737.Stroke, 1)
local _0x9AB5 = {
_0x2E5E(255,0,0), _0x2E5E(0,255,100), _0x2E5E(0,150,255),
_0x2E5E(255,200,0), _0x2E5E(255,0,255), _0x2E5E(150,80,255),
_0x2E5E(255,255,255), _0x2E5E(0,0,0)
}
local _0x6BE2 = _0x4524(string.char(70,114,97,109,101), _0xFCD7)
_0x6BE2.Size = _0x7303(1,0,0,18)
_0x6BE2.BackgroundTransparency = 1
_0x6BE2.LayoutOrder = 5
local _0x78E4 = _0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _0x6BE2)
_0x78E4.FillDirection = Enum.FillDirection.Horizontal
_0x78E4.Padding = _0xEA4A(0,4)
_0x78E4.Parent = _0x6BE2
for _,cor in ipairs(_0x9AB5) do
local _0xE9E5 = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), _0x6BE2)
_0xE9E5.Size = _0xEA31(16,16)
_0xE9E5.BackgroundColor3 = cor
_0xE9E5.BorderSizePixel = 0
_0xE9E5.Text =""_0xE9E5.AutoButtonColor = false
_0xF6BF(_0xE9E5,4) _0x1A8B(_0xE9E5,_0xA737.Stroke,1)
_0xE9E5.MouseButton1Click:Connect(function()
_0xD2C5.Cor = cor
_0xE34A.BackgroundColor3 = cor
end)
end
local _0xA426 = _0x2857.Card(_0x7CB8, 1,string.char(239,191,189,239,191,189,32,65,105,109))
_0x2857.Toggle(_0xA426, 1,string.char(65,116,105,118,97,114,32,65,105,109,98,111,116), _0xED34.Ativo, function(_0xB138)
_0xED34.Ativo = _0xB138
end)
_0x2857.Toggle(_0xA426, 2,string.char(77,111,115,116,114,97,114,32,70,79,86), _0xED34.MostrarFOV, function(_0xB138)
_0xED34.MostrarFOV = _0xB138
end)
local _0x228C = _0x4524(string.char(70,114,97,109,101), _0xA426)
_0x228C.Size = _0x7303(1,0,0,44)
_0x228C.BackgroundTransparency = 1
_0x228C.LayoutOrder = 3
local _0xD1E2 = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0x228C)
_0xD1E2.BackgroundTransparency = 1
_0xD1E2.Position = _0xEA31(0,0)
_0xD1E2.Size = _0x7303(1,-20,0,14)
_0xD1E2.Text =string.char(80,97,114,116,101,32,100,111,32,65,108,118,111)_0xD1E2.TextColor3 = _0xA737.Gray
_0xD1E2.Font = _0xC9E5
_0xD1E2.TextSize = 10
_0xD1E2.TextXAlignment = _0xC25C
local _0x4B6B = _0x4524(string.char(70,114,97,109,101), _0x228C)
_0x4B6B.Position = _0xEA31(0,20)
_0x4B6B.Size = _0x7303(1,0,0,24)
_0x4B6B.BackgroundTransparency = 1
local _0xACC7 = _0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _0x4B6B)
_0xACC7.FillDirection = Enum.FillDirection.Horizontal
_0xACC7.Padding = _0xEA4A(0,4)
_0xACC7.Parent = _0x4B6B
local _0x96EF = {string.char(67,97,98,101,195,167,97),string.char(84,114,111,110,99,111)}
local _0x69A2 = {}
local function _0x69AD()
for _,item in ipairs(_0x69A2) do
if item.Nome == _0xED34.ParteAlvo then
item.Btn.BackgroundColor3 = _0x2E5E(60,40,110)
item.Btn.TextColor3 = _0xA737.PurpleLight
item.Stroke.Color = _0xA737.Purple
else
item.Btn.BackgroundColor3 = _0x2E5E(30,30,40)
item.Btn.TextColor3 = _0xA737.Gray
item.Stroke.Color = _0xA737.Stroke
end
end
end
for _,nome in ipairs(_0x96EF) do
local _0xE9E5 = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), _0x4B6B)
_0xE9E5.Size = _0x7303(0.5,-2,1,0)
_0xE9E5.BackgroundColor3 = _0x2E5E(30,30,40)
_0xE9E5.Text = nome
_0xE9E5.TextColor3 = _0xA737.Gray
_0xE9E5.Font = _0x5ED4
_0xE9E5.TextSize = 10
_0xE9E5.BorderSizePixel = 0
_0xE9E5.AutoButtonColor = false
_0xF6BF(_0xE9E5,6)
local _0x7808 = _0x1A8B(_0xE9E5,_0xA737.Stroke,1)
table.insert(_0x69A2,{Btn=_0xE9E5,Nome=nome,_0x1A8B=_0x7808})
_0xE9E5.MouseButton1Click:Connect(function()
_0xED34.ParteAlvo = nome
_0x69AD()
end)
end
_0x69AD()
_0x2857.Slider(_0xA426, 4,string.char(84,97,109,97,110,104,111,32,70,79,86), _0xED34.FOV, 20, 200, false,
function(_0xB138) _0xED34.FOV = _0xB138 end)
_0x2857.Slider(_0xA426, 5,string.char(84,114,97,110,115,112,97,114,195,170,110,99,105,97), _0xED34.RingTransparency, 0, 1, true,
function(_0xB138) _0xED34.RingTransparency = _0xB138 end)
local _0x6D3A = _0x4524(string.char(70,114,97,109,101), _0xA426)
_0x6D3A.Size = _0x7303(1,0,0,34)
_0x6D3A.BackgroundTransparency = 1
_0x6D3A.LayoutOrder = 6
local _0xE60B = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0x6D3A)
_0xE60B.BackgroundTransparency = 1
_0xE60B.Position = _0xEA31(0,0)
_0xE60B.Size = _0x7303(1,0,0,14)
_0xE60B.Text =string.char(67,111,114,32,100,111,32,70,79,86)_0xE60B.TextColor3 = _0xA737.Gray
_0xE60B.Font = _0xC9E5
_0xE60B.TextSize = 10
_0xE60B.TextXAlignment = _0xC25C
local _0x088A = _0x4524(string.char(70,114,97,109,101), _0x6D3A)
_0x088A.Position = _0xEA31(0,18)
_0x088A.Size = _0x7303(1,0,0,16)
_0x088A.BackgroundTransparency = 1
local _0xC4FB = _0x4524(string.char(85,73,76,105,115,116,76,97,121,111,117,116), _0x088A)
_0xC4FB.FillDirection = Enum.FillDirection.Horizontal
_0xC4FB.Padding = _0xEA4A(0,4)
_0xC4FB.Parent = _0x088A
local _0xFD6D = {
_0x2E5E(150,80,255),_0x2E5E(255,0,0),_0x2E5E(0,255,100),
_0x2E5E(255,200,0),_0x2E5E(0,200,255),_0x2E5E(255,0,255),_0x2E5E(255,255,255)
}
for _,cor in ipairs(_0xFD6D) do
local _0xE9E5 = _0x4524(string.char(84,101,120,116,66,117,116,116,111,110), _0x088A)
_0xE9E5.Size = _0xEA31(16,16)
_0xE9E5.BackgroundColor3 = cor
_0xE9E5.BorderSizePixel = 0
_0xE9E5.Text =""_0xE9E5.AutoButtonColor = false
_0xF6BF(_0xE9E5,4) _0x1A8B(_0xE9E5,_0xA737.Stroke,1)
_0xE9E5.MouseButton1Click:Connect(function() _0xED34.Cor = cor end)
end
_0x30D4.CanvasPosition = _0x426D()
endlocal _0x60C6
do
local _0xE924={Fundo=_0x2E5E(10,10,14),Card=_0x2E5E(20,20,28),Borda=_0x2E5E(0,220,255),
Texto=_0x2E5E(240,240,250),Verde=_0x2E5E(0,190,110),Vermelho=_0x2E5E(220,50,70),
Amarelo=_0x2E5E(255,200,0),Cinza=_0x2E5E(80,80,95)}
local _0xBCAF=os.clock()
_0x3228:SetAttribute(string.char(90,75,89,65,114,109),_0xBCAF)
local function _0xF09C() return _0x3228:GetAttribute(string.char(90,75,89,65,114,109))==_0xBCAF end
local function _0xDE3C(_0x5B52)
if not _0x5B52 then return false end
return _0x5B52.G>0.2 and _0x5B52.G>_0x5B52.R*1.1 and _0x5B52.G>_0x5B52.B*1.1
end
local function _0x5177(obj)
if not obj or not obj.Parent then return end
if obj:IsA(string.char(70,114,97,109,101)) then
local _0xFCD1=obj.AbsoluteSize.X*obj.AbsoluteSize.Y
if _0xDE3C(obj.BackgroundColor3) or obj.BackgroundColor3==_0x2E5E(0,0,0) then
obj.BackgroundColor3=_0xFCD1>30000 and _0xE924.Fundo or _0xE924.Card
end
if _0xFCD1>5000 then
if not obj:FindFirstChildOfClass(string.char(85,73,67,111,114,110,101,114)) then
_0x4524(string.char(85,73,67,111,114,110,101,114),obj).CornerRadius=_0xEA4A(0,10)
end
local _0x7808=obj:FindFirstChildOfClass(string.char(85,73,83,116,114,111,107,101))
if not _0x7808 then _0x7808=_0x4524(string.char(85,73,83,116,114,111,107,101),obj) end
if _0xDE3C(_0x7808.Color) or _0x7808.Transparency>0.5 then
_0x7808.Color=_0xE924.Borda _0x7808.Thickness=1 _0x7808.Transparency=0.4
end
end
elseif obj:IsA(string.char(83,99,114,111,108,108,105,110,103,70,114,97,109,101)) then
obj.BorderSizePixel=0 obj.ScrollBarImageColor3=_0xE924.Borda
if _0xDE3C(obj.BackgroundColor3) then obj.BackgroundColor3=_0xE924.Fundo end
elseif obj:IsA(string.char(84,101,120,116,76,97,98,101,108)) then
if _0xDE3C(obj.TextColor3) then obj.TextColor3=_0xE924.Texto end
elseif obj:IsA(string.char(84,101,120,116,66,117,116,116,111,110)) then
if _0xDE3C(obj.BackgroundColor3) then obj.BackgroundColor3=_0xE924.Verde end
if _0xDE3C(obj.TextColor3) then obj.TextColor3=Color3.new(1,1,1) end
if not obj:FindFirstChildOfClass(string.char(85,73,67,111,114,110,101,114)) then
_0x4524(string.char(85,73,67,111,114,110,101,114),obj).CornerRadius=_0xEA4A(0,6)
end
elseif obj:IsA(string.char(73,109,97,103,101,76,97,98,101,108)) or obj:IsA(string.char(73,109,97,103,101,66,117,116,116,111,110)) then
if _0xDE3C(obj.BackgroundColor3) then obj.BackgroundColor3=_0xE924.Card end
end
end
local function _0xC2BF(_0x6B2C)
if not _0x6B2C or not _0x6B2C.Parent then return end
for _,obj in ipairs(_0x6B2C:GetDescendants()) do pcall(_0x5177,obj) end
if not _0x6B2C:FindFirstChild(string.char(65,107,105,114,97,77,97,114,107)) then
local _0xFE1A=_0x4524(string.char(84,101,120,116,76,97,98,101,108),_0x6B2C)
_0xFE1A.Name=string.char(65,107,105,114,97,77,97,114,107)_0xFE1A.Size=_0x7303(1,-20,0,16)
_0xFE1A.Position=_0x7303(0,10,1,-18) _0xFE1A.BackgroundTransparency=1
_0xFE1A.Text=string.char(226,154,161,32,98,121,32,65,107,105,114,97)_0xFE1A.TextColor3=_0xE924.Borda _0xFE1A.Font=_0x5ED4
_0xFE1A.TextSize=11 _0xFE1A.ZIndex=200
end
end
local function _0x1542(nome)
for _,_0xACA3 in ipairs(_0x3228:GetChildren()) do
if _0xACA3:IsA(string.char(83,99,114,101,101,110,71,117,105)) and _0xACA3.Name==nome then return _0xACA3 end
end
for _,_0xACA3 in ipairs(_0x3228:GetDescendants()) do
if _0xACA3:IsA(string.char(83,99,114,101,101,110,71,117,105)) and _0xACA3.Name==nome then return _0xACA3 end
end
end
local _0xBF60={}
local function _0x1644(nome)
local _0xACA3=_0xBF60[nome]
if _0xACA3 and _0xACA3.Parent then return _0xACA3 end
return _0x1542(nome)
end
task.spawn(function()
while _0xF09C() do
task.wait(0.5)
local _0xACA3=_0x1644(string.char(71,117,110,83,104,111,112,71,117,105))
if _0xACA3 and _0xACA3~=_0xBF60.GunShopGui then
_0xBF60.GunShopGui=_0xACA3
_0xACA3:GetPropertyChangedSignal(string.char(69,110,97,98,108,101,100)):Connect(function()
if _0xACA3.Enabled then task.wait(0.15) _0xC2BF(_0xACA3) end
end)
end
end
end)
task.spawn(function()
while _0xF09C() do
task.wait(0.8)
local _0xACA3=_0x1644(string.char(71,117,110,83,104,111,112,71,117,105))
if _0xACA3 and _0xACA3.Enabled then pcall(_0xC2BF,_0xACA3) end
end
end)
local function _0xDB18()
local _0xACA3=_0x1644(string.char(71,117,110,83,104,111,112,71,117,105))
if not _0xACA3 then _0xF45C(string.char(69,82,82,79),string.char(76,111,106,97,32,100,101,32,97,114,109,97,115,32,110,195,163,111,32,101,110,99,111,110,116,114,97,100,97,32,110,111,32,106,111,103,111,46),string.char(69,114,114,111,114)) return end
_0xACA3.Enabled=true task.wait(0.15) _0xC2BF(_0xACA3)
end
_0x60C6=function()
_0x04FA=string.char(76,111,106,97)_0xC52E()
local _0x3F04 = _0x2857.Card(_0xA5D6, 0,string.char(239,191,189,239,191,189,32,76,111,106,97,32,100,101,32,65,114,109,97,115))
local _0x695B = _0x4524(string.char(84,101,120,116,76,97,98,101,108), _0x3F04)
_0x695B.Size = _0x7303(1,0,0,40)
_0x695B.BackgroundTransparency = 1
_0x695B.Text =string.char(65,98,114,101,32,97,32,108,111,106,97,32,100,101,32,97,114,109,97,115,32,100,111,32,106,111,103,111,32,99,111,109,32,118,105,115,117,97,108,32,100,97,114,107,46)_0x695B.TextColor3 = _0xA737.Gray
_0x695B.Font = _0xC9E5
_0x695B.TextSize = 10
_0x695B.TextWrapped = true
_0x695B.TextXAlignment = _0xC25C
_0x695B.TextYAlignment = Enum.TextYAlignment.Top
_0x695B.LayoutOrder = 1
_0x2857.ActionButton(_0x3F04, 2,string.char(226,150,182,32,65,98,114,105,114,32,76,111,106,97), _0x2E5E(30,30,40), _0xDB18)
_0x30D4.CanvasPosition=_0x426D()
end
endlocal function _0x23EC(_0xE9E5)
if _0xA513 then
_0xA513.BackgroundColor3=_0xA737.Card
_0xA513.TextColor3=_0xA737.Gray
end
_0xA513=_0xE9E5
_0xE9E5.BackgroundColor3=_0xA737.Selected
_0xE9E5.TextColor3=_0xA737.White
end
_0x4E6B.MouseButton1Click:Connect(function()
_0x23EC(_0x4E6B) ShowEBDelta()
end)
_0xE20E.MouseButton1Click:Connect(function()
_0x23EC(_0xE20E) _0x685A()
end)
_0xD47A.MouseButton1Click:Connect(function()
_0x23EC(_0xD47A) _0xC085()
end)
_0x4CAF.MouseButton1Click:Connect(function()
_0x23EC(_0x4CAF) _0x35FC()
end)
_0x07FE.MouseButton1Click:Connect(function()
_0x23EC(_0x07FE) ShowCombate()
end)
_0x8EDF.MouseButton1Click:Connect(function()
_0x23EC(_0x8EDF) ShowTextosProntos()
end)
_0xDAF5.MouseButton1Click:Connect(function()
_0x23EC(_0xDAF5) _0x0672()
end)
_0x874B.MouseButton1Click:Connect(function()
_0x23EC(_0x874B) _0x60C6()
end)local _0x20B0=false
local _0x76E3,_0x10E2
_0x3B21.InputBegan:Connect(function(_0xA98B)
if _0xA98B.UserInputType==Enum.UserInputType.MouseButton1 or _0xA98B.UserInputType==Enum.UserInputType.Touch then
_0x20B0=true _0x76E3=_0xA98B.Position _0x10E2=_0x3B21.Position
_0xA98B.Changed:Connect(function()
if _0xA98B.UserInputState==Enum.UserInputState.End then _0x20B0=false end
end)
end
end)
_0x4E58.InputChanged:Connect(function(_0xA98B)
if _0x20B0 and (_0xA98B.UserInputType==Enum.UserInputType.MouseMovement or _0xA98B.UserInputType==Enum.UserInputType.Touch) then
local _0xEB91=_0xA98B.Position-_0x76E3
_0x3B21.Position=_0x7303(_0x10E2.X.Scale,_0x10E2.X.Offset+_0xEB91.X,
_0x10E2.Y.Scale,_0x10E2.Y.Offset+_0xEB91.Y)
end
end)
local _0x7C2F=false
local _0xD5C7,_0xCADE
_0xDBB5.InputBegan:Connect(function(_0xA98B)
if _0xA98B.UserInputType==Enum.UserInputType.MouseButton1 or _0xA98B.UserInputType==Enum.UserInputType.Touch then
_0x7C2F=true _0xD5C7=_0xA98B.Position _0xCADE=_0x5B0B.Position
_0xA98B.Changed:Connect(function()
if _0xA98B.UserInputState==Enum.UserInputState.End then _0x7C2F=false end
end)
end
end)
_0x4E58.InputChanged:Connect(function(_0xA98B)
if _0x7C2F and (_0xA98B.UserInputType==Enum.UserInputType.MouseMovement or _0xA98B.UserInputType==Enum.UserInputType.Touch) then
local _0xEB91=_0xA98B.Position-_0xD5C7
_0x5B0B.Position=_0x7303(_0xCADE.X.Scale,_0xCADE.X.Offset+_0xEB91.X,
_0xCADE.Y.Scale,_0xCADE.Y.Offset+_0xEB91.Y)
end
end)
local _0x2A42=false
local function _0x8D9D()
if _0x2A42 then return end
_0x2A42=true _0x5B0B.Visible=true
_0x5B0B.Size=UDim2.fromScale(.25,.15) _0x5B0B.BackgroundTransparency=1
_0xA77C:Create(_0x5B0B,TweenInfo.new(.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
{Size=UDim2.fromScale(.78,.65),BackgroundTransparency=0}):Play()
end
local function _0xDA7E()
if not _0x2A42 then return end
_0x2A42=false
local _0xA75B=_0xA77C:Create(_0x5B0B,TweenInfo.new(.25,Enum.EasingStyle.Quart,Enum.EasingDirection.In),
{Size=UDim2.fromScale(.25,.15),BackgroundTransparency=1})
_0xA75B:Play()
_0xA75B.Completed:Wait()
if not _0x2A42 then _0x5B0B.Visible=false end
end
_0x3B21.MouseButton1Click:Connect(function()
if _0x2A42 then _0xDA7E() else _0x8D9D() end
end)
_0xD337.MouseButton1Click:Connect(_0xDA7E)task.defer(function()
local _0xC3F7=0
for _,_0x2833 in ipairs(_0xA36A) do
if _0x5047(_0x2833) then _0xC3F7+=1 end
end
local _0xADF0=_0xDC92(string.char(84,111,114,114,101,32,49),string.char(195,154,110,105,99,97))
local _0x8C11=0
for _,rn in ipairs(_0xF051) do
if _0xDC92(string.char(84,111,114,114,101,32,50),rn) then _0x8C11+=1 end
end
ShowEBDelta()
_0xF45C(string.char(90,75,89,32,80,65,82,75,79,85,82),_0xC3F7..string.char(47,52,32,112,97,114,107,111,117,114,115,32,226,128,162,32,84,111,114,114,101,32,49,58,32)..(_0xADF0 andstring.char(79,75)orstring.char(69,82,82,79))..string.char(32,226,128,162,32,84,111,114,114,101,32,50,58,32)..lt2..string.char(47,52),
_0xC3F7==4 and _0xADF0 and _0x8C11==4 andstring.char(83,117,99,99,101,115,115)orstring.char(69,114,114,111,114))
end)
print(string.char(65,75,73,82,65,32,77,69,78,85,32,86,50,46,50,46,49,32,99,97,114,114,101,103,97,100,111,32,99,111,109,32,115,117,99,101,115,115,111,33))