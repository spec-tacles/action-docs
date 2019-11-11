#!/bin/sh -l

REPO="https://${GITHUB_ACTOR}:${{ secrets.GITHUB_TOKEN }}@github.com/${GITHUB_REPOSITORY}.git"
DOCS_DIRECTORY=$1
TARGET_BRANCH=$2
TARGET_DIRECTORY=$($3)

eval $4

git clone --no-checkout --single-branch -b $TARGET_BRANCH $REPO out

rm -rf out/$TARGET_DIRECTORY
mv -f $DOCS_DIRECTORY out/$TARGET_DIRECTORY

cd out

git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"

git add $TARGET_DIRECTORY
git commit -m "Docs build for ${{ github.sha }}"
git push $REPO HEAD:$TARGET_BRANCH
