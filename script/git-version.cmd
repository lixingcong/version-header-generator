@REM 注释详见git-version.sh
@REM 本文件仅仅是bash版本在windows实现
@REM 使用前，确保git.exe所在目录属于PATH环境变量
@echo off

@echo #pragma once

@REM 名字
@echo #define APP_NAME          "%1"

@REM 版本
set git_version=unknown
@where git > NUL 2>&1
if not errorlevel 1 (
	for /f "tokens=*" %%a in (
		'"git describe --tags --always --dirty="-dev""' 
	) do (
		set git_version=%%a 
	)
)
@echo #define APP_BUILD_COMMIT  "%git_version%"

@REM 日期
set build_time=unknown
@where git > NUL 2>&1
if not errorlevel 1 (
	for /f "tokens=*" %%a in (
		'"git show --no-patch --no-notes --pretty='%%ad' --date=local"' 
	) do (
		set build_time=%%a
	)
)
@echo #define APP_BUILD_TIME    "%build_time%"

@REM 分支
set git_branch=unknown
@where git > NUL 2>&1
if not errorlevel 1 (
	for /f "tokens=*" %%a in (
		'"git rev-parse --abbrev-ref HEAD"' 
	) do (
		set git_branch=%%a
	)
)
@echo #define APP_GIT_BRANCH    "%git_branch%"
