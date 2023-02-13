# **TIDAL Audio Device Switcher**

This AppleScript monitors the playback status of TIDAL, and switches the default audio device to a USB DAC (AudioQuest DragonFly Red) when playback stops, and switches back to the built-in speakers when playback resumes.

## **Prerequisites**

This script requires the **`SwitchAudioSource`** command-line utility, which can be installed via Homebrew:

```
shCopy code
brew install switchaudio-osx

```

## **Usage**

1. Open the TIDAL app and start playback.
2. Run the **`TIDAL Audio Device Switcher`** script using the AppleScript Editor or from the command line.
3. The script will switch the audio device automatically when playback starts or stops.

## **Configuration**

The following properties can be modified in the script:

- **`defaultAudioDeviceName`**: the name of the built-in audio device to switch to when playback stops.
- **`tidalAudioDeviceName`**: the name of the USB audio device to switch to when playback starts.
- **`switchDeviceCommand`**: the command-line tool to switch audio devices. The default value is **`/usr/local/bin/SwitchAudioSource -s`**.

## **License**

This script is released under the **[MIT License](https://chat.openai.com/chat/LICENSE)**.