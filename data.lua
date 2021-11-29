require("solar-panel-interface")
require("solar-wall")
require("solar-wall-technology")

local path_g = "__solar-walls__/graphics/"

local solar_panel = {
  {
    name = "wall-solar-panel",
    icon = path_g .. "solar-wall.png",
    production = settings.startup["solar-wall-production"].value,
    units = "kW"
  }
}

local wall_tier = {
  {
    name = "solar-wall",
    icon = path_g .. "solar-wall.png",
    order = "a[stone-wall]-b[solar-wall]",
    energy_required = 10,
    max_health = settings.startup["solar-wall-max-health"].value,
    ingredients = 
    {
      { "solar-panel", 1 },
	    { "stone-wall", settings.startup["solar-wall-recipe-ratio"].value }
    },
    result_count = settings.startup["solar-wall-recipe-ratio"].value,
    stack_size = settings.startup["solar-wall-stack-size"].value,
    resistances = data.raw.wall["stone-wall"].resistances
  }
}

local technology_tier ={
  {
    name = "solar-wall",
    prerequisites = { "solar-energy" },
    count = 160,
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1}
    },
    time = 30
  }
}

SolarWall.NewTierInterface(solar_panel[1])
SolarWall.NewTierWall(wall_tier[1])
SolarWall.NewTierTechnology(technology_tier[1])

for key, value in pairs(data.raw.wall) do
  data.raw.wall[value.name].stack_size = settings.startup["solar-wall-stack-size"].value
end
