alias dockbuild="docker build --tag lsp:lsp /Users/jrenau-v/docker"
alias dockcreate="docker create -it -v ~/42:/42 --name myDock lsp:lsp"
alias dockstart="docker start -i myDock"
alias dockexec="docker exec -it  myDock /bin/bash"
alias dockbegin="dockbuild && dockcreate && dockstart"
alias dockclean="docker stop myDock && docker rm myDock"
alias dockfclean="docker stop myDock && docker rm myDock && docker image rm lsp:lsp"
