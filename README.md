# Clone
    git clone git@github.com:fpghost/dotvim.git ~/.vim

# Create symlinks
    ln -s ~/.vim/vimrc ~/.vimrc 
    ln -s ~/.vim/gvimrc ~/.gvimrc 

# Get vundle
Note the plugin inside bundle dir will be empty on github
git doesn't let you add git repos as part of repo.
This is the way Vundle is intended to work, so you don't
need all the plugin files. Just reinstall Vundle
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

and then do :BundleList, :BundleInstall with vim opened.
