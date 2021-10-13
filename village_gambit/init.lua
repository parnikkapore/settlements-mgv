local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)

local schem_path = modpath.."/schems/"

------------------------------------------------------

local make_schem = smgv.schematic_entry_maker(schem_path)
local schematic_table = {
make_schem("gambit_church_1_0_180",         1/10),
make_schem("gambit_cementry_0_180",         1/10),
make_schem("gambit_field_1_1_90",           1),
make_schem("gambit_forge_1_2_270",          1/10),
make_schem("gambit_fountain_1_1_90",        1/6),
make_schem("gambit_house_1_0_0",            3),
make_schem("gambit_lamp_0_270",             1, 1),
make_schem("gambit_library_hotel_0_180",    1),
make_schem("gambit_pub_1_0_0",              1),
make_schem("gambit_shed_open_chests_2_0",   1, -1),
make_schem("gambit_shop_0_90",              1),
make_schem("gambit_shop_large_0_0",         1),
make_schem("gambit_stable_1_2_90",          1, -1),
make_schem("gambit_tower_1_0_270",          1/6, 1),
}

smgv.make_settlement(
    "mgv_gambit", "town",
    {
		["default:wood"] = {
			'default:wood', 'default:junglewood',
		},
        ["stairs:stair_cobble"] = {
            'stairs:stair_stone', 'stairs:stair_cobble',
        },
	},
    schematic_table)
