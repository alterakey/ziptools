#!/bin/bash -e
export LC_ALL=en_US.UTF-8
fn=$(realpath "$1")
ofn=${fn/.z/-fixed.z}
tmp=$(mktemp -d)
cd $tmp
unzip $fn
(find . \( -name '.DS_Store' -o -name '.git*' \) -print0 | xargs -0 rm -f)
convmv --notest -f UTF-8 -t UTF-8 --nfc -r .
zip -r $ofn .
