#include <macro.h>
/*

		Author: Devilfloh
		
*/
private["_display","_text","_units","_type"];

if(!life_use_atm) exitWith
{
	hint localize "STR_Shop_ATMRobbed";
};

if(!dialog) then
{
	if(!(createDialog "Life_atm_management")) exitWith {};
};

disableSerialization;

_display = findDisplay 2700;
_text = _display displayCtrl 2701;

switch (playerSide) do
{
	case civilian:
	{
		if(isNil {(grpPlayer getVariable "gang_bank")}) then 
		{
			_text ctrlSetStructuredText parseText format["<img size='3.4' image='icons\gangbank.paa'/><t size='2.0px'> %1<br/><img size='3.4' image='icons\bank.paa'/><t size='2.0px'> € %2<br/><img size='3.2' image='icons\money.paa'/> € %3</t>","In keiner Gang",[life_atmbank] call life_fnc_numberText,[life_cash] call life_fnc_numberText];
		}else
		{
			_text ctrlSetStructuredText parseText format["<img size='3.4' image='icons\gangbank.paa'/><t size='2.0px'> € %1<br/><img size='3.4' image='icons\bank.paa'/><t size='2.0px'> € %2<br/><img size='3.2' image='icons\money.paa'/> € %3</t>",[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,[life_atmbank] call life_fnc_numberText,[life_cash] call life_fnc_numberText];
		};
	};
	case west:
	{
		_text ctrlSetStructuredText parseText format["<img size='3.4' image='icons\bank.paa'/><t size='2.0px'> € %1<br/><img size='3.2' image='icons\money.paa'/> € %2</t>",[life_atmbank] call life_fnc_numberText,[life_cash] call life_fnc_numberText];
	};
	case independent:
	{
		_text ctrlSetStructuredText parseText format["<img size='3.4' image='icons\bank.paa'/><t size='2.0px'> € %1<br/><img size='3.2' image='icons\money.paa'/> € %2</t>",[life_atmbank] call life_fnc_numberText,[life_cash] call life_fnc_numberText];
	};
};