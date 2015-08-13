#include <macro.h>
/*

		Author: Devilfloh
		
*/
private["_val"];
_val = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_val > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_val < 0) exitWith {};
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
		if(_val > life_cash) exitWith {hint localize "STR_ATM_NotEnoughCash"};
		if(_val < 2) exitWith {hint localize "STR_ATM_WithdrawMin1"}; //Temp fix for something
		
		life_cash = life_cash - _val;
		life_atmbank = life_atmbank + _val;

		hint format[localize "STR_ATM_DepositMSG",[_val] call life_fnc_numberText];
		[] call life_fnc_atmMenu;
		[6] call SOCK_fnc_updatePartial;
	};
	case 1:
	{
		if(_val > life_cash) exitWith {hint localize "STR_NOTF_NotEnoughGFunds"};
		if(_val < 2) exitWith {hint localize "STR_ATM_WithdrawMin1"}; //Temp fix for something

		__SUB__(life_cash,_val);
		_gFund = grpPlayer getVariable ["gang_bank",0];
		_gFund = _gFund + _val;
		grpPlayer setVariable ["gang_bank",_gFund,true];

		hint format[localize "STR_ATM_DepositGangBar",[_val] call life_fnc_numberText];
		[] call life_fnc_atmMenu;
		[] call SOCK_fnc_updateRequest; //Silent Sync
		[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
	};
};

