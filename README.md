# godot-compatibility-test

## Requirements

- [Godot 4.7](https://godotengine.org/releases/4.7/)
- [OpenJDK 17](https://adoptium.net/fr/temurin/releases?variant=openjdk17&version=17&os=any&arch=any)
- [Android Studio](https://developer.android.com/studio?hl=fr)


## Install the plugin

You can directly import the cross-platofrm controller and its dependencies by downloading CrossPlatformPlugin in the latest Release and unzipping the addons folder in your godot project.

To enable the plugin, go to Project > Project Settings > Plugins and tick the boxes for cross-platform-controller Godot XR Tools. You will need to save and restart to apply.

Follow the steps in Setup below to finish the install.

Once you're done, you can just drag and drop cross-platform-controller.tscn from addons/cross-platform-controller/ into your 3D scene.

## Setup

Setup android export options from [Godot documentation](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html#setting-it-up-in-godot)

Install export templates:
- Go to Project/Install Android Build Templates...
- In the popup window click on Manage Templates
- In the next windows click on Download and Install

Set exports as runnable:
- Go To Project/Export...
- For each export preset (Pico / Meta Quest, Windows.. ) enable the Runnable option.
This will allow you to run the project on different devices (hmd, phone, browser..)

Note: Android and Pico / Meta Quest can't be both set as runnable the same time, you have to enable/disable when you want to switch the device.

## Run The Project On A Remote Device

### Android

Setup your android phone so you can deploy on it [as detailled here](https://developer.android.com/studio/debug/dev-options) (quit tutorial once you've enabled USB Debugging).

Connect your phone via USB.

Make sure Android export preset is set as Runnable.

Click on Remote Deploy. Your phone name should appear in the dropdown list.

 ### META QUEST

Install [Meta Horizon Link](https://www.meta.com/fr-fr/help/quest/1517439565442928/) on Windows (you will need a Meta account)

Connect your HMD via USB or the same Wifi as your computer

Launch Horizon Meta Link Horizon on Windows and enable connection from HMD by going to Quick Commands > Link

Make sure Android export preset is set as Runnable.

Click on Remote Deploy. Your HMD name should appear in the dropdown list.

![Remote Deploy](./doc/RemoteDeploy.png)

 ### PICO VR

Install [Pico Connect](https://www.picoxr.com/fr/software/pico-link) on Windows and your Pico HMD

Connect your HMD via USB or the same Wifi as your computer

Launch Pico Connect on both devices and enable connection from HMD

Make sure Android export preset is set as Runnable.

Click on Remote Deploy. Your HMD name should appear in the dropdown list.

![Remote Deploy](./doc/RemoteDeploy.png)

### WebXR

Click on Remote Deploy/Start HTTP Server, then Remote Deploy/Run In Browser.

![Remote Deploy](./doc/RemoteDeploy.png)
