Kee = {}

SLASH_KEELOAD1 = "/keeload"
SLASH_SETLEADER1 = "/setleader"


KeeSettings = {}
KeeSettings.LEADER_NAME = "flogzero"


local CreateOrReplaceMacro = function(name,icon,macro_string,macro_type) 
	--print(format("Loading macro  %s", name));
	macro_string = gsub(macro_string, "{{LEADER_NAME}}", KeeSettings.LEADER_NAME)
	DeleteMacro(name);
	CreateMacro(name, icon, macro_string, macro_type);
end

local LoadMacro = function(k,v)
	CreateOrReplaceMacro(v.name,v.icon,v.macro_string,v.macro_type)
	print(format("Loading macro:%s",v.name))
end

SlashCmdList.KEELOAD= function(msg, editBox)

	print("Loading macros");
	table.foreach(Kee.KeeMacros, LoadMacro);
	--local macroId = CreateOrReplaceMacro("MyMacro", "INV_MISC_QUESTIONMARK", "/cast Demon Armor;", nil);

	print("Loaded Macros");
end

SlashCmdList.SETLEADER= function(msg, editBox)
	KeeSettings.LEADER_NAME=msg
end