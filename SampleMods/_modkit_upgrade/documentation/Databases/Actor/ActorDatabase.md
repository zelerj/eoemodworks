**Actor Database**
______________________________________________________________________________________________

# Infos

## ID
The ID is the unique value defining the actor, you can either override an existing entry from the game by using an already used ID (First mod in sort order will always be the one overriding the entry) or assign yourself a new one with a big value to ensure that no one else is using it

## Associated Loot Set ID
When the actor is an ennemy, it points to the loot set ([See LootDatabase](file:///Assets/ModToolkitDocumentation/Databases/Loots/LootDatabase.md)) contained by the entity when defeated

## Allowed Equipment
Mask of allowed equipment category to be wielded by the actor

## Parent Actor ID
If you want to use the XP / Stats curve and/or Skillbook of another actor you can put here the ID of another actor to inherit values

## Inherit Parent Stats and XP Curve
If you want to use the inherited parent actor stats and xp curve

## Inherit Parent Skillbook
If you want to use the skillbook of the inherited parent actor

## Exploration CreatureAI
Default behaviour of the actor (in creature mode) while in exploration

- Classic Pursue : Default behaviour with random movements, pursue mode and automatically back home after a timeout

- Passive : The entity do absolutely nothing

- Exploration AI Script : Implementable by overriding WandererAI, put an attribute ScriptedWandererAI ontop of your class to define the path

- Custom : Deprecated, do not use

- Custom Nodal : Not yet implemented

## Combat CreatureAI

- Warrior : The creature will automatically try to get close to the ennemy and fight closely, it will use randomly skills from his skillbook at 30% chance rate it will also try to flee at farther range if their HP become low to heal themselves or fight at distance

- Tank : The creature will automatically try to get close to the ennemy and fight closely, it will use randomly skills from his skillbook at 30% chance rate, it will try to protect his allies at any cost and trying to prevent the players to come closer to the other ennemies

- Caster : The creature will automatically try to go at his cast range limit from the ennemy to blast from distance (100% chance of casting spell from skillbook if it have still enough MP, otherwise it will fight at close range)

- Custom : Deprecated, do not use

- Custom Nodal : Not yet implemented

# Stats

# Experience

# Skillbook

______________________________________________________________________________________________