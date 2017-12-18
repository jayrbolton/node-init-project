#!/bin/bash
set -e
project_name=$1
name="$(npm config get init.author.name)"
email="$(npm config get init.author.email)"
mkdir $project_name
cd $project_name
git init
echo 'node_modules' > .gitignore
cat > package.json <<- EOM
{
  "name": "$1project_name",
  "version": "0.0.1",
  "description": "",
  "main": "index.js",
  "directories": {
    "test": "test"
  },
  "dependencies": {},
  "devDependencies": {},
  "scripts": {
    "test": "dependency-check package.json && standard && node test/"
  },
  "keywords": [],
  "author": "$name <$email>",
  "license": "MIT"
}
EOM
npm install --save-dev dependency-check standard tape
mkdir test
touch test/index.js
touch index.js
echo "#$project_name" > README.md
mkdir lib
git add --all
git commit -m "Initialize"
git tag 0.0.1
npm run test
