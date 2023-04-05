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

There are a few potential improvements that could be made to this code:

1. Use const references instead of passing by value in function arguments
   
   double haversine(const double& lat1, const double& lon1, const double& lat2, const double& lon2)
   
2. Avoid repeatedly calculating the same value in the haversine function

   double sin_delta_phi = sin(delta_phi / 2.0);
   double sin_delta_lambda = sin(delta_lambda / 2.0);
   double cos_phi1 = cos(phi1);
   double cos_phi2 = cos(phi2);

const double a = sin_delta_phi * sin_delta_phi +
    cos_phi1 * cos_phi2 *
    sin_delta_lambda * sin_delta_lambda;
    
 3. Use the reserve method on the vector to avoid excessive memory allocation


   vector<Position> positions;
positions.reserve(size / 24); // size / sizeof(Position)

  4. Use emplace_back instead of push_back to construct Position objects in place
  
    positions.emplace_back(*(int*)(buffer.data() + i), string(buffer.data() + i + 4),
                        *(float*)(buffer.data() + i + 12), *(float*)(buffer.data() + i + 16),
                        *(unsigned long*)(buffer.data() + i + 20));
  5. vector<pair<int, double>> distances;
for (int i = 0; i < latitudes.size(); ++i) {
    cout << "Closest positions to (" << latitudes[i] << ", " << longitudes[i] << "):" << endl;

    distances.clear();
    distances.reserve(positions.size());

    for (const auto& p : positions) {
        double dist = haversine(latitudes[i], longitudes[i], p.latitude, p.longitude);
        distances.emplace_back(p.id, dist);
    }

    // ...
}
6. Use parallelization to speed up the computation of the haversine distances. This could be done with OpenMP or other parallelization libraries.

7. Avoid reading the entire binary file into memory at once. Instead, read the file in chunks using a buffer to minimize memory usage.

8. Use a more efficient data structure to store the Position data, such as a quadtree or KD-tree, to speed up the nearest neighbor search.

9. Use a faster algorithm for nearest neighbor search, such as the k-d tree algorithm or locality-sensitive hashing.

10. Use a more efficient data format to store the Position data, such as Protocol Buffers or Apache Arrow, to reduce file size and improve I/O performance.

 algorithm optimization
                                                                                             
1. Use a spatial index: Instead of comparing the distance between each position and each coordinate, we can use a spatial index like a quadtree or kd-tree to efficiently find the positions that are closest to each coordinate. This can greatly reduce the number of distance calculations needed.

2. Sort positions by latitude and longitude: Since the distance between two positions is directly related to their latitude and longitude, we can sort the positions by latitude and longitude before calculating distances. This can help avoid unnecessary distance calculations by only comparing positions that are close in latitude and longitude.

3. Use a faster distance calculation: The Haversine formula is accurate but computationally expensive. There are faster distance formulas that can be used for approximations, such as the Spherical Law of Cosines or the Equirectangular approximation.

4. Use parallelism: If the code is running on a multi-core CPU, we can parallelize the distance calculations for each coordinate by dividing them into smaller chunks and processing them in parallel using threads or OpenMP.

5. Use a more efficient file format: If the file format is not optimized for reading, it can cause slow I/O performance. We can consider using a more efficient file format like HDF5 or binary format that allows for faster reading and writing of data.

6. Use memory-mapped files: Instead of loading the entire file into memory, we can use memory-mapped files to only load portions of the file as needed. This can help reduce memory usage and improve I/O performance.

7. Use a profiler: We can use a profiler to identify bottlenecks in the code and optimize the parts that take the most time. This can help identify specific areas of the code that can be optimized, such as removing unnecessary loops or reducing function calls.
 
 Contact me if any help
                                                                                             
 My contact number : +27 67 608 08 31
 Email: mwakanukecedrick@gmail.con                                                                                           
                                                                                             



   
