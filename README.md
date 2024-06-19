# Generate the header file include git version

The generated `version.h` looks like this:

```cpp
#pragma once

#define APP_VERSION "1.3.0"

#define GIT_VERSION_DESCRIBE "8a4b6a8"
#define GIT_COMMIT_SHA "8a4b6a8d5a609fa7dc11e7ce44a337438d119f54"
#define GIT_COMMIT_TIME "2024-06-19 23:00"
#define GIT_BRANCH "master"

#define CMAKE_EXECUTE_TIME "2024-06-19 23:05"
```

Usage: see the projects under 'example'

# References

- [cmake-git-version-tracking](https://github.com/andrew-hardin/cmake-git-version-tracking)
- [Show windows datetime with cmd](https://superuser.com/a/1045459)
- [gitversion.pri](https://gist.github.com/grassator/11405930)