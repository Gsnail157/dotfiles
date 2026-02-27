## My Dotfiles:
*Made by: Gsnail157*

I've configured my dotfiles to be stored and managed only using git. Inspiration from this [article](https://www.atlassian.com/git/tutorials/dotfiles) and credit to whoever wrote it. The configurations for each OS will have their own branch so clone accordingly. The `main` branch will just have some of the basic config files for shells, terminal editors, etc that are not system dependent.

## Installation on a new system

## Step 1: 
Set alias in `.bashrc` or `.zshrc`
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
```
## Step 2:
clone specific repo with specific branch
```
git clone --bare https://github.com/Gsnail157/dotfiles.git -b <BRANCH_NAME> $HOME/.cfg
```
## Step 3:
Define alias in current shell scope
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
## Step 4:
checkout
```
config checkout
```
You may recieve error messages to overwrite existing config files but you should create backups and remove the existing ones.
## Step 5:
Untrack files that do not need to be `git add`ed. This will prevent `config status` from showing all the files that are not tracked.
```
config config --local status.showUntrackedFiles no
```

I've also added a folder for wallpapers that I think are cool
