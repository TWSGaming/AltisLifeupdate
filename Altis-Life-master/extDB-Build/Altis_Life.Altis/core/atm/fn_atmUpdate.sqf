#include <macro.h>
/*

		Author: Devilfloh
		
*/

private ["_status","_display","_mainText","_button1","_text1","_button2","_text2","_button3","_text3","_moneyEdit","_playerList"];

_status = _this select 0;

disableSerialization;
_display = findDisplay 2700;

_mainText = _display displayCtrl 2799;
_button1 = _display displayCtrl 2710;
_text1 = _display displayCtrl 2711;
_button2 = _display displayCtrl 27201;
_text2 = _display displayCtrl 27211;
_button3 = _display displayCtrl 27301;
_text3 = _display displayCtrl 27311;

_moneyEdit = _display displayCtrl 2702;
_playerList = _display displayCtrl 2703;


switch (_status) do
{
	case "kontostand":
	{
		_mainText ctrlSetStructuredText parseText "<t font='TahomaB' align='center' size='3.0'>KONTOSTAND</t>";
		_button1 buttonSetAction "";
		_text1 ctrlSetStructuredText parseText "<t align='center'></t>";
		_button2 buttonSetAction "";
		_text2 ctrlSetStructuredText parseText "<t align='center'></t>";
		_button3 buttonSetAction "";
		_text3 ctrlSetStructuredText parseText "<t align='center'></t>";
		
		_moneyEdit ctrlShow false;
		_playerList ctrlShow false;
	};
	case "einzahlen":
	{
		_mainText ctrlSetStructuredText parseText "<t font='TahomaB' align='center' size='3.0'>EINZAHLUNG</t>";
		_button1 buttonSetAction "[] call life_fnc_bankDeposit";
		_text1 ctrlSetStructuredText parseText "<t align='center'>EINZAHLEN</t>";
		
		_moneyEdit ctrlShow true;
		_playerList ctrlShow true;
		
		lbClear _playerList;
		
		if(isNil {(grpPlayer getVariable "gang_bank")}) then
		{
			_playerList lbAdd "Bankkonto";
			_playerList lbSetData [(lbSize _playerList)-1,"bank"];
		}else
		{
			_playerList lbAdd "Bankkonto";
			_playerList lbSetData [(lbSize _playerList)-1,"bank"];
			_playerList lbAdd "Gangkonto";
			_playerList lbSetData [(lbSize _playerList)-1,"gang"];
		};
		
		lbSetCurSel [2703,0];
	};
	case "auszahlen":
	{
		_mainText ctrlSetStructuredText parseText "<t font='TahomaB' align='center' size='3.0'>AUSZAHLUNG</t>";
		_button1 buttonSetAction "[] call life_fnc_bankWithdraw";
		_text1 ctrlSetStructuredText parseText "<t align='center'>AUSZAHLEN</t>";
		
		_moneyEdit ctrlShow true;
		_playerList ctrlShow true;
		
		lbClear _playerList;
		
		if(isNil {(grpPlayer getVariable "gang_bank")}) then 
		{
			_playerList lbAdd "Bankkonto";
			_playerList lbSetData [(lbSize _playerList)-1,"bank"];
		}else
		{
			_playerList lbAdd "Bankkonto";
			_playerList lbSetData [(lbSize _playerList)-1,"bank"];
			_playerList lbAdd "Gangkonto";
			_playerList lbSetData [(lbSize _playerList)-1,"gang"];
		};
		
		lbSetCurSel [2703,0];
	};
	case "uberweisen":
	{
		_mainText ctrlSetStructuredText parseText "<t font='TahomaB' align='center' size='3.0'>UEBERWEISUNG</t>";
		_button1 buttonSetAction "[] call life_fnc_bankTransfer";
		_text1 ctrlSetStructuredText parseText "<t align='center'>UEBERWEISEN</t>";
		
		_moneyEdit ctrlShow true;
		_playerList ctrlShow true;
		
		lbClear _playerList;
		
		if(isNil {(grpPlayer getVariable "gang_bank")}) then
		{
		}else
		{
			_playerList lbAdd "Bankkonto -> Gangkonto";
			_playerList lbSetData [(lbSize _playerList)-1,"bankToGang"];
			_playerList lbAdd "Gangkonto -> Bankkonto";
			_playerList lbSetData [(lbSize _playerList)-1,"gangToBank"];
		};
		
		{
			if(alive _x) then
			{
				switch (side _x) do
				{
					case west: {_playerList lbAdd format["%1 (%2)",_x getVariable["realname",name _x],"Cop"];};
					case civilian: {_playerList lbAdd format["%1 (%2)",_x getVariable["realname",name _x],"Civ"];};
					case independent: {_playerList lbAdd format["%1 (%2)",_x getVariable["realname",name _x],"Med"];};
				};
				//_playerList lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
				_playerList lbSetData [(lbSize _playerList)-1,str(_x)];
			};
		} foreach playableUnits;

		lbSetCurSel [2703,0];
	};
};