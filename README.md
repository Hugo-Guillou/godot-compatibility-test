# godot-compatibility-test

## Requirements

- [Godot 4.7](https://godotengine.org/download/archive/4.7-dev3/)
- [OpenJDK 17](https://adoptium.net/fr/temurin/releases?variant=openjdk17&version=17&os=any&arch=any)
- [Android Studio](https://developer.android.com/studio?hl=fr)

## Installation

Setup android export options from [Godot documentation](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html#setting-it-up-in-godot)

Install export templates:
- Go to Project/Install Android Build Templates...
- In the popup window click on Manage Templates
- In the next windows click on Download and Install

Set exports as runnable:
- Go To Project/Export...
- For each export preset (Pico, Windows Desktop.. ) enable the Runnable option.
This will allow you to run the project on different devices (hmd, phone, browser..)
Note: Android and Pico can't be both set as runnable the same time, you have to enable/disable when you want to switch the device.

## Run The Project On A Remote Device

### Android

Setup your android phone so you can deploy on it [as detailled here](https://developer.android.com/studio/debug/dev-options) (quit tutorial once you've enabled USB Debugging).

Connect your phone via USB.

Make sure Android export preset is set as Runnable.

Click on Remote Deploy. Your phone name should appear in the dropdown list.

 ### PICO VR

Install [Pico Connect](https://www.picoxr.com/fr/software/pico-link) on Windows and your Pico HMD

Connect your HMD via USB or the same Wifi as your computer

Launch Pico Connect on both devices and enable connection from HMD

Make sure Android export preset is set as Runnable.

Click on Remote Deploy. Your HMD name should appear in the dropdown list.

### WebXR

Click on Remote Deploy/Start HTTP Server, then Remote Deploy/Run In Browser.