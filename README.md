# Vehicle-position-c++ programming

Vehicle Position Challenge - Instructions for Firmware Candidates ONLY

Task

The binary data file "VehiclePositions.dat" in "VehiclePositions_DataFile.zip" contains a position for each of 2 million vehicles. Your task is to write a program that finds the nearest vehicle positions in the data file to each of the 10 co-ordinates provided in the table below. Your program should be able to find the position ID's of all 10 closest positions in less time than the benchmark approach that simply loops through each of the 2 million positions and keeps the closest to each of the 10 co-ordinates. The challenge is to optimize for speed and improve on the benchmark to the best of your ability.

Specifics

Use Git to clone the project template to your PC
Use C language and GCC compiler toolchain (recommend MinGW/MSYS for Windows users)
Your code should be compatible with 32 and 64 bit architectures
Add your code to solution.c
Complete makefile with rules to compile and clean
Compile: Should only recompile code when any source code changed
Disable optimization
Disable generation of debug information (for final submission)
Enable all general warnings
Enable conversion warnings
Clean: Should not show error if files does not exist
Add code to time execution of the content of the main() function with millisecond accuracy. This includes reading of the file.
You are allowed to use any means possible to speed up execution - this is not limited to code/algorithm optimization.
Minimum acceptance criteria:
Your solution should correctly identify the position IDs of the closest positions
Your solution should find the position IDs in under 500ms when run on our benchmark PC: 1.9GHz, Turbo 4.8Ghz, 4 Cores, 8 Threads
You are allowed 3 submission attempts
Fast track acceptance criteria:
Your solution should correctly identify the position IDs of the closest positions
Your solution should find the position IDs in under 80ms when run on our benchmark PC: 1.9GHz, Turbo 4.8Ghz, 4 Cores, 8 Threads
You are allowed 1 submission attempt

Additional information

Structure of the objects within position.dat:
Field	Data Type
Position ID	32 bit integer
Vehicle Registration	Null terminated string (ASCII)
Latitude	32 bit floating point
Longitude	32 bit floating point
UTC Timestamp	64 bit unsigned integer (number of seconds since Epoch)

10 co-ordinates:

Position	

Latitude	34.544909	32.345544	33.234235	35.195739	31.895839	32.895839	34.115839	32.335839	33.535339	32.234235
Longitude	-102.100843	-99.123124	-100.214124	-95.348899	-97.789573	-101.789573	-100.225732	-99.992232	-94.792232	-100.222222

Makefile

The CXX variable specifies the C++ compiler to use, while CXXFLAGS and LDFLAGS specify compiler and linker options respectively. SOURCES specifies the source files, OBJECTS specifies the object files to build, and EXECUTABLE specifies the name of the final executable.

The all target builds the executable from the object files, using the specified compiler and linker options. The clean target removes the executable and object files.

The run target adds a new rule to the makefile, which runs the program and times its execution using the time command. The program filename is passed as an argument to the run target.

To use this makefile, simply place it in the same directory as your source files and run make in the command line. This will build the executable. You can then run the program using ./program VehiclePositions.dat and time its execution using make run.
