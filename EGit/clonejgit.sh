curr_dir=`pwd`
#git config --global http.proxy 10.167.32.133:8080
git config --global core.autocrlf true
env GIT_SSL_NO_VERIFY=ture git clone http://git.eclipse.org/gitroot/jgit/jgit.git $curr_dir/src/JGit
