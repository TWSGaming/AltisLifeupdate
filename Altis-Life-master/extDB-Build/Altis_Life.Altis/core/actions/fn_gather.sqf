#include <macro.h>
/*
File: fn_gather.sqf
Author: Bryan "Tonic" Boardwine
Edit: Devilfloh
Description:
Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_resourceZones","_zone"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1","lead_1","iron_1","salt_1","sand_1","diamond_1","oil_1","oil_2","rock_1"];
_zone = "";
_tool = "";
if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
life_action_gathering = true;
//Find out what zone we're near
{
if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(EQUAL(_zone,"")) exitWith {life_action_gathering = false;};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = ["apple",3];_tool = "";};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = ["peach",3];_tool = "";};
	case (_zone in ["heroin_1"]): {_gather = ["heroin_unprocessed",1];_tool = "";};
	case (_zone in ["cocaine_1"]): {_gather = ["cocaine_unprocessed",1];_tool = "";};
	case (_zone in ["weed_1"]): {_gather = ["cannabis",1];_tool = "";};
	
	case (_zone in ["lead_1"]): {_gather = ["copper_unrefined",2];_tool = "pickaxe";};
	case (_zone in ["iron_1"]): {_gather = ["iron_unrefined",2];_tool = "pickaxe";};
	case (_zone in ["salt_1"]): {_gather = ["salt_unrefined",4];_tool = "pickaxe";};
	case (_zone in ["sand_1"]): {_gather = ["sand",5];_tool = "pickaxe";};
	case (_zone in ["diamond_1"]): {_gather = ["diamond_uncut",2];_tool = "pickaxe";};
	case (_zone in ["oil_1","oil_2"]): {_gather = ["oil_unprocessed",2];_tool = "pickaxe";};
	case (_zone in ["rock_1"]): {_gather = ["rock",2];_tool = "pickaxe";};
default {""};
};
//gather check??
if(vehicle player != player) exitWith {};

if (_tool != "" && {if (EQUAL(ITEM_VALUE(_tool),0)) exitWith { true };false}) exitWith {hint format ["You need a %1",_tool];life_action_gathering = false;};


_diff = [SEL(_gather,0),SEL(_gather,1),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(EQUAL(_diff,0)) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_gathering = true;

for "_i" from 0 to 2 do {
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
sleep 2.5;
};

if(([true,SEL(_gather,0),_diff] call life_fnc_handleInv)) then {
_itemName = M_CONFIG(getText,"VirtualItems",SEL(_gather,0),"displayName");
titleText[format[localize "STR_NOTF_Gather_Success",(localize _itemName),_diff],"PLAIN"];
};

life_action_gathering = false;