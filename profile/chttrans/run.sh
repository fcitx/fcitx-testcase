#!/bin/sh

run()
{
fcitx-testbed `cat addons1` keysequence1
fcitx-testbed -d "${SANDBOXDIR}" `cat addons2` keysequence2
}

run 2>&1 | grep -E '(PREEDIT|CANDIDATE)'
