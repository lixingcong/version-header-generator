#include <iostream>
#include "version.h"

int main(int argc, char** argv) {
#define OUT(x) std::cout << "version.h: " #x << " = " << x << std::endl
	OUT(APP_VERSION);
	OUT(GIT_BRANCH);
	OUT(GIT_VERSION_DESCRIBE);
	OUT(GIT_COMMIT_SHA);
	OUT(GIT_COMMIT_TIME);
	OUT(XMAKE_EXECUTE_TIME);
    return 0;
}
