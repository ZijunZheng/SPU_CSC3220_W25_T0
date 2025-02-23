Project Proposal
Single Player Deck Building Card Game
  Cards managed via relational database(s)
  LootTable is an entity composed of all cards in the game
  Cards added to "Collection" when lootbox opened
    Lootbox uses RNG to determine card data retrieved from LootTable to be used in the formation of a new Card object within the "Collection"
      "Collection" uses an entity table
      "Collection" is persistent between launches
  Cards in "Collection" can be added to "Decks"
    Decks use entity tables
    Decks can be created and destroyed
  The Collection has a many to many relationship with Decks 
  Cards used in match by creating temporary new "Active Deck" database
    This Deck maps cards to array indices, shuffles range of length equal to array
    This Deck is further subdivided into four portions:
      The Hand, the cards available for the players use
      The Board, the cards currently having an effect
        Cards in Board area are actively updated
      The Discard, played cards no longer having an effect
      The Draw, cards to be added to the hand
      When Cards change portions they are updated
      These portions will be where the majority of database operations occur in a game
    In progress games will have the "Active Deck" saved persistently every round. 
    
  Settings Tab
      User will be able use a slider to either turn down or up the volume
      User will be able to change the font or the size of the font
