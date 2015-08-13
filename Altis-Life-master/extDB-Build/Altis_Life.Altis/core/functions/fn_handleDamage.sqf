#include <macro.h>
/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	Edit: Devilfloh
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = SEL(_this,0);
_part = SEL(_this,1);
_damage = SEL(_this,2);
_source = SEL(_this,3);
_projectile = SEL(_this,4);

if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if(_projectile in ["B_9x21_Ball","B_556x45_UW_mag"] && _curWep in ["hgun_P07_snds_F","arifle_sdar_F"]) then {
			if(side _source == west && playerSide != west) then {
				private["_distance","_isVehicle","_isQuad"];
				_impact = 0;
				_distance = 0;
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				switch(true) do {
					case ((EQUAL(_curWep,"hgun_P07_snds_F")) && (EQUAL(_projectile,"B_9x21_Ball"))):
					{
						_istazer = true;
						_distance = 100;
						_impact = 30;
					};

					case ((EQUAL(_curWep,"arifle_sdar_F")) && (EQUAL(_projectile,"B_556x45_UW_mag"))):
					{
						_istazer = true;
						_distance = 1000;
						_impact = 40;
					};
				};
				
				_damage = false;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit GVAR ["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							//player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						} else {
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			};
			
			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = false;
			};
		};
	};
};
[] call life_fnc_hudUpdate;
_damage;