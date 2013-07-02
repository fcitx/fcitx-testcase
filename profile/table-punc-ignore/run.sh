#!/bin/sh

run()
{
fcitx-testbed -i erbi `cat addons` keysequence
}

run 2>&1 | grep -E '^(FORWARD|COMMIT):'
