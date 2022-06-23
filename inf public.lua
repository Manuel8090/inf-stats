local Slot="Slot2" --the one that will be used as a dummy for stats(namekian)
local PointSlot="Slot3" --the one that gets the points

game.Players.LocalPlayer.PlayerGui.HUD.Bottom.Stats.Visible = true

if not game:IsLoaded() then
    game.Loaded:Wait()
end;
repeat
    game:GetService("RunService").RenderStepped:Wait();
until game.Players.LocalPlayer;
task.wait(5);
Worlds={552500546,536102540}
if game.PlaceId == Worlds[1] then
    repeat
        task.wait()
    until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Setup"):FindFirstChild("Frame"):FindFirstChild("Side"):FindFirstChild("Race").Visible == true
    repeat
        game.Players.LocalPlayer.Backpack.Scripter.RemoteEvent:FireServer(game.Players.LocalPlayer.PlayerGui.Setup.Frame.Side.Race,"up")
        task.wait(0.5)
    until game.Players.LocalPlayer.PlayerGui.Setup.Frame.Side.Race.Set.Texter.Text == "Namekian"
    task.wait(3)
    path=game:GetService("Players").LocalPlayer.PlayerGui.Setup.Frame.Side.Finish
    firesignal(path.MouseButton1Click);
    return
end;
if game.PlaceId ~= Worlds[2] then task.wait(10) game:GetService("TeleportService"):teleport(Worlds[2]) return end;
task.spawn(function()
    while task.wait() do
        firetouchinterest(game.Players.LocalPlayer.Character.Head,game.Workspace.Touchy.Part,0)
        task.wait()
        firetouchinterest(game.Players.LocalPlayer.Character.Head,game.Workspace.Touchy.Part,1)
        game:GetService("RunService").Stepped:Connect(function()
            if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Popup") and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Popup").Enabled == true then
                game.Players.LocalPlayer.PlayerGui.Popup.Enabled = false
            end;
        end);
    end;
end);
function SlotChange(slot)
    game.Players.LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs["Character Slot Changer"])
    repeat task.wait() game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"Yes"}) until game.Players.LocalPlayer.PlayerGui.HUD.Bottom.ChatGui.TextLabel.Text == "Alright"
    task.wait(.15)
    repeat task.wait() game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"k"}) until game.Players.LocalPlayer.PlayerGui.HUD.Bottom.ChatGui.TextLabel.Text == "Which slot would you like to play in?"
    task.wait(.15)
    repeat task.wait() game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({slot}) until game.Players.LocalPlayer.PlayerGui.HUD.Bottom.ChatGui.TextLabel.Text == "Loading!"
end;
repeat
    task.wait();
until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Block");
Chr = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
Race = Chr:WaitForChild("Race");
if Race.Value ~= "Namekian" then
    task.wait(.1)
    repeat
        pcall(SlotChange,Slot);
        task.wait(5);
    until game.Players.LocalPlayer.Character.Race.Value == "Namekian";
end;
Level = tonumber(game.Players.LocalPlayer.PlayerGui.HUD.Bottom.Stats.LVL.Val.Text);
if Level < 50 then
    local lplr = game:GetService('Players').LocalPlayer
    for i,v in pairs(workspace.FriendlyNPCs:GetDescendants()) do
        if v.Name == 'Chat' and v.ClassName ~= 'Folder' then
            if v.Value == "I heard there's a spaceship in Yunzabit Heights" then
                v.Parent.Parent.Name = 'Quest_1'
            elseif v.Value == "We need your help in the future!" then
                v.Parent.Parent.Name = 'Quest_2'
            elseif v.Value == "Hey want to explore the galaxy?" then
                v.Parent.Parent.Name = 'Quest_3'
            elseif v.Value == "Whatup" then
                v.Parent.Parent.Name = 'Quest_4'
            elseif v.Value == "YOU THINK YOU CAN STOP THE UNIVERSAL CHAMPION?" then
                v.Parent.Parent.Name = "Quest_5"
            elseif v.Value == "You know, I heard there's a floating platform above Korin's Tower" then
                v.Parent.Parent.Name = "Quest_6"
            elseif v.Value == "I'm interested in joining the ranked matches at the tournament arena!" then
                v.Parent.Parent.Name = "Quest_7"
            elseif v.Value == "I have a packge for Master Roshi" then
                v.Parent.Parent.Name = "Quest_8"
            end;
        end
    end
    function distance(vect1,vect2)
        return (vect1 - vect2).Magnitude;
    end;
    function Autofarm(Npc)
        while task.wait() do
            for i,v in pairs(game.Workspace.Live:GetChildren()) do
                if v.Name:lower():find(Npc:lower()) and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health ~= 0 then
                    local step=game:GetService("RunService").Stepped:Connect(function()
                        local dist = distance(v.HumanoidRootPart.Position,lplr.Character.HumanoidRootPart.Position);
                        game:GetService("TweenService"):Create(lplr.Character.HumanoidRootPart,TweenInfo.new(dist/5000),{CFrame=v.HumanoidRootPart.CFrame * CFrame.new(0,0,2)}):Play()
                    end);
                    repeat
                        task.wait(.33);
                        lplr.Backpack.ServerTraits.Input:FireServer({"md"},"")
                    until not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid") or v.Humanoid.Health == 0;
                    step:Disconnect();
                end;
            end
            if not lplr.PlayerGui.HUD.FullSize.Quests:FindFirstChild("Copy") then
                break;
            end;
        end
    end;
    function quest_remotes(x,y,z,v)
        lplr.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs[x])
        task.wait(.1)
        lplr.Backpack.ServerTraits.ChatAdvance:FireServer({y})
        task.wait(.75)
        lplr.Backpack.ServerTraits.ChatAdvance:FireServer({y})
        task.wait(.75)
        lplr.Backpack.ServerTraits.ChatAdvance:FireServer({z})
        task.wait(.75)
        lplr.Backpack.ServerTraits.ChatAdvance:FireServer({y})
        task.wait(.75)
        lplr.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs:FindFirstChild(tostring(v)) or 'nil');
        task.wait(.5)
    end
    quest_remotes('Quest_1','k','Yes','NamekianShip')
    quest_remotes('Quest_2','k','Yes','TimeMachine')
    quest_remotes('Quest_3','k','Yes','SpaceShip')
    quest_remotes('Quest_4','k','Yes','Krillin')
    lplr.Backpack.ServerTraits.ChatAdvance:FireServer({"No"})
    task.wait(.75)
    lplr.Backpack.ServerTraits.ChatAdvance:FireServer({"k"})
    task.wait(.75)
    lplr.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs["Elder Kai"])
    task.wait(.75)
    lplr.Backpack.ServerTraits.ChatAdvance:FireServer({'k'})
    task.wait(.75)
    lplr.Backpack.ServerTraits.ChatAdvance:FireServer({'Yes'})
    task.wait(.75)
    lplr.Backpack.ServerTraits.ChatAdvance:FireServer({'k'})
    task.wait(.75)
    lplr.Backpack.ServerTraits.ChatAdvance:FireServer({'k'})
    task.wait(1);
    -- [[ the end of credits to shuko ]] --
    quest_remotes('Quest_6','k','Yes','Popo')
    lplr.Backpack.ServerTraits.ChatAdvance:FireServer({'k'})
    task.wait(.5);
    quest_remotes('Quest_7','k','Yes','Help Center');
    lplr.Backpack.ServerTraits.ChatAdvance:FireServer({'k'})
    task.wait(.5);
    quest_remotes('Quest_8','k','Yes','Roshi')
    lplr.Backpack.ServerTraits.ChatAdvance:FireServer({'k'})
    task.wait(.5)
    quest_remotes('Future Trunks','k','Alright');
    coroutine.wrap(function()
        points = tonumber(game.Players.LocalPlayer.PlayerGui.HUD.Bottom.Stats['StatPoints'].Val.Text)
        for i=1,(points or 2) do
            game:GetService("Players").LocalPlayer.Backpack.ServerTraits.AttemptUpgrade:FireServer(game:GetService("Players").LocalPlayer.PlayerGui.HUD.Bottom.Stats["Phys-Damage"])
            task.wait(.05)
	    end;
    end)();
    task.wait(.5)
    Autofarm('Imperfect Cell');
    -- task.wait(.5);
    -- quest_remotes('Quest_5','k',"Yes");
    -- task.wait(.5)
    -- Autofarm("Universal Champion")
end;
task.wait(1);
if not workspace.FriendlyNPCs:FindFirstChild("KAMI") then
    game.Players.LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs["Start New Game [Redo Character]"]);
    task.wait(0.5);
    game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"Yes"});
    task.wait(0.5);
    game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"k"});
    task.wait(0.5);
    game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"Yes"});
    return;
end;
game.Players.LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs['KAMI']);
task.wait(.75)
game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({'k'});
task.wait(.5);
pcall(function()
    SlotChange(PointSlot);
end);
task.wait(10);
if game.Players.LocalPlayer.Character:FindFirstChild("Race") and (game.Players.LocalPlayer.Character.Race.Value == "Namekian" or game.Players.LocalPlayer.Character.Race.Value == "Namekian" and not workspace.FriendlyNPCs:FindFirstChild("KAMI")) then
    repeat task.wait(.5);pcall(function()
        if game.Players.LocalPlayer.Character:FindFirstChild("Race") and game.Players.LocalPlayer.Character.Race.Value == "Namekian" then
            game.Players.LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs["Start New Game [Redo Character]"]);
            task.wait(0.5);
            game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"Yes"});
            task.wait(0.5);
            game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"k"});
            task.wait(0.5);
            game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"Yes"});
        else
            SlotChange(Slot);
        end;
	end)
    until game.PlaceId ~= game.PlaceId;
else
    repeat
        pcall(SlotChange,Slot);
        task.wait(10);
    until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Race") and game.Players.LocalPlayer.Character:FindFirstChild("Race").Value == "Namekian";
    task.wait(.1)
    repeat task.wait(.5); pcall(function()
        if game.Players.LocalPlayer.Character:FindFirstChild("Race") and game.Players.LocalPlayer.Character.Race.Value == "Namekian" then
            game.Players.LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(workspace.FriendlyNPCs["Start New Game [Redo Character]"]);
            task.wait(0.5);
            game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"Yes"});
            task.wait(0.5);
            game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"k"});
            task.wait(0.5);
            game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({"Yes"});
        else
            SlotChange(Slot);
        end;
	end)
    until game.PlaceId ~= game.PlaceId;
end;
