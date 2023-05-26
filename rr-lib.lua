local lib = {}

--- @alias IngredientPrototype {name: string, amount:number} | {[1]: string, [2]: number}

--- @class TechnologyData
--- @field unit { count: number, ingredients: table<IngredientPrototype> }

--- @class TechnologyPrototype: TechnologyData
--- @field name string
--- @field prerequisites? table<string>
--- @field normal? TechnologyData
--- @field expensive? TechnologyData

--- @param tech TechnologyData
--- @param old string
local function remove_technology_ingredient(tech, old)
  if tech ~= nil and tech.unit ~= nil and tech.unit.ingredients ~= nil then
    local index = nil
		for i, ingredient in pairs(tech.unit.ingredients) do
      if ingredient.name == old or ingredient[1] == old then
        index = i
        break
      end
    end
    if index ~= nil then
      table.remove(tech.unit.ingredients, index)
    end
  end
end

--- @param tech_name string
--- @param ingredient string
function lib.remove_pack(tech_name, ingredient)
  local tech = data.raw.technology[tech_name]
  if not tech then return end
  remove_technology_ingredient(tech, ingredient)
  remove_technology_ingredient(tech.normal, ingredient)
  remove_technology_ingredient(tech.expensive, ingredient)
end

--- @param tech TechnologyData
--- @param ingredient string
--- @param count number 
local function add_technology_ingredient(tech, ingredient, count)
  if tech ~= nil and tech.unit ~= nil and tech.unit.ingredients ~= nil then
    for ___, existing in pairs(tech.unit.ingredients) do
      if existing[1] == ingredient or existing.name == ingredient then
        return
      end
    end
    table.insert(tech.unit.ingredients, {ingredient, count})
  end
end

--- @param tech_name string
--- @param ingredient string
--- @param count? number
function lib.add_pack(tech_name, ingredient, count)
  local tech = data.raw.technology[tech_name]
  if not tech then return end
  count = count or 1
  add_technology_ingredient(tech, ingredient, count)
  add_technology_ingredient(tech.normal, ingredient, count)
  add_technology_ingredient(tech.expensive, ingredient, count)
end

--- @param tech string | TechnologyPrototype
function lib.add_prerequisite_packs(tech)
  if type(tech) == "string" then
    tech = data.raw.technology[tech]
  end
  if not tech then return end

  local prerequisites = tech.prerequisites
  if not prerequisites then return end

  for ___, prerequisite in pairs(prerequisites) do
    if data.raw.technology[prerequisite] ~= nil then
      lib.add_prerequisite_packs(prerequisite)
      local prereq = data.raw.technology[prerequisite]
      local unit = prereq.unit
        or (prereq.normal ~= nil and prereq.normal.unit) 
        or (prereq.expensive ~= nil and prereq.expensive.unit)
      if unit then
        for ___, ingredient in pairs(unit.ingredients) do
          lib.add_pack(tech.name, ingredient.name or ingredient[1])
        end
      end
    end
  end
end

return lib