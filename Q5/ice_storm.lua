--Arrays to store combat instances and areas
local combat = {}
local areas = {
--area 1
{
{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{1, 1, 1, 1, 2, 1, 1, 1, 1},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0}
},
--area 2
{
{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 2, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0}
}
}

--Set up each combat instance
for i = 1, #areas do
	combat[i] = Combat()
	combat[i]:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
	combat[i]:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
	combat[i]:setArea(createCombatArea(areas[i]))

	--Function to calculate attack max and min
	function onGetFormulaValues(player, level, magicLevel)
		local min = (level / 5) + (magicLevel * 8) + 50
		local max = (level / 5) + (magicLevel * 12) + 75
		return -min, -max
	end

	combat[i]:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
end

--Cast the spell for a certain combat instance
local function castSpell(creatureId, variant, combatIndex)
	combat[combatIndex]:execute(creature, variant)
end

--Delay casting the spell in the second area
function onCastSpell(creature, variant)
	for i = 2, #areas do
		addEvent(castSpell, 500, creature.uid, variant, i)
	end
	return combat[1]:execute(creature, variant)
end