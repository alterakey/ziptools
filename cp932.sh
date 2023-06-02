#!/bin/bash -e
export LC_ALL=en_US.UTF-8
fn=$(realpath "$1")
ofn=${fn/.z/-cp932.z}
bfn=${fn/.z/-orig.z}
tmp=$(mktemp -d)
cd $tmp
unzip $fn
(find . \( -name '.DS_Store' -o -name '.git*' \) -print0 | xargs -0 rm -f)
convmv --notest -f UTF-8 -t CP932 -r .
env LC_ALL=C zip -r $ofn .
mv $fn $bfn
mv $ofn $fn
