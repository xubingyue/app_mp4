CFLAGS = -g -O2 -shared -fPIC -Wall -pedantic
LDFLAGS = -lmp4v2

all: app_mp4.so

app_mp4.so: app_mp4.o
	g++ $(CFLAGS) -o $@ $^ $(LDFLAGS)

app_mp4.o: app_mp4.c
	gcc $(CFLAGS) --std=gnu99 -c -o $@ $<

install: all
	cp -av app_mp4.so /usr/lib/asterisk/modules/

clean:
	rm -f *.o *.so
