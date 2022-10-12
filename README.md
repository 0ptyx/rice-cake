# Rice-Cake: Auto Rice meta-configuration tool
Some scripts / framework I made for making linux system configuration easier. The core is just bash and text files.

## Overview
There are only three things Rice-Cake needs to work: A system with bash, the `tasks` directory and the `manifest` file.
The `manifest` file contains the list of tasks found in the `tasks` directory that should 
be run. Rice-Cake runs them *in the order they are presented* meaning that you can sort of
handle task dependency. For each task, rice-cake looks in the `tasks` directory for either a) a bash script named `<task_name>.sh` or 
a `task.sh` file inside a `<task_name>/` directory. In this way, tasks can do whatever you need them to including call other tools.

## Use
I don't know why anyone else would use this but just in case this is how I use it:
1) Fork it. 
2) Add your tasks. Package install, dotfile setup, github project clone, etc.
3) Tag and create a release.
4) When you find yourself in an empty & depressing shell of a linux system, run `wget https://<wherever your hosting>/<release_name>.tar.gz`
5) Untar, & run `rice-cake.sh`
6) Congrats. 


## FAQ
* Why? I find my self frequently configuring new linux VMs or other systems so having a way to auto configure them makes my life less painful.
* Why not use ___? Because I wanted to stick to something as native as possible to what already comes on linux.
* Why rice-cake? If you've ever been on [/r/unixporn](https://reddit.com/r/unixporn) then you know.


