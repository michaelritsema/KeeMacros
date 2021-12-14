local Kee = Kee

Kee.KeeMacros = {}

--CreateMacro(name, icon, macro_string, macro_type);

-- variables used 
-- LEADER_NAME: Multibox Leader, usually the human screen


Kee.KeeMacros[0] =  { 
name = "buff",
icon = "INV_MISC_QUESTIONMARK",
macro_string = 
[[
#showtooltip
/assist {{LEADER_NAME}}
/castsequence  Power Word: Fortitude
]],
macro_type=1
};

Kee.KeeMacros[1] =  { 
    name = "cleanse",
    icon = "INV_MISC_QUESTIONMARK",
    macro_string = 
[[
#showtooltip
/assist {{LEADER_NAME}}
/cast Abolish Disease
 ]],
    macro_type=1
};


Kee.KeeMacros[2] =  { 
    name = "dispel",
    icon = "INV_MISC_QUESTIONMARK",
    macro_string = 
[[
#showtooltip
/assist {{LEADER_NAME}}
/cast Dispel Magic
]],
    macro_type=1
};


Kee.KeeMacros[3] =  { 
    name = "heal alt",
    icon = "INV_MISC_QUESTIONMARK",
    macro_string = 
[[
#showtooltip
/castsequence [target=player] reset=15 Power Word: Shield, Heal
]],
    macro_type=1
};

Kee.KeeMacros[4] =  { 
    name = "heal leader",
    icon = "INV_MISC_QUESTIONMARK",
    macro_string = 
[[
/cast [target={{LEADER_NAME}}]Heal
]],
    macro_type=1
};