/*
@file Name: ToxicGas.sqf
@file Author: Mokey
@file Description: Toxic Gas addon for A3W
@web: http://www.fractured-gaming.com
@Special Thanks to Pitoucc, CREAMPIE, and Izzer
-----------------------------------------------------------------------
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
For more for see <http://www.gnu.org/licenses/>.
-----------------------------------------------------------------------

*/

//Edit Gas Execptions here
_gasMask = [
            "H_CrewHelmetHeli_B",
            "H_CrewHelmetHeli_O",
            "H_CrewHelmetHeli_I",
            "H_HelmetO_ViperSP_ghex_F",
            "H_HelmetO_ViperSP_hex_F"
          ];

_exemptVehicles = [
                    "B_MRAP_01_F",
                    "B_MRAP_01_hmg_F",
                    "B_MRAP_01_gmg_F",
                    "O_MRAP_02_F",
                    "O_MRAP_02_hmg_F",
                    "O_MRAP_02_gmg_F",
                    "I_MRAP_03_F",
                    "I_MRAP_03_hmg_F",
                    "I_MRAP_03_gmg_F",
                    "O_APC_Wheeled_02_rcws_v2_F",
                    "B_APC_Wheeled_01_cannon_F",
                    "I_APC_Wheeled_03_cannon_F",
                    "B_AFV_Wheeled_01_cannon_F",
                    "B_AFV_Wheeled_01_up_cannon_F",
                    "I_LT_01_scout_F",
                    "I_LT_01_cannon_F",
                    "I_LT_01_AT_F",
                    "I_LT_01_AA_F",
                    "B_APC_Tracked_01_CRV_F",
                    "B_APC_Tracked_01_rcws_F",
                    "I_APC_tracked_03_cannon_F",
                    "O_APC_Tracked_02_cannon_F",
                    "B_APC_Tracked_01_AA_F",
                    "O_APC_Tracked_02_AA_F",
                    "B_MBT_01_cannon_F",
                    "B_MBT_01_TUSK_F",
                    "O_MBT_02_cannon_F",
                    "I_MBT_03_cannon_F",
                    "O_T_MBT_04_cannon_F",
                    "O_T_MBT_04_command_F"
                  ];

setNoGasStatus = {
    "dynamicBlur" ppEffectEnable true;                  // enables ppeffect
    "dynamicBlur" ppEffectAdjust [0];                   // enables normal vision
    "dynamicBlur" ppEffectCommit 10;                    // time it takes to go back to normal vision
    resetCamShake;                                      // resets the shake
    20 fadeSound 1;                                     // fades the sound back to normal
};

setGasStatus = {
    "dynamicBlur" ppEffectEnable true;              	// enables ppeffect
    "dynamicBlur" ppEffectAdjust [12];             	  	// intensity of blur
	"dynamicBlur" ppEffectCommit 5;                 	// time till vision is fully blurred
	enableCamShake true;                             	// enables camera shake
	addCamShake [10, 45, 10];                        	// sets shakevalues
//	player setFatigue 1;                            	// sets the fatigue to 100%
	5 fadeSound 0.1;                                 	// fades the sound to 10% in 5 seconds
};

gasDamage = {
	player setDamage (damage player + 0.15);     		//damage per tick
	sleep 3;                                 		    // Timer damage is assigned "seconds"
};

While{true} do{

	call setNoGasStatus;

	waituntil{
        _smokeShell = nearestObject [getPosATL player, "SmokeShellYellow"];
	    _curPlayerInvulnState = player getVariable ["isAdminInvulnerable", false];
		_smokeShell distance player < 7
		&&
	    velocity _smokeShell isEqualTo [ 0, 0, 0 ]
	    &&
	    !_curPlayerInvulnState
	};

	if ((headgear player in _gasMask) || ((typeOf vehicle player) in _exemptVehicles)) then
	{
	    call setNoGasStatus;
	}
    else
	{
		call setGasStatus;
		call gasDamage;
	};
};//	@file Name: ToxicGas.sqf
//  @file Author: Mokey
//	@file Description: Toxic Gas addon for A3W
//	@web: http://www.fractured-gaming.com
//	@Special Thanks to Pitoucc, CREAMPIE, and Izzer

_gasMask = [
            "H_CrewHelmetHeli_B",
            "H_CrewHelmetHeli_O",
            "H_CrewHelmetHeli_I",
            "H_HelmetO_ViperSP_ghex_F",
            "H_HelmetO_ViperSP_hex_F"
          ];

_exemptVehicles = [
                    "B_MRAP_01_F",
                    "B_MRAP_01_hmg_F",
                    "B_MRAP_01_gmg_F",
                    "O_MRAP_02_F",
                    "O_MRAP_02_hmg_F",
                    "O_MRAP_02_gmg_F",
                    "I_MRAP_03_F",
                    "I_MRAP_03_hmg_F",
                    "I_MRAP_03_gmg_F",
                    "O_APC_Wheeled_02_rcws_v2_F",
                    "B_APC_Wheeled_01_cannon_F",
                    "I_APC_Wheeled_03_cannon_F",
                    "B_AFV_Wheeled_01_cannon_F",
                    "B_AFV_Wheeled_01_up_cannon_F",
                    "I_LT_01_scout_F",
                    "I_LT_01_cannon_F",
                    "I_LT_01_AT_F",
                    "I_LT_01_AA_F",
                    "B_APC_Tracked_01_CRV_F",
                    "B_APC_Tracked_01_rcws_F",
                    "I_APC_tracked_03_cannon_F",
                    "O_APC_Tracked_02_cannon_F",
                    "B_APC_Tracked_01_AA_F",
                    "O_APC_Tracked_02_AA_F",
                    "B_MBT_01_cannon_F",
                    "B_MBT_01_TUSK_F",
                    "O_MBT_02_cannon_F",
                    "I_MBT_03_cannon_F",
                    "O_T_MBT_04_cannon_F",
                    "O_T_MBT_04_command_F"
                  ];

setNoGasStatus = {
    "dynamicBlur" ppEffectEnable true;                  // enables ppeffect
    "dynamicBlur" ppEffectAdjust [0];                   // enables normal vision
    "dynamicBlur" ppEffectCommit 10;                    // time it takes to go back to normal vision
    resetCamShake;                                      // resets the shake
    20 fadeSound 1;                                     // fades the sound back to normal
};

setGasStatus = {
    "dynamicBlur" ppEffectEnable true;              	// enables ppeffect
    "dynamicBlur" ppEffectAdjust [12];             	  	// intensity of blur
	"dynamicBlur" ppEffectCommit 5;                 	// time till vision is fully blurred
	enableCamShake true;                             	// enables camera shake
	addCamShake [10, 45, 10];                        	// sets shakevalues
//	player setFatigue 1;                            	// sets the fatigue to 100%
	5 fadeSound 0.1;                                 	// fades the sound to 10% in 5 seconds
};

gasDamage = {
	player setDamage (damage player + 0.15);     		//damage per tick
	sleep 3;                                 		    // Timer damage is assigned "seconds"
};

While{true} do{

	call setNoGasStatus;

	waituntil{
        _smokeShell = nearestObject [getPosATL player, "SmokeShellYellow"];
	    _curPlayerInvulnState = player getVariable ["isAdminInvulnerable", false];
		_smokeShell distance player < 7
		&&
	    velocity _smokeShell isEqualTo [ 0, 0, 0 ]
	    &&
	    !_curPlayerInvulnState
	};

	if ((headgear player in _gasMask) || ((typeOf vehicle player) in _exemptVehicles)) then
	{
	    call setNoGasStatus;
	}
    else
	{
		call setGasStatus;
		call gasDamage;
	};
};//	@file Name: ToxicGas.sqf
//  @file Author: Mokey
//	@file Description: Toxic Gas addon for A3W
//	@web: http://www.fractured-gaming.com
//	@Special Thanks to Pitoucc, CREAMPIE, and Izzer

_gasMask = [
            "H_CrewHelmetHeli_B",
            "H_CrewHelmetHeli_O",
            "H_CrewHelmetHeli_I",
            "H_HelmetO_ViperSP_ghex_F",
            "H_HelmetO_ViperSP_hex_F"
          ];

_exemptVehicles = [
                    "B_MRAP_01_F",
                    "B_MRAP_01_hmg_F",
                    "B_MRAP_01_gmg_F",
                    "O_MRAP_02_F",
                    "O_MRAP_02_hmg_F",
                    "O_MRAP_02_gmg_F",
                    "I_MRAP_03_F",
                    "I_MRAP_03_hmg_F",
                    "I_MRAP_03_gmg_F",
                    "O_APC_Wheeled_02_rcws_v2_F",
                    "B_APC_Wheeled_01_cannon_F",
                    "I_APC_Wheeled_03_cannon_F",
                    "B_AFV_Wheeled_01_cannon_F",
                    "B_AFV_Wheeled_01_up_cannon_F",
                    "I_LT_01_scout_F",
                    "I_LT_01_cannon_F",
                    "I_LT_01_AT_F",
                    "I_LT_01_AA_F",
                    "B_APC_Tracked_01_CRV_F",
                    "B_APC_Tracked_01_rcws_F",
                    "I_APC_tracked_03_cannon_F",
                    "O_APC_Tracked_02_cannon_F",
                    "B_APC_Tracked_01_AA_F",
                    "O_APC_Tracked_02_AA_F",
                    "B_MBT_01_cannon_F",
                    "B_MBT_01_TUSK_F",
                    "O_MBT_02_cannon_F",
                    "I_MBT_03_cannon_F",
                    "O_T_MBT_04_cannon_F",
                    "O_T_MBT_04_command_F"
                  ];

setNoGasStatus = {
    "dynamicBlur" ppEffectEnable true;                  // enables ppeffect
    "dynamicBlur" ppEffectAdjust [0];                   // enables normal vision
    "dynamicBlur" ppEffectCommit 10;                    // time it takes to go back to normal vision
    resetCamShake;                                      // resets the shake
    20 fadeSound 1;                                     // fades the sound back to normal
};

setGasStatus = {
    "dynamicBlur" ppEffectEnable true;              	// enables ppeffect
    "dynamicBlur" ppEffectAdjust [12];             	  	// intensity of blur
	"dynamicBlur" ppEffectCommit 5;                 	// time till vision is fully blurred
	enableCamShake true;                             	// enables camera shake
	addCamShake [10, 45, 10];                        	// sets shakevalues
//	player setFatigue 1;                            	// sets the fatigue to 100%
	5 fadeSound 0.1;                                 	// fades the sound to 10% in 5 seconds
};

gasDamage = {
	player setDamage (damage player + 0.15);     		//damage per tick
	sleep 3;                                 		    // Timer damage is assigned "seconds"
};

While{true} do{

	call setNoGasStatus;

	waituntil{
        _smokeShell = nearestObject [getPosATL player, "SmokeShellYellow"];
	    _curPlayerInvulnState = player getVariable ["isAdminInvulnerable", false];
		_smokeShell distance player < 7
		&&
	    velocity _smokeShell isEqualTo [ 0, 0, 0 ]
	    &&
	    !_curPlayerInvulnState
	};

	if ((headgear player in _gasMask) || ((typeOf vehicle player) in _exemptVehicles)) then
	{
	    call setNoGasStatus;
	}
    else
	{
		call setGasStatus;
		call gasDamage;
	};
};//	@file Name: ToxicGas.sqf
//  @file Author: Mokey
//	@file Description: Toxic Gas addon for A3W
//	@web: http://www.fractured-gaming.com
//	@Special Thanks to Pitoucc, CREAMPIE, and Izzer

_gasMask = [
            "H_CrewHelmetHeli_B",
            "H_CrewHelmetHeli_O",
            "H_CrewHelmetHeli_I",
            "H_HelmetO_ViperSP_ghex_F",
            "H_HelmetO_ViperSP_hex_F"
          ];

_exemptVehicles = [
                    "B_MRAP_01_F",
                    "B_MRAP_01_hmg_F",
                    "B_MRAP_01_gmg_F",
                    "O_MRAP_02_F",
                    "O_MRAP_02_hmg_F",
                    "O_MRAP_02_gmg_F",
                    "I_MRAP_03_F",
                    "I_MRAP_03_hmg_F",
                    "I_MRAP_03_gmg_F",
                    "O_APC_Wheeled_02_rcws_v2_F",
                    "B_APC_Wheeled_01_cannon_F",
                    "I_APC_Wheeled_03_cannon_F",
                    "B_AFV_Wheeled_01_cannon_F",
                    "B_AFV_Wheeled_01_up_cannon_F",
                    "I_LT_01_scout_F",
                    "I_LT_01_cannon_F",
                    "I_LT_01_AT_F",
                    "I_LT_01_AA_F",
                    "B_APC_Tracked_01_CRV_F",
                    "B_APC_Tracked_01_rcws_F",
                    "I_APC_tracked_03_cannon_F",
                    "O_APC_Tracked_02_cannon_F",
                    "B_APC_Tracked_01_AA_F",
                    "O_APC_Tracked_02_AA_F",
                    "B_MBT_01_cannon_F",
                    "B_MBT_01_TUSK_F",
                    "O_MBT_02_cannon_F",
                    "I_MBT_03_cannon_F",
                    "O_T_MBT_04_cannon_F",
                    "O_T_MBT_04_command_F"
                  ];

setNoGasStatus = {
    "dynamicBlur" ppEffectEnable true;                  // enables ppeffect
    "dynamicBlur" ppEffectAdjust [0];                   // enables normal vision
    "dynamicBlur" ppEffectCommit 10;                    // time it takes to go back to normal vision
    resetCamShake;                                      // resets the shake
    20 fadeSound 1;                                     // fades the sound back to normal
};

setGasStatus = {
    "dynamicBlur" ppEffectEnable true;              	// enables ppeffect
    "dynamicBlur" ppEffectAdjust [12];             	  	// intensity of blur
	"dynamicBlur" ppEffectCommit 5;                 	// time till vision is fully blurred
	enableCamShake true;                             	// enables camera shake
	addCamShake [10, 45, 10];                        	// sets shakevalues
//	player setFatigue 1;                            	// sets the fatigue to 100%
	5 fadeSound 0.1;                                 	// fades the sound to 10% in 5 seconds
};

gasDamage = {
	player setDamage (damage player + 0.15);     		//damage per tick
	sleep 3;                                 		    // Timer damage is assigned "seconds"
};

While{true} do{

	call setNoGasStatus;

	waituntil{
        _smokeShell = nearestObject [getPosATL player, "SmokeShellYellow"];
	    _curPlayerInvulnState = player getVariable ["isAdminInvulnerable", false];
		_smokeShell distance player < 7
		&&
	    velocity _smokeShell isEqualTo [ 0, 0, 0 ]
	    &&
	    !_curPlayerInvulnState
	};

	if ((headgear player in _gasMask) || ((typeOf vehicle player) in _exemptVehicles)) then
	{
	    call setNoGasStatus;
	}
    else
	{
		call setGasStatus;
		call gasDamage;
	};
};
