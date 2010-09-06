TARGET = buffer

all: $(TARGET)

read.o:read.c fat32.h
	gcc -Wall -c -o $@ $< -g

radix.o:radix.c radix.h mm.h
	gcc -Wall -c -o $@ $< -g -std=c99

dir.o:dir.c dir.h page.h io.h fat32.h
	gcc -Wall -c -o $@ $< -g

superblock.o:superblock.c superblock.h page.h
	gcc -Wall -c -o $@ $< -g

io.o:io.c io.h
	gcc -Wall -c -o $@ $< -g

mm.o:mm.c mm.h
	gcc -Wall -c -o $@ $< -g

buffer.o: buffer.c buffer.h mm.h page.h fat32.h io.h radix.h superblock.h dir.h lib.h
	gcc -Wall -c -o $@ $< -g -std=c99

buffer:buffer.o dir.o radix.o superblock.o io.o read.o mm.o
	gcc -Wall -o $@ $^ -g -std=c99

clean:
	rm -rf $(TARGET) *.o

