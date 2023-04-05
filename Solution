#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
#include <algorithm>

#define M_PI 3.14159265358979323846


using namespace std;

// Define a struct to hold the data for each position
struct Position {
    int id;
    string registration;
    double latitude;
    double longitude;
    unsigned long timestamp;
};

// Define a function to calculate the distance between two coordinates using the Haversine formula
double haversine(double lat1, double lon1, double lat2, double lon2) {
    const double R = 6371e3; // Earth's radius in meters
    const double phi1 = lat1 * M_PI / 180.0; // Convert latitude to radians
    const double phi2 = lat2 * M_PI / 180.0;
    const double delta_phi = (lat2 - lat1) * M_PI / 180.0;
    const double delta_lambda = (lon2 - lon1) * M_PI / 180.0;

    const double a = sin(delta_phi / 2.0) * sin(delta_phi / 2.0) +
        cos(phi1) * cos(phi2) *
        sin(delta_lambda / 2.0) * sin(delta_lambda / 2.0);
    const double c = 2.0 * atan2(sqrt(a), sqrt(1.0 - a));

    return R * c;
}

int main() {
    // Read in the binary data file
    ifstream file("VehiclePositions.dat", ios::binary | ios::ate);
    streamsize size = file.tellg();
    file.seekg(0, ios::beg);
    vector<char> buffer(size);
    if (file.read(buffer.data(), size)) {
        cout << "Read " << size << " bytes from file." << endl;
    }
    else {
        cerr << "Error reading file." << endl;
        return 1;
    }
    file.close();

    // Parse the binary data into Position structs
    vector<Position> positions;
    for (int i = 0; i < size; i += 24) {
        Position p;
        p.id = *(int*)(buffer.data() + i);
        p.registration = string(buffer.data() + i + 4);
        p.latitude = *(float*)(buffer.data() + i + 12);
        p.longitude = *(float*)(buffer.data() + i + 16);
        p.timestamp = *(unsigned long*)(buffer.data() + i + 20);
        positions.push_back(p);
    }

    // Define the coordinates to find the closest positions to
    vector<double> latitudes = { 34.544909, 32.345544, 33.234235, 35.195739, 31.895839,
                                32.895839, 34.115839, 32.335839, 33.535339, 32.234235 };
    vector<double> longitudes = { -102.100843, -99.123124, -100.214124, -95.348899,
                                 -97.789573, -101.789573, -100.225732, -99.992232,
                                 -94.792232, -100.222222 };

    // Find the closest positions to each coordinate
    for (int i = 0; i < latitudes.size(); ++i) {
        cout << "Closest positions to (" << latitudes[i] << ", " << longitudes[i] << "):" << endl;

        vector<pair<int, double>> distances;
        for (const auto& p : positions) {
            double dist = haversine(latitudes[i], longitudes[i], p.latitude, p.longitude);
            distances.push_back(make_pair(p.id, dist));
        }

        sort(distances.begin(), distances.end(), [](const auto& a, const auto& b) {
            return a.second < b.second;
            });

        for (int j = 0; j < min(10, (int)distances.size()); ++j) {
            cout << distances[j].first << endl;
        }
        cout << endl;
    }

    return 0;
}
