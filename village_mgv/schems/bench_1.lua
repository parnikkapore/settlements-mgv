schematic = {
	size = {x=4, y=2, z=3},
	yslice_prob = {
		{ypos=0, prob=254},
		{ypos=1, prob=254},
	},
	data = {

		-- z=0, y=0
		{name="default:dirt_with_grass", prob=254, param2=0},
		{name="default:dirt_with_grass", prob=254, param2=0},
		{name="default:dirt_with_grass", prob=254, param2=0},
		{name="default:dirt_with_grass", prob=254, param2=0},

		-- z=0, y=1
		{name="air", prob=254, param2=0},
		{name="air", prob=254, param2=0},
		{name="air", prob=254, param2=0},
		{name="air", prob=254, param2=0},

		-- z=1, y=0
		{name="default:dirt_with_grass", prob=254, param2=0},
		{name="default:dirt_with_grass", prob=254, param2=0},
		{name="default:dirt_with_grass", prob=254, param2=0},
		{name="default:dirt_with_grass", prob=254, param2=0},

		-- z=1, y=1
		{name="moreblocks:slab_cobble", prob=254, param2=18},
		{name="cottages:bench", prob=254, param2=0},
		{name="cottages:bench", prob=254, param2=0},
		{name="moreblocks:slab_cobble", prob=254, param2=12},

		-- z=2, y=0
		{name="default:dirt_with_grass", prob=254, param2=0},
		{name="default:dirt_with_grass", prob=254, param2=0},
		{name="default:dirt_with_grass", prob=254, param2=0},
		{name="default:dirt_with_grass", prob=254, param2=0},

		-- z=2, y=1
		{name="air", prob=254, param2=0},
		{name="moreblocks:slab_cobble", prob=254, param2=7},
		{name="moreblocks:slab_cobble", prob=254, param2=7},
		{name="air", prob=254, param2=0},
	},
}

return schematic