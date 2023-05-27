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