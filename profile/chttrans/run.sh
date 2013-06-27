#!/bin/sh

run()
{
fcitx-testbed -i pinyin `cat addons1` keysequence1
fcitx-testbed -i chewing -d "${SANDBOXDIR}" `cat addons2` keysequence2
}

run 2>&1 | grep -E '(PREEDIT|CANDIDATE)' | grep -v '^PREEDIT:$'
