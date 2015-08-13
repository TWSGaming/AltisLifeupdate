#include <macro.h>
/*

		Author: Devilfloh
		
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};

_index = lbCurSel 2703;
switch (_index) do
{
	case -1:
	{
		hint localize "STR_ATM_NoneSelected";
	};
	case 0:
	{
		if(_val > life_atmbank) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
		if(_val < 2) exitWith {hint localize "STR_ATM_WithdrawMin2"}; //Temp fix for something.

		life_cash = life_cash + _val;
		life_atmbank = life_atmbank - _val;
		hint format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText];
		[] call life_fnc_atmMenu;
		[6] call SOCK_fnc_updatePartial; //Silent Sync

	};
	case 1:
	{
		_gFund = grpPlayer getVariable ["gang_bank",0];
		if(_val > _gFund) exitWith {hint localize "STR_NOTF_NotEnoughGFunds"};
		if(_val < 2) exitWith {hint localize "STR_ATM_WithdrawMin2"}; //Temp fix for something
		
		__SUB__(_gFund,_val);
		grpPlayer setVariable ["gang_bank",_gFund,true];

		life_cash = life_cash + _val;

		hint format[localize "STR_ATM_WithdrawGangBar",[_val] call life_fnc_numberText];
		[] call life_fnc_atmMenu;
		[] call SOCK_fnc_updateRequest; //Silent Sync
		[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
	};
};