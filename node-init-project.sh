#!/bin/bash
set -e
project=$1
desc=$2
github_name="$(npm config get init.author.github_name)"
name="$(npm config get init.author.name)"
email="$(npm config get init.author.email)"
mkdir $project
cd $project
git init
echo 'examples' > .npmignore
echo 'node_modules' > .gitignore
cat > package.json <<- EOM
{
  "name": "$project",
  "version": "0.0.1",
  "description": "$desc",
  "main": "index.js",
  "directories": {
    "test": "test"
  },
  "dependencies": {},
  "devDependencies": {},
  "bugs": {
    "url": "https://github.com/$github_name/$project/issues"
  },
  "repository": {
    "type": "git",
    "url": "https://github.com/$github_name/$project.git"
  },
  "scripts": {
    "test": "dependency-check package.json && standard && node test/"
  },
  "keywords": [],
  "author": "$name <$email>",
  "license": "MIT"
}
EOM
npm install --save-dev dependency-check standard tape common-readme
mkdir test
touch test/index.js
touch index.js
./node_modules/.bin/common-readme > README.md
mkdir lib
git add --all
git commit -m "Initialize"
git tag 0.0.1
npm run test
