local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)

local schem_path = modpath.."/schems/"

if minetest.get_modpath("name_generator") then
	name_generator.parse_lines(io.lines(modpath.."/namegen_mgv.cfg"))
end

-------------------------------------
-- Node initialization
local function fill_chest(pos)
	-- fill chest
	local inv = minetest.get_inventory( {type="node", pos=pos} )
	-- always
	inv:add_item("main", "default:apple "..math.random(1,3))
	-- low value items
	if math.random(0,1) < 1 then
		inv:add_item("main", "farming:bread "..math.random(0,3))
		inv:add_item("main", "default:steel_ingot "..math.random(0,3))
		-- additional fillings when farming mod enabled
		if minetest.get_modpath("farming") ~= nil and farming.mod == "redo" then
			if math.random(0,1) < 1 then
				inv:add_item("main", "farming:melon_slice "..math.random(0,3))
				inv:add_item("main", "farming:carrot "..math.random(0,3))
				inv:add_item("main", "farming:corn "..math.random(0,3))
			end
		end
	end
	-- medium value items
	if math.random(0,3) < 1 then
		inv:add_item("main", "default:pick_steel "..math.random(0,1))
		inv:add_item("main", "default:pick_bronze "..math.random(0,1))
		inv:add_item("main", "fire:flint_and_steel "..math.random(0,1))
		inv:add_item("main", "bucket:bucket_empty "..math.random(0,1))
		inv:add_item("main", "default:sword_steel "..math.random(0,1))
	end
end

local function generate_book(pos, town_name)
	local callbacks = {}
	table.insert(callbacks, {func = settlements.generate_travel_guide, param1=pos, param2=town_name})
	if settlements.generate_ledger then
		table.insert(callbacks, {func = settlements.generate_ledger, param1="kings", param2=town_name})
	end
	local callback = callbacks[math.random(#callbacks)]
	return callback.func(callback.param1, callback.param2)
end

local function fill_shelf(pos, town_name)
	local inv = minetest.get_inventory( {type="node", pos=pos} )
	for i = 1, math.random(2, 8) do
		local book = generate_book(pos, town_name)
		if book then
			inv:add_item("books", book)
		end
	end
end

local generate_books = minetest.settings:get_bool("settlements_generate_books", true)

local initialize_node = function(pos, node, node_def, settlement_info)
	if settlement_info.name and node.name == "default:sign_wall_steel" then
		local meta = minetest.get_meta(pos)
		meta:set_string("text", S("@1 Town Hall", settlement_info.name))
		meta:set_string("infotext", S("@1 Town Hall", settlement_info.name))
	end
	-- when chest is found -> fill with stuff
	if node.name == "default:chest" then
		fill_chest(pos)
	end
	if generate_books and node.name == "default:bookshelf" then
		fill_shelf(pos, settlement_info.name)
	end
	if minetest.get_item_group(node.name, "plant") > 0 then
		minetest.get_node_timer(pos):start(1000) -- start crops growing
	end
end

--------------------------------------------
-- Schematics

function make_schematic_entry(schem, weight, htadj)
    htadj = htadj or 0
    return {
        name = schem,
		schematic = dofile(schem_path..schem..".lua"),
		buffer = 3,
		max_num = 0.2 * weight,
		height_adjust = htadj,
        replace_nodes_optional = true, -- If true, default:cobble will be replaced with a random wall material
        initialize_node = initialize_node,
		platform_ignore_group_above = "group:leafdecay",
    }
end

local schematic_table = {
make_schematic_entry("gambit_church_1_0_180",         1/10),
make_schematic_entry("gambit_cementry_0_180",         1/10),
make_schematic_entry("gambit_field_1_1_90",           1),
make_schematic_entry("gambit_forge_1_2_270",          1/10),
make_schematic_entry("gambit_fountain_1_1_90",        1/6),
make_schematic_entry("gambit_house_1_0_0",            3),
make_schematic_entry("gambit_lamp_0_270",             1, 1),
make_schematic_entry("gambit_library_hotel_0_180",    1),
make_schematic_entry("gambit_pub_1_0_0",              1),
make_schematic_entry("gambit_shed_open_chests_2_0",   1, -1),
make_schematic_entry("gambit_shop_0_90",              1),
make_schematic_entry("gambit_shop_large_0_0",         1),
make_schematic_entry("gambit_stable_1_2_90",          1, -1),
make_schematic_entry("gambit_tower_1_0_270",          1/6, 1),
}

local modern_house_settlements = {
	description = S("town"), -- a general name for this kind of settlement

	-- this settlement will be placed on nodes with this surface material type.
	surface_materials = {
		"default:dirt",
		"default:dirt_with_grass",
		"default:dry_dirt_with_dry_grass",
		"default:dirt_with_snow",
		"default:dirt_with_dry_grass",
		"default:dirt_with_coniferous_litter",
		"default:sand",
		"default:silver_sand",
		"default:snowblock",
	},

	-- TODO: add a biome list. The tricky part here is, what if a biome list but not a surface materials list is provided?
	-- How to find the surface, and how to know what to replace surface material nodes with in the schematic?

	-- nodes in all schematics will be replaced with these nodes, or a randomly-selected node
	-- from a list of choices if a list is provided
	replacements = {},

	-- Affected by per-building replace_nodes flag
	replacements_optional = {
		["default:wood"] = {
			'default:wood', 'default:junglewood',
		},
        ["stairs:stair_cobble"] = {
            'stairs:stair_stone', 'stairs:stair_cobble',
        },
	},

	-- This node will be replaced with the surface material of the location the building is placed on.
	replace_with_surface_material = "default:dirt_with_grass",

	-- Trees often interfere with surface detection. These nodes will be ignored when detecting surface level.
	ignore_surface_materials = {
		"default:tree",
		"default:jungletree",
		"default:pine_tree",
		"default:acacia_tree",
		"default:aspen_tree",
		"default:bush_stem",
		"default:bush_leaves",
		"default:acacia_bush_stem",
		"default:acacia_bush_leaves",
		"default:pine_bush_stem",
		"default:pine_bush_needles",
		"default:blueberry_bush_leaves_with_berries",
		"default:blueberry_bush_leaves",
	},

	platform_shallow = "default:dirt",
	platform_deep = "default:stone",
	path_material = "default:gravel",

	schematics = schematic_table,

	-- Select one of these to form the center of town. If not defined, one will be picked from the regular schematic table
	--central_schematics = {},

	building_count_min = 20,
	building_count_max = 30,

	altitude_min = 2,
	altitude_max = 300,

	generate_name = function(pos)
		if minetest.get_modpath("name_generator") then
			return name_generator.generate("settlement_mgv")
		end
		return S("Town")
	end,

	generate_book = generate_book,
	
	-- This is a special-purpose property used for cleaning up leaf blobs that might have been left behind
	-- when tree trunks got removed by buildings. It goes through every node in the mapchunk and sets the
	-- node's timer going if it matches (using find_nodes_in_area).
	trigger_timers_for_nodes = "group:leafdecay",
}

settlements.register_settlement("mgv_gambit", modern_house_settlements)
