# TM Warthog config script for StarCitizen v3.5.0

A simple Warthog HOTAS setup to match the current SC control schema.
The goal is to use as much of the SC default keybindings to minimize the controllers setup ordeal between releases.

## How to run
 * Check out or download the files under ```./script```. All of it.
 * Point your T.A.R.G.E.T. software to run the script directly w/o loading the GUI.<br>
 ```"C:\Program Files (x86)\Thrustmaster\TARGET\x64\TARGETGUI.exe" -r E:\StarCitizen-WarthogScript\script\StarCitizen_3.5.x_combined.tmc```<br>
 Where the latter path is obviously the location where you've copied the scripts to.
 * Check out or download the keybindings file under ```./sc-settings/mappings```
 * Import the keybindings in-game:
    * Keyboard -> Keyboard
    * Mouse -> Mouse
    * Joystick (1) -> Joystick (1) // virtual Warthog HOTAS
    * Joystick (2) -> Joystick (2) // optional Rudder Pedals - if you have some

 * Apply a few [manual settings](sc-settings/ManualSettings.md) in-game.

## Action Mapping / Layout

Here's an overview of the currently mapped functions to the HOTAS buttons and axis.
![Functional Button/Axis Mapping](resources/warthog_layout.png "Warthog HOTAS function mapping")
 
## Trouble shooting
In this manual I assume, that the Warthog HOTAS is the only controller you have attached to your PC (besides Rudder Pedals, if you have).
If you have trouble loading the keybindings into StarCitizen it may be because the game has registered another Joystick type controller to position 1 of your Joystick slots (1-4).

You have 2 options to solve this issue.
 1. Re-sort your controllers in-game.
     * Open your in-game console: `^`
     * enter: `i_DumpDeviceInformation`.<br>
     *See to what internal slots your devices are assigned to.*
     * resort joysticks, by example: `pp_resortdevices joystick 2 1` <br>
     *This moves stick **2** to position **1** obviously.<br>
     You have to **use the correct numbers** matching your machines setup!*
 1. Import the HOTAS keybindings to a different slot.<br>
 *This requires also to adjust the deadzones for that slot! See [manual settings](sc-settings/ManualSettings.md))*

## Further reading
1. CIG documentation on keybinding management ['Create, export and import custom profiles'](https://support.robertsspaceindustries.com/hc/en-us/articles/360000183328-Create-export-and-import-custom-profiles)