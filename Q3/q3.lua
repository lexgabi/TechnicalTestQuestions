-- Author: Alexis Gabiola
-- This is Q3 of the Technical Test provided by Tavernlight Games

-- Fix or improve the implmenetation of the below method


function do_sth_with_PlayerParty(playerId, membername)
    player = Player(playerId)
    local party = player:getParty()
    
    for k,v in pairs(party:getMembers()) do
    if v == Player(membername) then
    party:removeMember(Player(membername))
    end
    end
    end