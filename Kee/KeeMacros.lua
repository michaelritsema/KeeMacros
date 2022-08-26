local Kee = Kee

Kee.Account = {}
Kee.Account.Macros = {}
Kee.Priest = {}
Kee.Priest.Macros = {}
Kee.Shaman = {}
Kee.Shaman.Macros = {}
Kee.Warlock= {}
Kee.Warlock.Macros = {}
Kee.Tests= {}
Kee.Tests.Macros = {}

--CreateMacro(name, icon, macro_string, macro_type);

-- variables used 
-- LEADER_NAME: Multibox Leader, usually the human screen
-- feature name checks for the true value of a setting
local addMacro = function (macro_table,name,icon,macro_string,macro_type,feature) 
    if not feature then
        feature=false
    end
    table.insert(macro_table, 
    {
        name=name,
        icon=icon,
        macro_string=macro_string,
        macro_type=macro_type,
        feature=feature
    }
    );
end
--follow
addMacro(Kee.Account.Macros, "ALTSHIFTBACKSLASH", "INV_MISC_QUESTIONMARK",
[[
/follow {{LEADER_NAME}}
]],
nil
);

-- reload ui
addMacro(Kee.Account.Macros,
 "ALTSHIFTD",
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

  "ALTSHIFTQ",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
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

--assist leader
addMacro(Kee.Account.Macros,

 "ALTSHIFTC",
  "INV_MISC_QUESTIONMARK",

[[
#showtooltip
/assist {{LEADER_NAME}}
]],
  nil
);

addMacro(Kee.Account.Macros,
"mnt",
"INV_MISC_QUESTIONMARK",
[[
#showtooltip
/use Swift White Steed
/use Great Green Elekk
/use Swift White Mechanostrider
]],
nil
);

addMacro(Kee.Account.Macros,
"myfocus",
"INV_MISC_QUESTIONMARK",
[[
#showtooltip
/assist {{LEADER_NAME}}
/focus
/party Setting focus %f
]],
nil
);

-- Heal Leader
addMacro(Kee.Shaman.Macros,
    "healleader",
    "INV_MISC_QUESTIONMARK",
[[
/cast [target={{LEADER_NAME}}]Healing Wave
]],
    1

);

addMacro(Kee.Shaman.Macros,
    "ALTSHIFTLEFTBRACKET",
    "INV_MISC_QUESTIONMARK",
[[
/cast Lightning Shield
]],
    1

);

addMacro(Kee.Shaman.Macros,
    "ALTSHIFTRIGHTBRACKET",
    "INV_MISC_QUESTIONMARK",
[[
/cast Flametongue Weapon
]],
    1

);

addMacro(Kee.Shaman.Macros,
    "ALTSHIFTX",
    "INV_MISC_QUESTIONMARK",
[[
/cast Ghost Wolf
]],
    1

);


--Heal Target
addMacro(Kee.Shaman.Macros, "ALTSHIFTY", "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Healing Wave
]],
1
);

addMacro(Kee.Shaman.Macros, "ns heal target", "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/p Instant chain heal on %t
/cast Nature's Swiftness
/cast Chain Heal
]],
1
);

-- single spell for WOTLK
addMacro(Kee.Shaman.Macros,
    "ALTSHIFTB",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/castsequence reset=combat Searing Totem
]],
    1
);

-- single spell for WOTLK
addMacro(Kee.Shaman.Macros,
    "ALTSHIFTN",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/castsequence reset=combat Fire Nova Totem
]],
    1
);

addMacro(Kee.Shaman.Macros,
    "shield leader",
    "INV_MISC_QUESTIONMARK",
[[
/target {{LEADER_NAME}}
/cast Earth Shield
]],
    1
);

addMacro(Kee.Shaman.Macros,
    "chainhealleader",
    "INV_MISC_QUESTIONMARK",
[[
/target {{LEADER_NAME}}
/cast Chain Heal
]],
    1
);

addMacro(Kee.Shaman.Macros,
    "ALTSHIFTZ",
    "INV_MISC_QUESTIONMARK",
[[
/use Melon Juice
]],
    1
);

-- Lightning Bolt
addMacro(Kee.Shaman.Macros,
    "ALTSHIFTJ",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Lightning Bolt
]],
    1
);

--shock
addMacro(Kee.Shaman.Macros,
    "ALTSHIFTK",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Earth Shock
]],
    1
);

--flameshock
addMacro(Kee.Shaman.Macros,
    "ALTSHIFTW",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Flame Shock
]],
    1
);

--STARTATTACK
addMacro(Kee.Shaman.Macros,
    "ALTSHIFTF",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/startattack
]],
    1
);


addMacro(Kee.Warlock.Macros,
    "smite",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/castsequence reset=target Corruption,Siphon Life,Unstable Affliction,Immolate
]],
    1
);

addMacro(Kee.Warlock.Macros,
    "seduce",
    "INV_MISC_QUESTIONMARK",
[[
/target focus
/party Seducing %t
/cast Seduction
]],
    1
);


addMacro(Kee.Warlock.Macros,
    "smite",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/castsequence reset=target Corruption,Immolate
]],
    1
);

addMacro(Kee.Warlock.Macros,
    "ALTSHIFTR",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Seed of Corruption
]],
    1
);

addMacro(Kee.Warlock.Macros,
    "ALTSHIFTSEMICOLON",
    "INV_MISC_QUESTIONMARK",
[[
/cast Life Tap
]],
    1
);

addMacro(Kee.Warlock.Macros,
    "ALTSHIFTK",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/use 13
/use 14
/cast Shadow Bolt
]],
    1
);

-- currently fire damage
addMacro(Kee.Warlock.Macros,
    "death coil",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/castsequence reset=15 Corruption,Immolate, Incinerate
]],
    1
);

-- TODO: We need Curse of the Elements by highest lock only


addMacro(Kee.Warlock.Macros,
    "TT Cast",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Amplify Curse
/cast Curse of Doom
]],
    1
);

addMacro(Kee.Warlock.Macros,
    "curse",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Curse of Agony
]],
1,
{
    feature_name = "cote",
    macro_string =
[[
/assist {{LEADER_NAME}}
/cast Curse of the Elements
]]
}
);

addMacro(Kee.Warlock.Macros,
    "drain soul",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Drain Soul
]],
    1
);


addMacro(Kee.Warlock.Macros,
    "ALTSHIFTZ",
    "INV_MISC_QUESTIONMARK",
[[
/cast Fel Armor
]],
    1
);

addMacro(Kee.Tests.Macros,"A","INV_MISC_QUESTIONMARK",[[/run Fel print("A")]],1);

--lua GetBindingKey("command") SetBinding("KEY", "command") SetBindingSpell("KEY", "Spell Name") SetBindingItem("KEY", "itemname") SetBindingMacro("KEY", "macroname"|macroid)
