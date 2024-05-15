--area 1 array
local area1 = {
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 1, 0, 1, 1, 0},
{1, 1, 1, 0, 1, 1, 1},
{1, 1, 1, 2, 1, 1, 1},
{1, 1, 1, 0, 1, 1, 1},
{0, 1, 1, 0, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 0}
}

--area 2 array
local area2 = {
{0, 1, 1, 1, 0},
{1, 1, 1, 1, 1},	
{1, 1, 2, 1, 1},
{1, 1, 1, 1, 1},
{0, 1, 1, 1, 0}
}

--Set up Area1
local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat1:setArea(createCombatArea(area1))

--Set up Area2
local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat2:setArea(createCombatArea(area2))

--Function that returns the min and max level/magic level
function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 5.5) + 25
	local max = (level / 5) + (magicLevel * 11) + 50
	return -min, -max
end

--Callback which uses vaules from above function
combat1:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
combat2:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

--casts the spell of the second combat area
local function castSpell(creatureId, variant)
	combat2:execute(creature, variant)
end

--delays second combat execution and executes first combat area
function onCastSpell(creature, variant)
	addEvent(castSpell, 1000, creature.uid, variant)
	return combat1:execute(creature, variant)
end