#!/bin/bash

cd $HOME/deadman

postTemplate='dead.md'
pageName='openpunk/content/pages/dead.md'
currDate=$(date '+%Y-%m-%d')

git clone git@github.com:CPunch/openpunk.git
cp $postTemplate $pageName

# replace our {{DATE}} with the current date
sed -i 's/{{DATE}}/'$currDate'/g' $pageName

# commit & push the post
cd openpunk
git add .
git commit -m "DeadSwitch: Posted dead message"
git push
