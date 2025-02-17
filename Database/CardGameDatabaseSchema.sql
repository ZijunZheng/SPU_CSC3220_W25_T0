--
-- File generated with SQLiteStudio v3.4.16 on Mon Feb 17 14:37:25 2025
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: BoardState
CREATE TABLE BoardState (
    BoardStateID INTEGER NOT NULL
                         PRIMARY KEY AUTOINCREMENT,
    CardID       INTEGER REFERENCES Card (CardID),
    PileID       ANY     REFERENCES Pile (PileID),
    MatchID      INTEGER REFERENCES Match (MatchID) 
                         NOT NULL
)
STRICT;


-- Table: Card
CREATE TABLE Card (
    CardID        INTEGER PRIMARY KEY AUTOINCREMENT,
    RarityID      INTEGER REFERENCES Rarity (RarityID),
    CardName      TEXT    UNIQUE
                          NOT NULL,
    ManaCost      INTEGER NOT NULL,
    NumberOfCards ANY     NOT NULL,
    Ability       TEXT,
    CardType      TEXT    NOT NULL
)
STRICT;


-- Table: Creature
CREATE TABLE Creature (
    Attack INTEGER NOT NULL,
    Health INTEGER NOT NULL,
    CardID INTEGER REFERENCES Card (CardID) 
)
STRICT;


-- Table: Deck
CREATE TABLE Deck (
    DeckID   INTEGER PRIMARY KEY AUTOINCREMENT,
    DeckSize INTEGER NOT NULL,
    DeckName TEXT    UNIQUE
                     NOT NULL
)
STRICT;


-- Table: Decklist
CREATE TABLE Decklist (
    DecklistID    INTEGER PRIMARY KEY AUTOINCREMENT,
    NumberOfCards INTEGER NOT NULL,
    DeckID        INTEGER REFERENCES Deck (DeckID),
    CardID        INTEGER REFERENCES Card (CardID) 
)
STRICT;


-- Table: Match
CREATE TABLE Match (
    MatchID      INTEGER PRIMARY KEY AUTOINCREMENT
                         NOT NULL,
    PlayerHealth INTEGER NOT NULL,
    CurrentTurn  INTEGER NOT NULL,
    ManaSpent    INTEGER NOT NULL
)
STRICT;


-- Table: Pile
CREATE TABLE Pile (
    PileID   INTEGER PRIMARY KEY AUTOINCREMENT,
    PileType TEXT    UNIQUE
                     NOT NULL
)
STRICT;


-- Table: Rarity
CREATE TABLE Rarity (
    RarityID     INTEGER PRIMARY KEY AUTOINCREMENT,
    RarityType   TEXT    NOT NULL
                         UNIQUE,
    RarityChance INTEGER NOT NULL
)
STRICT;


-- Table: Speed
CREATE TABLE Speed (
    SpeedID   INTEGER PRIMARY KEY AUTOINCREMENT,
    CastSpeed TEXT    UNIQUE
                      NOT NULL
)
STRICT;


-- Table: Spell
CREATE TABLE Spell (
    SpeedID INTEGER REFERENCES Speed (SpeedID),
    CardID  INTEGER REFERENCES Card (CardID) 
)
STRICT;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
