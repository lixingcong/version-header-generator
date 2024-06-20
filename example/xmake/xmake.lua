add_rules("mode.debug", "mode.release")

set_version("1.5.1")

includes("../../xmake/version-header-generator.lua")

target("xmake-demo")
    set_kind("binary")
    add_files("*.cpp")
