-- Author: Alexis Gabiola
-- This is Q1 of the Technical Test provided by Tavernlight Games

-- Fix or improve the implmenetation of the below methods


function onLogout(player)
    if player:getStorageValue(1000) == 1 then addEvent(releaseStorage, 1000, player)
    end
    return true
end


local function releaseStorage(player)
    player:setStorageValue(1000, -1)
end
    
