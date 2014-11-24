#include <sourcemod>
#include <updater>
#include <tf2_stocks>


#define UPDATE_URL "https://raw.githubusercontent.com/RyanMonkey/vipmenu/master/addons/sourcemod/updatefile.txt"

new Handle:hMenu

public Plugin:myinfo = {
	name = "VIP Menu"
	, author = "Yusuf Ali"
	, description = ""
	, version = "0.0.0"
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
public vipMenHandle(Handle:menu, MenuAction:action, client, param2 ){
	switch( action ){
		case MenuAction_Select:{
			decl String:info[32];
			GetMenuItem( menu, param2, info, sizeof(info))

			if( StrEqual(info,"swap") ){
				switch( GetClientTeam(client) ){
					case ( _:TFTeam_Red ): {
						FakeClientCommand( client, "sm_blue" )
					}
					case ( _:TFTeam_Blue ): {
						FakeClientCommand( client, "sm_red" )	
					}
				}
			}
			else if( StrEqual(info,"tp") ){
				FakeClientCommand( client, "sm_thirdperson" )
			}
			else if( StrEqual(info,"fp") ){
				FakeClientCommand( client, "sm_firstperson" )
			}
			else if( StrEqual(info,"help") ){
				FakeClientCommand( client, "sm_callforhelp" )
			}
			else if( StrEqual(info,"unusual") ){
				FakeClientCommand( client, "sm_unusual" )
			}

			/* stuff for vote_kick and what not */
			else if( StrEqual(info,"vote_kick") ){
			}
		}
	}

	return 0;
}