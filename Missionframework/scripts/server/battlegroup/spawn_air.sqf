params [
    ["_objective", [0, 0, 0], [[]], [3]],
    ["_min", 0, [0]]
];

private _first_objective = _objective;

// Exit early if no plane types defined
if (KPLIB_o_planes isEqualTo []) exitWith { false };

// Determine number of planes based on enemy readiness
private _planes_number = ((floor linearConversion [40, 100, KPLIB_enemyReadiness, 1, 3]) min 3) max _min;
if (_planes_number < 1) exitWith {};


private _class = selectRandom KPLIB_o_planes;

// Sort and pick closest air spawn marker
private _spawnPoint = ([KPLIB_sectors_airSpawn, [_first_objective], {(markerPos _x) distance _first_objective}, "ASCEND"] call BIS_fnc_sortBy) select 0;
if (isNil "_spawnPoint" || {markerPos _spawnPoint isEqualTo [0,0,0]}) exitWith {
    diag_log format ["[KP LIBERATION] Invalid air spawn point: %1", _spawnPoint];
    false
};

// Create enemy air group
private _grp = createGroup [KPLIB_side_enemy, true];

for "_i" from 1 to _planes_number do {
    // Spawn offset and position
    private _basePos = markerPos _spawnPoint;
    private _offset = [500 - random 1000, 500 - random 1000, 0];
    private _spawnPos = _basePos vectorAdd _offset;
    _spawnPos set [2, 200];  // Set altitude to 200

    private _plane = createVehicle [_class, _spawnPos, [], 0, "FLY"];
    createVehicleCrew _plane;
    _plane flyInHeight (100 + random 300);
    [_plane] call KPLIB_fnc_addObjectInit;


    _plane addMPEventHandler ["MPKilled", {
        params ["_unit", "_killer"];
        ["KPLIB_manageKills", [_unit, _killer]] call CBA_fnc_localEvent;
    }];
    {
        _x addMPEventHandler ["MPKilled", {
            params ["_unit", "_killer"];
            ["KPLIB_manageKills", [_unit, _killer]] call CBA_fnc_localEvent;
        }];
    } forEach (crew _plane);

    // Assign to group
    (crew _plane) joinSilent _grp;

    sleep 5;
};


{ deleteWaypoint _x } forEachReversed waypoints _grp;
sleep 1;


{ _x doFollow leader _grp } forEach units _grp;
sleep 1;


private _behaviours = ["AWARE", "COMBAT", "STEALTH"];
private _combatModes = ["YELLOW", "RED", "GREEN"];
private _speeds = ["FULL", "NORMAL", "LIMITED"];


for "_i" from 1 to 2 do {
    private _wp = _grp addWaypoint [_first_objective, 500];
    _wp setWaypointType "MOVE";
    _wp setWaypointSpeed selectRandom _speeds;
    _wp setWaypointBehaviour selectRandom _behaviours;
    _wp setWaypointCombatMode selectRandom _combatModes;
};


for "_i" from 1 to 4 do {
    private _wp = _grp addWaypoint [_first_objective, 500];
    _wp setWaypointType "SAD";
    _wp setWaypointSpeed selectRandom _speeds;
    _wp setWaypointBehaviour selectRandom _behaviours;
    _wp setWaypointCombatMode selectRandom _combatModes;
};


private _cycleWP = _grp addWaypoint [_first_objective, 500];
_cycleWP setWaypointType "CYCLE";


_grp addEventHandler ["WaypointCompleted", {
    params ["_grp", "_wpIndex"];
    if (_wpIndex == (count waypoints _grp) - 1) then {
        _grp setCurrentWaypoint [_grp, 1];
    };
}];


_grp setCurrentWaypoint [_grp, 1];
