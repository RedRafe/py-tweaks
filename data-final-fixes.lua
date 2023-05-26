local lib = require "rr-lib"

-- Recursively add science-packs if prerequisites have it
for tech, ___ in pairs(data.raw.technology) do
  lib.add_prerequisite_packs(tech)
end
