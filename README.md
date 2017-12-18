# Simple npm initialization script

```
chmod +x ./node-init-project.sh
./node-init-project.sh my-new-project
```

This is a simple script I use to initialize a new npm module.
* Initialize git repo and npm package with version 0.0.1 and MIT license
* Dev install dependency-check, standard, and tape
* Create all boilerplate files
* Git tag 0.0.1 and make an initial commit

Set these npm configuration variables:

```sh
npm config set init.author.name your-name-here
npm config get init.author.email your-email-here
```
