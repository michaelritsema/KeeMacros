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
SLASH_KEEBINDINGS1 = "/keebindings"
SlashCmdList.KEEBINDINGS=function(msg, editBox)
	print("Updating Kee keybindings");
	SetBinding("ALT-CTRL-A", "MACRO petattack");
	SetBinding("ALT-CTRL-B", "MACRO totemset1");
	SetBinding("ALT-CTRL-C", "MACRO ALTCTRLC");
	SetBinding("ALT-CTRL-D", "MACRO petfollow");
	SetBinding("ALT-CTRL-E", "MACRO ALTCTRLE");
	SetBinding("ALT-CTRL-F", "MACRO ALTCTRLF");
	SetBinding("ALT-CTRL-G", "MACRO ALTCTRLG");
	SetBinding("ALT-CTRL-H", "MACRO ALTCTRLH");
	SetBinding("ALT-CTRL-I", "MACRO ALTCTRLI");
	SetBinding("ALT-CTRL-J", "MACRO ALTCTRLJ");
	SetBinding("ALT-CTRL-K", "MACRO shadowbolt");
	SetBinding("ALT-CTRL-L", "MACRO ALTCTRLL");
	SetBinding("ALT-CTRL-M", "MACRO ALTCTRLM");
	SetBinding("ALT-CTRL-N", "MACRO ALTCTRLN");
	SetBinding("ALT-CTRL-O", "MACRO ALTCTRLO");
	SetBinding("ALT-CTRL-P", "MACRO ALTCTRLP");
	SetBinding("ALT-CTRL-Q", "MACRO ALTCTRLQ");
	SetBinding("ALT-CTRL-R", "MACRO seed");
	SetBinding("ALT-CTRL-S", "MACRO ALTCTRLS");
	SetBinding("ALT-CTRL-T", "MACRO healleader");
	SetBinding("ALT-CTRL-U", "MACRO healtarget");
	SetBinding("ALT-CTRL-V", "MACRO ALTCTRLV");
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
	SetBinding("ALT-CTRL-SHIFT-C", "MACRO ALTCTRLSHIFTC");
	SetBinding("ALT-CTRL-SHIFT-D", "MACRO ALTCTRLSHIFTD");
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
	SetBinding("ALT-CTRL-SHIFT-R", "MACRO ALTCTRLSHIFTR");
	SetBinding("ALT-CTRL-SHIFT-S", "MACRO ALTCTRLSHIFTS");
	SetBinding("ALT-CTRL-SHIFT-T", "MACRO chainhealleader");
	SetBinding("ALT-CTRL-SHIFT-U", "MACRO chainhealtarget");
	SetBinding("ALT-CTRL-SHIFT-V", "MACRO ALTCTRLSHIFTV");
	SetBinding("ALT-CTRL-SHIFT-W", "MACRO ALTCTRLSHIFTW");
	SetBinding("ALT-CTRL-SHIFT-X", "MACRO ALTCTRLSHIFTX");
	SetBinding("ALT-CTRL-SHIFT-Y", "MACRO chainhealtarget");
	SetBinding("ALT-CTRL-SHIFT-Z", "MACRO ALTCTRLSHIFTZ");
	print("Updated Kee keybindings");
end