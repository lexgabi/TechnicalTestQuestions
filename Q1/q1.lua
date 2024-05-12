-- Author: Alexis Gabiola
-- This is Q1 of the Technical Test provided by Tavernlight Games

-- Fix or improve the implementation of the below methods

-- This function takes a player and their ID, and resets the storage value to -1
local function releaseStorage(player, storageID)
    player:setStorageValue(storageID, -1)
end
    
-- This function tests if a player does not have an empty storage when logging off
function onLogout(player, storageID)
    if player:getStorageValue(storageID) >= 0 then addEvent(releaseStorage, storageID, player)
    end
    return true
end