Kee = {}

--https://wowpedia.fandom.com/wiki/World_of_Warcraft_API

KeeSettings = {}
KeeSettings.LEADER_NAME = "flogzero"
KeeSettings.FEATURES = {}


Kee.OnEvent = function(self, event, ...)
	local arg1 = ...;
	--print(arg1);
	--ADDON_LOADED" --and arg1=="Kee"
	if event == "PLAYER_ENTERING_WORLD"  then
		print("Kee Addon Loaded");
		local class = UnitClass("player");
		print(format("Loading settings for account"));
		Kee.loadMacros("Account");
		print(format("Loading settings for class: %s", class));
		Kee.loadMacros(class);
		Kee.ReloadBindings();
	end
end

Kee.frame = CreateFrame("Frame", "KeeFrame");
Kee.frame:RegisterEvent("ADDON_LOADED");
Kee.frame:RegisterEvent("PLAYER_ENTERING_WORLD");
Kee.frame:SetScript("OnEvent", Kee.OnEvent);

Kee.DeletePlayerMacros = function() 
	a,p = GetNumMacros();
	print(format("Deleting %i player macros",p));
	for i=121,p+121-1 do
		name,icon,body = GetMacroInfo(121);  
		print(format("Deleting player macro: %s", name));
		DeleteMacro(121);  
	end
end

Kee.DeleteAccountMacros = function() 
	a,p = GetNumMacros();
	print(format("Deleting %i account macros",a));
	for i=0,a-1 do
		name,icon,body = GetMacroInfo(1);  
		print(format("Deleting account macro: %s", name));
		DeleteMacro(1);   
	end
end

-- id's change after each delete so we delete from front
-- account macro starts at 0
-- player macros start at 121
--
Kee.DeleteAllMacros = function() 
	a,p = GetNumMacros();
	print(format("p macros: %i, a macros: %i",p,a));
	Kee.DeleteAccountMacros();
	Kee.DeletePlayerMacros();
	a,p = GetNumMacros();
	print(format("p macros: %i, a macros: %i",p,a));
end

Kee.CreateOrReplaceMacro = function(name,icon,macro_string,macro_type) 
	print(format("Creating macro  %s", name));
	macro_string = gsub(macro_string, "{{LEADER_NAME}}", KeeSettings.LEADER_NAME)
	DeleteMacro(name);
	CreateMacro(name, icon, macro_string, macro_type);
end

Kee.LoadMacro = function(k,v)
	if v.feature then
		print(format("Found feature %s,checking if enabled", v.feature.feature_name));
		if KeeSettings.FEATURES[v.feature.feature_name] then
			print(format("Feature %s enabled, using alternatve macro", v.feature.feature_name));
			CreateOrReplaceMacro(v.name,v.icon,v.feature.macro_string,v.macro_type)
			return
		end
	end
	Kee.CreateOrReplaceMacro(v.name,v.icon,v.macro_string,v.macro_type)
	--print(format("Loading macro:%s",v.name))
end

SLASH_DELETEMACROS1 = "/kd"
SlashCmdList.DELETEMACROS= function(msg, editBox)
	print("deleting all macros");
	Kee.DeleteAllMacros();
end

Kee.loadMacros = function(msg) 
	if msg == "p" or msg == "Priest" then
		print("Clearing player macros and loading priest.");
		--Kee.DeletePlayerMacros();
		table.foreach(Kee.Priest.Macros, Kee.LoadMacro);
	end

	if msg == "a" or msg =="Account" then
		print("Clearing account macros and loading account");
		--Kee.DeleteAccountMacros();
		table.foreach(Kee.Account.Macros, Kee.LoadMacro);
	end

	if msg == "s" or msg =="Shaman" then
		print("Clearing player macros and loading shaman");
		--Kee.DeletePlayerMacros();
		table.foreach(Kee.Shaman.Macros, Kee.LoadMacro);
	end

	if msg == "w" or msg =="Warlock" then
		print("Clearing player macros and loading warlock");
		--Kee.DeletePlayerMacros();
		table.foreach(Kee.Warlock.Macros, Kee.LoadMacro);
	end
	print(format("Loaded Macros for %s",msg));
end

SLASH_KEELOAD1 = "/kl"
SlashCmdList.KEELOAD= function(msg, editBox)
	Kee.loadMacros(msg)
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
	print(format("Feature %s is set to %s.",msg,tostring(fval)));
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
-- https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=f5d64f7f8f69c06ce0a50cb2ad2dd789
-- We could have separate sets
SLASH_KEEBINDINGS1 = "/kb"
SlashCmdList.KEEBINDINGS=function(msg, editBox)
	Kee.ReloadBindings();
end


Kee.ReloadBindings = function() 
	print("Updated Kee keybindings");
	LoadBindings(0);
	SetBinding("G", "INTERACTTARGET");
	SetBinding("BACKSPACE", "TOGGLEAUTORUN");
	SetBinding("TOGGLEMAINMENU", "ESC");
	SetBinding("ALT-CTRL-A", "MACRO petattack");
	SetBinding("ALT-CTRL-B", "MACRO totems1");
	SetBinding("ALT-CTRL-C", "MACRO ALTCTRLC");
	SetBinding("ALT-CTRL-D", "MACRO petfollow");
	SetBinding("ALT-CTRL-E", "MACRO ALTCTRLE");
	SetBinding("ALT-CTRL-F", "MACRO ALTCTRLF");
	SetBinding("ALT-CTRL-G", "MACRO ALTCTRLG");
	SetBinding("ALT-CTRL-H", "MACRO ALTCTRLH");
	SetBinding("ALT-CTRL-I", "MACRO ALTCTRLI");
	SetBinding("ALT-CTRL-J", "MACRO ALTCTRLJ");
	SetBinding("ALT-CTRL-K", "MACRO singletarget");
	SetBinding("ALT-CTRL-L", "MACRO ALTCTRLL");
	--SetBinding("ALT-CTRL-M", "MACRO ALTCTRLM"); map
	SetBinding("ALT-CTRL-N", "MACRO ALTCTRLN");
	SetBinding("ALT-CTRL-O", "MACRO ALTCTRLO");
	SetBinding("ALT-CTRL-P", "MACRO drainsoul");
	SetBinding("ALT-CTRL-Q", "MACRO assistleader");
	SetBinding("ALT-CTRL-R", "MACRO seed");
	SetBinding("ALT-CTRL-S", "MACRO ALTCTRLS");
	SetBinding("ALT-CTRL-T", "MACRO chainhealleader");
	SetBinding("ALT-CTRL-U", "MACRO shieldleader");
	--SetBinding("ALT-CTRL-V", "MACRO ALTCTRLV");
	SetBinding("ALT-CTRL-W", "MACRO ALTCTRLW");
	SetBinding("ALT-CTRL-X", "MACRO ALTCTRLX");
	SetBinding("ALT-CTRL-Y", "MACRO healtarget");
	SetBinding("ALT-CTRL-Z", "MACRO ALTCTRLZ");
	
	SetBinding("ALT-CTRL-\\", "MACRO followleader");
	SetBinding("ALT-CTRL-;", "MACRO lifetap");
	--SetBinding("ALT-CTRL-"", "MACRO ");
	--SetBinding("ALT-CTRL-[", "MACRO");
	--SetBinding("ALT-CTRL-]", "MACRO ");
	--SetBinding("ALT-CTRL-,", "MACRO");
	--SetBinding("ALT-CTRL-/", "MACRO ");
	--SetBinding("ALT-CTRL-.", "MACRO ");

	SetBinding("ALT-CTRL-SHIFT-A", "MACRO ALTCTRLSHIFTA");
	SetBinding("ALT-CTRL-SHIFT-B", "MACRO ALTCTRLSHIFTB");
	SetBinding("ALT-CTRL-SHIFT-C", "MACRO mount");
	SetBinding("ALT-CTRL-SHIFT-D", "MACRO curseofagony");
	SetBinding("ALT-CTRL-SHIFT-E", "MACRO ALTCTRLSHIFTE");
	SetBinding("ALT-CTRL-SHIFT-F", "MACRO ALTCTRLSHIFTF");
	SetBinding("ALT-CTRL-SHIFT-G", "MACRO ALTCTRLSHIFTG");
	SetBinding("ALT-CTRL-SHIFT-H", "MACRO ALTCTRLSHIFTH");
	SetBinding("ALT-CTRL-SHIFT-I", "MACRO ALTCTRLSHIFTI");
	SetBinding("ALT-CTRL-SHIFT-J", "MACRO ALTCTRLSHIFTJ");
	SetBinding("ALT-CTRL-SHIFT-K", "MACRO ALTCTRLSHIFTK");
	SetBinding("ALT-CTRL-SHIFT-L", "MACRO ALTCTRLSHIFTL");
	SetBinding("ALT-CTRL-SHIFT-M", "MACRO ALTCTRLSHIFTM");
	SetBinding("ALT-CTRL-SHIFT-N", "MACRO ALTCTRLSHIFTN");
	SetBinding("ALT-CTRL-SHIFT-O", "MACRO ALTCTRLSHIFTO");
	SetBinding("ALT-CTRL-SHIFT-P", "MACRO ALTCTRLSHIFTP");
	SetBinding("ALT-CTRL-SHIFT-Q", "MACRO ALTCTRLSHIFTQ");
	SetBinding("ALT-CTRL-SHIFT-R", "MACRO burst");
	SetBinding("ALT-CTRL-SHIFT-S", "MACRO ALTCTRLSHIFTS");
	SetBinding("ALT-CTRL-SHIFT-T", "MACRO chainhealleader");
	SetBinding("ALT-CTRL-SHIFT-U", "MACRO chainhealtarget");
	SetBinding("ALT-CTRL-SHIFT-V", "MACRO ALTCTRLSHIFTV");
	SetBinding("ALT-CTRL-SHIFT-W", "MACRO singletarget");
	SetBinding("ALT-CTRL-SHIFT-X", "MACRO buffweapon");
	SetBinding("ALT-CTRL-SHIFT-Y", "MACRO chainhealtarget");
	SetBinding("ALT-CTRL-SHIFT-Z", "MACRO armor");
	SetBinding("ALT-CTRL-SHIFT-\\", "MACRO followtarget");
	SetBinding("ALT-CTRL-SHIFT-/", "MACRO keeinit");
	SetBinding("ALT-CTRL-SHIFT-.", "MACRO reloadui");
	SaveBindings(1);
end