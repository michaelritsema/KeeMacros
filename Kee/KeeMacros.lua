local Kee = Kee

Kee.Account = {}
Kee.Account.Macros = {}
Kee.Priest = {}
Kee.Priest.Macros = {}
Kee.Shaman = {}
Kee.Shaman.Macros = {}

--CreateMacro(name, icon, macro_string, macro_type);

-- variables used 
-- LEADER_NAME: Multibox Leader, usually the human screen

local addMacro = function (macro_table,name,icon,macro_string,macro_type) 
    table.insert(macro_table, 
    {
        name=name,
        icon=icon,
        macro_string=macro_string,
        macro_type=macro_type
    }
    );
end

addMacro(Kee.Priest.Macros, "buff", "INV_MISC_QUESTIONMARK", 
[[
#showtooltip
/assist {{LEADER_NAME}}
/castsequence  Power Word: Fortitude
]],
1
);

addMacro(Kee.Priest.Macros, "cleanse", "INV_MISC_QUESTIONMARK", 
[[
#showtooltip
/assist {{LEADER_NAME}}
/cast Abolish Disease
]],
1
);

addMacro(Kee.Priest.Macros, "dispel", "INV_MISC_QUESTIONMARK", 
[[
#showtooltip
/assist {{LEADER_NAME}}
/cast Dispel Magic
]],
1
);



addMacro(Kee.Priest.Macros, "heal alt", "INV_MISC_QUESTIONMARK", 
[[
#showtooltip
/castsequence [target=player] reset=15 Power Word: Shield, Heal
]],
1
);


addMacro(Kee.Priest.Macros, "heal leader", "INV_MISC_QUESTIONMARK", 
[[
/cast [target={{LEADER_NAME}}]Heal
]],
1
);

addMacro(Kee.Shaman.Macros,
    "heal leader",
    "INV_MISC_QUESTIONMARK",
[[
/cast [target={{LEADER_NAME}}]Healing Wave
]],
    1

);

addMacro(Kee.Account.Macros, "follow", "INV_MISC_QUESTIONMARK",
[[
/follow {{LEADER_NAME}}
]],
nil
);

addMacro(Kee.Account.Macros,
 "reload ui",
   "INV_MISC_QUESTIONMARK",

[[
/reload ui
]],
nil
);

addMacro(Kee.Account.Macros,

  "petattack",
    "INV_MISC_QUESTIONMARK",
 
[[
#showtooltip
/assist {{LEADER_NAME}}
/petpassive
/petattack
]],
  nil
);

addMacro(Kee.Account.Macros,

 "petfollow",
  "INV_MISC_QUESTIONMARK",

[[
#showtooltip
/petfollow
/petpassive
]],
  nil
);

addMacro(Kee.Account.Macros,
"mnt",
"INV_MISC_QUESTIONMARK",
[[
#showtooltip
/use Swift White Steed
]],
nil
);