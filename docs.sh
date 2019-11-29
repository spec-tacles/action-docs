#!/bin/bash

TARGET_DIRECTORY=$($TARGET_DIRECTORY)
eval $DOCS_DIRECTORY

git clone --no-checkout --single-branch -b $TARGET_BRANCH $REPO out

rm -rf out/$TARGET_DIRECTORY
mv -f $DOCS_DIRECTORY out/$TARGET_DIRECTORY

cd out

git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"

git add $TARGET_DIRECTORY
git commit -m "Docs build for ${{ github.sha }}"
git push $REPO HEAD:$TARGET_BRANCH
