FROM archlinux:multilib-devel-20251012.0.434149

LABEL maintainer="elwnc" \
      description="Arch Linux environment for Assembly development (NASM, GCC, GDB, etc.)"

WORKDIR /app

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
        base-devel \
        nasm \
        binutils \
        gcc \
        gdb \
        make \
        vim \
        git \
        sudo \
        man-pages \
        man-db \
        less \
        util-linux \
        multilib-devel \
        strace \
        lldb \
        python \
        which && \
    pacman -Scc --noconfirm

ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m -s /bin/bash $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER $USERNAME
WORKDIR /home/$USERNAME/app

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV PATH="/home/$USERNAME/.local/bin:$PATH"

RUN echo "Assembly dev environment ready." && \
    nasm -v && \
    gcc --version && \
    gdb --version

CMD ["/bin/bash"]
