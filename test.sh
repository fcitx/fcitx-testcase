#!/bin/sh

export LC_ALL=C

if [ -z "$TESTDIR" ]; then
    TESTDIR="`pwd`/test"
fi

export TESTDIR

mkdir -p "${TESTDIR}"
rm -rf ${TESTDIR}/*

for f in profile/*
do
    TESTNAME=`basename $f`
    export SANDBOXDIR="${TESTDIR}/${TESTNAME}-sandbox"
    rm -rf "${SANDBOXDIR}"
    pushd . > /dev/null 2>&1
    cd "$f"
    sh ./run.sh > "${TESTDIR}/${TESTNAME}.txt"
    diff "${TESTDIR}/${TESTNAME}.txt" expect || exit 1
    popd > /dev/null 2>&1
done
