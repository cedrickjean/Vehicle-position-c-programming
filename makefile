CXX = g++
CXXFLAGS = -Wall -Wconversion -O0 -std=c++11
LDFLAGS =

SOURCES = main.cpp haversine.cpp
OBJECTS = $(SOURCES:.cpp=.o)
EXECUTABLE = program

.PHONY: all clean

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(LDFLAGS) $^ -o $@

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(EXECUTABLE) $(OBJECTS)

run: $(EXECUTABLE)
	time ./$(EXECUTABLE) VehiclePositions.dat
