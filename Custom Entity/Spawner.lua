local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/arkanzulfadliputra-oss/Custom-Entity-Model/refs/heads/main/Custom%20Entity/Source.lua"))()

local config = {
    Entity = {
        Name = "A-69 Custom",
        Asset = "14040465404",
        HeightOffset = 0
    },
    Spawned = {
        SpawnInFront = false,
        SpawnInBehind = true
    },
    Movement = {
        Speed = 200,
        Delay = 1,
        Reversed = false
    },
    Damage = {
        Enabled = true,
        Range = 50,
        Amount = 100,
        IgnoreHiding = false
    },
    Rebounding = {
        Enabled = true,
        Type = "Ambush",
        Min = 2,
        Max = 4,
        Delay = 1
    },
    Lights = {
        Flicker = {
            Enabled = true,
            Duration = 1.5
        },
        Shatter = true,
        Repair = false
    },
    Earthquake = {
        Enabled = true
    },
    CameraShake = {
        Enabled = true,
        Range = 100,
        Values = {2, 20, 0.1, 1}
    },
    CustomSounds = {
        PlaySound = {
            SoundId = "rbxassetid://9114223282",
            Volume = 1
        },
        Footsteps = {
            SoundId = "rbxassetid://9114223282",
            Volume = 1
        }
    },
    Jumpscare = {
        Enabled = true,
        Background1 = Color3.fromRGB(255, 0, 0),
        Background2 = Color3.fromRGB(150, 0, 0),
        Face1 = "rbxassetid://10483855823",
        Face2 = "rbxassetid://10483999903",
        Sound1 = "rbxassetid://10483790459",
        Sound2 = "rbxassetid://10483837590"
    },
    Achievement = {
        Despawned = {
            Enabled = true,
            Title = "Entity Destroyer",
            Desc = "Successfully destroyed custom entity",
            Reason = "You successfully banished the entity!",
            Image = "rbxassetid://12309073114"
        },
        Death = {
            Enabled = true,
            Title = "RIP",
            Desc = "You died by custom entity",
            Reason = "???",
            Image = "rbxassetid://12309073114"
        },
        Crucifix = {
            Enabled = true,
            Title = "Exorcist!",
            Desc = "Successfully crucified custom entity",
            Reason = "Cross power defeated the entity!",
            Image = "rbxassetid://12309073114",
            CustomSound = {
                Enabled = false,
                Screaming = "rbxassetid://9114223282"
            }
        }
    },
    Crucifixion = {
        Enabled = true,
        Range = 40,
        Resist = false,
        Break = true
    },
    Death = {
        Type = "Curious",
        Hints = {
            "You died by A-69 Custom...",
            "Beware of this custom entity!"
        },
        Cause = "A-69 Custom"
    }
}

local entity = spawner.Create(config)

entity:SetCallback("OnSpawned", function(model)
    print("Entity spawned!")
end)

entity:SetCallback("OnDespawned", function()
    print("Entity despawned!")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
    print("Player damaged, health:", newHealth)
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime then
        print("Entity entered new room:", room.Name)
    end
end)

entity:SetCallback("OnRebounding", function(isRebounding)
    if isRebounding then
        print("Entity is rebounding!")
    else
        print("Entity stopped rebounding!")
    end
end)

entity:SetCallback("OnLookAt", function(inSight)
    if inSight then
        print("Entity is looking at you!")
    end
end)

entity:SetCallback("CrucifixionOverwrite", function()
    if config.Achievement.Crucifix.Enabled then
        local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()
        achievementGiver({
            Title = config.Achievement.Crucifix.Title,
            Desc = config.Achievement.Crucifix.Desc,
            Reason = config.Achievement.Crucifix.Reason,
            Image = config.Achievement.Crucifix.Image
        })
    end
    
    if config.Achievement.Crucifix.CustomSound.Enabled then
        local screaming = Instance.new("Sound")
        screaming.SoundId = config.Achievement.Crucifix.CustomSound.Screaming
        screaming.Volume = 2
        screaming.Parent = workspace
        
        for _, sound in ipairs(entity.Model:GetDescendants()) do
            if sound:IsA("Sound") then
                sound:Stop()
                sound:Destroy()
            end
        end
        
        screaming:Play()
        task.wait(screaming.TimeLength or 3)
        screaming:Destroy()
    end
end)

entity:Run()
