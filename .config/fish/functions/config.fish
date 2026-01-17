function config --wraps='git --git-dir=$HOME/.cfg --work-tree=$HOME' --description 'alias config=git --git-dir=$HOME/.cfg --work-tree=$HOME'
    git --git-dir=$HOME/.cfg --work-tree=$HOME $argv
end
