-- Default settlement generator for settlement_mgv

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)

local schem_path = modpath.."/schems/"

smgv = smgv or {}

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

local init_node = function(pos, node, node_def, settlement_info)
	if settlement_info.name and node.name == "default:sign_wall_wood" then
		local meta = minetest.get_meta(pos)
		meta:set_string("text", S("Welcome to @1", settlement_info.name))
		meta:set_string("infotext", S("@1 welcome sign", settlement_info.name))
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

function smgv.schematic_entry_maker(schem_path)
    return function (schem, weight, htadj)
        return {
            name = schem,
            schematic = dofile(schem_path..schem..".lua"),
            buffer = 3, -- buffer space around the building, footprint is treated as radius max(size.x, size.z) + buffer for spacing purposes
            max_num = 0.2 * weight, -- This times the number of buildings in a settlement gives the maximum number of these buildings in a settlement.
					                -- So for example, 0.1 means at most 1 in a 10-building settlement and 2 in a 20-building settlement.
            height_adjust = htadj or 0, -- adjusts the y axis of where the schematic is built, to allow for "basement" stuff
            replace_nodes_optional = true, -- Use the optional replacements table
            initialize_node = init_node, -- allows additional post-creation actions to be executed on schematic nodes once they're constructed
            platform_ignore_group_above = "group:leafdecay", -- If the node is in the space above the schematic being placed it will not be turned into air. (for leaves)
        }
    end
end

--------------------------------------------
-- Settlement template

function smgv.make_settlement(name, desc, repl, schems, settings)
    settings = settings or {}
    settings.building_count = settings.building_count or {}
    
    local settlement_def = {
        description = S(desc or "village"), -- a general name for this kind of settlement

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
        replacements_optional = repl or {},

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
        path_material = settings.path_material or "default:gravel",

        schematics = schems,

        -- Select one of these to form the center of town. If not defined, one will be picked from the regular schematic table
        central_schematics = settings.central_schematics or nil,

        building_count_min = settings.building_count[1] or 20,
        building_count_max = settings.building_count[2] or 30,

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

    settlements.register_settlement(name, settlement_def)
end

--------------------------------------------
-- Generic replacement tables

local function table_new_append(t, str_to_append)
    local n
    for k,v in pairs(t) do
        n[k] = v .. str_to_append
    end
    return n
end

local function table_new_prepend(t, str_to_prepend)
    local n = {}
    for k,v in pairs(t) do
        n[k] = str_to_prepend .. v
    end
    return n
end

smgv.replacements_stone = {
	'cobble',           'desert_cobble',
	'stone',            'stone_block',            'stonebrick',
	'sandstone',        'sandstone_block',        'sandstonebrick',
	'desert_stone',     'desert_stone_block',     'desert_stonebrick',
	'desert_sandstone', 'desert_sandstone_block', 'desert_sandstone_brick',
	'silver_sandstone', 'silver_sandstone_block', 'silver_sandstone_brick',
}

smgv.replacements_wood = {
	'wood', 'junglewood', 'pine_wood', 'acacia_wood', 'aspen_wood',
	'wood', 'junglewood', 'pine_wood', 'acacia_wood', 'aspen_wood',
	'wood', 'junglewood', 'pine_wood', 'acacia_wood', 'aspen_wood',
	'wood', 'junglewood', 'pine_wood', 'acacia_wood', 'aspen_wood',
	'wood', 'junglewood', 'pine_wood', 'acacia_wood', 'aspen_wood',

	'cobble',           'desert_cobble',
	'stone',            'stone_block',            'stonebrick',
	'sandstone',        'sandstone_block',        'sandstonebrick',
	'desert_stone',     'desert_stone_block',     'desert_stonebrick',
	'desert_sandstone', 'desert_sandstone_block', 'desert_sandstone_brick',
	'silver_sandstone', 'silver_sandstone_block', 'silver_sandstone_brick',
}

smgv.replacements_brick = {
    'wood', 'junglewood', 'pine_wood', 'acacia_wood', 'aspen_wood',
	'cobble',           'desert_cobble',
	'stone',            'stone_block',            'stonebrick',
	'sandstone',        'sandstone_block',        'sandstonebrick',
	'desert_stone',     'desert_stone_block',     'desert_stonebrick',
	'desert_sandstone', 'desert_sandstone_block', 'desert_sandstone_brick',
	'silver_sandstone', 'silver_sandstone_block', 'silver_sandstone_brick',
	'brick', 'brick', 'brick', 'brick', 'brick',
	'clay', 'clay', 'loam', 'loam',
}

for _,rtype in pairs({"replacements_stone", "replacements_wood", "replacements_brick"}) do
    smgv[rtype .. "_wall"] = table_new_prepend(smgv[rtype], "default:")
    smgv[rtype .. "_slab"] = table_new_prepend(smgv[rtype], "stairs:slab_")
    smgv[rtype .. "_stair"] = table_new_prepend(smgv[rtype], "stairs:stair_")
    smgv[rtype .. "_istair"] = table_new_prepend(smgv[rtype], "stairs:stair_inner_")
    smgv[rtype .. "_ostair"] = table_new_prepend(smgv[rtype], "stairs:stair_outer_")
end
