#!/bin/bash -e
fn=$(realpath "$1")
ofn=${fn/.z/-fixed.z}
tmp=$(mktemp -d)
cd $tmp
env LC_ALL=en_US.UTF-8 unzip $fn
(env LC_ALL=en_US.UTF-8 find . -name '.DS_Store' -o -name '.git*' -print0 | env LC_ALL=en_US.UTF-8 xargs -0 rm -f)
convmv --notest -f UTF-8 -t UTF-8 --nfc -r .
env LC_ALL=en_US.UTF-8 zip -r $ofn .
