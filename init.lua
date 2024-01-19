-- Copyright 2024 Neuromancer

-----------------------
-- Node Registration --
-----------------------
local pcount = 7

for i = 1, pcount do
	local param2 = math.random(0, 1) 
	if (param2 == 0) then
		minetest.register_node("petroglyphs:petroglyph"..i, {
			description = ("Petroglyph"..i),
			paramtype = "light",
			paramtype2 = "facedir",
			tiles = { "default_desert_stone.png",
			"default_desert_stone.png",
			"petroglyph"..i..".png",
			"petroglyph"..i..".png",
			"default_desert_stone.png",			
			"default_desert_stone.png",},
		groups = {cracky=3, stone=1},
		--sounds = default.node_sound_stone_defaults(),
		sounds = default.node_sound_stone_defaults({
		footstep = {name = "petroglyph"..i, gain = 0.1},})
		})
	else
		minetest.register_node("petroglyphs:petroglyph"..i, {
			description = ("Petroglyph"..i),
			paramtype = "light",
			paramtype2 = "facedir",
			tiles = { "default_desert_stone.png",
			"default_desert_stone.png",
			"default_desert_stone.png",
			"default_desert_stone.png",
			"petroglyph"..i..".png",
			"petroglyph"..i..".png",},
			groups = {cracky=3, stone=1},
			--sounds = default.node_sound_stone_defaults(),
					sounds = default.node_sound_stone_defaults({
		footstep = {name = "petroglyph"..i, gain = 0.1},})
		})
	end

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "petroglyphs:petroglyph"..i,  -- Replace with your ore node name
		wherein        = "default:desert_stone",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 1,
		clust_size     = 1,
		y_min          = -31000,
		y_max          = 31000,
	})

end
--[[
minetest.register_on_generated(function(minp, maxp, seed)
	for x = minp.x, maxp.x do
		for y = minp.y, maxp.y do
			for z = minp.z, maxp.z do
				local pos = {x=x, y=y, z=z}
				local node = minetest.get_node(pos)

				-- Check if the ore is being placed next to an air node
				if node.name == "air" then
					minetest.set_node(pos, {name="petroglyphs:sand_with_stones"})
				end
			end
		end
	end
end)
]]
