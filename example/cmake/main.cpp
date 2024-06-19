#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

#include "version.h"

int main()
{
#define OUT(x) std::cout << "version.h: " #x << " = " << x << std::endl
	OUT(APP_VERSION);
	OUT(GIT_BRANCH);
	OUT(GIT_VERSION_DESCRIBE);
	OUT(GIT_COMMIT_SHA);
	OUT(GIT_COMMIT_TIME);
	OUT(CMAKE_EXECUTE_TIME);

	std::string   line;
	std::ifstream fs("Changelog.txt");
	while (std::getline(fs, line))
		std::cout << line << std::endl;
	fs.close();

    return 0;
}
