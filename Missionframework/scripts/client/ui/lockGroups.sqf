/*
    lockGroups.sqf
    Runs for every player after respawn.
    - If the unit is NOT marked as a leader, force him back
      into the original group when he tries to leave
    - Prevents non‑leaders from renaming the group
    - Blocks BIS group‑UI “Create group” button for non‑leaders
*/

params ["_unit"];

private _leaderMarked = _unit getVariable ["KPLIB_lockLeader", false];

if (!_leaderMarked) then {
    _unit addEventHandler ["GroupChanged", {
        (_this select 0) joinSilent (leader (_this select 1) call BIS_fnc_groupFromNetId);
    }];

    // Disable the default Create Group action (CBA or BIS)
    _unit enableTeamSwitch false;
} else {
    // Allow leader to rename group but not disband
    _unit addAction ["Rename group", {
        params ["_target", "_caller"];
        private _newName = ctrlText (findDisplay 101 displayCtrl 101);
        group _caller setGroupIdGlobal [_newName];
    }];
};
