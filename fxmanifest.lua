fx_version 'bodacious'
games { 'gta5' }
version '1.0'
author 'Gurumi Heist'
description 'Consumables with Effects for ESX.'
lua54 'yes'

client_scripts {
    'client/*.lua'
}
shared_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
    'config.lua'
}

server_scripts {
    'server/*.lua'
}

escrow_ignore{
    'config.lua'
}