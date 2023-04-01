if not SolarWall then SolarWall = {} end

--[[
  @ TECHNOLOGY_TIER
    name = "solar-wall"
    prerequisites = { "solar-energy" },
    count = 160
    ingredients = 
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1}
    }
    time = 30
]]
local function Technology(technology_tier)
  return {
    type = "technology",
    name = technology_tier.name,
    icon_size = 256,
    icon = "__base__/graphics/technology/solar-energy.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = technology_tier.name
      }
    },
    prerequisites = technology_tier.prerequisites,
    unit =
    {
      count = technology_tier.count,
      ingredients = technology_tier.ingredients,
      time = technology_tier.time
    },
    order = "c-e-a",
  }
end

local function NewTierTechnology(technology_tier)
  data:extend({ Technology(technology_tier) })
end

SolarWall.Technology = Technology
SolarWall.NewTierTechnology = NewTierTechnology