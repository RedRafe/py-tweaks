local lib = require "rr-lib"

-- Recursively add science-packs if prerequisites have it
if settings.startup["rr-py-integrity"].value then 
  local depth = settings.startup["rr-py-depth"].value
  while depth > 0 do
    for tech, ___ in pairs(data.raw.technology) do
      lib.add_prerequisite_packs(tech, 1)
    end
    depth = depth - 1
  end
end
