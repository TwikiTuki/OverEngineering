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




 # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 




setOptions(){
	echo "Setting options"
	DOCKER_FILE="/home/jrenau-v/OverEngineering"
	HOST_VOLUME="./"
	DOCK_NAME="myDock"
	OPTS=":v:n:f:"
	while getopts ${OPTS} opt; do
		case ${opt} in
			v)
				echo "Option v with value ${OPTARG}"
				;;
			n)
				echo "Option n with value ${OPTARG}"
				;;
			f)
				echo "Option f with value ${OPTARG}"
				;;
			:)
				echo "Option ${OPTARG} without value "
				;;
			?)
				echo "Invalid option"
				;;
	esac
	done

	echo "Docer file path: ${DOCKER_FILE}"
	echo "Host volume dir (-v): ${HOST_VOLUME}"
	echo "Docker name (-n): ${DOCK_NAME}"
	echo 
}


dockbuild()
{
	setOptions
	docker build --tag lsp:lsp $DOCKER_FILE
}

dockcreate()
{
	setOptions()
	docker create -it -v ${HOST_VOLUME}:/42 --name ${DOCK_NAME} lsp:lsp
}

dockstart()
{
	setOptions()
	docker start -i ${DOCK_NAME}
}

dockexec()
{
	setOptions()
	docker exec -it  ${DOCK_NAME} /bin/bash
}

dockbegin()
{
	setOptions()
	dockbuild && dockcreate && dockstart
}

dockclean()
{
	setOptions()
	docker stop ${DOCK_NAME} && docker rm ${DOCK_NAME}
}

dockfclean()
{
	setOptions()
	docker stop ${DOCK_NAME} && docker rm ${DOCK_NAME} && docker image rm lsp:lsp
}



#alias dockbuild="docker build --tag lsp:lsp $DOCKER_FILE"
#alias dockcreate="docker create -it -v ${HOST_VOLUME}:/42 --name ${DOCK_NAME} lsp:lsp"
#alias dockstart="docker start -i ${DOCK_NAME}"
#alias dockexec="docker exec -it  ${DOCK_NAME} /bin/bash"
#alias dockbegin="dockbuild && dockcreate && dockstart"
#alias dockclean="docker stop ${DOCK_NAME} && docker rm ${DOCK_NAME}"
#alias dockfclean="docker stop ${DOCK_NAME} && docker rm ${DOCK_NAME} && docker image rm lsp:lsp"
