CC=clang
CFLAGS=-framework Foundation -framework IOKit -fobjc-arc -l IOAccessoryManager
test: *.m
	$(CC) *.m -o main ${CFLAGS}
