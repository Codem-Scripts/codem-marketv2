fx_version 'cerulean'
game 'gta5'
author 'Hyuga#1000'
description 'Codem-mMarket'
ui_page {
	'html/ui.html',
}

files {
	'html/style/*.css',
	'html/script/*.js',
	'html/*.html',
	'html/images/*.png',
	'html/images/itemimages/*.png',
	'html/images/*.svg',
	'html/fonts/*.otf',

}

shared_script{
	'config.lua',
}



escrow_ignore {
	'config.lua',
	'GetFrameworkObject.lua',
	'server/*.lua',
	
}

client_scripts {
	'GetFrameworkObject.lua',
	'client/*.lua',
}
server_scripts {
	'server/*.lua',
	'GetFrameworkObject.lua',
}

lua54 'yes'
