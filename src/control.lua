require "defines"

script.on_event(defines.events.on_chunk_generated, function(event)
	local distX = math.abs(event.area.left_top.x)
	local distY = math.abs(event.area.left_top.y)
	local mult = 1 + (math.floor(math.sqrt((distX * distX) + (distY * distY))) / 3500)
	
	if mult > 1 then
		for _,ore in pairs(event.surface.find_entities_filtered({area = {{event.area.left_top.x, event.area.left_top.y}, {event.area.right_bottom.x, event.area.right_bottom.y}}, type="resource"})) do
			ore.amount = math.floor(ore.amount * mult)
		end
	end
end)