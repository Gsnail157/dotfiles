# MacOS dot files

![Screen](/Pictures/screenshot/macos.png)

I might try [fish](https://fishshell.com/) if I am bored one day.

### Using [eza](https://github.com/eza-community/eza) instead of ls:

Downloaded via homebrew

There are issues with the default env variable `$EZA_CONFIG_DIR` on MacOS.

Here is the quick [solution](https://github.com/eza-community/eza/issues/1224)
```
mkdir ~/Library/Application\ Support/eza

cd ~/Library/Application\ Support/eza

ln -sf $/Users/gsnail/eza-themes/themes/tokyonight.yml ./theme.yml
```

### zsh plugins
- zsh-autocomplete: via homebrew
