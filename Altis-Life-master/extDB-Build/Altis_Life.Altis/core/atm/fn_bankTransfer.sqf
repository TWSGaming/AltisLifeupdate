#include <macro.h>
/*

		Author: Devilfloh
		
*/
private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);

if(_val > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if((lbCurSel 2703) == -1) exitWith {hint localize "STR_ATM_NoneSelected"};

_index = lbCurSel 2703;
switch (_index) do
{
	case -1:
	{
		hint localize "STR_ATM_NoneSelected";
	};
	case 0:
	{
		if(_val > life_atmbank) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};
		if(_val < 2) exitWith {hint localize "STR_ATM_WithdrawMin3"}; //Temp fix for something

		__SUB__(life_atmbank,_val);
		_gFund = grpPlayer getVariable ["gang_bank",0];
		_gFund = _gFund + _val;
		grpPlayer setVariable ["gang_bank",_gFund,true];

		hint format[localize "STR_ATM_DepositGang",[_val] call life_fnc_numberText];
		[] call life_fnc_atmMenu;
		[] call SOCK_fnc_updateRequest; //Silent Sync
		[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
	};
	case 1:
	{
		_gFund = grpPlayer getVariable ["gang_bank",0];
		if(_val > _gFund) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};
		if(_val < 2) exitWith {hint localize "STR_ATM_WithdrawMin3"}; //Temp fix for something

		__SUB__(_gFund,_val);
		grpPlayer setVariable ["gang_bank",_gFund,true];

		life_atmbank = life_atmbank + _val;

		hint format[localize "STR_ATM_WithdrawGang",[_val] call life_fnc_numberText];
		[] call life_fnc_atmMenu;
		[] call SOCK_fnc_updateRequest; //Silent Sync
		[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
	};
	default 
	{
		_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
		if(isNull _unit) exitWith {};
		if(isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
		if(_val > life_atmbank) exitWith {hint localize "STR_ATM_NotEnough"};
		if(_val < 2) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something
		_tax = [_val] call life_fnc_taxRate;
		if((_val + _tax) > life_atmbank) exitWith {hint format[localize "STR_ATM_SentMoneyFail",_val,_tax]};

		life_atmbank = life_atmbank - (_val + _tax);

		[[_val,profileName],"clientWireTransfer",_unit,false] spawn life_fnc_MP;
		[] call life_fnc_atmMenu;
		hint format[localize "STR_ATM_SentMoneySuccess",[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText];
		[1] call SOCK_fnc_updatePartial;
	};
};
