# My Dot Files

## Usage

> Taken from [https://antelo.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b](https://antelo.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b)

### Add to a new computer

1. Clone repo to HOME directory `git clone --bare https://github.com/silbermm/dotfiles.git $HOME/.dotfiles`
2. Define an alias `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
3. Checkout the contents to the HOME directory `dotfiles checkout`
4. Deal with any files that may already exist

#### Vim
* install [vim-plug](https://github.com/junegunn/vim-plug)
* open `vim` and run `:VimInstall`

### Adding new files and commiting changes

Just like any other `git` flow:
* `dotfiles add filename`
* `doffiles commit -am "added filename"`
* `dotfiles push`
