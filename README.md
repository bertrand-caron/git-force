# Git-force.sh

## Description

Git-force is a bash alias and function to force (sloppy) coworkers or friends to use git on text-based file without them knowing, thus throwing at their faces the power of versioning at the time of an (inevitable) screw-up.

It was designed as a (geeky) joke, but can nevertheless be used !

## Installation

Simply copy the content of git-force.sh at the bottom of your victims `~/.bashrc`.

## Use

Every time the victim edits a file with `vi` or `vim`, the changes made to the files will be committed at the time of leaving the text editor with the commit message ``"Git-forced to commit changes to ${EDITED_FILES}"``. Thats devious, right ?

Big files will be discarded from the commit process.

## Priceless Git Ressources

http://justinhileman.info/article/git-pretty/
http://nvie.com/posts/a-successful-git-branching-model/
