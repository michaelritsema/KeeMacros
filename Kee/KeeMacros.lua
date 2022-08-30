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

addMacro(Kee.Account.Macros, "followtarget", "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/follow
]],
nil
);

addMacro(Kee.Shaman.Macros, "keeinit", "INV_MISC_QUESTIONMARK",
[[
/keeload account
/keeload shaman
]],
nil
);

addMacro(Kee.Warlock.Macros, "keeinit", "INV_MISC_QUESTIONMARK",
[[
/keeload account
/keeload warlock
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

addMacro(Kee.Warlock.Macros,
"petattack",
"INV_MISC_QUESTIONMARK",
 
[[
/assist {{LEADER_NAME}}
/cast Demonic Empowerment
/petpassive
/petattack
]],
  nil
);

addMacro(Kee.Warlock.Macros,

 "petfollow",
  "INV_MISC_QUESTIONMARK",

[[
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
/cast Earthliving Weapon
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
    "totems1",
    "INV_MISC_QUESTIONMARK",
[[
/call of the Spirits
]],
    1
);


addMacro(Kee.Shaman.Macros,
    "totems2",
    "INV_MISC_QUESTIONMARK",
[[
/cast Call of the Ancestors
]],
    1
);

addMacro(Kee.Shaman.Macros,
    "totems3",
    "INV_MISC_QUESTIONMARK",
[[
/cast Call of the Elements
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
/cast Tidal Force
/castsequence reset=6 Riptide,Healing Wave, Chain Heal
]],
    1
);

addMacro(Kee.Shaman.Macros,
    "healtarget",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/castsequence reset=target/5 Chain Heal,Lesser Healing Wave
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
    "windshear",
    "INV_MISC_QUESTIONMARK",
[[
/assist {{LEADER_NAME}}
/cast Wind Shear
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
/castsequence reset=24/target Corruption,Immolate,Incinerate,Incinerate,Incinerate,Incinerate,Incinerate
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
    "createspellstone",
    "INV_MISC_QUESTIONMARK",
[[
/cast Create Spellstone
]],
    1
);

addMacro(Kee.Warlock.Macros,
    "usespellstone",
    "INV_MISC_QUESTIONMARK",
[[
/use Master Spellstone
/use 16
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

addMacro(Kee.Warlock.Macros,
    "meta",
    "INV_MISC_QUESTIONMARK",
[[
    /use 13
    /use 14
    /cast !Metamorphosis
    /cast Immolation Aura(Demon)
    /cast Shadow Cleave(Demon)
    /cqs
]],
    1
);

addMacro(Kee.Warlock.Macros,
    "felguard",
    "INV_MISC_QUESTIONMARK",
[[
    /cast Fel Domination
    /cast Summon Felguard
    /cqs
]],
    1
);





--addMacro(Kee.Tests.Macros,"A","INV_MISC_QUESTIONMARK",[[/run Fel print("A")]],1);
--lua GetBindingKey("command") SetBinding("KEY", "command") SetBindingSpell("KEY", "Spell Name") SetBindingItem("KEY", "itemname") SetBindingMacro("KEY", "macroname"|macroid)
