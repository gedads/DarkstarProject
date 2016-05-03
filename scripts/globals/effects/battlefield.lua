-----------------------------------
--
--     EFFECT_BATTLEFIELD
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (target:getPet()) then
        target:getPet():addStatusEffect(effect);
    end
    target:registerBattlefield(effect:getPower(), effect:getSubPower(), effect:getSubID());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    if (target:getPet()) then
        target:getPet():delStatusEffect(EFFECT_BATTLEFIELD);
    end
    target:leaveBattlefield(effect:getPower());
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    player:PrintToPlayer(string.format("UPDATE csid %u option %u", csid, option));
--printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
end;