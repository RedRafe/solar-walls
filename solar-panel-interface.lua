if not SolarWall then SolarWall = {} end

local path_g = "__solar-walls__/graphics/"

--[[
  @ SOLAR_PANEL
    name = "wall-solar-panel"
    icon = path_g .. "solar-wall-2.png"
    production = tostring(settings.startup["solar-wall-production"].value)
    units = "kw"
]]
local function SolarPanelInterfaceEntity(solar_panel)
  return {
    type = "solar-panel",
    name = solar_panel.name,
    icon = solar_panel.icon,
    icon_size = 32,
    flags =
    {
      "not-on-map",
      "placeable-off-grid",
      "not-in-kill-statistics"
    },
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{0, 0}, {0, 0}},
	  hidden = true,
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    picture =
    {
      {
        filename = path_g .. "transparent.png",
        priority = "extra-high",
        width = 32,
        height = 42,
        shift = util.by_pixel(0.078125, -0.3),
      },
    },
    production = tostring(solar_panel.production) .. solar_panel.units
  }
end

--[[
  @ SOLAR_PANEL
    name = "wall-solar-panel"
    icon = path_g .. "solar-wall-2.png"
    order = "a[stone-wall]-a[stone-wall]"
    stack_size = 100
]]
local function SolarPanelInterfaceItem(solar_panel)
  return {
    type = "item",
    name = solar_panel.name,
    icon = solar_panel.icon,
    icon_size = 32,
	  hidden = true,
    subgroup = "defensive-structure",
    order = solar_panel.order,
    place_result = solar_panel.name,
    stack_size = solar_panel.stack_size
  }
end

--[[
  @ SOLAR_PANEL
    name = "wall-solar-panel"
    icon = path_g .. "solar-wall-2.png"
]]
local function SolarPanelInterfaceRecipe(solar_panel)
  return {
    type = "recipe",
    name = solar_panel.name,
    energy_required = 10,
	  icon = solar_panel.icon,
    icon_size = 32,
    enabled = false,
	  hidden = true,
    ingredients = {},
    result = solar_panel.name,
	  result_count = 1
  }
end

local function NewTierSolarPanelInterface(solar_panel)
  data:extend({ SolarPanelInterfaceEntity(solar_panel) })
end

SolarWall.SolarPanelInterfaceEntity = SolarPanelInterfaceEntity
SolarWall.NewTierInterface = NewTierSolarPanelInterface