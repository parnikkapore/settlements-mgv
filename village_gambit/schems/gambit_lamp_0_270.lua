schematic = {
	size = {x=3, y=4, z=3},
	yslice_prob = {
		{ypos=0, prob=254},
		{ypos=1, prob=254},
		{ypos=2, prob=254},
		{ypos=3, prob=254},
	},
	data = {

		-- z=0, y=0
		{name="air", prob=254, param2=0},
		{name="air", prob=254, param2=0},
		{name="air", prob=254, param2=0},

		-- z=0, y=1
		{name="air", prob=254, param2=0},
		{name="air", prob=254, param2=0},
		{name="air", prob=254, param2=0},

		-- z=0, y=2
		{name="air", prob=254, param2=0},
		{name="air", prob=254, param2=0},
		{name="air", prob=254, param2=0},

		-- z=0, y=3
		{name="air", prob=254, param2=0},
		{name="default:torch_wall", prob=254, param2=4},
		{name="air", prob=254, param2=0},

		-- z=1, y=0
		{name="air", prob=254, param2=0},
		{name="default:fence_wood", prob=254, param2=0},
		{name="air", prob=254, param2=0},

		-- z=1, y=1
		{name="air", prob=254, param2=0},
		{name="default:fence_wood", prob=254, param2=0},
		{name="air", prob=254, param2=0},

		-- z=1, y=2
		{name="air", prob=254, param2=0},
		{name="default:fence_wood", prob=254, param2=0},
		{name="air", prob=254, param2=0},

		-- z=1, y=3
		{name="default:torch_wall", prob=254, param2=2},
		{name="wool:black", prob=254, param2=0},
		{name="default:torch_wall", prob=254, param2=3},

		-- z=2, y=0
		{name="air", prob=254, param2=0},
		{name="air", prob=254, param2=0},
		{name="air", prob=254, param2=0},

		-- z=2, y=1
		{name="air", prob=254, param2=0},
		{name="air", prob=254, param2=0},
		{name="air", prob=254, param2=0},

		-- z=2, y=2
		{name="air", prob=254, param2=0},
		{name="air", prob=254, param2=0},
		{name="air", prob=254, param2=0},

		-- z=2, y=3
		{name="air", prob=254, param2=0},
		{name="default:torch_wall", prob=254, param2=5},
		{name="air", prob=254, param2=0},
	},
}

return schematic