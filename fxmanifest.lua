fx_version "cerulean"
lua54 "yes"

games {
    "gta5"
}

author "Walter"
description "Simple carwipe script that works with fiveguard"
version "1.0.0"

shared_scripts { "@es_extended/imports.lua", "@ox_lib/init.lua" }
server_scripts { "server.lua", "config.lua" }