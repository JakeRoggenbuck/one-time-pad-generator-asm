build:
	nasm -f elf64 main.asm
	ld main.o -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc -melf_x86_64
