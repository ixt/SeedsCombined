CC = g++
RM = rm

CFLAGS = -g -Wall 
LIBS = $(shell pkg-config --cflags --libs opencv)

all : seeds seedscombine

seeds : seeds/main.cpp seeds/SeedsRevised.cpp seeds/Tools.cpp
	$(CC) $(CFLAGS) -o Seeds seeds/main.cpp seeds/SeedsRevised.cpp seeds/Tools.cpp $(LIBS)

seedscombine : seedscombine/seedscombine.cpp seedscombine/Superpixel.cpp seedscombine/SuperpixelEdge.cpp seedscombine/SuperpixelImage.cpp seedscombine/SuperpixelEdgeTable.cpp seedscombine/Coord.cpp seedscombine/OpenCVUtil.cpp seedscombine/Util.cpp
	$(CC) $(CFLAGS) -o SeedsCombine seedscombine/seedscombine.cpp seedscombine/Superpixel.cpp seedscombine/SuperpixelEdge.cpp seedscombine/SuperpixelImage.cpp seedscombine/SuperpixelEdgeTable.cpp seedscombine/Coord.cpp seedscombine/OpenCVUtil.cpp seedscombine/Util.cpp $(LIBS)

clean :
	rm Seeds SeedsCombine

.PHONY: all clean seeds seedscombine
