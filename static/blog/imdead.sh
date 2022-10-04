#!/bin/bash

cd $HOME/deadman

postPatch='dead.patch'
pageName='content/pages/dead.md'
currDate=$(date '+%Y-%m-%d')

git clone git@github.com:CPunch/openpunk.git

# commit & push the post
cd openpunk
git am postPatch
# replace our --DATE-- with the current date
sed -i 's/--DATE--/'$currDate'/g' $pageName
git add .
git commit -m "DeadSwitch: No response from CPunch in 14 days, posting dead.md"
git push --force
