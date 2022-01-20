# bgw - Background Window with wmctrl and xprop

If you don't like directories and files in your desktop, but want to make use
of your background, I created `bgw` (**b**ack**g**round **w**indow) tool that uses wmctrl
and xprop underneath to put a window on your desktop background, so when you
show your desktop (or minimize all of your windows), the chosen window will
appears like if it was your background image.

The idea is to maximize a window and make it `_NET_WM_WINDOW_TYPE_DESKTOP` so
it will not appear in task/window list, and will always be visible when all
windows are minimized.

```
$ bgw --help
Usage: bgw [--help] <command> <windowtitle>
Setup a window in desktop background

Commands:
  lock            Lock a window to desktop background of its current screen. The
                  locked window will be resized to fill the screen. It will be
                  hidden from task/window list, but will be shown in all
                  workspaces. You also won't be able to resized or move it.
  unlock          Unlock a window from the desktop background. The unlocked
                  window will be shown in task/window list, and you will be able
                  to move it arround.
  activate        Activate/show/focus a window. Match window title partially.

Arguments:
    windowtitle   Window title

Options:
  -h, --help      Shows this help

Examples:
  * Focus window titled "MyWindowTitle":
  bgw activate MyWindowTitle

  * Lock "MyWindowTitle" to background:
  bgw lock MyWindowTitle

  * Show this help:
  bgw --help
```

## Installation:

### 1. Requirements:

`wmctrl` and `xprop`

### 2. Copy to a bin (set in $path)

**TODO:** Automate instalation

That is it!

## Example

### Background Terminator:

Here is a script example to run terminator on background. To get this
automatically in your startup, just add this script to your autostart.
```
#!/bin/bash

BGTERM_TITLE="BackgroundTerminator"
BGTERM_LAYOUT="BackgroundTerminator"

terminator -T $BGTERM_TITLE -l $BGTERM_LAYOUT

sleep 3

bgw lock $BGTERM_TITLE
```
