# solar-walls
Update for [Solar Walls](https://mods.factorio.com/mod/SolarWalls) mod (by DellAquila), adds walls equipped with solar panel.

### Version 0.0.15
  Bugfixes:
    - Fixed ghost wall not rebuilding solar interface
  Features:
    - Added settings to change Solar Wall health
    - Added compatibility with [Accumulator Walls](https://mods.factorio.com/mod/accumulator-walls)
  Changes:
    - Migrated prototypes: from "solar-wall-2" to "solar-wall"
    - Default stack size back to 100
    - Refactored scripts to improve future compatibility
### Version 0.0.14
Version: 0.0.14 
  Bugfixes:
    - Fixed collision boxes of solar walls
    - Fixed solar panels used by solar walls causing collisions
    - Fixed deconstruction planner: it was not possible to go through Solar Walls marked as deconstruction 
    - Fixed icon in power production GUI
  Changes:
    - Redefined collision box and mask to stone wall's values
    - Added startup settings for solar production and recipe ratios
    - Added startup setting for Wall stack size (will now affect vanilla walls too)