Kee = {}

SLASH_KEELOAD1 = "/keeload"
SLASH_SETLEADER1 = "/setleader"


KeeSettings = {}
KeeSettings.LEADER_NAME = "flogzero"



local DeletePlayerMacros = function() 
	for i=121,138 do DeleteMacro(i) end
end

local DeleteAccountMacros = function() 
	--p,a = GetNumMacros();
	--print(format("p macros: %i, a macros: %i",p,a));
	for i=1,120 do DeleteMacro(i) end
end

local DeleteAllMacros = function() 
	DeleteAccountMacros()
	DeletePlayerMacros()
end



local CreateOrReplaceMacro = function(name,icon,macro_string,macro_type) 
	print(format("Loading macro  %s", name));
	macro_string = gsub(macro_string, "{{LEADER_NAME}}", KeeSettings.LEADER_NAME)
	DeleteMacro(name);
	CreateMacro(name, icon, macro_string, macro_type);
end

local LoadMacro = function(k,v)
	CreateOrReplaceMacro(v.name,v.icon,v.macro_string,v.macro_type)
	print(format("Loading macro:%s",v.name))
end

SlashCmdList.KEELOAD= function(msg, editBox)
	if msg == "priest" then
		print("Clearing player macros and loading priest.");
		DeletePlayerMacros();
		table.foreach(Kee.Priest.Macros, LoadMacro);
	end

	if msg == "account" then
		print("Clearing account macros and loading account");
		DeleteAccountMacros();
		table.foreach(Kee.Account.Macros, LoadMacro);
	end

	if msg == "shaman" then
		print("Clearing player macros and loading shaman");
		DeletePlayerMacros();
		table.foreach(Kee.Shaman.Macros, LoadMacro);
	end


	print("Loaded Macros");
end

SlashCmdList.SETLEADER= function(msg, editBox)
	KeeSettings.LEADER_NAME=msg
end