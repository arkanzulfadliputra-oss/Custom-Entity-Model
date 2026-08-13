local Jumpscare = Loader.Create({
    Enabled = false,
    Face1 = "",
    Face2 = "",
    Background1 = Color3.fromRGB(255, 255, 255),
    Background2 = Color3.fromRGB(0, 0, 0),
    Background = {
        BlinkingBackground = false,
    },
    Sound1 = "",
    Sound2 = "",
    CustomSound = {
        Enabled = false,
        Github = {
            SoundLink = "",
        },
        Sound = {
            DistortionSoundEffect = {
                Level = 0,
            },
            PitchShiftSoundEffect = {
                Octave = 0,
            },
            ReverbSoundEffect = {
                DecayTime = 0,
                Density = 0,
                Diffusion = 0,
                DryLevel = 0,
                WetLevel = 0,
            },
            EchoSoundEffect = {
                Delay = 0,
                DryLevel = 0,
                Feedback = 0,
                WetLevel = 0,
            },
            EqualizerSoundEffect = {
                HighGain = 0,
                MidGain = 0,
                LowGain = 0,
            },
            TremoloSoundEffect = {
                Depth = 0,
                Duty = 0,
                Frequency = 0,
            },
            ChorusSoundEffect = {
                Depth = 0,
                Mix = 0,
                Rate = 0,
            },
            CompressorSoundEffect = {
                Attack = 0,
                Release = 0,
                Ratio = 0,
                GainMakeup = 0,
                Threshold = 0,
            },
            FlangeSoundEffect = {
                Depth = 0,
                Mix = 0,
                Rate = 0,
            },
        },
    },
})

---Not Delete
Jumpscare:Play()
