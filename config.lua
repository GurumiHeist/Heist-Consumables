Config = {}

Config.MythicNotify = false

Config.Items = { 
    --[[
    ["testitem"] = {
        name = "testitem",
        label = "testitem",
        hp = 100,
        armour = 100,
        hunger = 100000,
        thirst = 100000,
        removestress = false,
        addstress = false,
        drunk = false,
        perks = {
            sprintmultiplier = true,
            stamina = true,
            swimmultiplier = true,
            meleemultiplier = true,
            adrenaline = true,
            perk_duration = 30
        },
        anim = {
            animatdict = 'mp_player_intdrink',
            animation = 'loop_bottle',
            prop_name = 'prop_ld_flow_bottle',
            bones = 18905,
            prop_rotate = vector3(260.0, 0.0, 0.0)
        }
    },
    ]]

    ["mcchicken"] = {
        name = "mcchicken",
        label = "Mc Chicken",
        hunger = 100000,
        removestress = true
    },

    ["mcveggie"] = {
        name = "mcveggie",
        label = "Mc Veggie",
        hunger = 100000,
        removestress = true
    },

    ["mcflurry"] = {
        name = "mcflurry",
        label = "Mc Flurry",
        thirst = 100000,
        removestress = true,
        anim = {
            animatdict = 'mp_player_inteat@burger',
            animation = 'mp_player_int_eat_burger_fp',
            prop_name = 'prop_ld_flow_bottle',
            bones = 18905,
            prop_rotate = vector3(260.0, 0.0, 0.0)
        }
    },

    ["painkillers"] = {
        name = "painkillers",
        label = "Pain Killers",
        hp = 30,
        perks = {
            meleemultiplier = true,
            perk_duration = 30
        }
    },

    ["adrenaline"] = {
        name = "adrenaline",
        label = "Adrenaline",
        hp = 30,
        removestress = true,
        perks = {
            adrenaline = true,
            perk_duration = 30
        }
    },

    ["energypills"] = {
        name = "energypills",
        label = "Energy Pills",
        hp = 30,
        removestress = true,
        perks = {
            sprintmultiplier = true,
            perk_duration = 30
        }
    },

    ["energydrink"] = {
        name = "energydrink",
        label = "Energy Drink",
        hp = 30,
        removestress = true,
        perks = {
            sprintmultiplier = true,
            stamina = true,
            perk_duration = 30
        }
    }


}



