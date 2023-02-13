property isTidalPlaying : true
property wasTidalPlaying : true

repeat
    tell application "System Events"
        try
            tell process "TIDAL"
                set wasTidalPlaying to isTidalPlaying
                if name of menu item 0 of menu "Playback" of menu bar 1 is "Pause" then
                    set isTidalPlaying to true
                end if
                if name of menu item 0 of menu "Playback" of menu bar 1 is "Play" then
                    set isTidalPlaying to false
                end if
            end tell
        on error
            set isTidalPlaying to false
            set wasTidalPlaying to false
        end try
    end tell

    if isTidalPlaying = false and wasTidalPlaying = true
        do shell script "/usr/local/bin/SwitchAudioSource -s 'AudioQuest DragonFly Red v1.0'"
    end if

    if isTidalPlaying = true and wasTidalPlaying = false
        do shell script "/usr/local/bin/SwitchAudioSource -s 'MacBook Pro Speakers'"
    end if

    if wasTidalPlaying = false and wasTidalPlaying = false
        delay 5
    else
        delay 1
    end if
end repeat
