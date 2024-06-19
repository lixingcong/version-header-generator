#! /bin/bash

echo "#pragma once"

# app name
echo "#define APP_NAME          \"${1}\""

# 获取从git得到的commit SHA值，作为版本信息
# 输出字符串格式：（假设tag=v1.0）
# 1. 如果当前版本已经有tag，且工作区干净，则直接输出此tag名：v1.0
# 2. 如果当前版本基于tag有了6次新提交，则输出v1.0-6-g0c2b1cf
# 3. 如果本地仓库有修改，则认为是dirty的，则追加-dev，表示是开发版：v1.0-6-g0c2b1cf-dev
# 4. 如果当前版本没有tag，直接输出SHA：g0c2b1cf；若dirty同样加上dev
# 参考https://blog.csdn.net/zhangpeng_linux/article/details/85858841
git_version=unknown
which git > /dev/null 2>&1
if [ "x$?" = "x0" ]; then
	git_version=`git describe --tags --always --dirty="-dev"`
fi
echo "#define APP_BUILD_COMMIT  \"$git_version\""

# date
if [[ $git_version == *-dev ]]; then
    build_time=`date +"%Y/%m/%d %H:%M"`
else
    build_time=`git show --no-patch --no-notes --pretty='%ad' --date=format:'%Y/%m/%d %H:%M'`
fi
echo "#define APP_BUILD_TIME    \"$build_time\""

# branch
git_branch=`git rev-parse --abbrev-ref HEAD`
echo "#define APP_GIT_BRANCH    \"$git_branch\""

