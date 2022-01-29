#!/usr/bin/env bash

BGTERM_TITLE="BGTerm-alef"
BGTERM_LAYOUT="BackgroundTerminator"
BGTERM_PROFILE="test_bgterm"
BGTERM_COMMAND="terminator -T $BGTERM_TITLE -l $BGTERM_LAYOUT -p $BGTERM_PROFILE"

BGTERM_VERSION="0.1-beta"

function bgterm_version {
  echo "bgterm $BGTERM_VERSION"
  exit 0
}

function usage {
  cat << EOF
Usage: bgterm [--help] [<command>]
Setup a terminal in desktop background.

Commands:
  start           Start terminal and setup it in the desktop background. If
                  terminal is already running, run 'lock'.
  lock            Lock terminal to desktop background of its current screen. If
                  terminal is already running in background, this command will
                  perform the window size maximization (useful to fix broken
                  window size) and focus the terminal.
  unlock          Unlock terminal from the desktop background.

If no command is specified, bgterm will execute 'start' command.
All commands will focus the terminal.

Options:
  -h, --help      Show this help
  -v, --version   Show version
EOF
  exit 1
}

function not_bgterm_command {
  cat << EOF
bgterm: '$1' is not a bgterm command. See 'bgterm --help'.

Commands supported:
  start
  lock
  unlock
EOF
  exit 1
}

function bgterm_run_activate {
  bgw activate $BGTERM_TITLE
}

function bgterm_run_lock {
  bgw lock $BGTERM_TITLE
  bgterm_run_activate && bgw show-desktop
}

function bgterm_run_unlock {
  bgw unlock $BGTERM_TITLE
  bgterm_run_activate
}

function bgterm_run_terminal {
  FOUND_BGTERM=$(wmctrl -l | grep $BGTERM_TITLE | cut -d' ' -f4)
  if [ -z "$FOUND_BGTERM" ]; then
    $BGTERM_COMMAND
  else
    echo "Background terminal is already running. Executing 'lock' command."
    bgterm_run_lock
  fi
}

# Parse commands and options
# getopt options
SHORT_OPTS="hv"
LONG_OPTS="help,version"

# Parse params with getopt
PARSED_PARAMS=$(getopt -n $(basename $0) -o $SHORT_OPTS -l $LONG_OPTS -- "$@")

# Check last command (getopt params parsing) executed without error.
VALID_PARAMS=$?
if [ ! $VALID_PARAMS -eq 0 ]; then # 0 is ok, other than that is error
  usage
fi

set -e
eval set -- "$PARSED_PARAMS"
while :
do
  case "$1" in
    -h | --help)     usage            ;;
    -v | --version)  bgterm_version   ;;
    --) shift; break ;;
  esac
done

# Command
case "$1" in
  s | start)     bgterm_run_terminal    ;;
  l | lock)      bgterm_run_lock        ;;
  u | unlock)    bgterm_run_unlock      ;;
  '')            bgterm_run_terminal    ;;
  *)             not_bgterm_command  $1 ;;
esac
