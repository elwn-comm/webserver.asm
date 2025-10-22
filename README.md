# Simple Webserver in Assembly

A minimal HTTP web server written entirely in **x86-64 Assembly**, demonstrating low-level network programming using Linux syscalls.
The project shows how to create sockets, handle TCP connections, and send HTTP responses without relying on any high-level language or standard library.

---

## Installation and Usage

This project uses **CMake** for modular multi-file builds and **Docker** for a reproducible development environment.
You do not need to install NASM or other build tools locally.

---

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/webserverasm.git
cd webserverasm
```

---

### 2. Build the Docker Image

```bash
docker build -t webserverasm .
```

This creates an isolated environment containing NASM, LD, CMake, and all required dependencies.

---

### 3. Run the Development Container

```bash
docker run -it -v ./:/home/dev/app webserverasm
```

This command mounts your current directory (`./`) into the container at `/home/dev/app`
and opens an interactive shell where you can build and run the project.

---

### 4. Configure and Build with CMake

Inside the container, run:

```bash
cmake -S . -B build
cmake --build build
```

Alternatively, you can use the short form:

```bash
cmake -B build && cmake --build build
```

This assembles all `.asm` source files, links them, and produces the `webserver` binary in the `build/` directory.

---

### 5. Run the Webserver

After a successful build:

```bash
./build/webserver
```

In another terminal, test the server with:

```bash
curl http://localhost:8080
```

Expected response:

```copy
Hello, world!
```

---

### 6. Clean Build Files

To remove all compiled artifacts:

```bash
rm -rf build
```

---

## Requirements

* Docker ≥ 24.x
* CMake ≥ 3.20 (already installed in container)
* NASM assembler
* Basic understanding of x86-64 Assembly and Linux syscalls

---

## License

This project is released under the **MIT License**.
You may use, modify, and distribute it for educational or research purposes.
