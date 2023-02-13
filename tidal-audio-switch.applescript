-- Config
property defaultAudioDeviceName : "'MacBook Pro Speakers'"
property tidalAudioDeviceName : "'AudioQuest DragonFly Red v1.0'"
property switchDeviceCommand : "/usr/local/bin/SwitchAudioSource -s "

-- Variables
global isPlaying 
global wasPlaying

-- Init
set isPlaying to getTidalPlaybackStatus()

-- Main loop
repeat
    set  wasPlaying to isPlaying
    set isPlaying to getTidalPlaybackStatus()

    set playbackStopped to isPlaying = false and  wasPlaying = true
    set playbackStarted to isPlaying = true and  wasPlaying = false
    set playbackContinues to isPlaying = false and  wasPlaying = false

    if playbackStopped
        do shell script switchDeviceCommand & tidalAudioDeviceName
    else if playbackStarted
        do shell script switchDeviceCommand & defaultAudioDeviceName
    end if

    if playbackContinues
        delay 5
    end if

    delay 1
end repeat

-- Functions
on getTidalPlaybackStatus()
    tell application "System Events"
        try
            tell process "TIDAL"
                return name of menu item 0 of menu "Playback" of menu bar 1 is "Pause"
            end tell
        on error
            return false
        end try
    end tell
end getTidalPlaybackStatus
