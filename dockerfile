FROM ubuntu:latest
WORKDIR /42
VOLUME /42
RUN apt update
RUN apt install -y vim 
RUN apt install -y curl
RUN apt install -y clangd
RUN apt install -y g++
RUN apt install -y make
COPY ./root /root/
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN  vim  -c ':PlugInstall | quita' 
