local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)

local schem_path = modpath.."/schems/"

-------------------------------------

local make_schematic_entry = smgv.schematic_entry_maker(schem_path)
local schematic_table = {
    make_schematic_entry("towntest_ACDC_house_0_270",        1),

    make_schematic_entry("towntest_cornernote_hut1_1_0",     1),
    make_schematic_entry("towntest_cornernote_hut2_1_90",    1),
    make_schematic_entry("towntest_cornernote_hut3_1_180",   1),
    make_schematic_entry("towntest_cornernote_fortress_4_0", 1/6),
    make_schematic_entry("towntest_cornernote_tower_1_90",   1/4),
    make_schematic_entry("towntest_cornernote_turret_1_270", 1/4),

    make_schematic_entry("towntest_irksomeduck_manor_0_180", 1),

    make_schematic_entry("towntest_kddekadenz_barn1_1_270",  1),
    make_schematic_entry("towntest_kddekadenz_barn2_1_270",  1),
    make_schematic_entry("towntest_kddekadenz_castle_3_90",  1),
    make_schematic_entry("towntest_kddekadenz_factory_1_270",1),
    make_schematic_entry("towntest_kddekadenz_gazebo_0_180", 1),
    make_schematic_entry("towntest_kddekadenz_home1_1_270",  1),
    make_schematic_entry("towntest_kddekadenz_home2_1_270",  1),
    make_schematic_entry("towntest_kddekadenz_windmill_0_90",1/10, 1),

    make_schematic_entry("towntest_Nanuk_chapel_1_180",      1/10),
    make_schematic_entry("towntest_Nanuk_lavabeacon_0_180",  1/10),
    make_schematic_entry("towntest_Nanuk_well_0_90",         1, 1),

    make_schematic_entry("towntest_VanessaE_home1_1_270",    1),
    make_schematic_entry("towntest_VanessaE_home2_0_180",    1),
}

smgv.make_settlement(
    "mgv_cornernote", "town",
    {
		["default:wood"] = {
			'default:wood', 'default:junglewood',
		},
        ["stairs:stair_cobble"] = {
            'stairs:stair_stone', 'stairs:stair_cobble',
        },
	},
    schematic_table)
