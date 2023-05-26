local lib = require "rr-lib"

for tech, ___ in pairs(data.raw.technology) do
  lib.add_prerequisite_packs(tech)
end
