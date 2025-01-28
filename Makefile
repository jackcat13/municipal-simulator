ubuntu: municipal-simulator-ubuntu

municipal-simulator-ubuntu: municipal-simulator.o
	ld -o municipal-simulator municipal-simulator.o -dynamic-linker /lib64/ld-linux-x86-64.so.2 -L./raylib/ -lc -lraylib -lm

windows: municipal-simulator-windows
	
municipal-simulator-windows: municipal-simulator.o
	gcc municipal-simulator.o -o municipal-simulator.exe -L./raylib-windows -lraylib -lopengl32 -lgdi32 -lwinmm

municipal-simulator.o: municipal-simulator.asm
	fasm municipal-simulator.asm
