local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Script Gaming V20",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading....",
   LoadingSubtitle = "by ScriptGaming",
   ShowText = "Rayfield", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.

   -- ScriptID = "sid_xxxxxxxxxxxx", -- Your Script ID from developer.sirius.menu — enables analytics, managed keys, and script hosting

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})

local Tab = Window:CreateTab("Custom Entity", 99226763923744) -- Title, Image
local Section = Tab:CreateSection("Custom Entity")

Tab:CreateButton({
    Name = "Spawn A-60 OG",
    Callback = function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
        local entity = Spawner.Create({
            Entity = {
                Name = "A-60 OG",
                Asset = "https://github.com/arkanzulfadliputra-oss/Custom-Entity-Model/raw/main/A-60%20But%20Kawaii.rbxm",
                HeightOffset = 0
            },
            Lights = {
                Flicker = {Enabled = true, Duration = 0.5},
                Shatter = false,
                Repair = false
            },
            Earthquake = {
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {2, 25, 0.1, 1}
            },
            Movement = {
                Speed = 350,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 1,
                Max = 2,
                Delay = 1
            },
            Damage = {
                Enabled = false,
                Range = 40,
                Amount = 0
            },
            Crucifixion = {
                Enabled = true,
                Range = 40,
                Resist = false,
                Break = true
            },
            Death = {
                Type = "Guiding",
                Hints = {"You died to A-60...", "It moves extremely fast and makes a loud static noise.", "Hide immediately when you hear it!"},
                Cause = "A-60 OG"
            }
        })
        entity:Run()
        Rayfield:Notify({Title = "Spawned", Content = "A-60 OG spawned!"})
    end,
})

Tab:CreateButton({
    Name = "Spawn A-60 V2",
    Callback = function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
        local entity = Spawner.Create({
            Entity = {
                Name = "A-60 V2",
                Asset = "https://github.com/arkanzulfadliputra-oss/Custom-Entity-Model/raw/main/A-60V2.rbxm",
                HeightOffset = 0
            },
            Lights = {
                Flicker = {Enabled = true, Duration = 1},
                Shatter = true,
                Repair = false
            },
            Earthquake = {
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 120,
                Values = {2, 20, 0.1, 1}
            },
            Movement = {
                Speed = 300,
                Delay = 1.5,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 4,
                Delay = 1.5
            },
            Damage = {
                Enabled = false,
                Range = 40,
                Amount = 0
            },
            Crucifixion = {
                Enabled = true,
                Range = 40,
                Resist = false,
                Break = true
            },
            Death = {
                Type = "Guiding",
                Hints = {"A-60 V2 behaves like Ambush!", "It will rebound back and forth multiple times.", "Stay in your hiding spot until it passes completely."},
                Cause = "A-60 V2"
            }
        })
        entity:Run()
        Rayfield:Notify({Title = "Spawned", Content = "A-60 V2 spawned!"})
    end,
})

Tab:CreateButton({
    Name = "Spawn A-60 Rooms",
    Callback = function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
        local entity = Spawner.Create({
            Entity = {
                Name = "A-60 Rooms",
                Asset = "https://github.com/arkanzulfadliputra-oss/Custom-Entity-Model/raw/main/A-60%20Rooms.rbxm",
                HeightOffset = 0
            },
            Lights = {
                Flicker = {Enabled = false, Duration = 0},
                Shatter = false,
                Repair = false
            },
            Earthquake = {
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 150,
                Values = {3, 30, 0.1, 1}
            },
            Movement = {
                Speed = 400,
                Delay = 1,
                Reversed = false
            },
            Rebounding = {
                Enabled = false
            },
            Damage = {
                Enabled = false,
                Range = 50,
                Amount = 0
            },
            Crucifixion = {
                Enabled = true,
                Range = 40,
                Resist = true,
                Break = false
            },
            Death = {
                Type = "Guiding",
                Hints = {"In The Rooms, A-60 does not flicker the lights.", "Listen closely for its sound cues!", "Hide in a locker or fridge as soon as you hear it."},
                Cause = "A-60 Rooms"
            }
        })
        entity:Run()
        Rayfield:Notify({Title = "Spawned", Content = "A-60 Rooms spawned!"})
    end,
})

Tab:CreateButton({
    Name = "Spawn A-60 V3",
    Callback = function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
        local entity = Spawner.Create({
            Entity = {
                Name = "A-60 V3",
                Asset = "https://github.com/arkanzulfadliputra-oss/Custom-Entity-Model/raw/main/A-60%20V3.rbxm",
                HeightOffset = 0
            },
            Lights = {
                Flicker = {Enabled = true, Duration = 1.5},
                Shatter = true,
                Repair = false
            },
            Earthquake = {
                Enabled = true
            },
            CameraShake = {
                Enabled = true,
                Range = 150,
                Values = {2.5, 25, 0.1, 1}
            },
            Movement = {
                Speed = 320,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 3,
                Max = 5,
                Delay = 1
            },
            Damage = {
                Enabled = false,
                Range = 45,
                Amount = 0
            },
            Crucifixion = {
                Enabled = true,
                Range = 40,
                Resist = false,
                Break = true
            },
            Death = {
                Type = "Guiding",
                Hints = {"This variant of A-60 is extremely aggressive.", "It causes earthquakes and shatters lights.", "Be careful of its multiple rebounds!"},
                Cause = "A-60 V3"
            }
        })
        entity:Run()
        Rayfield:Notify({Title = "Spawned", Content = "A-60 V3 spawned!"})
    end,
})

Tab:CreateButton({
    Name = "Spawn Ambush But Bad",
    Callback = function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
        local entity = Spawner.Create({
            Entity = {
                Name = "Ambush But Bad",
                Asset = "https://github.com/arkanzulfadliputra-oss/Custom-Entity-Model/raw/main/Ambush%20But%20Bad.rbxm",
                HeightOffset = 0
            },
            Lights = {
                Flicker = {Enabled = true, Duration = 2},
                Shatter = false,
                Repair = false
            },
            Earthquake = {
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 80,
                Values = {1, 10, 0.1, 1}
            },
            Movement = {
                Speed = 100,
                Delay = 3,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 1,
                Max = 3,
                Delay = 2
            },
            Damage = {
                Enabled = false,
                Range = 30,
                Amount = 0
            },
            Crucifixion = {
                Enabled = true,
                Range = 40,
                Resist = false,
                Break = false
            },
            Death = {
                Type = "Guiding",
                Hints = {"How did you even die to this?", "It moves so slow..."},
                Cause = "Ambush But Bad"
            }
        })
        entity:Run()
        Rayfield:Notify({Title = "Spawned", Content = "Ambush But Bad spawned!"})
    end,
})

Tab:CreateButton({
    Name = "Spawn Ambush Old",
    Callback = function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
        local entity = Spawner.Create({
            Entity = {
                Name = "Ambush Old",
                Asset = "https://github.com/arkanzulfadliputra-oss/Custom-Entity-Model/raw/main/Ambush%20Old%20V2.rbxm",
                HeightOffset = 0
            },
            Lights = {
                Flicker = {Enabled = true, Duration = 1.5},
                Shatter = true,
                Repair = false
            },
            Earthquake = {
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.8, 20, 0.1, 1}
            },
            Movement = {
                Speed = 220,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 4,
                Delay = 1.5
            },
            Damage = {
                Enabled = false,
                Range = 40,
                Amount = 0
            },
            Crucifixion = {
                Enabled = true,
                Range = 40,
                Resist = false,
                Break = true
            },
            Death = {
                Type = "Guiding",
                Hints = {"You died to the classic Ambush.", "Remember that Ambush comes back multiple times!", "Hop out and hop back into lockers to avoid Hide."},
                Cause = "Ambush Old"
            }
        })
        entity:Run()
        Rayfield:Notify({Title = "Spawned", Content = "Ambush Old spawned!"})
    end,
})

Tab:CreateButton({
    Name = "Spawn Angry Munci",
    Callback = function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
        local entity = Spawner.Create({
            Entity = {
                Name = "Angry Munci",
                Asset = "https://github.com/arkanzulfadliputra-oss/Custom-Entity-Model/raw/main/AngryMunci.rbxm",
                HeightOffset = 0
            },
            Lights = {
                Flicker = {Enabled = true, Duration = 0.8},
                Shatter = true,
                Repair = false
            },
            Earthquake = {
                Enabled = true
            },
            CameraShake = {
                Enabled = true,
                Range = 150,
                Values = {3, 30, 0.1, 1}
            },
            Movement = {
                Speed = 280,
                Delay = 1,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 2,
                Max = 5,
                Delay = 1
            },
            Damage = {
                Enabled = false,
                Range = 50,
                Amount = 0
            },
            Crucifixion = {
                Enabled = true,
                Range = 40,
                Resist = true,
                Break = true
            },
            Death = {
                Type = "Guiding",
                Hints = {"Angry Munci is fast and unpredictable!", "It breaks lights instantly and shakes the room violently."},
                Cause = "Angry Munci"
            }
        })
        entity:Run()
        Rayfield:Notify({Title = "Spawned", Content = "Angry Munci spawned!"})
    end,
})

Tab:CreateButton({
    Name = "Spawn Big Games",
    Callback = function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
        local entity = Spawner.Create({
            Entity = {
                Name = "Big Games",
                Asset = "https://github.com/arkanzulfadliputra-oss/Custom-Entity-Model/raw/main/BIGGAMES.rbxm",
                HeightOffset = 0
            },
            Lights = {
                Flicker = {Enabled = true, Duration = 1},
                Shatter = false,
                Repair = false
            },
            Earthquake = {
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.5, 15, 0.1, 1}
            },
            Movement = {
                Speed = 180,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = false
            },
            Damage = {
                Enabled = false,
                Range = 40,
                Amount = 0
            },
            Crucifixion = {
                Enabled = true,
                Range = 40,
                Resist = false,
                Break = false
            },
            Death = {
                Type = "Guiding",
                Hints = {"Big Games took away your microtransactions... and your life.", "Hide when you hear its sound!"},
                Cause = "Big Games"
            }
        })
        entity:Run()
        Rayfield:Notify({Title = "Spawned", Content = "Big Games spawned!"})
    end,
})

Tab:CreateButton({
    Name = "Spawn BigHead",
    Callback = function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
        local entity = Spawner.Create({
            Entity = {
                Name = "BigHead",
                Asset = "https://github.com/arkanzulfadliputra-oss/Custom-Entity-Model/raw/main/BigHead.rbxm",
                HeightOffset = 0
            },
            Lights = {
                Flicker = {Enabled = true, Duration = 2},
                Shatter = true,
                Repair = false
            },
            Earthquake = {
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 120,
                Values = {2, 20, 0.1, 1}
            },
            Movement = {
                Speed = 250,
                Delay = 2,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 1,
                Max = 3,
                Delay = 1.5
            },
            Damage = {
                Enabled = false,
                Range = 45,
                Amount = 0
            },
            Crucifixion = {
                Enabled = true,
                Range = 40,
                Resist = false,
                Break = true
            },
            Death = {
                Type = "Guiding",
                Hints = {"BigHead", "BigHead."},
                Cause = "BigHead"
            }
        })
        entity:Run()
        Rayfield:Notify({Title = "Spawned", Content = "BigHead spawned!"})
    end,
})

Tab:CreateButton({
    Name = "Spawn Birthday Ambush",
    Callback = function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
        local entity = Spawner.Create({
            Entity = {
                Name = "Birthday Ambush",
                Asset = "https://github.com/arkanzulfadliputra-oss/Custom-Entity-Model/raw/main/BirthdayAmbush.rbxm",
                HeightOffset = 0
            },
            Lights = {
                Flicker = {Enabled = true, Duration = 1.5},
                Shatter = true,
                Repair = false
            },
            Earthquake = {
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 120,
                Values = {2.2, 22, 0.1, 1}
            },
            Movement = {
                Speed = 260,
                Delay = 1.5,
                Reversed = false
            },
            Rebounding = {
                Enabled = true,
                Type = "Ambush",
                Min = 3,
                Max = 6,
                Delay = 1
            },
            Damage = {
                Enabled = false,
                Range = 40,
                Amount = 0
            },
            Crucifixion = {
                Enabled = true,
                Range = 40,
                Resist = false,
                Break = true
            },
            Death = {
                Type = "Guiding",
                Hints = {"Happy Birthday! Ambush brought you a death screen.", "It rebounds much more frequently than normal Ambush."},
                Cause = "Birthday Ambush"
            }
        })
        entity:Run()
        Rayfield:Notify({Title = "Spawned", Content = "Birthday Ambush spawned!"})
    end,
})

Tab:CreateButton({
    Name = "Spawn Birthday Rush",
    Callback = function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
        local entity = Spawner.Create({
            Entity = {
                Name = "Birthday Rush",
                Asset = "https://github.com/arkanzulfadliputra-oss/Custom-Entity-Model/raw/main/BirthdayRush.rbxm",
                HeightOffset = 0
            },
            Lights = {
                Flicker = {Enabled = true, Duration = 1},
                Shatter = true,
                Repair = false
            },
            Earthquake = {
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 100,
                Values = {1.8, 18, 0.1, 1}
            },
            Movement = {
                Speed = 210,
                Delay = 1.5,
                Reversed = false
            },
            Rebounding = {
                Enabled = false
            },
            Damage = {
                Enabled = false,
                Range = 40,
                Amount = 0
            },
            Crucifixion = {
                Enabled = true,
                Range = 40,
                Resist = false,
                Break = false
            },
            Death = {
                Type = "Guiding",
                Hints = {"You died to Birthday Rush!", "It behaves like regular Rush, but party-themed.", "Hide as soon as the lights flicker."},
                Cause = "Birthday Rush"
            }
        })
        entity:Run()
        Rayfield:Notify({Title = "Spawned", Content = "Birthday Rush spawned!"})
    end,
})

Tab:CreateButton({
    Name = "Spawn Breeze",
    Callback = function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
        local entity = Spawner.Create({
            Entity = {
                Name = "Breeze",
                Asset = "https://github.com/arkanzulfadliputra-oss/Custom-Entity-Model/raw/main/Breeze.rbxm",
                HeightOffset = 0
            },
            Lights = {
                Flicker = {Enabled = true, Duration = 0.3},
                Shatter = false,
                Repair = false
            },
            Earthquake = {
                Enabled = false
            },
            CameraShake = {
                Enabled = true,
                Range = 60,
                Values = {0.8, 10, 0.1, 1}
            },
            Movement = {
                Speed = 380,
                Delay = 1,
                Reversed = false
            },
            Rebounding = {
                Enabled = false
            },
            Damage = {
                Enabled = false,
                Range = 35,
                Amount = 0
            },
            Crucifixion = {
                Enabled = true,
                Range = 40,
                Resist = false,
                Break = false
            },
            Death = {
                Type = "Guiding",
                Hints = {"Breeze passes by like a gust of wind.", "It gives very little warning before arriving.", "Reaction speed is key!"},
                Cause = "Breeze"
            }
        })
        entity:Run()
        Rayfield:Notify({Title = "Spawned", Content = "Breeze spawned!"})
    end,
})

Tab:CreateButton({
    Name = "Spawn Capybara",
    Callback = function()
        local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
        local entity = Spawner.Create({
            Entity = {
                Name = "Capybara",
                Asset = "https://github.com/arkanzulfadliputra-oss/Custom-Entity-Model/raw/main/Capybara.rbxm",
                HeightOffset = 0
            },
            Lights = {
                Flicker = {Enabled = false, Duration = 0},
                Shatter = false,
                Repair = false
            },
            Earthquake = {
                Enabled = false
            },
            CameraShake = {
                Enabled = false
            },
            Movement = {
                Speed = 300,
                Delay = 3,
                Reversed = false
            },
            Rebounding = {
                Enabled = false
            },
            Damage = {
                Enabled = false,
                Range = 20,
                Amount = 0
            },
            Crucifixion = {
                Enabled = true,
                Range = 40,
                Resist = true,
                Break = false
            },
            Death = {
                Type = "Guiding",
                Hints = {"Ok I pull up...", "How did Capybara eliminate you?"},
                Cause = "Capybara"
            }
        })
        entity:Run()
        Rayfield:Notify({Title = "Spawned", Content = "Capybara spawned!"})
    end,
})
local Tab = Window:CreateTab("Tab Example", 4483362458) -- Title, Image
