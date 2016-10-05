all: gaf-terminal
gaf-terminal: ../../gaf.vala \
	  gaf-terminal.vala
	valac -o gaf-terminal \
	-X -w \
	-X -lm \
    --pkg=gtk+-3.0 \
    --pkg=gee-0.8 \
    --pkg=vte-2.91 \
    --pkg=posix \
    --pkg=gdk-x11-3.0 \
    --pkg=xcb \
    --vapidir=./vapi \
    ../../gaf.vala \
    gaf-terminal.vala

clean:
	rm -f gaf-terminal
	rm -f ./*.vala.c

