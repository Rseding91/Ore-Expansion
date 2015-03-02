require "defines"

game.onevent(defines.events.onchunkgenerated, function(event)
	local distX = math.abs(event.area.lefttop.x)
	local distY = math.abs(event.area.lefttop.y)
	local mult = 1 + (math.floor(math.sqrt((distX * distX) + (distY * distY))) / 3500)
	
	if mult > 1 then
		for _,ore in pairs(game.findentitiesfiltered({area = {{event.area.lefttop.x, event.area.lefttop.y}, {event.area.rightbottom.x, event.area.rightbottom.y}}, type="resource"})) do
			ore.amount = math.floor(ore.amount * mult)
		end
	end
end)