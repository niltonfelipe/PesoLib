CC     = gcc
AR     = ar
RANLIB = ranlib
RM     = rm -f
OBJS   = ../src/PesoLib.o \
         ../src/device/Device.o \
         ../src/device/DeviceManager.o \
         ../src/driver/Elgin.o \
         ../src/driver/Magna.o \
         ../src/driver/Filizola.o \
         ../src/driver/Toledo.o \
         ../src/driver/Alfa.o \
         ../src/driver/Urano.o \
         ../src/win/main.o \
         ../src/win/CommPort.o \
         ../src/win/Event.o \
         ../src/win/Mutex.o \
         ../src/win/Thread.o \
         ../src/util/StringBuilder.o \
         ../src/java/br_com_mzsw_PesoLibWrapper.o

LIBS   = -lwinspool -m32
CFLAGS = -I..\include -I..\src\system -I..\src\comm -I..\src\device -I..\src\driver -I..\src\util -I..\src\java\jni -I..\src\java\jni\win32 -DLIB_STATIC -m32 -fno-diagnostics-show-option

.PHONY: all

all: ../lib/x86/libPesoLib.a

clean:
	$(RM) $(OBJS) ../lib/x86/libPesoLib.a

clear:
	$(RM) $(OBJS)

../lib/x86/libPesoLib.a: $(OBJS)
	$(AR) rc $@ $(OBJS)
	$(RANLIB) $@

../src/PesoLib.o: ../src/PesoLib.c ../src/system/Thread.h ../src/system/Mutex.h ../src/system/Event.h ../src/comm/CommPort.h ../src/device/DeviceManager.h ../src/util/StringBuilder.h ../src/system/Mutex.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

../src/device/Device.o: ../src/device/Device.c ../src/device/Device.h ../src/device/DevicePrivate.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

../src/device/DeviceManager.o: ../src/device/DeviceManager.c ../src/device/DeviceManager.h ../src/driver/Filizola.h ../src/driver/Toledo.h ../src/driver/Alfa.h ../src/driver/Magna.h ../src/driver/Urano.h ../src/driver/Elgin.h ../src/util/StringBuilder.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

../src/driver/Elgin.o: ../src/driver/Elgin.c ../src/driver/Elgin.h ../src/device/DevicePrivate.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

../src/driver/Magna.o: ../src/driver/Magna.c ../src/driver/Magna.h ../src/device/DevicePrivate.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

../src/driver/Filizola.o: ../src/driver/Filizola.c ../src/driver/Filizola.h ../src/device/DevicePrivate.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

../src/driver/Toledo.o: ../src/driver/Toledo.c ../src/driver/Toledo.h ../src/device/DevicePrivate.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

../src/driver/Alfa.o: ../src/driver/Alfa.c ../src/driver/Alfa.h ../src/device/DevicePrivate.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

../src/driver/Urano.o: ../src/driver/Urano.c ../src/driver/Urano.h ../src/device/DevicePrivate.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

../src/win/main.o: ../src/win/main.c ../include/PesoLib.h ../src/comm/CommPort.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

../src/win/CommPort.o: ../src/win/CommPort.c ../src/comm/CommPort.h ../src/system/Thread.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

../src/win/Event.o: ../src/win/Event.c ../src/system/Event.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

../src/win/Mutex.o: ../src/win/Mutex.c ../src/system/Mutex.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

../src/win/Thread.o: ../src/win/Thread.c ../src/system/Thread.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

../src/util/StringBuilder.o: ../src/util/StringBuilder.c ../src/util/StringBuilder.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

../src/java/br_com_mzsw_PesoLibWrapper.o: ../src/java/br_com_mzsw_PesoLibWrapper.c ../src/java/br_com_mzsw_PesoLibWrapper.h ../include/PesoLib.h
	$(CC) -Wall -s -O2 -c $< -o $@ $(CFLAGS)

