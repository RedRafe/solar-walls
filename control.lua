local SWControl = {}

SWControl.interface = {
  ["solar-wall"] = "wall-solar-panel"
}

SWControl.isKey = function(entity_name)
  return SWControl.interface[entity_name] ~= nil
end

-- BUILD INTERFACE
local function on_built(event)
  local entity = event.entity or event.created_entity
  if not entity or not entity.valid then return end

  local entity_name = entity.name
  if not SWControl.isKey(entity_name) then return end

  local interface = entity.surface.create_entity{ 
    name = SWControl.interface[entity_name],
    position = entity.position,
    force = entity.force
  }
  interface.destructible = false
end

-- DESTROY INTERFACE
local function on_destroy(event)
  local entity = event.entity or event.created_entity or event.destination
  if not entity or not entity.valid then return end

  local entity_name = entity.name
  if not SWControl.isKey(entity_name) then return end

  local center = entity.position
  for _, interface in pairs(entity.surface.find_entities_filtered{
    name = SWControl.interface[entity_name],
    position = entity.position,
    radius = 0.5,
  }) do interface.destroy() end
end

local solar_wall_filters = {
  {filter = "name", name = "solar-wall"},
  {filter = "type", type = "wall", mode = "and"}
}

-- build events
script.on_event(defines.events.on_built_entity,       on_built, solar_wall_filters)
script.on_event(defines.events.on_entity_cloned,      on_built, solar_wall_filters)
script.on_event(defines.events.on_robot_built_entity, on_built, solar_wall_filters)
script.on_event(defines.events.script_raised_revive,  on_built, solar_wall_filters)
script.on_event(defines.events.script_raised_built,   on_built, solar_wall_filters)

-- destroy events
script.on_event(defines.events.on_player_mined_entity, on_destroy, solar_wall_filters)
script.on_event(defines.events.on_robot_mined_entity,  on_destroy, solar_wall_filters)
script.on_event(defines.events.on_entity_died,         on_destroy, solar_wall_filters)
script.on_event(defines.events.script_raised_destroy,  on_destroy, solar_wall_filters)
