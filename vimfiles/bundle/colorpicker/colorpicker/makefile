gtk_include=-IC:/GTK/INCLUDE/LIBXML2 -IC:/GTK/INCLUDE/LIBGLADE-2.0 -IC:/GTK/LIB/GTKGLEXT-1.0/INCLUDE -IC:/GTK/LIB/GLIB-2.0/INCLUDE -IC:/GTK/LIB/GTK-2.0/INCLUDE -IC:/GTK/INCLUDE/GTKGLEXT-1.0 -IC:/GTK/INCLUDE/ATK-1.0 -IC:/GTK/INCLUDE/CAIRO -IC:/GTK/INCLUDE/PANGO-1.0 -IC:/GTK/INCLUDE/GLIB-2.0 -IC:/GTK/INCLUDE/GTK-2.0 -IC:/GTK/INCLUDE

gtk_lib=-Wl,-luuid -LC:/GTK/lib -lglade-2.0 -lgtk-win32-2.0 -lgdk-win32-2.0 -limm32 -lshell32 -lole32 -latk-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpangoft2-1.0 -lpangowin32-1.0 -lgdi32 -lfreetype -lz -lfontconfig -lpango-1.0 -lm -lgobject-2.0 -lgmodule-2.0 -lglib-2.0 -lintl -lxml2

main: colorpicker.c
	gcc -mwindows -mms-bitfields -Wall -g colorpicker.c -o colorpicker ${gtk_include} ${gtk_lib}

all:
	${MAKE} main
