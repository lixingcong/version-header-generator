# Need to discard STDERR so get path to NULL device
win32 {
    NULL_DEVICE = NUL
} else {
    NULL_DEVICE = /dev/null
}

!system(git --version > $$NULL_DEVICE) {
   error(Require git installed)
}

# Git version describe
GIT_VERSION_DESCRIBE = $$system(git describe --tags --always --dirty=-dev 2> $$NULL_DEVICE)
DEFINES += GIT_VERSION_DESCRIBE=\\\"$$GIT_VERSION_DESCRIBE\\\"

# Git commit full SHA
GIT_COMMIT_SHA = $$system(git rev-parse HEAD 2> $$NULL_DEVICE)
DEFINES += GIT_COMMIT_SHA=\\\"$$GIT_COMMIT_SHA\\\"

# Git branch
GIT_BRANCH = $$system(git rev-parse --abbrev-ref HEAD 2> $$NULL_DEVICE)
DEFINES += GIT_BRANCH=\\\"$$GIT_BRANCH\\\"

# Git commit author date
GIT_COMMIT_TIME = $$system(git show --no-patch --no-notes --pretty='%ad' --date=format:'%Y-%m-%d_%H:%M' 2> $$NULL_DEVICE)
DEFINES += GIT_COMMIT_TIME=\\\"$$GIT_COMMIT_TIME\\\"

# QMake timestamp
win32 {
    QMAKE_EXECUTE_TIME = $$system("$${PWD}\..\script\windows-date.cmd")
} else {
    QMAKE_EXECUTE_TIME = $$system("date +%Y-%m-%d_%H:%M")
}
DEFINES += QMAKE_EXECUTE_TIME=\\\"$${QMAKE_EXECUTE_TIME}\\\"
