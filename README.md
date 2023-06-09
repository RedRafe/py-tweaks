# **Red Rafe's Pyanodon Tweaks**

---

Simply fixes some issues/inconsistencies/details in [Pyanodon](https://mods.factorio.com/user/pyanodon) mods.

Can turn ON/OFF each feature individually via mod settings.

---

### Changes

- *Bigger recipe icons*
 
 > Scale recipe icon in alt-mode according to the machine's size to better fit PY's enormous machines

- *Tech integrity check*
 
 > Recursively add science packs to technologies that depend on previous techs with more science-packs ingredients
 (i.e. artillery turrets tech, unlocked after military & chemical, will also cost chemical science packs in addition to already present red/green/military)

- *Battery equipment fix*

 > Fix battery items placement result when placed as equipment. Nexelite & Quantum batteries will be placed correctly as equipments when insert into armor-like inventories.

- *Fix upgrade planner*

 > Add upgrade planner to missing entities. Some entities were missing the next_upgrade specification, this option will add that specification and enable the fast upgrade for those entities (i.e. Mk01-Mk04 upgrades)