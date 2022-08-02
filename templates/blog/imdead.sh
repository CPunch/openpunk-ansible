#!/bin/bash

cd $HOME/deadman

postPatch='dead.patch'
pageName='openpunk/content/pages/dead.md'
currDate=$(date '+%Y-%m-%d')

git clone git@github.com:CPunch/openpunk.git
git am postPatch

# replace our --DATE-- with the current date
sed -i 's/--DATE--/'$currDate'/g' $pageName

# commit & push the post
cd openpunk
git add .
git commit -m "DeadSwitch: No response from CPunch in 14 days, posting dead.md"
git push --force
