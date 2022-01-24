# [DEPECRATED] Devilspie method

**DEPRECATION NOTE:** The `devilspie` method was depecrated and replaced with shell
script using `wmctrl` and `xprop` to control window state. Go to main branch
to get the latest `bgw` script.

**MOTIVATION:** The `devilspie` method behaviour is too unstable, for example
when connecting to or/disconnecting a monitor screen or when accidentally
hitting the toggle maximization hotkey, the background window could lost its
maximization state, get its window size frozen on umaximized state, or the
window could "go" behind the desktop, making it inaccessible through convenient
ways.

To deal with those problems, usually the easiest way would be to close/kill the
window, kill devilspie and start the BackgroundTerminator.sh script again to
open a clean terminator. This is not convenient, and even if I created a script
for that, this would be not ideal.

Another way to mitigate those problems would be to set a fixed window size in
your devilspie config, but this only works if you don't use other monitor
screen, so this solution is not very portable.

On my search in how to easily fix window size without having to restart the
terminal when it breaks its state, I found it was possible could control window
state with `wmctrl` and change window type with `xprop`, and soon realized
that the best way to achieve the same thing, desktop background window, was not
use devilspie at all and use only shell script with `wmctrl` and `xprop` to
fully control the window state.

I ended up creating the `bgw` (background window) script with the following
commands that works for any window by only passing its title and automaticaly
deals with window size and screen size, also fix undesired behaviour when
connecting to/disconnecting a monitor screen and maximization problems:
`bgw lock <window-title>`: Lock window maximized on its current screen, hidding it from task list but showing on all workspace.
`bgw unlock <window-title>`: Unlock the window. Show in task list, can be resized and be freely moved to other screen.
`bgw activate <window-title>`: Activates the informed window. Used to show/activate any window. Useful in case of the background window is behind the desktop.

This new script is very portable.

# Background Terminal with Devilspie

If you don't like directories and files in your desktop, but want to make use
of your background, this scripts uses devilspie to put a terminal emulator on
your desktop background, so when you show your desktop (or minimize all of your
windows), a terminal appears like if it was your background image.

The idea is to maximize the terminal window and make it `WINDOW_TYPE_DESKTOP`.

When setting devilspie rules, the easiest way to select a window to apply the
changes is to select the window by its title, so since terminator has a title
option to run with a custom fixed title, I combined both to create the
devilspie rules, but feel free to create your own devilspie config with your
desired rules, or to edit the scripts to use another terminal emulator.

## Installation:

### 1. Requirements:

1. Install `devilspie` or `devilspie2`
2. Install `terminator`

**NOTE:** Depending on your system or devilspie or devilspie2 package will be
available. They do the same thing but use different scripting syntax. I
provided a setup and start script for both.

### 2. Add the respective `.sh` to autostart:
Choose your preferable way to auto start the script, you can also edit the
scripts and configs if you want different behaviours.

- For `devilspie` run `BackgroundTerminator.sh`
- For `devilspie2` run `BackgroundTerminatorDevispie2.sh`

That is it!
