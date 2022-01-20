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
