# ============================================================
# Arch Linux Assembly Development Environment
# Base: archlinux:multilib-devel
# Tools: NASM, LD, GCC, GDB, LLDB, CMake, Make
# Maintainer: elwnc
# ============================================================

FROM archlinux:multilib-devel-20251012.0.434149

LABEL maintainer="elwnc" \
      description="Arch Linux environment for Assembly (NASM, GCC, GDB, CMake, etc.)"

# Set up non-root user
ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create working directory
WORKDIR /home/${USERNAME}/app

# Update base system and install essential tools with reliable mirrors
RUN sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist && \
    pacman -Sy --noconfirm reflector && \
    reflector --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && \
    pacman -Syu --noconfirm || true && \
    pacman -S --noconfirm \
        base-devel \
        nasm \
        binutils \
        gcc \
        gdb \
        make \
        cmake \
        lldb \
        strace \
        vim \
        git \
        python \
        sudo \
        man-db \
        man-pages \
        less \
        util-linux \
        which && \
    pacman -Scc --noconfirm && \
    rm -rf /var/cache/pacman/pkg/* /tmp/*


# Create user and give passwordless sudo
RUN groupadd --gid ${USER_GID} ${USERNAME} && \
    useradd --uid ${USER_UID} --gid ${USER_GID} -m -s /bin/bash ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USERNAME} && \
    chmod 0440 /etc/sudoers.d/${USERNAME}

USER ${USERNAME}

# Locale and PATH configuration
ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    PATH="/home/${USERNAME}/.local/bin:${PATH}"

# Quick sanity check
RUN echo "Assembly development environment ready." && \
    nasm -v && \
    gcc --version && \
    gdb --version && \
    cmake --version

CMD ["/bin/bash"]
