#include <sourcemod>
#include <updater>

#define UPDATE_URL "http://yusufali.ca/plugins/vipmenu/master/"

public Plugin:myinfo = {
	name = "VIP Menu"
	, author = "Yusuf Ali"
	, description = ""
	, version = "1.0.0"
	, url = "https://github.com/RyanMonkey/vipmenu"
}

public OnPluginStart(){
	if( LibraryExists("updater") ){
		Updater_AddPlugin( UPDATE_URL )
	}

	RegAdminCmd( "sm_vip", vipMenu, ADMFLAG_CUSTOM1)
}
public OnLibraryAdded( const String:name[] ){
	if(		StrEqual( name,"updater" )	){
		Updater_AddPlugin( UPDATE_URL )
	}
}
public Updater_OnPluginUpdated(){
	ReloadPlugin()
}

public Action:vipMenu(client, args){

}