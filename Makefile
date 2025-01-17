municipal-simulator: municipal-simulator.o
	ld -o municipal-simulator municipal-simulator.o -dynamic-linker /lib64/ld-linux-x86-64.so.2 -L./raylib/ -lc -lraylib -lm

municipal-simulator.o: municipal-simulator.asm
	fasm municipal-simulator.asm