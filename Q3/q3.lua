-- Author: Alexis Gabiola
-- This is Q3 of the Technical Test provided by Tavernlight Games

-- Fix or improve the name and the implementation of the below method

-- This function removes a player from their respective party
function remove_player_from_PlayerParty(playerId, membername)
    player = Player(playerId)
    local party = player:getParty()

    -- Create set to store members of party
    local members = {}
    for _, k in ipairs(party:getMembers()) do members[k] = true
    end

    -- Searches set and removes player if found in party
    if members[Player(membername)] then
        party:removeMember(Player(membername))
    end
end
