#!/bin/sh

run()
{
fcitx-testbed -i erbi `cat addons` keysequence
fcitx-testbed -i boshiamy `cat addons` keysequence2
}

run 2>&1 | grep -E '^(FORWARD|COMMIT):'
