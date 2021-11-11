local function on_built( entity )
  local pole = entity.surface.create_entity{name="wall-solar-panel", position=entity.position, force=entity.force}
  pole.destructible = true
  return true
end

script.on_event(defines.events.on_built_entity, function(event)
  if event.created_entity.name == "solar-wall-2" then
    on_built( event.created_entity )
  end	
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
  if event.created_entity.name == "solar-wall-2" then
	  on_built( event.created_entity )
	end
end)



script.on_event(defines.events.script_raised_revive, function(event)
  local entity = event.entity or event.created_entity
  if entity.name == "solar-wall-2" then
    on_built(entity)
  end
end)

script.on_event(defines.events.script_raised_built, function(event)
  local entity = event.entity or event.created_entity
  if entity.name == "solar-wall-2" then
    on_built(entity)
  end
end)

script.on_event(defines.events.on_player_mined_entity, function(event)
  if event.entity.name == "solar-wall-2" then
    center = event.entity.position
    for _, entity in pairs(event.entity.surface.find_entities_filtered{
      area = {{center.x-0.5, center.y-0.5}, {center.x+0.5, center.y+0.5}},
      name = "wall-solar-panel"}) do
        entity.destroy()
    end
  end	
end)

script.on_event(defines.events.on_robot_mined_entity, function(event)
  if event.entity.name == "solar-wall-2" then
    center = event.entity.position
    for _, entity in pairs(event.entity.surface.find_entities_filtered{
      area = {{center.x-0.5, center.y-0.5}, {center.x+0.5, center.y+0.5}},
      name = "wall-solar-panel"}) do
      entity.destroy()
    end
  end
end)

script.on_event(defines.events.on_entity_died, function(event)
  if event.entity.name == "solar-wall-2" then
    center = event.entity.position
    for _, entity in pairs(event.entity.surface.find_entities_filtered{
      area = {{center.x-0.5, center.y-0.5}, {center.x+0.5, center.y+0.5}},
      name = "wall-solar-panel"}) do
      entity.destroy()
    end
  end	
end)
