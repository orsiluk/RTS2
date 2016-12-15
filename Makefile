AS = gpasm
CC = sdcc
CFLAGS= -c -mpic16 -p18f97j60  -o$@ 
LD = sdcc
LDFLAGS= -mpic16 -p18f97j60 -L/usr/local/share/sdcc/lib/pic16 \
         -L/usr/local/share/sdcc/lib/src/pic16/libc -llibio18f97j60.lib \
         -llibdev18f97j60.lib -llibc18f.a
AR = ar
RM = rm

OBJECTS= Objects/LCDBlocking.o \
		 Objects/UDP.o \
		 Object/RelayDHCP.o

SDCC_HEADERS=/usr/local/share/sdcc/include/string.h \
   /usr/local/share/sdcc/include/stdlib.h \
   /usr/local/share/sdcc/include/stdio.h \
   /usr/local/share/sdcc/include/stddef.h \
   /usr/local/share/sdcc/include/stdarg.h 

SDCC_PIC16_HEADERS=/usr/local/share/sdcc/include/pic16/pic18f97j60.h

TCPIP_HEADERS=   Include/TCPIP_Stack/ETH97J60.h \
   Include/TCPIP_Stack/LCDBlocking.h \
   Include/TCPIPConfig.h \
   Include/TCPIP_Stack/TCPIP.h \
   Include/TCPIP_Stack/DHCP.h \
   Include/TCPIP_Stack/UDP.h

APP_HEADERS=Include/GenericTypeDefs.h \
   Include/Compiler.h \
   Include/HardwareProfile.h 

RelayDHCP : RelayDHCP.o $(OBJECTS)
	$(LD) $(LDFLAGS) Objects/RelayDHCP.o $(OBJECTS)

Objects/RelayDHCP.o : RelayDHCP.c $(SDCC_HEADERS) $(SDCC_PIC16_HEADERS) \
   $(APP_HEADERS) $(TCPIP_HEADERS)
	$(CC) $(CFLAGS) "Objects/RelayDHCP.o" \
              -L/usr/local/lib/pic16  RelayDHCP.c

Objects/UDP.o : TCPIP_Stack/UDP.c $(SDCC_HEADERS) $(SDCC_PIC16_HEADERS) \
   $(APP_HEADERS) $(TCPIP_HEADERS)
	$(CC) $(CFLAGS) "Objects/UDP.o" \
              -L/usr/local/lib/pic16  TCPIP_Stack/UDP.c

Objects/LCDBlocking.o : TCPIP_Stack/LCDBlocking.c $(SDCC_HEADERS)  \
   $(SDCC_PIC16_HEADERS) $(APP_HEADERS) $(TCPIP_HEADERS)
	$(CC) -c -mpic16 -p18f97j60  -o"Objects/LCDBlocking.o" \
              -L/usr/local/lib/pic16  TCPIP_Stack/LCDBlocking.c

Objects/Tick.o : TCPIP_Stack/Tick.c  $(SDCC_HEADERS)  \
   $(SDCC_PIC16_HEADERS) $(APP_HEADERS) $(TCPIP_HEADERS)
	$(CC) -c -mpic16 -p18f97j60  -o"Objects/Tick.o" \
              -L/usr/local/lib/pic16  TCPIP_Stack/Tick.c

clean : 
	$(RM) $(OBJECTS)

