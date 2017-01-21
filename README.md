# git-amnesia
[![Gem](https://img.shields.io/gem/v/git-amnesia.svg)](https://rubygems.org/gems/git-amnesia)
[![license](https://img.shields.io/github/license/x4121/git-amnesia.svg)](https://github.com/x4121/git-amnesia)

Did you ever come back from the weekend, or worse holiday, looking at your repositories like:

![](http://s2.quickmeme.com/img/26/264476d2588c8a3a8c6db005251434f2c63c7eaf5402752918719efcb70924bf.jpg)

Worry no More! Pass out on the weekends and let git-amnesia remember what you committed.

## Usage
Set your workspace (or whatever you call the folder you put your repos) with
```sh
$ git config dir.workspace /path/to/my/workspace
```
and add any additional repositories you keep scattered around your file system
```sh
$ git config dir.others $HOME/.dotfiles:/some/other/repo
```
Now, typing `git amnesia` will present you with a nicely formatted and colored\* history of your commits.
![example output](https://raw.github.com/x4121/git-amnesia/master/git-amnesia.png)

\* you may still need to install a half decent colorscheme.

## Requirements
- git (you probably have this if you're here)
- ruby >= 1.9.3

## Installation
```sh
$ gem install git-amnesia
```
