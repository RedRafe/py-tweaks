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
    setting_type = "startup",
    default_value = true,
    order = "f2"
  },
})