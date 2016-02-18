-- By Farfadet46

---------------
-- POUBELLES --
---------------
-- Verte = Group recycle = 1
-- Noire = Group recycle = 2

--[[
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "recycle:poubelle_verte" then -- This is your form name
		print("Player "..player:get_player_name().." submitted fields "..dump(fields))
	end
end)
]]--

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if fields.quit then
		--print("quit")
		return
	elseif fields.give then
		player:get_inventory():add_item('main', 'recycle:sac_poubelle')
		player:get_inventory():add_item('main', 'recycle:peau_banane')
		player:get_inventory():add_item('main', 'recycle:brick_lait')
		player:get_inventory():add_item('main', 'recycle:bouteille_eau')
		player:get_inventory():add_item('main', 'recycle:journal')
		player:get_inventory():add_item('main', 'recycle:canette_cola')
		print("give ok")
		return
	end
end)

minetest.register_node("recycle:poubelle_verte", {
	description = "Poubelle verte",
	drawtype = "mesh",
	mesh = "poubelle.b3d",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"poubelle_verte.png"},
	drop = "recycle:poubelle_verte",
	inventory_image = "img_poubelle_verte.png",
	wield_image = "img_poubelle_verte.png",
	groups = {cracky=1},
	on_rightclick = function(pos, node, player, pointed_thing)
		--local playername = player:get_player_name()
		minetest.show_formspec(player:get_player_name(), "recycle:form_vert",
				"size[8,4]" ..
				"label[0,0;Cette poubelle verte permet de recycler certains objets :]" ..
				"label[0.2,0.5;- Le Papier / carton,]" ..
				"label[0.2,0.9;- Les plastiques,]" ..
				"label[0.2,1.3;- L'Aluminium,]" ..
				"image[5, 1; 3,3;logo_recycle.png]"..
				"button[2,3;2,1;give;Give]"..
				"button_exit[0,3;2,1;exit;Quit]")

	end,
	
	on_punch=function(pos, node, player, pointed_thing)
		local item_en_main = player:get_wielded_item():get_name() 
		if item_en_main ~= "hand" then
			local playername = player:get_player_name()
			local group = minetest.get_node_group(item_en_main, "recycle")
				
			if group == 1 then
				--enlever l'item de la main
				player:set_wielded_item(nil)
				return{}
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
	inventory_image = "img_poubelle_noire.png",
	wield_image = "img_poubelle_noire.png",
	groups = {cracky=1},
	
	on_rightclick = function(pos, node, player, pointed_thing)
		--local playername = player:get_player_name()
		minetest.show_formspec(player:get_player_name(), "recycle:form_noir",
				"size[8,4]" ..
				"label[0,0;Cette poubelle noire permet de jeter certains objets :]" ..
				"label[0.2,0.5;- Les déchets sales,]" ..
				"label[0.2,0.9;- Les sac poubelles,]" ..
				"image[5, 1; 3,3;logo_no_recycle.png]"..
				"button[2,3;2,1;give;Give]"..
				"button_exit[0,3;2,1;exit;Quit]")

	end,
	
	on_punch=function(pos, node, player, pointed_thing)
		local item_en_main = player:get_wielded_item():get_name() 
		local playername = player:get_player_name()
		local group = minetest.get_node_group(item_en_main, "recycle")
	
		if group == 2 then
			player:set_wielded_item(nil)
			return{}
		end
	end,
})


minetest.register_node("recycle:peau_banane",{
	description = "Peau de banane",
	drawtype="plantlike",
	tiles ={"banane.png"},
	inventory_image = "img_banane.png",
	wield_image = "img_banane.png",
	paramtype="light",
	paramtype2="facedir",
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
	drawtype="mesh",
	mesh="canette.b3d",
	tiles ={"canette_cola.png"},
	inventory_image = "img_canette_cola.png",
	wield_image = "img_canette_cola.png",
	paramtype="light",
	walkable = false,
	view_size = 2,
	drop="recycle:canette_cola",
	buildable_to = false,
	groups = {crumbly=2, recycle=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})

minetest.register_node("recycle:brick_lait",{
	description = "brique de lait",
	drawtype="nodebox",
	tiles ={
		"brick_lait_up.png",
		"brick_lait_up.png",
		"brick_lait_uni.png",
		"brick_lait_uni.png",
		"brick_lait_ar.png",
		"brick_lait_av.png",
	},
	inventory_image = "img_brick_lait.png",
	wield_image = "img_brick_lait.png",
	paramtype="light",
	paramtype2 = "facedir",
	walkable = false,
	drop="recycle:brick_lait",
	buildable_to = false,
	groups = {crumbly=2, recycle=1},
	node_box={
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
	},
})

minetest.register_node("recycle:sac_poubelle",{
	description = "Sac poubelle",
	drawtype="plantlike",
	tiles ={"sac_poubelle.png"},
	inventory_image = "sac_poubelle.png",
	wield_image = "sac_poubelle.png",
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

minetest.register_node("recycle:bouteille_eau",{
	description = "Bouteille d'eau",
	drawtype="plantlike",
	tiles ={"bouteille_eau.png"},
	inventory_image = "img_bouteille_eau.png",
	wield_image = "img_bouteille_eau.png",
	paramtype="light",
	walkable = false,
	drop="recycle:bouteille_eau",
	buildable_to = false,
	groups = {crumbly=2, recycle=1},
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3},
	},
})

minetest.register_node("recycle:journal",{
	description = "Vieux journal",
	drawtype="nodebox",
	tiles ={
		"journal_up.png",
		"journal_up.png",
		"journal_cote.png",
		"journal_cote.png",
		"journal_av_ar.png",
		"journal_av_ar.png",
	},
	--[[tiles ={
		"journal_up.png",
		"journal_down.png",
		"journal_right.png",
		"journal_left.png",
		"journal_back.png",
		"journal_front.png",
	},]]
	inventory_image = "img_journal.png",
	wield_image = "img_journal.png",
	paramtype="light",
	paramtype2 = "facedir",
	walkable = false,
	drop="recycle:journal",
	buildable_to = false,
	groups = {crumbly=2, recycle=1},
	node_box={
		type = "fixed",
		fixed = {-0.4, -0.5, -0.5, 0.4, -5/16, 0.5},
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.4, -0.5, -0.5, 0.4, -5/16, 0.5},
	},
})