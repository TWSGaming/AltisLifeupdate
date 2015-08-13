#include <macro.h>
/*

		Author: Devilfloh
		
*/
private["_display","_text","_units","_type"];

if(!life_use_atm) exitWith
{
	hint localize "STR_Shop_ATMRobbed";
};

if(isNil {(grpPlayer getVariable "gang_bank")}) exitWith {
	hint "Du bist in keiner Gang.";
};

if(!dialog) then
{
	if(!(createDialog "Life_atm_management_gang")) exitWith {};
};

disableSerialization;

_display = findDisplay 92700;
_text = _display displayCtrl 92701;
_gangBank = grpPlayer getVariable "gang_bank";

_text ctrlSetStructuredText parseText format["<img size='1.7' image='icons\gangbank.paa'/> $%1<br/><img size='1.6' image='icons\money.paa'/> $%2",[_gangBank] call life_fnc_numberText,[life_cash] call life_fnc_numberText];
