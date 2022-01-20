#!/bin/bash

devilspie2 --folder=$(dirname "$0") &

sleep 10

# Same title set in devilspie2 .lua file
terminator -T "BackgroundTerminator" -l "BackgroundTerminator"
