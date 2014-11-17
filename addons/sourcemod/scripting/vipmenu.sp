#include <sourcemod>

public Plugin:myinfo = {
	name = "VIP Menu"
	, author = "Yusuf Ali"
	, description = ""
	, version = "1.0.0"
	, url = "https://github.com/RyanMonkey/vipmenu"
}

public OnPluginStart(){
	RegAdminCmd( "sm_vip", vipMenu, ADMFLAG_CUSTOM1)
}

public Action:vipMenu(client, args){
	
}