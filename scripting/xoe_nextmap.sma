#include <amxmodx> 

new xoe_nextmap_message 
new xoe_nextmap_color 
new xoe_nextmap_color_static
 

public plugin_init()
{ 
	register_plugin("[XOE] Next Map", "2.0", "atiksoftware") 
	set_task(1.0, "xoe_nextmap_timer",0,"",0,"b") 
	
	xoe_nextmap_message       = register_cvar ("xoe_nextmap_message", "+hostname+") 
	xoe_nextmap_color         = register_cvar ("xoe_nextmap_color", "200 25 25")
	
	register_cvar ("xoe_nextmap_color_static", "1")
	xoe_nextmap_color_static  =get_cvar_num("xoe_nextmap_color_static")
	
	return PLUGIN_CONTINUE 
} 

public xoe_nextmap_timer()
{ 
	new nextmap[32] 
	get_cvar_string("amx_nextmap",nextmap,31) 
	new timeleft = get_timeleft() 

	new hostname[64]
	get_cvar_string("hostname", hostname, 63) 
 
	
	new mesaj[128]
	get_pcvar_string(xoe_nextmap_message , mesaj , 127)
 
	replace_all(mesaj , 127 , "+hostname+" , hostname )
	
	
	new currentMap[64]
	get_mapname(currentMap,63);
	strtolower(currentMap)
 
	//new iMode = get_cvar_num("xoe_nextmap_color_static")
	new iRed,iGreen,iBlue
	
	if(xoe_nextmap_color_static){
		new cR[4] , cG[4] , cB[4]
		new colors[32]
		get_pcvar_string(xoe_nextmap_color, colors, 31)
		parse(colors ,     cR ,charsmax(cR),      cG ,charsmax(cG),      cB ,charsmax(cB))
		
		iRed =   str_to_num(cR)
		iGreen = str_to_num(cG)
		iBlue =  str_to_num(cB)
		
	}else{
		iRed =   random_num(0,255)
		iGreen = random_num(0,255)
		iBlue =  random_num(0,255)	
	}
	
	set_hudmessage(iRed, iGreen, iBlue,   -1.0, 0.02,  0,   2.0,   2.0,      0.1, 0.1, 1)
	show_hudmessage(0, "%s^nHarita:%s | Sure:%d:%02d | Sonraki: %s", mesaj, currentMap, timeleft / 60, timeleft % 60, nextmap) 
 

	return PLUGIN_CONTINUE 
} 
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang1055\\ f0\\ fs16 \n\\ par }
*/
