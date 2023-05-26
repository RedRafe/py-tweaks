for ___, source in pairs({"assembling-machine", "furnace"}) do
  for ___, entity in pairs(data.raw[source]) do
    local b = entity.selection_box or entity.collision_box
    if b and b[1] and b[1][1] and math.abs(b[1][1]) > 1 then
      entity.scale_entity_info_icon = true
    end
  end
end