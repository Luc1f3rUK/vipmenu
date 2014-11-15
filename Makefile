CC = ./addons/sourcemod/scripting/spcomp
INC = addons/sourcemod/scripting/include

compile: addons/sourcemod/scripting/vipmenu.sp
	$(CC) addons/sourcemod/scripting/vipmenu.sp -oaddons/sourcemod/plugins/vipmenu.smx -i$(INC)