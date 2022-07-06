FROM alpine:latest

RUN apk add --update \
  git \
  alpine-sdk build-base\
  libtool \
  automake \
  m4 \
  autoconf \
  linux-headers \
  unzip \
  ncurses ncurses-dev ncurses-libs ncurses-terminfo \
  python \
  python-dev \
  py-pip \
  clang \
  go \
  nodejs \
  xz \
  curl \
  make \
  cmake \
  cargo \
  rust  \
  tmux  \
  neovim  \
  && rm -rf /var/cache/apk/*
WORKDIR /tmp
ENV CMAKE_EXTRA_FLAGS=-DENABLE_JEMALLOC=OFF

# Required for running this on my archbox
# RUN adduser -S xubo -u 1000 -G users
# RUN adduser -S xubo -G users
# RUN adduser -S ubuntu -G users

RUN git clone https://github.com/neovim/libtermkey.git && \
  cd libtermkey && \
  make && \
  make install && \
  cd ../ && rm -rf libtermkey

RUN git clone https://github.com/neovim/libvterm.git && \
  cd libvterm && \
  make && \
  make install && \
  cd ../ && rm -rf libvterm

RUN git clone https://github.com/neovim/unibilium.git && \
  cd unibilium && \
  make && \
  make install && \
  cd ../ && rm -rf unibilium

RUN  git clone https://github.com/neovim/neovim.git && \
  cd neovim && \
  make && \
  make install && \
  cd ../ && rm -rf nvim

# # Install neovim python support
# RUN pip install neovim pep8
# RUN chgrp -R users .

# COPY install /usr/local/bin/install-neovim
# USER xubo

# # install vim-plug
# RUN curl -fLo /home/xubo/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# # copy init.vim into container
# COPY init.vim /home/xubo/.config/nvim/init.vim
# COPY pep8 /home/xubo/.config/pep8

# # install all plugins
# RUN nvim +PlugInstall +qa 
# RUN cd /home/xubo/.nvim/plugged/YouCompleteMe && ./install.py --clang-completer --gocode-completer --tern-completer 

# ENV TERM xterm256-color

WORKDIR /data
#COPY neovim /neovim
CMD /usr/local/bin/nvim 
