CC = gcc

CFLAGS = -Wall `pkg-config fuse3 --cflags --libs` -D_FILE_OFFSET_BITS=64

TARGET = ssd_fuse
DUT_TARGET = ssd_fuse_dut

SRCS = ssd_fuse.c ssd_fuse_dut.c

all: clean $(TARGET) $(DUT_TARGET) remount

$(TARGET): ssd_fuse.o
	$(CC) -o $(TARGET) ssd_fuse.o $(CFLAGS)

$(DUT_TARGET): ssd_fuse_dut.o
	$(CC) -o $(DUT_TARGET) ssd_fuse_dut.o $(CFLAGS)

clean:
	rm -f $(TARGET) $(DUT_TARGET) *.o

remount:
	fusermount -u /tmp/ssd || true
	mkdir -p /tmp/ssd
	./$(TARGET) -d /tmp/ssd &

.PHONY: all clean remount
