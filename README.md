#  IOAccessoryManager library testing

## About
Somewhat of a WIP. **IOAccessoryManager** is another undocumented IOKit API that looks kinda interesting. I haven't been a able to find any references to it anywhere online!

Snooping around my system, I found It has a relationship with different physical IO on your device, mainly USB-C, and seems to have some control over those ports? When you plug/unplug USB-C devices (charging cables, display, etc.) from are many logs in the kernel referencing it's class, as well as other classes **IOPort** and **IOPortTransportState**.

Disassimbling the IOAccessoryManager kext binary, the IOPort class looks really interesting, with methods for `addTransport`, `removeTransport` (which can be seen in use in the before mentioned kernel logs); the IOPortTransportState's class has intriguing methods like `setActive`.

*This all just makes me wonder if there are ways you could make IOConnectCalls to the services for the ports and trigger these methods. It would be pretty great if you could then use these to, say, I don't know, forcibly enable and send custom display signals over USB-C on M1 Macs?*

Naaah...I wish. The display limitations are mostly hardware as far as I know, but surely with the right software there is a jank way around it...?

😝

Anyway, just messing around with some of the symbols in the tbd file and seeing what I can do. Just dumps data right now. You can find all the symbols at `libIOAccessoryManager.tbd` somewhere in your developer frameworks. Most of the methods return what you can see in the IORegistry already. There is also IOAccessoryPort methods, but haven't found IOServices that match the class.

Maybe I'll figure out whats up with IOPort at some point.

## Building
You probably already know but just use the makefile. It'll produce a binary `main`.
