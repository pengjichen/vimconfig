# vim config

## install

- for ubuntu

```
cd $HOME ;\
git clone --recursive https://github.com/pengjichen/vimconfig.git .vim ;\
cp .vim/.vimrc $HOME ;\
apt install -y build-essential cmake python3-dev ;\
cd .vim/bundle/YouCompleteMe ;\
python3 install.py --go-completer ;\
cp .vim/codesnippets/* .vim/bundle/vim-snippets/UltiSnips
```
