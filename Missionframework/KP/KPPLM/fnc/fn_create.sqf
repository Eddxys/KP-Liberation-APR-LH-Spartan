/*
    KPPLM_fnc_create
    Modified to restrict group creation to squad leaders only.
*/

private _isLeader = player getVariable ["KPLIB_lockLeader", false];

// OPTIONAL: Or check for actual leader status
// private _isLeader = (player == leader group player);

if (!_isLeader) exitWith {
    hint "Only group leaders are allowed to create new groups.";
    closeDialog 0;
    false
};

private _grp = createGroup [(side player), true];
[player] join _grp;

// Refresh Dialog
closeDialog 0;
[{!dialog}, {call KPPLM_fnc_openDialog;}] call CBA_fnc_waitUntilAndExecute;

true
