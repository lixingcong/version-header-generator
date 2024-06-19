#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

#include "version.h"

int main()
{
	std::cout << "version.h: CMAKE_EXECUTE_TIME=" << CMAKE_EXECUTE_TIME << std::endl;

	std::cout << "Read changelog:" << std::endl;
	std::string   line;
	std::ifstream fs("Changelog.txt");
	while (std::getline(fs, line))
		std::cout << line << std::endl;
	fs.close();

    return 0;
}
