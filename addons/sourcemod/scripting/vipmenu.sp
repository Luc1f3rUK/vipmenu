#include <sourcemod>
#include <updater>

#define UPDATE_URL "https://raw.githubusercontent.com/RyanMonkey/vipmenu/master/addons/sourcemod/updatefile.txt"

new Handle:hMenu

public Plugin:myinfo = {
	name = "VIP Menu"
	, author = "Yusuf Ali"
	, description = ""
	, version = "1.0.0"
	, url = "https://github.com/RyanMonkey/vipmenu"
}

public OnPluginStart(){
	/* add auto updater url */
	if( LibraryExists("updater") ){
		Updater_AddPlugin( UPDATE_URL )
	}

	/*
		Build menu for VIPS
		because this menu should not change 
		(same for all vips)
		i do not close the handle
		if this is not the case in future, this will 
		need to be updated
	*/
	buildVIP_menu();

	/* 
		registers command for vip menu 
		custom1 is flag o
		see admin.inc for more flags
	*/
	RegAdminCmd( "sm_vip", vipMenu, ADMFLAG_CUSTOM1 )
}
/* auto update url stuff */
public OnLibraryAdded( const String:name[] ){
	if(		StrEqual( name,"updater" )	){
		Updater_AddPlugin( UPDATE_URL )
	}
}
public Updater_OnPluginUpdated(){
	/* reloads plugin on update */
	ReloadPlugin()
}




public Action:vipMenu(client, args){
	DisplayMenu( hMenu, client, 20 )

	return Plugin_Handled;
}


/* method builds the VIP menu */
buildVIP_menu(){
	hMenu = CreateMenu(vipMenHandle, MENU_ACTIONS_ALL)
	AddMenuItem( hMenu, "vote_kick", "Vote Kick" )
	/*
		add rest of vote items....
	*/
	AddMenuItem( hMenu, "swap", "Change Team" )
	AddMenuItem( hMenu, "tp", "Third Person View Point" )
	AddMenuItem( hMenu, "fp", "First Person View Point" )
	AddMenuItem( hMenu, "help", "Call For Help" )
	AddMenuItem( hMenu, "unusual", "Add Unusual Effects" )
	SetMenuExitButton( hMenu, true )
}

/* triggered when item in vip menu is selected */
public vipMenHandle(Handle:menu, MenuAction:action, param1, param2 ){

}