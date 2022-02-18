local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)

local schem_path = modpath.."/schems/"

-------------------------------------

local make_schem = smgv.schematic_entry_maker(schem_path, 3)
local schems = {
    make_schem("modern_house_a_5_270",  1),
    make_schem("modern_house_facade",   1),
    make_schem("modern_house_serenity", 1)
}

smgv.make_settlement(
    "mgv_modern_houses", "village",
    {
		["default:wood"] = {
			'default:wood', 'default:junglewood',
		},
		["wool:dark_green"] = {
            'wool:blue', 'wool:brown', 'wool:cyan', 'wool:dark_green', 'wool:dark_grey', 
        },
	},
    schems,
    {building_count = {15,30}})
