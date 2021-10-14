local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)
local schem_path = modpath.."/schems/"
local make_schem = smgv.schematic_entry_maker(schem_path)

--[[

--- Nore ---------------------------------------------

local nore_schems = {
make_schem("house_1_0",                          1),
make_schem("wheat_field",                        1),
make_schem("cotton_field",                       1),
make_schem("lamp",                               1/2.7, 1),
make_schem("well",                               1, -5),
make_schem("fountain",                           1/2.8),
make_schem("small_house_1_0",                    1),
make_schem("house_with_garden_1_0",              1),
make_schem("church_1_0",                         1),
make_schem("tower_1_0",                          1/3),
make_schem("forge_1_0",                          1),
make_schem("library_1_0",                        1),
make_schem("inn_1_0",                            1/2.5),
make_schem("pub_1_0",                            1/2),
make_schem("allmende_3_90",   3, -2),
}

smgv.make_settlement(
    "nore", "town",
    {
        ["default:stonebrick"]  = smgv.replacements_stone_wall,
        ["default:wood"]        = smgv.replacements_wood_wall,
        ["wool:grey"]           = {"wool:grey", "wool:white", "wool:dark_grey", "wool:cyan", "wool:pink"},
    },
    nore_schems,
    {building_count = {10,15}}
)

--- logcabin -----------------------------------------

local logcabin_schems = {
    make_schem("logcabin1",    1   ),
    make_schem("logcabin2",    1   ),
    make_schem("logcabin3",    1   ),
    make_schem("logcabin4",    1   ),
    make_schem("logcabin5",    1   ),
    make_schem("logcabin6",    1   ),
    make_schem("logcabin7",    1   ),
    make_schem("logcabin8",    1   ),
    make_schem("logcabin9",    1   ),
    make_schem("logcabin10",   1   ),
    make_schem("logcabin11",   1   ),
    make_schem("logcabinpub1", 0.4 ),
    make_schem("logcabinpub2", 0.4 ),
    make_schem("logcabinpub3", 0.4 ),
    make_schem("allmende_3_90",   3, -2),
}

smgv.make_settlement(
    "logcabin", "camp",
    {
        ["default:junglewood"]  = smgv.replacements_wood_wall,
    },
    logcabin_schems,
    {building_count = {8,15}}
)

--- Medieval -----------------------------------------
-- requires cottages

local medieval_schems = {
    make_schem("church_1",         1),
	make_schem("forge_1",          2),
	make_schem("mill_1",           2),
	make_schem("watermill_1",      2,  -3),
	make_schem("hut_1",            1),
	make_schem("hut_2",            1),
	make_schem("farm_full_1",      1/3),
	make_schem("farm_full_2",      1/3),
	make_schem("farm_full_3",      1/3),
	make_schem("farm_full_4",      1/3),
	make_schem("farm_full_5",      1/3),
	make_schem("farm_full_6",      1/3),
	make_schem("farm_tiny_1",      1),
	make_schem("farm_tiny_2",      1),
	make_schem("farm_tiny_3",      1),
	make_schem("farm_tiny_4",      1),
	make_schem("farm_tiny_5",      1),
	make_schem("farm_tiny_6",      1),
	make_schem("farm_tiny_7",      1),
	make_schem("taverne_1",           1/2),
	make_schem("taverne_2",           1/2),
	make_schem("taverne_3",           1/2),
	make_schem("taverne_4",           1/2),

	make_schem("well_1",            1/3),
	make_schem("well_2",            1/3),
	make_schem("well_3",            1/3),
	make_schem("well_4",            1/3),
	make_schem("well_5",            1/3),
	make_schem("well_6",            1/3),
	make_schem("well_7",            1/3, -1),
	make_schem("well_8",            1/3),

	make_schem("allmende_3_90",   2, -2),

	make_schem("tree_place_1",    1/3, 1),
	make_schem("tree_place_2",    1/3, 1),
	make_schem("tree_place_3",    1/3, 1),
	make_schem("tree_place_4",    1/3, 1),
	make_schem("tree_place_5",    1/3, 1),
	make_schem("tree_place_6",    1/3, 1),
	make_schem("tree_place_7",    1/3, 1),
	make_schem("tree_place_8",    1/3, 1),
	make_schem("tree_place_9",    1/3, 1),
	make_schem("tree_place_10",   1/3, 1),

	make_schem("wagon_1",         1/3),
	make_schem("wagon_2",         1/3),
	make_schem("wagon_3",         1/3),
	make_schem("wagon_4",         1/3),
	make_schem("wagon_5",         1/3),
	make_schem("wagon_6",         1/3),
	make_schem("wagon_7",         1/3),
	make_schem("wagon_8",         1/3),
	make_schem("wagon_9",         1/3),
	make_schem("wagon_10",        1/3),
	make_schem("wagon_11",        1/3),
	make_schem("wagon_12",        1/3),

	make_schem("bench_1",         1/3),
	make_schem("bench_2",         1/3),
	make_schem("bench_3",         1/3),
	make_schem("bench_4",         1/3),

	make_schem("shed_1",          1/3),
	make_schem("shed_2",          1/3),
	make_schem("shed_3",          1/3),
	make_schem("shed_5",          1/3),
	make_schem("shed_6",          1/3),
	make_schem("shed_7",          1/3),
	make_schem("shed_8",          1/3),
	make_schem("shed_9",          1/3),
	make_schem("shed_10",         1/3),
	make_schem("shed_11",         1/3),
	make_schem("shed_12",         1/3),

	make_schem("weide_1",         0.4),
	make_schem("weide_2",         0.4),
	make_schem("weide_3",         0.4),
	make_schem("weide_4",         0.4),
	make_schem("weide_5",         0.4),
	make_schem("weide_6",         0.4),

	make_schem("field_1",0.4, -2),
	make_schem("field_2",0.4, -2),
	make_schem("field_3",0.4, -2),
	make_schem("field_4",0.4, -2),
}

local medieval_materials = {
    'cottages:loam', 'cottages:loam', 'cottages:loam', 'cottages:loam', 'cottages:loam', 
    'default:clay',  'default:clay',  'default:clay',  'default:clay',  'default:clay',
    'default:wood','default:junglewood', 'default:pine_wood', 'default:acacia_wood', 'default:aspen_wood', 'default:sandstone',
    'default:desert_stone','default:brick','default:cobble','default:stonebrick',
    'default:desert_stonebrick','default:sandstonebrick','default:stone',
    'default:silver_sandstone','default:silver_sandstone_block', 'default:silver_sandstone_brick',
    'default:desert_sandstone_block','default:desert_sandstone_brick',
}

smgv.make_settlement(
    "mgv_medieval", "town",
    {
        -- We don't have the Bell mod
        ['bell:bell'] =             'default:goldblock',
        -- Leftovers in the schematics
        ['default:glass'] =         'air',
        ['junglegrass:medium'] =    'air',
        ['junglegrass:short'] =     'air',
        ['poisonivy:seedling'] =    'air',
        -- Building materials
        ['default:sandstone'] = medieval_materials, -- floor
        ['default:clay']      = medieval_materials, -- A (lower)
        ['cottages:loam']      = medieval_materials, -- B (upper)
        ['default:cobble']    = smgv.replacements_stone_wall, -- cobble
    },
    medieval_schems,
    {building_count = {13,30}}
)

]]--

--- Lumberjack ---------------------------------------
-- requires cottages

local ljack_schems = {
    make_schem("lumberjack_1",        1, 1),
	make_schem("lumberjack_2",        1, 1),
	make_schem("lumberjack_3",        1, 1),
	make_schem("lumberjack_4",        1, 1),
	make_schem("lumberjack_5",        1, 1),
	make_schem("lumberjack_6",        1, 1),
	make_schem("lumberjack_7",        1, 1),
	make_schem("lumberjack_8",        1, 1),
	make_schem("lumberjack_9",        1, 1),
	make_schem("lumberjack_10",       1, 1),
	make_schem("lumberjack_11",       1, 0),
	make_schem("lumberjack_12",       1, 1),
	make_schem("lumberjack_13",       1, 1),
	make_schem("lumberjack_14",       1, 1),
	make_schem("lumberjack_15",       1, 1),
	make_schem("lumberjack_16",       1, 0),
	make_schem("lumberjack_school",   2, 1),
	make_schem("lumberjack_stable",   1, 0),
	make_schem("lumberjack_pub_1",    2, 1),
	make_schem("lumberjack_church_1", 2, 1),
	make_schem("lumberjack_hotel_1",  1, 1),
	make_schem("lumberjack_shop_1",   1, 1),
	make_schem("lumberjack_sawmill_1",2, -7),
    make_schem("allmende_3_90",   2, -2),
}

smgv.make_settlement(
    "lumberjack", "camp",
    {},
    ljack_schems,
    {building_count = {5,15}}
)

--[[

--- Claytrader ---------------------------------------
-- depends on cottages

local clt_schems = {
	make_schem("trader_clay_1",   3, 1), -- poor guy who has to live in that small thing
	make_schem("trader_clay_2",   3, 1), -- not that he'll live very comftable there...
	make_schem("trader_clay_3",   3, 1),
	make_schem("trader_clay_4",   3, 1),
	make_schem("trader_clay_5",   3, 1),

	make_schem("clay_pit_1",      1/2, -3),
	make_schem("clay_pit_2",      1/2, -1),
	make_schem("clay_pit_3",      1/2, -6),
	make_schem("clay_pit_4",      1/2,  0),
	make_schem("clay_pit_5",      1/2,  1),
}

smgv.make_settlement(
    "claytrader", "town",
    {["default:brick"]={
	'default:cobble',           'default:desert_cobble',          'default:mossycobble',
	'default:stone',            'default:stone_block',            'default:stonebrick',
	'default:sandstone',        'default:sandstone_block',        'default:sandstonebrick',
	'default:desert_stone',     'default:desert_stone_block',     'default:desert_stonebrick',
	'default:desert_sandstone', 'default:desert_sandstone_block', 'default:desert_sandstone_brick',
	'default:silver_sandstone', 'default:silver_sandstone_block', 'default:silver_sandstone_brick',
    'default:stone_bricks',     'default:desert_strone_bricks',
	}},
    clt_schems,
    {building_count = {10,15}}
)

--- Taoki --------------------------------------------

local taoki_schems = {
	make_schem("default_town_farm",          1,-1),
	make_schem("default_town_house_large_1", 1/3,-4),
	make_schem("default_town_house_large_2", 1/3,-4),
	make_schem("default_town_house_medium",  1/2,-4),
	make_schem("default_town_house_small",   1,-4),
	make_schem("default_town_house_tiny_1",  1,1),
	make_schem("default_town_house_tiny_2",  1,1),
	make_schem("default_town_house_tiny_3",  1,1),
	make_schem("default_town_park",          1,1),
	make_schem("default_town_tower",         0.4,1),
	make_schem("default_town_well",          1/3,-6),
	make_schem("default_town_fountain",      1/3,1),
}

smgv.make_settlement(
    "taoki", "town",
    {},
    taoki_schems,
    {building_count = {15,30}}
)
]]--
