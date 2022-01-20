#!/bin/bash

devilspie -a $(dirname "$0")/BackgroundTerminator.ds &
sleep 5
# Same title set in devilspie .ds file
terminator -T "BackgroundTerminator" -l "BackgroundTerminator" &
sleep 3
killall devilspie
