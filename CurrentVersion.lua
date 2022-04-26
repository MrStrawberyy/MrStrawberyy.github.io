local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Bestieee", "Serpent") --Creates the UI

--VERSION
local CurrentVersion = 1.2

function TestVersion(Version)
   if CurrentVersion ~= 1 then
       game.StarterGui:SetCore("SendNotification", {
          Title = "Version: "..CurrentVersion;
          Text = "You are Running the Newest Version of Bestieee!";
          Duration = 5
       })
   end
end

--Tables
local BenResponces = {
    "Ben: Hohoho";
    "Ben: No.";
    "Ben: Yes!";
    "Ben: Ugh";
}

--Services
local Players = game:GetService("Players")

--Others
local player = game.Players.LocalPlayer
local Jumpies = false
local DONTCHANGE = false
local BENACTIVE = false

--Tabs
local MainTab = Window:NewTab("Main Tab")
local DahoodTab = Window:NewTab("Dahood Tab")
local ToggleTab = Window:NewTab("Toggle Tab")
local OtherTab = Window:NewTab("Other Games")

--Sections
local MainSection = MainTab:NewSection("Main Tab")

--DaHood Sections
local DahoodMoneySection = DahoodTab:NewSection("Money Tab")
local DahoodMoneySection = DahoodTab:NewSection(" ")

--Other Sections
local TargetSection = DahoodTab:NewSection("Target Tab")
local ToggleSection = ToggleTab:NewSection("Toggle Tab")
local OtherSection = OtherTab:NewSection("Player")

--Functions
function bentalkmoment()
    wait(0.3)
    if BENACTIVE == true then
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(BenResponces[math.random(1,#BenResponces)],"All")
    else
       
    end
end    

--Notification
game.StarterGui:SetCore("SendNotification", {
    Title = "Version: "..CurrentVersion;
    Text = "You are Running the Newest Version of Bestieee!";
    Duration = 5
})

--Main Stuff
MainSection:NewKeybind("Close UI", "Closes The UI.", Enum.KeyCode.M, function()
    Library:ToggleUI()
end)



--Player Stuff
DahoodMoneySection:NewSlider("Balance Changer", "SliderInfo", 10000000, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.DataFolder.Currency.Value = s
    game.Players.LocalPlayer.Backpack.Wallet.Handle.BillboardGui.TextLabel.Text = game.Players.LocalPlayer.PlayerGui.MainScreenGui.MoneyText.Text
end)


--Toggle Stuff
ToggleSection:NewToggle("BEN", "Toggles ben", function(state)
    if state then
        BENACTIVE = true
    else
        BENACTIVE = false
    end
end)

ToggleSection:NewToggle("Jumpies", "Constantly Jump", function(state)
    if state then
        Jumpies = true
        if Jumpies == true then
            repeat 
                wait(0.3)
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
            until
           Jumpies == false
        end
    else
        Jumpies = false
        game.Players.LocalPlayer.Character.Humanoid.Jump = false
    end
end)

--Other Stuff
OtherSection:NewSlider("Speed", "Gives you speed", 128, 16, function(s) --16 to 128
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
OtherSection:NewSlider("JumpPower", "Gives you speed", 250, 50, function(s) --16 to 128
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

player.Chatted:Connect(bentalkmoment)
