local Kee = Kee

Kee.Account = {}
Kee.Account.Macros = {}
Kee.Priest = {}
Kee.Priest.Macros = {}
Kee.Shaman = {}
Kee.Shaman.Macros = {}
Kee.Warlock= {}
Kee.Warlock.Macros = {}

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

addMacro(Kee.Shaman.Macros,
    "armor",
    "INV_MISC_QUESTIONMARK",
[[
/cast Water Shield
]],
    1

);

addMacro(Kee.Shaman.Macros, "heal target", "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Chain Heal
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

addMacro(Kee.Shaman.Macros,
    "smite",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/castsequence reset=60 Tremor Totem, Windfury Totem, Mana Spring Totem,Searing Totem
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
    "flash",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Earth Shock(Rank 1)
]],
    1
);


addMacro(Kee.Shaman.Macros,
    "shield target",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Earth Shield
]],
    1
);

addMacro(Kee.Shaman.Macros,
    "shadowbolt",
    "INV_MISC_QUESTIONMARK",
[[
/use 13
/use 14
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
/castsequence reset=target Corruption,Unstable Affliction,Immolate,Siphon Life
]],
    1
);

addMacro(Kee.Warlock.Macros,
    "seed",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/castsequence reset=target Corruption,Unstable Affliction,Immolate,Siphon Life
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
/use 13
/use 14
/cast Shadow Bolt
]],
    1
);

addMacro(Kee.Warlock.Macros,
    "shadowburn",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Shadowburn
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
    "armor",
    "INV_MISC_QUESTIONMARK",
[[
/cast Fel Armor
]],
    1
);

-- TODO: spellsequence or code to round robin felguard charge/petattack ?