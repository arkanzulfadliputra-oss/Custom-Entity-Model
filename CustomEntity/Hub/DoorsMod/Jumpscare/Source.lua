local Loader = {}

local Players = game:GetService("Players")

local Player = Players.LocalPlayer

local function GetGui()
    local PlayerGui = Player:WaitForChild("PlayerGui")

    local Gui = PlayerGui:FindFirstChild("JumpscareGui")

    if not Gui then
        Gui = Instance.new("ScreenGui")
        Gui.Name = "JumpscareGui"
        Gui.IgnoreGuiInset = true
        Gui.ResetOnSpawn = false
        Gui.DisplayOrder = 999999
        Gui.Parent = PlayerGui
    end

    return Gui
end


--------------------------------------------------
-- GITHUB SOUND
--------------------------------------------------

local function GetGitSound(GithubSnd, SoundName)
    if not GithubSnd or GithubSnd == "" then
        return nil
    end

    if not isfile or not writefile then
        return nil
    end

    local AssetFunction = getcustomasset or getsynasset

    if not AssetFunction then
        return nil
    end

    local FileName = SoundName .. ".mp3"

    if not isfile(FileName) then
        local Success, Data = pcall(function()
            return game:HttpGet(GithubSnd)
        end)

        if not Success or not Data or Data == "" then
            return nil
        end

        local WriteSuccess = pcall(function()
            writefile(FileName, Data)
        end)

        if not WriteSuccess then
            return nil
        end
    end

    local Success, AssetId = pcall(function()
        return AssetFunction(FileName)
    end)

    if not Success or not AssetId then
        return nil
    end

    local Sound = Instance.new("Sound")
    Sound.Name = SoundName
    Sound.SoundId = AssetId
    Sound.Volume = 1

    return Sound
end


--------------------------------------------------
-- FACE
--------------------------------------------------

local function CreateFace(Gui, ImageId, Side)
    if not ImageId or ImageId == "" then
        return nil
    end

    local Image = Instance.new("ImageLabel")

    Image.Name = Side .. "Head"
    Image.BackgroundTransparency = 1
    Image.AnchorPoint = Vector2.new(0.5, 0.5)
    Image.Size = UDim2.fromScale(0.65, 0.65)

    if Side == "Left" then
        Image.Position = UDim2.fromScale(0.25, 0.5)
    else
        Image.Position = UDim2.fromScale(0.75, 0.5)
    end

    Image.Image = ImageId
    Image.ScaleType = Enum.ScaleType.Fit
    Image.ZIndex = 5
    Image.Parent = Gui

    return Image
end


--------------------------------------------------
-- FAST ROTATION
--------------------------------------------------

local function StartRotation(Image, Direction)
    task.spawn(function()
        local Rotation = 0

        while Image and Image.Parent do
            Rotation += 35 * Direction
            Image.Rotation = Rotation

            task.wait(0.03)
        end
    end)
end


--------------------------------------------------
-- BACKGROUND FLASH
--------------------------------------------------

local function StartBackgroundBlinking(Background, Config)
    if not Background or not Background.Parent then
        return
    end

    -- Setelah Sound1 selesai, langsung BG2
    Background.BackgroundColor3 = Config.Background2

    if not Config.Background.BlinkingBackground then
        return
    end

    task.spawn(function()
        while Background and Background.Parent do

            -- BG1
            Background.BackgroundColor3 =
                Config.Background1

            task.wait(0.02)

            if not Background or not Background.Parent then
                break
            end

            -- BG2
            Background.BackgroundColor3 =
                Config.Background2

            task.wait(0.02)
        end
    end)
end


--------------------------------------------------
-- SOUND EFFECTS
--------------------------------------------------

local function AddSoundEffects(Sound, Config)
    local Effects = Config.CustomSound.Sound

    local Distortion = Instance.new("DistortionSoundEffect")
    Distortion.Level = Effects.DistortionSoundEffect.Level
    Distortion.Parent = Sound

    local Pitch = Instance.new("PitchShiftSoundEffect")
    Pitch.Octave = Effects.PitchShiftSoundEffect.Octave
    Pitch.Parent = Sound

    local Reverb = Instance.new("ReverbSoundEffect")
    Reverb.DecayTime = Effects.ReverbSoundEffect.DecayTime
    Reverb.Density = Effects.ReverbSoundEffect.Density
    Reverb.Diffusion = Effects.ReverbSoundEffect.Diffusion
    Reverb.DryLevel = Effects.ReverbSoundEffect.DryLevel
    Reverb.WetLevel = Effects.ReverbSoundEffect.WetLevel
    Reverb.Parent = Sound

    local Echo = Instance.new("EchoSoundEffect")
    Echo.Delay = Effects.EchoSoundEffect.Delay
    Echo.DryLevel = Effects.EchoSoundEffect.DryLevel
    Echo.Feedback = Effects.EchoSoundEffect.Feedback
    Echo.WetLevel = Effects.EchoSoundEffect.WetLevel
    Echo.Parent = Sound

    local Equalizer = Instance.new("EqualizerSoundEffect")
    Equalizer.HighGain = Effects.EqualizerSoundEffect.HighGain
    Equalizer.MidGain = Effects.EqualizerSoundEffect.MidGain
    Equalizer.LowGain = Effects.EqualizerSoundEffect.LowGain
    Equalizer.Parent = Sound

    local Tremolo = Instance.new("TremoloSoundEffect")
    Tremolo.Depth = Effects.TremoloSoundEffect.Depth
    Tremolo.Duty = Effects.TremoloSoundEffect.Duty
    Tremolo.Frequency = Effects.TremoloSoundEffect.Frequency
    Tremolo.Parent = Sound

    local Chorus = Instance.new("ChorusSoundEffect")
    Chorus.Depth = Effects.ChorusSoundEffect.Depth
    Chorus.Mix = Effects.ChorusSoundEffect.Mix
    Chorus.Rate = Effects.ChorusSoundEffect.Rate
    Chorus.Parent = Sound

    local Compressor = Instance.new("CompressorSoundEffect")
    Compressor.Attack = Effects.CompressorSoundEffect.Attack
    Compressor.Release = Effects.CompressorSoundEffect.Release
    Compressor.Ratio = Effects.CompressorSoundEffect.Ratio
    Compressor.GainMakeup = Effects.CompressorSoundEffect.GainMakeup
    Compressor.Threshold = Effects.CompressorSoundEffect.Threshold
    Compressor.Parent = Sound

    local Flange = Instance.new("FlangeSoundEffect")
    Flange.Depth = Effects.FlangeSoundEffect.Depth
    Flange.Mix = Effects.FlangeSoundEffect.Mix
    Flange.Rate = Effects.FlangeSoundEffect.Rate
    Flange.Parent = Sound
end


--------------------------------------------------
-- CREATE SOUND
--------------------------------------------------

local function CreateSound(SoundId, SoundName, Config)
    local Sound

    if Config.CustomSound.Enabled
        and Config.CustomSound.Github.SoundLink ~= "" then

        Sound = GetGitSound(
            Config.CustomSound.Github.SoundLink,
            SoundName
        )
    end

    if not Sound and SoundId and SoundId ~= "" then
        Sound = Instance.new("Sound")
        Sound.Name = SoundName
        Sound.SoundId = SoundId
        Sound.Volume = 1
    end

    if not Sound then
        return nil
    end

    if Config.CustomSound.Enabled then
        AddSoundEffects(Sound, Config)
    end

    Sound.Parent = workspace

    return Sound
end


--------------------------------------------------
-- LOADER.CREATE
--------------------------------------------------

function Loader.Create(Config)

    Config = Config or {}

    local Object = {}

    Object.Config = Config

    Object.Gui = nil
    Object.Background = nil
    Object.Sound1 = nil
    Object.Sound2 = nil

    Object.Playing = false


    --------------------------------------------------
    -- STOP
    --------------------------------------------------

    function Object:Stop()
        self.Playing = false

        if self.Sound1 then
            pcall(function()
                self.Sound1:Stop()
                self.Sound1:Destroy()
            end)

            self.Sound1 = nil
        end

        if self.Sound2 then
            pcall(function()
                self.Sound2:Stop()
                self.Sound2:Destroy()
            end)

            self.Sound2 = nil
        end

        if self.Gui then
            self.Gui:ClearAllChildren()
        end
    end


    --------------------------------------------------
    -- PLAY
    --------------------------------------------------

    function Object:Play()

        if not Config.Enabled then
            return
        end

        self:Stop()

        self.Playing = true

        local Gui = GetGui()

        self.Gui = Gui

        --------------------------------------------------
        -- BACKGROUND 1
        --------------------------------------------------

        local Background = Instance.new("Frame")

        Background.Name = "Background"
        Background.Size = UDim2.fromScale(1, 1)
        Background.Position = UDim2.fromScale(0, 0)
        Background.BorderSizePixel = 0

        -- Awal selalu Background1
        Background.BackgroundColor3 =
            Config.Background1

        Background.ZIndex = 1
        Background.Parent = Gui

        self.Background = Background


        --------------------------------------------------
        -- FACE 1
        --------------------------------------------------

        local Face1 = CreateFace(
            Gui,
            Config.Face1,
            "Left"
        )

        if Face1 then
            StartRotation(Face1, -1)
        end


        --------------------------------------------------
        -- FACE 2
        --------------------------------------------------

        local Face2 = CreateFace(
            Gui,
            Config.Face2,
            "Right"
        )

        if Face2 then
            StartRotation(Face2, 1)
        end


        --------------------------------------------------
        -- SOUND 1
        --------------------------------------------------

        local Sound1 = CreateSound(
            Config.Sound1,
            "JumpscareSound1",
            Config
        )

        self.Sound1 = Sound1


        --------------------------------------------------
        -- SOUND 1 ENDED
        --------------------------------------------------

        if Sound1 then

            Sound1:Play()

            Sound1.Ended:Connect(function()

                if not self.Playing then
                    return
                end

                if not Background
                    or not Background.Parent then
                    return
                end

                -- SOUND1 SELESAI
                -- BG1 -> BG2 -> FLASH

                StartBackgroundBlinking(
                    Background,
                    Config
                )

            end)

        else

            -- Kalau Sound1 kosong,
            -- langsung BG2 lalu flashing

            StartBackgroundBlinking(
                Background,
                Config
            )
        end


        --------------------------------------------------
        -- SOUND 2
        --------------------------------------------------

        if Config.Sound2
            and Config.Sound2 ~= "" then

            task.delay(0.15, function()

                if not self.Playing then
                    return
                end

                local Sound2 = CreateSound(
                    Config.Sound2,
                    "JumpscareSound2",
                    Config
                )

                if Sound2 then

                    self.Sound2 = Sound2

                    Sound2:Play()

                    Sound2.Ended:Connect(function()

                        if Sound2 then
                            Sound2:Destroy()
                        end

                        if self.Sound2 == Sound2 then
                            self.Sound2 = nil
                        end
                    end)
                end
            end)
        end
    end


    return Object
end


return Loader
