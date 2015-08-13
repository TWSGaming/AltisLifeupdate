/*
	Author: Devilfloh
*/

//Bring me back to life.
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,FALSE];
[[life_corpse],"life_fnc_corpse",nil,false] spawn life_fnc_MP;
hideBody life_corpse;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

life_respawned = true;

[] call life_fnc_spawnMenu;