#!/bin/sh

run()
{
fcitx-testbed `cat addons` keysequence
}

run 2>&1 | grep -E '(PREEDIT|CANDIDATE)'
