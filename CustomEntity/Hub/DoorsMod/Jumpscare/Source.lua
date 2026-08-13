local Loader = {}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")


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
-- SOUND EFFECTS
--------------------------------------------------

local function AddSoundEffects(Sound, Config)
    if not Config.CustomSound
        or not Config.CustomSound.Enabled then
        return
    end

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

    if Config.CustomSound
        and Config.CustomSound.Enabled
        and Config.CustomSound.Github
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

    if Sound then
        AddSoundEffects(Sound, Config)
    end

    return Sound
end


--------------------------------------------------
-- LOADER.CREATE
--------------------------------------------------

function Loader.Create(jumpscareConfig)

    jumpscareConfig = jumpscareConfig or {}

    local Object = {}

    Object.Config = jumpscareConfig
    Object.Gui = nil
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
            self.Gui:Destroy()
            self.Gui = nil
        end
    end


    --------------------------------------------------
    -- PLAY
    --------------------------------------------------

    function Object:Play()

        if jumpscareConfig.Enabled == false then
            return
        end

        self:Stop()

        self.Playing = true


        --------------------------------------------------
        -- GUI
        --------------------------------------------------

        local JumpscareGui = Instance.new("ScreenGui")
        local ShakeFrame = Instance.new("Frame")
        local Background = Instance.new("Frame")
        local Face = Instance.new("ImageLabel")

        JumpscareGui.Name = "JumpscareGui"
        JumpscareGui.IgnoreGuiInset = true
        JumpscareGui.ZIndexBehavior =
            Enum.ZIndexBehavior.Sibling
        JumpscareGui.ResetOnSpawn = false
        JumpscareGui.DisplayOrder = 999999
        JumpscareGui.Parent = playerGui
        JumpscareGui.Enabled = true


        --------------------------------------------------
        -- SHAKE FRAME
        --------------------------------------------------

        ShakeFrame.Name = "Shake"
        ShakeFrame.BackgroundTransparency = 1
        ShakeFrame.BorderSizePixel = 0
        ShakeFrame.Size = UDim2.new(1, 0, 1, 0)
        ShakeFrame.Position = UDim2.new(0, 0, 0, 0)
        ShakeFrame.Parent = JumpscareGui


        --------------------------------------------------
        -- BACKGROUND
        --------------------------------------------------

        Background.Name = "Background"
        Background.BackgroundColor3 =
            jumpscareConfig.Background1
        Background.BorderSizePixel = 0
        Background.Size = UDim2.new(1, 0, 1, 0)
        Background.Position = UDim2.new(0, 0, 0, 0)
        Background.ZIndex = 999
        Background.Parent = ShakeFrame


        --------------------------------------------------
        -- ONE FACE
        --------------------------------------------------

        Face.Name = "Face"
        Face.AnchorPoint = Vector2.new(0.5, 0.5)
        Face.BackgroundTransparency = 1
        Face.Position = UDim2.new(0.5, 0, 0.5, 0)
        Face.Size = UDim2.new(0, 450, 0, 450)
        Face.Image = jumpscareConfig.Face1
        Face.ScaleType = Enum.ScaleType.Fit
        Face.ZIndex = 1000
        Face.Parent = Background


        self.Gui = JumpscareGui

        --------------------------------------------------
        -- SCREEN SHAKE
        --------------------------------------------------

        task.spawn(function()

            while JumpscareGui.Parent
                and self.Playing do

                local X = math.random(-14, 14)
                local Y = math.random(-14, 14)

                ShakeFrame.Position =
                    UDim2.fromOffset(X, Y)

                task.wait(0.025)
            end
        end)


        --------------------------------------------------
        -- FACE ZOOM
        --------------------------------------------------

        TweenService:Create(
            Face,
            TweenInfo.new(
                0.7,
                Enum.EasingStyle.Linear
            ),
            {
                Size = UDim2.new(
                    0,
                    2450,
                    0,
                    1550
                )
            }
        ):Play()


        --------------------------------------------------
        -- CHANGE TO FACE2 + BG2
        --------------------------------------------------

        local function StartSecondPhase()

            if not JumpscareGui.Parent
                or not self.Playing then
                return
            end


            --------------------------------------------------
            -- BG1 -> BG2
            --------------------------------------------------

            Background.BackgroundColor3 =
                jumpscareConfig.Background2


            --------------------------------------------------
            -- FACE1 -> FACE2
            --------------------------------------------------

            Face.Image =
                jumpscareConfig.Face2


            --------------------------------------------------
            -- FLASHING
            --------------------------------------------------

            if jumpscareConfig.Background
                and jumpscareConfig.Background.BlinkingBackground then

                task.spawn(function()

                    while JumpscareGui.Parent
                        and self.Playing do

                        Background.BackgroundColor3 =
                            jumpscareConfig.Background1

                        task.wait(0.02)

                        if not JumpscareGui.Parent then
                            break
                        end

                        Background.BackgroundColor3 =
                            jumpscareConfig.Background2

                        task.wait(0.02)
                    end
                end)
            end
        end


        --------------------------------------------------
        -- SOUND1
        --------------------------------------------------

        local Sound1 = CreateSound(
            jumpscareConfig.Sound1,
            "Scare1",
            jumpscareConfig
        )

        self.Sound1 = Sound1


        if Sound1 then

            Sound1.Parent = JumpscareGui

            Sound1:Play()


            Sound1.Ended:Connect(function()

                if not self.Playing then
                    return
                end

                StartSecondPhase()

            end)

        else

            -- Sound1 kosong
            -- langsung Face2 + BG2

            StartSecondPhase()
        end


        --------------------------------------------------
        -- SOUND2
        --------------------------------------------------

        if jumpscareConfig.Sound2
            and jumpscareConfig.Sound2 ~= "" then

            task.delay(0.15, function()

                if not JumpscareGui.Parent
                    or not self.Playing then
                    return
                end

                local Sound2 = CreateSound(
                    jumpscareConfig.Sound2,
                    "Scare2",
                    jumpscareConfig
                )

                if Sound2 then

                    self.Sound2 = Sound2

                    Sound2.Parent =
                        JumpscareGui

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


        --------------------------------------------------
        -- DESTROY
        --------------------------------------------------

        task.delay(0.8, function()

            if self.Gui == JumpscareGui then
                self.Playing = false

                if JumpscareGui then
                    JumpscareGui:Destroy()
                end

                self.Gui = nil
            end
        end)
    end


    return Object
end


return Loader
