#!/bin/sh

if [ -z "$TESTDIR" ]; then
    TESTDIR="`pwd`/test"
fi

export TESTDIR

mkdir -p "${TESTDIR}"

for f in profile/*
do
    TESTNAME=`basename $f`
    export SANDBOXDIR="${TESTDIR}/${TESTNAME}-sandbox"
    rm -rf "${SANDBOXDIR}"
    pushd . > /dev/null 2>&1
    cd "$f"
    sh ./run.sh > "${TESTDIR}/${TESTNAME}.result"
    diff "${TESTDIR}/${TESTNAME}.result" expect || exit 1
    popd > /dev/null 2>&1
done
