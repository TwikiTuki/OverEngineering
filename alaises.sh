DOCK_DIR="/home/jrenau-v/OverEngineering"
MOUNT_DIR="./"
DOCK_NAME="myDock"
alias dockbuild="docker build --tag lsp:lsp $DOCK_DIR"
alias dockcreate="docker create -it -v ${MOUNT_DIR}:/42 --name ${DOCK_NAME} lsp:lsp"
alias dockstart="docker start -i ${DOCK_NAME}"
alias dockexec="docker exec -it  ${DOCK_NAME} /bin/bash"
alias dockbegin="dockbuild && dockcreate && dockstart"
alias dockclean="docker stop ${DOCK_NAME} && docker rm ${DOCK_NAME}"
alias dockfclean="docker stop ${DOCK_NAME} && docker rm ${DOCK_NAME} && docker image rm lsp:lsp"

