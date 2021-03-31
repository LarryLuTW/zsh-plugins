# Zsh alias and functions

Here are many useful aliases and functions for zsh. This is for my own usage. If you want to create your own alias, you can fork this and add your own.

## How to use these plugins with zplug

### Install all plugins in the repository

Just put the following line in your .zshrc, and run `zplug install` in your terminal.

```sh
zplug "LarryLuTW/zsh-plugins"
```

For more details about how to use zplug, please goto [zplug usage](https://github.com/zplug/zplug#usage)

### Install specific plugin

```sh
# only use git plugin
zplug "LarryLuTW/zsh-plugins", use:git.plugin.zsh
```

### Update plugin

Just run `zplug update` in your terminal.

## Reference

- [ohmyzsh/git plugin](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh)
- [tcnksm/docker-alias](https://github.com/tcnksm/docker-alias/blob/master/zshrc)
- [ohmyzsh/docker-compose](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/docker-compose/docker-compose.plugin.zsh)
