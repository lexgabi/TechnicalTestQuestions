// Author: Alexis Gabiola
// This is Q4 of the Technical Test provided by Tavernlight Games

// Assume all method calls work fine. Fix the memory leak issue in below method

#include <string>
#include <iostream>

using namespace std;

// This function is intended to add an Item class object to a Player class object
void Game::addItemToPlayer(const string& recipient, uint16_t itemId)
{
    // Class pointer to address of object of the Player class
    Player* player = g_game.getPlayerByName(recipient);

    // Check to see if player's memory address is non-null
    if (!player) {
        player = new Player(nullptr);
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            return;
        }
    }
    
    // Class pointer to address of object of the Item class
    Item* item = Item::CreateItem(itemId);
    
    // Check to see if item's memory address is non-null
    if (!item) {
        return;    
    }
        
    // Add item to player's internal inbox at any index
    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    // If player's status is offline, then save player's progress
    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
     }

    // Frees up memory allocated by 'new' call
     delete player;

}