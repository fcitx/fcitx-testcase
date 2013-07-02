#!/bin/sh

run()
{
fcitx-testbed -i pinyin `cat addons` keysequence
}

run 2>&1 | grep -E '^COMMIT:'
