local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)

local schem_path = modpath.."/schems/"

-------------------------------------

local make_schematic_entry = smgv.schematic_entry_maker(schem_path)
local schematic_table = {
    make_schematic_entry("sandcity_tiny_1_1_270",           1),
    make_schematic_entry("sandcity_tiny_2_1_270",           1),
    make_schematic_entry("sandcity_tiny_3_1_270",           1),
    make_schematic_entry("sandcity_tiny_4_1_270",           1),
    make_schematic_entry("sandcity_small_1_1_270",          1),
    make_schematic_entry("sandcity_small_2_1_270",          1),
    make_schematic_entry("sandcity_small_3_1_270",          1),
    make_schematic_entry("sandcity_small_4_1_270",          1),
    make_schematic_entry("sandcity_small_5_1_270",          1),
    make_schematic_entry("sandcity_meeting_small_1_1_270",  1),
    make_schematic_entry("sandcity_ap_tower_1_1_270",       1),
    make_schematic_entry("sandcity_ap_tower_2_1_270",       1),
    make_schematic_entry("sandcity_ap_tower_3_1_270",       1),
    make_schematic_entry("sandcity_ap_tower_4_1_270",       1),
    make_schematic_entry("sandcity_ap_tower_5_1_270",       1),
    make_schematic_entry("sandcity_ap_tower_6_1_270",       1),
    make_schematic_entry("sandcity_ap_tower_7_1_270",       1),
    make_schematic_entry("sandcity_ap_mixed_1_1_270",       1),
    make_schematic_entry("sandcity_ap_mixed_2_1_270",       1),
    make_schematic_entry("sandcity_ap_tiny_3_1_270",        1),
    make_schematic_entry("sandcity_ap_tiny_3b_1_270",       1),
    make_schematic_entry("sandcity_small_2_1_270",          1),
    make_schematic_entry("sandcity_small_3_1_270",          1),
}

local replacements = {
    ["default:wood"] = {
        'default:wood', 'default:acacia_wood',
    },
    ["default:sandstonebrick"] = {
        'default:sandstonebrick', 'default:sandstonebrick',
        'default:clay', 'default:desert_stonebrick', 'default:desert_stone',
        'default:stonebrick', 'default:obsidianbrick',
    },
}

if minetest.get_modpath('cottages') then
    replacements["default:sandstone"] = {
        'default:sandstone', 'default:clay', 'cottages:loam'
    }
end

smgv.make_settlement(
    "mgv_sandcity", "town",
    replacements,
    schematic_table,
    {
        building_count={3,30},
        path_material="default:desert_sand",
        surface_materials={
            "default:sand",
            "default:desert_stone",
            "default:desert_sand",
        },
        platform_shallow="default:desert_sand",
        platform_deep="default:desert_stone",
    })
