---------------------------------------------
--  Chemical_Bomb
--
--  Description: slow + elegy
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- skillList  54 = Omega
    -- skillList 727 = Proto-Omega
    -- skillList 728 = Ultima
    -- skillList 729 = Proto-Ultima
    local skillList = mob:getMobMod(MOBMOD_SKILL_LIST);
    local mobhp = mob:getHPP();
    local phase = mob:getLocalVar("battlePhase");

    if ((skillList == 729 and phase < 3) or ((skillList == 728 and mobhp >= 70 or mobhp < 40))) then
        return 0;  
    end

    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect0 = EFFECT_ELEGY;
    local typeEffect1 = EFFECT_SLOW;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect0, 1, 0,30));
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect1, 1, 0,30));

    -- This likely doesn't behave like retail.
    return typeEffect1;
end;
