Kee = {}



KeeSettings = {}
KeeSettings.LEADER_NAME = "flogzero"
KeeSettings.FEATURES = {}


local DeletePlayerMacros = function() 
	for i=120,138 do DeleteMacro(i) end
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
	if v.feature then
		print(format("Found feature %s,checking if enabled", v.feature.feature_name));
		if KeeSettings.FEATURES[v.feature.feature_name] then
			print(format("Feature %s enabled, using alternatve macro", v.feature.feature_name));
			CreateOrReplaceMacro(v.name,v.icon,v.feature.macro_string,v.macro_type)
			return
		end
	end
	CreateOrReplaceMacro(v.name,v.icon,v.macro_string,v.macro_type)
	--print(format("Loading macro:%s",v.name))
end

SLASH_KEELOAD1 = "/keeload"
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

	if msg == "warlock" then
		print("Clearing player macros and loading warlock");
		DeletePlayerMacros();
		table.foreach(Kee.Warlock.Macros, LoadMacro);
	end


	print("Loaded Macros");
end

SLASH_SETLEADER1 = "/setleader"
SlashCmdList.SETLEADER= function(msg, editBox)
	KeeSettings.LEADER_NAME=msg
end


SLASH_SETFEATURE1 = "/setfeature"
SlashCmdList.SETFEATURE= function(msg, editBox)
	print(format("Enable feature %s",msg));
	KeeSettings.FEATURES[msg] = true
end

SLASH_UNSETFEATURE1 = "/unsetfeature"
SlashCmdList.UNSETFEATURE= function(msg, editBox)
	print(format("Disable feature %s",msg));
	KeeSettings.FEATURES[msg] = false
end

SLASH_CHECKFEATURE1 = "/checkfeature"
SlashCmdList.CHECKFEATURE= function(msg, editBox)
	local fval = false;
	if KeeSettings.FEATURES[msg] then
		fval=true;
	end 
	print(format("Feature %s is set to %s",msg,tostring(fval)));
end

-- Bindings don't seem to pick up the macros from the wtf file
-- Find the macro associated with this key
--/run print(GetBindingAction("ALT-CTRL-1"))
SLASH_BINDINGSPRINT1 = "/bindingsprint"
SlashCmdList.BINDINGSPRINT = function(msg, editBox)
	for i=1,GetNumBindings() do
		print(GetBinding(i));
	end
end
