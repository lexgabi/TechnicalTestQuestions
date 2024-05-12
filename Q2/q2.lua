-- Author: Alexis Gabiola
-- This is Q2 of the Technical Test provided by Tavernlight Games

-- Fix or improve the implementation of the below method

-- This method is supposed to print names of all guilds that have a memberCount less than max members
function printSmallGuildNames(memberCount)
    -- Insert value of variable into query string
    local selectGuildQuery = string.format("SELECT name FROM guilds WHERE max_members > %d", memberCount)
    local resultId = db.storeQuery(selectGuildQuery)
    local guildName = result.getString("name")
    print(guildName)
end