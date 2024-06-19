#include <iostream>

using namespace std;

int main()
{
#define OUT(x) cout << #x << ": " << x << endl
	OUT(GIT_BRANCH);
	OUT(GIT_VERSION_DESCRIBE);
	OUT(GIT_COMMIT_SHA);
	OUT(GIT_COMMIT_TIME);
	OUT(QMAKE_EXECUTE_TIME);
	return 0;
}
