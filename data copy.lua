--require("solar-panel-interface")

local stone_wall = table.deepcopy(data.raw["wall"]["stone-wall"])
local path_g = "__solar-walls__/graphics/"

data:extend(
{
-- SOLAR PANEL V2
  {
    type = "solar-panel",
    name = "wall-solar-panel",
    icon = path_g .. "solar-wall-2.png",
    icon_size = 32,
    --minable = {hardness = 0.2, mining_time = 0.5, result = "wall-solar-panel"},
    max_health = 350,
    flags = {"not-on-map", "placeable-off-grid", "not-in-kill-statistics"},
    --flags = stone_wall.flags,
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
   --   layers =
  --    {
        {
          filename = path_g .. "transparent.png",
          priority = "extra-high",
          width = 32,
          height = 42,
          shift = util.by_pixel(0.078125, -0.3),
        },
  --    }
    },
    production = tostring(settings.startup["solar-wall-production"].value) .. "kW"
  },
   --[[
  {
    type = "item",
    name = "wall-solar-panel",
    icon = path_g .. "solar-wall-2.png",
    icon_size = 32,
	  hidden = true,
    subgroup = "defensive-structure",
    order = "a[stone-wall]-a[ttone-wall]",
    place_result = "wall-solar-panel",
    stack_size = 100
  },
  {
    type = "recipe",
    name = "wall-solar-panel",
    energy_required = 10,
	  icon = path_g .. "solar-wall-2.png",
    icon_size = 32,

    enabled = false,
	  hidden = true,
    ingredients =
    {
      {"solar-panel", 1},
	    {"stone-wall", settings.startup["solar-wall-recipe-ratio"].value}
    },
    result = "wall-solar-panel",
	  result_count = settings.startup["solar-wall-recipe-ratio"].value
  },
  ]]

-- SOLAR WALL V2
-- Solar Wall: Item
  {
    type = "item",
    name = "solar-wall-2",
    icon = path_g .. "solar-wall-2.png",
    icon_size = 32,
    subgroup = "defensive-structure",
    order = "a[stone-wall]-a[ttone-wall]",
    place_result = "solar-wall-2",
    stack_size = 100
  },
  -- Solar Wall: Recipe
  {
    type = "recipe",
    name = "solar-wall-2",
    energy_required = 10,

    enabled = false,
    ingredients =
    {
      {"solar-panel", 1},
	    {"stone-wall", settings.startup["solar-wall-recipe-ratio"].value}
    },
    result = "solar-wall-2",
	  result_count = settings.startup["solar-wall-recipe-ratio"].value
  },

  -- Solar Wall: Entity
  {
    type = "wall",
    name = "solar-wall-2",
    icon = path_g .. "solar-wall-2.png",
    icon_size = 32,
    flags = stone_wall.flags,
    collision_box = stone_wall.collision_box,
    collision_mask = stone_wall.collision_mask,
    selection_box = stone_wall.selection_box,
    minable = {mining_time = 0.2, result = "solar-wall-2"},
    fast_replaceable_group = "wall",
    max_health = 350,
    repair_speed_modifier = 2,
    corpse = "wall-remnants",
    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
    -- this kind of code can be used for having walls mirror the effect
    -- there can be multiple reaction items
    --attack_reaction =
    --{
      --{
        ---- how far the mirroring works
        --range = 2,
        ---- what kind of damage triggers the mirroring
        ---- if not present then anything triggers the mirroring
        --damage_type = "physical",
        ---- caused damage will be multiplied by this and added to the subsequent damages
        --reaction_modifier = 0.1,
        --action =
        --{
          --type = "direct",
          --action_delivery =
          --{
            --type = "instant",
            --target_effects =
            --{
              --type = "damage",
              ---- always use at least 0.1 damage
              --damage = {amount = 0.1, type = "physical"}
            --}
          --}
        --},
      --}
    --},
    connected_gate_visualization =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      scale = 0.5
    },
    resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 20
      },
      {
        type = "impact",
        decrease = 45,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "fire",
        percent = 100
      },
      {
        type = "acid",
        percent = 80
      },
      {
        type = "laser",
        percent = 70
      }
    },
    pictures =
    {
      single =
      {
        layers =
        {
          {
            filename = path_g .. "wall/wall-single.png",
            priority = "extra-high",
            width = 32,
            height = 46,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, -6),
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-single.png",
              priority = "extra-high",
              width = 64,
              height = 86,
              variation_count = 2,
              line_length = 2,
              shift = util.by_pixel(0, -5),
              scale = 0.5
            }
          },
          {
            filename = path_g .. "wall/wall-single-shadow.png",
            priority = "extra-high",
            width = 50,
            height = 32,
            repeat_count = 2,
            shift = util.by_pixel(10, 16),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-single-shadow.png",
              priority = "extra-high",
              width = 98,
              height = 60,
              repeat_count = 2,
              shift = util.by_pixel(10, 17),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      straight_vertical =
      {
        layers =
        {
          {
            filename = path_g .. "wall/wall-vertical.png",
            priority = "extra-high",
            width = 32,
            height = 68,
            variation_count = 5,
            line_length = 5,
            shift = util.by_pixel(0, 8),
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-vertical.png",
              priority = "extra-high",
              width = 64,
              height = 134,
              variation_count = 5,
              line_length = 5,
              shift = util.by_pixel(0, 8),
              scale = 0.5
            }
          },
          {
            filename = path_g .. "wall/wall-vertical-shadow.png",
            priority = "extra-high",
            width = 50,
            height = 58,
            repeat_count = 5,
            shift = util.by_pixel(10, 28),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-vertical-shadow.png",
              priority = "extra-high",
              width = 98,
              height = 110,
              repeat_count = 5,
              shift = util.by_pixel(10, 29),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      straight_horizontal =
      {
        layers =
        {
          {
            filename = path_g .. "wall/wall-horizontal.png",
            priority = "extra-high",
            width = 32,
            height = 50,
            variation_count = 6,
            line_length = 6,
            shift = util.by_pixel(0, -4),
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-horizontal.png",
              priority = "extra-high",
              width = 64,
              height = 92,
              variation_count = 6,
              line_length = 6,
              shift = util.by_pixel(0, -2),
              scale = 0.5
            }
          },
          {
            filename = path_g .. "wall/wall-horizontal-shadow.png",
            priority = "extra-high",
            width = 62,
            height = 36,
            repeat_count = 6,
            shift = util.by_pixel(14, 14),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-horizontal-shadow.png",
              priority = "extra-high",
              width = 124,
              height = 68,
              repeat_count = 6,
              shift = util.by_pixel(14, 15),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      corner_right_down =
      {
        layers =
        {
          {
            filename = path_g .. "wall/wall-corner-right.png",
            priority = "extra-high",
            width = 32,
            height = 64,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, 6),
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-corner-right.png",
              priority = "extra-high",
              width = 64,
              height = 128,
              variation_count = 2,
              line_length = 2,
              shift = util.by_pixel(0, 7),
              scale = 0.5
            }
          },
          {
            filename = path_g .. "wall/wall-corner-right-shadow.png",
            priority = "extra-high",
            width = 62,
            height = 60,
            repeat_count = 2,
            shift = util.by_pixel(14, 28),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-corner-right-shadow.png",
              priority = "extra-high",
              width = 124,
              height = 120,
              repeat_count = 2,
              shift = util.by_pixel(17, 28),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      corner_left_down =
      {
        layers =
        {
          {
            filename = path_g .. "wall/wall-corner-left.png",
            priority = "extra-high",
            width = 32,
            height = 68,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, 6),
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-corner-left.png",
              priority = "extra-high",
              width = 64,
              height = 134,
              variation_count = 2,
              line_length = 2,
              shift = util.by_pixel(0, 7),
              scale = 0.5
            }
          },
          {
            filename = path_g .. "wall/wall-corner-left-shadow.png",
            priority = "extra-high",
            width = 54,
            height = 60,
            repeat_count = 2,
            shift = util.by_pixel(8, 28),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-corner-left-shadow.png",
              priority = "extra-high",
              width = 102,
              height = 120,
              repeat_count = 2,
              shift = util.by_pixel(9, 28),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      t_up =
      {
        layers =
        {
          {
            filename = path_g .. "wall/wall-t.png",
            priority = "extra-high",
            width = 32,
            height = 68,
            variation_count = 4,
            line_length = 4,
            shift = util.by_pixel(0, 6),
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-t.png",
              priority = "extra-high",
              width = 64,
              height = 134,
              variation_count = 4,
              line_length = 4,
              shift = util.by_pixel(0, 7),
              scale = 0.5
            }
          },
          {
            filename = path_g .. "wall/wall-t-shadow.png",
            priority = "extra-high",
            width = 62,
            height = 60,
            repeat_count = 4,
            shift = util.by_pixel(14, 28),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-t-shadow.png",
              priority = "extra-high",
              width = 124,
              height = 120,
              repeat_count = 4,
              shift = util.by_pixel(14, 28),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      ending_right =
      {
        layers =
        {
          {
            filename = path_g .. "wall/wall-ending-right.png",
            priority = "extra-high",
            width = 32,
            height = 48,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, -4),
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-ending-right.png",
              priority = "extra-high",
              width = 64,
              height = 92,
              variation_count = 2,
              line_length = 2,
              shift = util.by_pixel(0, -3),
              scale = 0.5
            }
          },
          {
            filename = path_g .. "wall/wall-ending-right-shadow.png",
            priority = "extra-high",
            width = 62,
            height = 36,
            repeat_count = 2,
            shift = util.by_pixel(14, 14),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-ending-right-shadow.png",
              priority = "extra-high",
              width = 124,
              height = 68,
              repeat_count = 2,
              shift = util.by_pixel(17, 15),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      ending_left =
      {
        layers =
        {
          {
            filename = path_g .. "wall/wall-ending-left.png",
            priority = "extra-high",
            width = 32,
            height = 48,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, -4),
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-ending-left.png",
              priority = "extra-high",
              width = 64,
              height = 92,
              variation_count = 2,
              line_length = 2,
              shift = util.by_pixel(0, -3),
              scale = 0.5
            }
          },
          {
            filename = path_g .. "wall/wall-ending-left-shadow.png",
            priority = "extra-high",
            width = 54,
            height = 36,
            repeat_count = 2,
            shift = util.by_pixel(8, 14),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-ending-left-shadow.png",
              priority = "extra-high",
              width = 102,
              height = 68,
              repeat_count = 2,
              shift = util.by_pixel(9, 15),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      filling =
      {
        filename = path_g .. "wall/wall-filling.png",
          priority = "extra-high",
          width = 24,
          height = 30,
          variation_count = 8,
          line_length = 8,
          shift = util.by_pixel(0, -2),
          hr_version =
          {
            filename = path_g .. "wall/hr-wall-filling.png",
            priority = "extra-high",
            width = 48,
            height = 56,
            variation_count = 8,
            line_length = 8,
            shift = util.by_pixel(0, -1),
            scale = 0.5
          }
      },
      water_connection_patch =
      {
        sheets =
        {
          {
            filename = path_g .. "wall/wall-patch.png",
            priority = "extra-high",
            width = 58,
            height = 64,
            shift = util.by_pixel(0, -2),
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-patch.png",
              priority = "extra-high",
              width = 116,
              height = 128,
              shift = util.by_pixel(0, -2),
              scale = 0.5
            }
          },
          {
            filename = path_g .. "wall/wall-patch-shadow.png",
            priority = "extra-high",
            width = 74,
            height = 52,
            shift = util.by_pixel(8, 14),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-patch-shadow.png",
              priority = "extra-high",
              width = 144,
              height = 100,
              shift = util.by_pixel(9, 15),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
      gate_connection_patch =
      {
        sheets =
        {
          {
            filename = path_g .. "wall/wall-gate.png",
            priority = "extra-high",
            width = 42,
            height = 56,
            shift = util.by_pixel(0, -8),
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-gate.png",
              priority = "extra-high",
              width = 82,
              height = 108,
              shift = util.by_pixel(0, -7),
              scale = 0.5
            }
          },
          {
            filename = path_g .. "wall/wall-gate-shadow.png",
            priority = "extra-high",
            width = 66,
            height = 40,
            shift = util.by_pixel(14, 18),
            draw_as_shadow = true,
            hr_version =
            {
              filename = path_g .. "wall/hr-wall-gate-shadow.png",
              priority = "extra-high",
              width = 130,
              height = 78,
              shift = util.by_pixel(14, 18),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      }
    },

    wall_diode_green = util.conditional_return(not data.is_demo,
    {
      sheet =
      {
        filename = path_g .. "wall/wall-diode-green.png",
        priority = "extra-high",
        width = 38,
        height = 24,
        --frames = 4, -- this is optional, it will default to 4 for Sprite4Way
        shift = util.by_pixel(-2, -24),
        hr_version =
        {
          filename = path_g .. "wall/hr-wall-diode-green.png",
          priority = "extra-high",
          width = 72,
          height = 44,
          --frames = 4,
          shift = util.by_pixel(-1, -23),
          scale = 0.5
        }
      }
    }),
    wall_diode_green_light_top = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(0, -30),
      size = 1,
      intensity = 0.3
    }),
    wall_diode_green_light_right = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(12, -23),
      size = 1,
      intensity = 0.3
    }),
    wall_diode_green_light_bottom = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(0, -17),
      size = 1,
      intensity = 0.3
    }),
    wall_diode_green_light_left = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(-12, -23),
      size = 1,
      intensity = 0.3
    }),

    wall_diode_red = util.conditional_return(not data.is_demo,
    {
      sheet =
      {
        filename = path_g .. "wall/wall-diode-red.png",
        priority = "extra-high",
        width = 38,
        height = 24,
        --frames = 4, -- this is optional, it will default to 4 for Sprite4Way
        shift = util.by_pixel(-2, -24),
        hr_version =
        {
          filename = path_g .. "wall/hr-wall-diode-red.png",
          priority = "extra-high",
          width = 72,
          height = 44,
          --frames = 4,
          shift = util.by_pixel(-1, -23),
          scale = 0.5
        }
      }
    }),
    wall_diode_red_light_top = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(0, -30),
      size = 1,
      intensity = 0.3
    }),
    wall_diode_red_light_right = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(12, -23),
      size = 1,
      intensity = 0.3
    }),
    wall_diode_red_light_bottom = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(0, -17),
      size = 1,
      intensity = 0.3
    }),
    wall_diode_red_light_left = util.conditional_return(not data.is_demo,
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(-12, -23),
      size = 1,
      intensity = 0.3
    }),

    circuit_wire_connection_point = circuit_connector_definitions["gate"].points,
    circuit_connector_sprites = circuit_connector_definitions["gate"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_output_signal = data.is_demo and {type = "virtual", name = "signal-green"} or {type = "virtual", name = "signal-G"}
  },

-- Solar Wall: Technology
  {
    type = "technology",
    name = "solar-wall",
    icon_size = 128,
    icon = "__base__/graphics/technology/solar-energy.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "solar-wall-2"
      }

    },
    prerequisites = {"solar-energy"},
    unit =
    {
      count = 160,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
		    {"chemical-science-pack", 1}
      },
      time = 30
    },
    order = "c-e-a",
  },

})

local stack_size_settings = settings.startup['solar-wall-stack-size'].value
data.raw.item["stone-wall"].stack_size = stack_size_settings
data.raw.item["solar-wall-2"].stack_size = stack_size_settings