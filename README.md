-- Sparkler Effects Script (GitHub投稿版)
local RS,TS,UIS,P=game:GetService("RunService"),game:GetService("TweenService"),game:GetService("UserInputService"),game:GetService("Players")
local N=getgenv().Network;if not N then warn("Network not found")end
local p,pG,c,h=P.LocalPlayer,P.LocalPlayer:WaitForChild("PlayerGui"),P.LocalPlayer.Character or P.LocalPlayer.CharacterAdded:Wait()
h=c:WaitForChild("HumanoidRootPart")
local s={sparklerName="FireworkSparkler",speed=0.05,size=20,heightOffset=10,isRunning=false,currentPattern="star",autoRotate=false}
local con,eff={},{}

local sG=Instance.new("ScreenGui")sG.Name,sG.ResetOnSpawn,sG.Parent="SparklerGUI",false,pG
local mF=Instance.new("Frame")mF.Size,mF.Position,mF.BackgroundColor3,mF.BorderSizePixel,mF.Active,mF.Draggable,mF.Parent=UDim2.new(0,350,0,400),UDim2.new(0,50,0,50),Color3.new(0.1,0.1,0.15),0,true,true,sG
local mC=Instance.new("UICorner")mC.CornerRadius,mC.Parent=UDim.new(0,10),mF

local tL=Instance.new("TextLabel")tL.Size,tL.BackgroundColor3,tL.Text,tL.TextColor3,tL.Text
