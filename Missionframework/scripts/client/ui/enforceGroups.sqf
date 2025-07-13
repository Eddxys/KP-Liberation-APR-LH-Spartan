// enforceGroups.sqf
params ["_unit"];

if (!hasInterface || !isMultiplayer) exitWith {}; // Only run for players in MP

// Delay to allow full player group setup
waitUntil { !isNull _unit && alive _unit };

// If player is a leader, leave them alone
if (_unit getVariable ["KPLIB_lockLeader", false]) exitWith {};

// Get current group and check for leader
private _grp = group _unit;
private _leader = leader _grp;

// If current group leader is a valid player leader, do nothing
if (_leader getVariable ["KPLIB_lockLeader", false]) exitWith {};

// Find a group with a leader
private _found = false;
{
    if (
        (_x != _grp) && // Not current group
        ({isPlayer _x} count units _x > 0) && // Has players
        ((leader _x) getVariable ["KPLIB_lockLeader", false]) // Leader is valid
    ) exitWith {
        [_unit] joinSilent _x;
        _found = true;
    };
} forEach allGroups;

// If no valid group found, optionally just create one controlled by HC or something
if (!_found) then {
    // As fallback, join player's side default group leader (if defined)
    systemChat format ["%1 could not find valid group with leader.", name _unit];
};
