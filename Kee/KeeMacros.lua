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
addMacro(Kee.Account.Macros, "followleader", "INV_MISC_QUESTIONMARK",
[[
/follow {{LEADER_NAME}}
]],
nil
);

-- reload ui
addMacro(Kee.Account.Macros,
 "reloadui",
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

--assist leader
addMacro(Kee.Account.Macros,
 "assistleader",
  "INV_MISC_QUESTIONMARK",

[[
#showtooltip
/assist {{LEADER_NAME}}
]],
  nil
);

addMacro(Kee.Account.Macros,
"mount",
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
"focusleaderstarget",
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
    "armor",
    "INV_MISC_QUESTIONMARK",
[[
/cast Lightning Shield
]],
    1
);

addMacro(Kee.Shaman.Macros,
    "buffweapon",
    "INV_MISC_QUESTIONMARK",
[[
/cast Flametongue Weapon
]],
    1
);

addMacro(Kee.Shaman.Macros, "healtarget", "INV_MISC_QUESTIONMARK",
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
    "totemset1",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/castsequence reset=combat Wrath of Air Totem,Strength of Earth Totem, Healing Stream Totem,Searing Totem
]],
    1
);

-- single spell for WOTLK
addMacro(Kee.Shaman.Macros,
    "totemset2",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/castsequence reset=10s Tremor Totem, Grounding Totem, Healing Stream Totem, Searing Totem
]],
    1
);

addMacro(Kee.Shaman.Macros,
    "shieldleader",
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
    "eatdrink",
    "INV_MISC_QUESTIONMARK",
[[
/use Melon Juice
]],
    1
);

-- Lightning Bolt
addMacro(Kee.Shaman.Macros,
    "lightningbolt",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Lightning Bolt
]],
    1
);

addMacro(Kee.Shaman.Macros,
    "earthshock",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Earth Shock
]],
    1
);

addMacro(Kee.Shaman.Macros,
    "flameshock",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Flame Shock
]],
    1
);

addMacro(Kee.Shaman.Macros,
    "startattacking",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/startattack
]],
    1
);

addMacro(Kee.Warlock.Macros,
    "singletarget",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/castsequence reset=target Corruption,Immolate,Shadow Bolt
]],
    1
);

addMacro(Kee.Warlock.Macros,
    "seed",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Seed of Corruption
]],
    1
);

addMacro(Kee.Warlock.Macros,
    "lifetap",
    "INV_MISC_QUESTIONMARK",
[[
/cast Life Tap
]],
    1
);

addMacro(Kee.Warlock.Macros,
    "shadowbolt",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Shadow Bolt
]],
    1
);

addMacro(Kee.Warlock.Macros,
    "curseofagony",
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
    "drainsoul",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Drain Soul
]],
    1
);


addMacro(Kee.Warlock.Macros,
    "armor",
    "INV_MISC_QUESTIONMARK",
[[
/cast Fel Armor
]],
    1
);

--addMacro(Kee.Tests.Macros,"A","INV_MISC_QUESTIONMARK",[[/run Fel print("A")]],1);
--lua GetBindingKey("command") SetBinding("KEY", "command") SetBindingSpell("KEY", "Spell Name") SetBindingItem("KEY", "itemname") SetBindingMacro("KEY", "macroname"|macroid)
