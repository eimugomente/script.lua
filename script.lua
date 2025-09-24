
-- Sparkler Effects - 埋め込みURL式スクリプト (短縮版)
-- 使用方法: このコードを実行するだけでGUI付きエフェクトが起動します
loadstring(game:HttpGet("https://raw.githubusercontent.com/username/sparkler-effects/main/script.lua", true))()

--[[
実際に展開されるスクリプト内容 (GitHub等にアップロード用):
--]]

--[[
local RS,TS,UIS,P=game:GetService("RunService"),game:GetService("TweenService"),game:GetService("UserInputService"),game:GetService("Players")
local N=getgenv().Network;if not N then warn("Network not found")end
local p,pG,c,h=P.LocalPlayer,P.LocalPlayer:WaitForChild("PlayerGui"),P.LocalPlayer.Character or P.LocalPlayer.CharacterAdded:Wait()
h=c:WaitForChild("HumanoidRootPart")
local s={sparklerName="FireworkSparkler",speed=0.05,size=20,heightOffset=10,isRunning=false,currentPattern="star",autoRotate=false}
local con,eff={},{}

local sG=Instance.new("ScreenGui")sG.Name,sG.ResetOnSpawn,sG.Parent="SparklerGUI",false,pG
local mF=Instance.new("Frame")mF.Size,mF.Position,mF.BackgroundColor3,mF.BorderSizePixel,mF.Active,mF.Draggable,mF.Parent=UDim2.new(0,350,0,400),UDim2.new(0,50,0,50),Color3.new(0.1,0.1,0.15),0,true,true,sG
local mC=Instance.new("UICorner")mC.CornerRadius,mC.Parent=UDim.new(0,10),mF

local tL=Instance.new("TextLabel")tL.Size,tL.BackgroundColor3,tL.Text,tL.TextColor3,tL.TextScaled,tL.Font,tL.Parent=UDim2.new(1,0,0,35),Color3.new(0.2,0.2,0.3),"🎆 Sparkler Effects 🎆",Color3.new(1,1,1),true,Enum.Font.GothamBold,mF
local tC=Instance.new("UICorner")tC.CornerRadius,tC.Parent=UDim.new(0,10),tL

local function cB(p,t,pos,sz,cb)
local b=Instance.new("TextButton")b.Size,b.Position,b.BackgroundColor3,b.Text,b.TextColor3,b.TextScaled,b.Font,b.Parent=sz or UDim2.new(0,80,0,25),pos,Color3.new(0.3,0.6,1),t,Color3.new(1,1,1),true,Enum.Font.Gotham,p
local bC=Instance.new("UICorner")bC.CornerRadius,bC.Parent=UDim.new(0,5),b
b.MouseEnter:Connect(function()TS:Create(b,TweenInfo.new(0.2),{BackgroundColor3=Color3.new(0.4,0.7,1)}):Play()end)
b.MouseLeave:Connect(function()TS:Create(b,TweenInfo.new(0.2),{BackgroundColor3=Color3.new(0.3,0.6,1)}):Play()end)
if cb then b.MouseButton1Click:Connect(cb)end;return b end

local function gSP(cP,sz,pts)local pos={};pts=pts or 5;local aS=(math.pi*2)/(pts*2)
for i=0,pts*2-1 do local a,r=i*aS,(i%2==0)and sz or sz*0.4;local x,z=cP.X+math.cos(a)*r,cP.Z+math.sin(a)*r
table.insert(pos,Vector3.new(x,cP.Y+s.heightOffset,z))end;return pos end

local function gHP(cP,sz)local pos,st={},40
for i=0,st do local t=(i/st)*math.pi*2;local x,z=cP.X+sz*(16*math.sin(t)^3)/16,cP.Z+sz*(13*math.cos(t)-5*math.cos(2*t)-2*math.cos(3*t)-math.cos(4*t))/16
table.insert(pos,Vector3.new(x,cP.Y+s.heightOffset,z))end;return pos end

local function lS(pos)if N and N.Invoke then N:Invoke(s.sparklerName,pos)end end

local function aP(pos,dur,nm)local sT,tP=tick(),#pos;local cn;cn=RS.Heartbeat:Connect(function()
if not s.isRunning then cn:Disconnect();con[nm]=nil;return end;local e,p=(tick()-sT)%dur/dur,math.floor(p*tP)+1
if p<=tP then lS(pos[p])end end);con[nm]=cn;return cn end

local function start()if s.isRunning then return end;s.isRunning=true;local cP=h.Position
if s.currentPattern=="star"then aP(gSP(cP,s.size,5),2,"star")
elseif s.currentPattern=="heart"then aP(gHP(cP,s.size),3,"heart")
elseif s.currentPattern=="all"then aP(gSP(cP+Vector3.new(-s.size,0,0),s.size,5),2,"star");aP(gHP(cP,s.size),3,"heart")end end

local function stop()s.isRunning=false;for n,c in pairs(con)do if c then c:Disconnect()end;con[n]=nil end end

local sB=cB(mF,"▶️ Start",UDim2.new(0,10,0,45),UDim2.new(0,70,0,25),start)
local stB=cB(mF,"⏹️ Stop",UDim2.new(0,90,0,45),UDim2.new(0,70,0,25),stop)
local cB1=cB(mF,"⭐ Star",UDim2.new(0,10,0,80),UDim2.new(0,70,0,25),function()s.currentPattern="star"end)
local cB2=cB(mF,"💖 Heart",UDim2.new(0,90,0,80),UDim2.new(0,70,0,25),function()s.currentPattern="heart"end)
local cB3=cB(mF,"🎆 All",UDim2.new(0,170,0,80),UDim2.new(0,70,0,25),function()s.currentPattern="all"end)

local cl=cB(mF,"✕",UDim2.new(1,-30,0,5),UDim2.new(0,25,0,25),function()stop();sG:Destroy()end)
cl.BackgroundColor3=Color3.new(1,0.3,0.3)

local st=Instance.new("TextLabel")st.Size,st.Position,st.BackgroundTransparency,st.Text,st.TextColor3,st.TextScaled,st.Font,st.Parent=UDim2.new(1,-20,0,25),UDim2.new(0,10,0,115),1,"Status: Ready",Color3.new(0.9,0.9,0.9),true,Enum.Font.Gotham,mF

spawn(function()while true do if s.isRunning then st.Text,st.TextColor3="Status: Running - "..s.currentPattern:upper(),Color3.new(0.3,1,0.3)else st.Text,st.TextColor3="Status: Stopped",Color3.new(1,0.3,0.3)end;wait(0.5)end end)

UIS.InputBegan:Connect(function(i,g)if g then return end
if i.KeyCode==Enum.KeyCode.F then if s.isRunning then stop()else start()end elseif i.KeyCode==Enum.KeyCode.G then sG.Enabled=not sG.Enabled end end)

print("✨ Sparkler Effects loaded! Press F to toggle, G to show/hide GUI")
--]]
