-- By Farfadet46

---------------
-- POUBELLES --
---------------
-- Verte = Group recycle = 1
-- Noire = Group recycle = 2

minetest.register_node("recycle:poubelle_verte", {
	description = "Poubelle verte",
	drawtype = "mesh",
	mesh = "poubelle.b3d",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"poubelle_verte.png"},
	drop = "recycle:poubelle_verte",
	inventory_image = "poubelle_verte.png",
	wield_image = "img_poubelle_verte.png",
	groups = {crumbly=3,stone=1},
	on_punch=function(pos, node, player, pointed_thing)
		local item_en_main = player:get_wielded_item():get_name() 
		if item_en_main ~= "hand" then
			local playername = player:get_player_name()
			local group = minetest.get_node_group(item_en_main, "recycle")
				
			if group == 1 then
				print("gagné")
				--enlever un item de la main
				player:set_wielded_item(nil)
				return{}
			--elseif group == 2 then
			--	print("non non non")
			end
		end
	end,
})

minetest.register_node("recycle:poubelle_noire", {
	description = "Poubelle Noire",
	drawtype = "mesh",
	mesh = "poubelle.b3d",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"poubelle_noire.png"},
	drop = "recycle:poubelle_noire",
	inventory_image = "poubelle_noire.png",
	wield_image = "img_poubelle_noire.png",
	groups = {stone=1},
	on_punch=function(pos, node, player, pointed_thing)
		local item_en_main = player:get_wielded_item():get_name() 
		local playername = player:get_player_name()
		local group = minetest.get_node_group(item_en_main, "recycle")
	
		if group == 2 then
			--print("gagné")
			player:set_wielded_item(nil)
			return{}
		end
	end,
})


minetest.register_node("recycle:peau_banane",{
	description = "Peau de banane",
	drawtype="plantlike",
	tiles ={"plant_banana.png"},
	inventory_image = "plant_banana.png",
	paramtype="light",
	walkable = false,
	drop="recycle:peau_banane",
	buildable_to = false,
	groups = {crumbly=2, recycle=2},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})

minetest.register_node("recycle:canette_cola", {
	description = "Canette de COLA",
	drawtype="plantlike",
	tiles ={"canette_cola.png"},
	inventory_image = "canette_cola.png",
	paramtype="light",
	walkable = false,
	drop="recycle:canette_cola",
	buildable_to = false,
	groups = {crumbly=2, recycle=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
	},
})

minetest.register_node("recycle:sac_poubelle",{
	description = "Peau de banane (plantlike)",
	drawtype="plantlike",
	tiles ={"sac_poubelle.png"},
	inventory_image = "sac_poubelle.png",
	paramtype="light",
	walkable = false,
	drop="recycle:sac_poubelle",
	buildable_to = false,
	groups = {crumbly=2, recycle=2},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
	},
})
