# 🧠 Simple Webserver in Assembly

A minimal web server written in **x86-64 Assembly**, designed for learning low-level network programming concepts.
This project demonstrates how to handle basic TCP connections and serve simple HTTP responses — all without using a high-level language.

> 📚 For detailed explanations and references, see [RESOURCES.md](./RESOURCES.md).

---

## ⚙️ Installation & Usage

You can build and run this project inside a Docker container.
This ensures a consistent environment across systems — no need to install assembler or linker tools manually.

### 1️⃣ Build the Docker Image

```bash
docker build -t webserverasm .
```

This command compiles the base environment and prepares the container for development.

---

### 2️⃣ Run the Container

```bash
docker run -it -v ./:/home/dev/app webserverasm
```

This mounts your current directory (`./`) into the container’s workspace and starts an **interactive shell** inside it.

---

### 3️⃣ Build & Run the Webserver

Once inside the container shell, use `make` to build and execute the program:

```bash
make run
```

This command:

* Assembles the source files.
* Links the binary.
* Runs the server inside the container.

---

## 🧩 Notes

* All build commands are defined in the `Makefile`.
* You can modify the source code in your local directory; changes are automatically reflected inside the container.
* For debugging or learning, explore the `.asm` source files and experiment with syscall behaviors.

---

## 🧰 Requirements

* Docker (version ≥ 24.x recommended)
* `make` (optional on host, used inside container)
* Basic understanding of Assembly syntax (NASM preferred)

---

## 🪪 License

This project is released under the **MIT License**.
Feel free to use, modify, and share it for educational purposes.
