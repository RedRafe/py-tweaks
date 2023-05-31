-- Make alt-mode icons scale with entity's size
if settings.startup["rr-py-icons"].value then
  for ___, source in pairs({"assembling-machine", "furnace"}) do
    for ___, entity in pairs(data.raw[source]) do
      local b = entity.selection_box or entity.collision_box
      if b and b[1] and b[1][1] and math.abs(b[1][1]) > 1 then -- only if entity is bigger than a 2x2
        entity.scale_entity_info_icon = true
      end
    end
  end
end

-- Fix used/new equipments burnt results/eqpuipment placement
if settings.startup["rr-py-equipments"].value then
  local equipments = {
    { name = "nexelit-battery", type = "battery-equipment" },
    { name = "quantum-battery", type = "battery-equipment" }
  }
  for ___, e in pairs(equipments) do
    local new = data.raw.item[e.name]
    local used = data.raw.item["used-"..e.name]
    local equipment = data.raw[e.type][e.name]

    if new and used and equipment then
      equipment.take_result = new.name

      new.burnt_result = used.name
      new.placed_as_equipment_result = equipment.name

      used.placed_as_equipment_result = nil
    end
  end
end