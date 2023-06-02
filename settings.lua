data:extend({
  {
    type = "bool-setting",
    name = "rr-py-integrity",
    localised_name = "Enable tech integrity check",
    setting_type = "startup",
    default_value = true,
    order = "f1"
  },
  {
      type = "int-setting",
      name = "rr-py-depth",
      localised_name = "Check previous techs",
      localised_description = "Call the recursion function up to N values, with N [0-100]. If 0, it won't check. Increase if some packs are missing, but loading times increase exponentially with N.",
      setting_type = "startup",
      default_value = 3,
      minimum_value = 0,
      maximum_value = 10 ^ 3,
      order = "f1-[2]"
  },
  {
    type = "bool-setting",
    name = "rr-py-icons",
    localised_name = "Enable bigger icon scaling",
    localised_description = "PyMods big machines will have bigger icons according to their scale. Still about 25% of the machine's size",
    setting_type = "startup",
    default_value = true,
    order = "f2"
  },
  {
    type = "bool-setting",
    name = "rr-py-equipments",
    localised_name = "Fix equipment placement/burnt results",
    localised_description = "Batteries will be placed correctly as equipments when insert into armor-like inventories",
    setting_type = "startup",
    default_value = true,
    order = "f3"
  },
  {
    type = "bool-setting",
    name = "rr-py-next-upgrade",
    localised_name = "Add upgrade planner to missing entities",
    localised_description = "Some entities were missing the next_upgrade specification, this will enable the fast upgrade for those",
    setting_type = "startup",
    default_value = true,
    order = "f4"
  },
})