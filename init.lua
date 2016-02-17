-- By Farfadet46

---------------
-- POUBELLES --
---------------
-- Verte = recyclable
-- Noire = non recyclable

minetest.register_node("recycle:poubelle_verte", {
	description = "Poubelle verte",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"poubelle_verte.png"},
	
	--metadata = { infotext = "Recyclable" },
	
	drop = "recycle:poubelle_verte",
	inventory_image = "poubelle_verte.png",
	wield_image = "img_poubelle_verte.png",
	groups = {cracky=2, stone=1}
--	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("recycle:poubelle_noire", {
	description = "Poubelle Noire",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"poubelle_noire.png"},
	drop = "recycle:poubelle_noire",
	inventory_image = "poubelle_noire.png",
	wield_image = "img_poubelle_noire.png",
	groups = {cracky=2, stone=1},
--	sounds = default.node_sound_wood_defaults(),
})

-----------
-- ITEMS --
-----------
minetest.register_craftitem("recycle:sac_poubelle", {
	description = "sac poubelle",
	inventory_image = "sac_poubelle.png",
		
	on_use = function(itemstack, user, pointed_thing)
		
		if not user or not user:is_player() then return end
		if pointed_thing.type ~= "node" then return end
		
		local playername = user:get_player_name()
		local n = minetest.get_node(pointed_thing.under)
		
		if n.name == "recycle:poubelle_noire" then
			minetest.chat_send_player(playername, "Bien joué!")
			return{}
		elseif n.name == "recycle:poubelle_verte" then
			minetest.chat_send_player(playername, "Mauvaise poubelle !")
		else
			minetest.chat_send_player(playername, "Tu ne peut pas jeter ca ici !")
		end
	end,
})

minetest.register_craftitem("recycle:canette_cola", {
	description = "Canette de Cola",
	inventory_image = "canette_cola.png",
	
	on_use = function(itemstack, user, pointed_thing)
		
		if not user or not user:is_player() then return end
		if pointed_thing.type ~= "node" then return end
		
		local playername = user:get_player_name()
		local n = minetest.get_node(pointed_thing.under)
		
		if n.name == "recycle:poubelle_noire" then
			minetest.chat_send_player(playername, "Mauvaise poubelle !")
		elseif n.name == "recycle:poubelle_verte" then
			minetest.chat_send_player(playername, "Bien joué!")
			return{}
		else
			minetest.chat_send_player(playername, "Tu ne peut pas jeter ca ici !")
		end
	end,
})