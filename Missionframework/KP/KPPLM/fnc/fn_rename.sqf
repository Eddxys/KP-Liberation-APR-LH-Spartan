/*
    KPPLM_fnc_rename

    File: fn_rename.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Modified by: [Your Name or leave as-is]
    Date: 2018-08-05
    Last Update: 2025-07-13

    Description:
    Set the new name for the group which is selected in the group list.
*/

// Dialog controls
private _dialog = findDisplay 75803;
private _ctrlGroupList = _dialog displayCtrl 758038;
private _ctrlEditName = _dialog displayCtrl 758039;
private _grp = KPPLM_groups select (lbCurSel _ctrlGroupList);

// Only allow change when player is group leader AND marked as KPLIB leader
if ((leader _grp == player) && {player getVariable ["KPLIB_lockLeader", false]}) then {
    _grp setGroupIdGlobal [ctrlText _ctrlEditName];

    // Refresh Dialog
    closeDialog 0;
    [{!dialog}, {call KPPLM_fnc_openDialog;}] call CBA_fnc_waitUntilAndExecute;
} else {
    hint localize "STR_KPPLM_NOTLEADER";  // Optionally update this string to a more specific message
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
};

true
