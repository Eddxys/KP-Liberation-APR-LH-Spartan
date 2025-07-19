/*
    File: synchronise_vars_deltaServer.sqf
    Purpose: Efficient delta-based sync for KP Liberation
*/

scriptName "synchronise_vars_deltaServer";

if (!isServer) exitWith {};

diag_log "[SYNC-DEBUG] Server delta script started.";

// ---------- Wait for required globals ----------
waitUntil {!isNil "KPLIB_saveLoaded"};
waitUntil {!isNil "KPLIB_fob_resources"};
waitUntil {!isNil "KPLIB_supplies_global"};
waitUntil {!isNil "KPLIB_ammo_global"};
waitUntil {!isNil "KPLIB_fuel_global"};
waitUntil {!isNil "KPLIB_enemyReadiness"};
waitUntil {!isNil "unitcap"};
waitUntil {!isNil "KPLIB_heli_count"};
waitUntil {!isNil "KPLIB_plane_count"};
waitUntil {!isNil "KPLIB_heli_slots"};
waitUntil {!isNil "KPLIB_plane_slots"};
waitUntil {!isNil "resources_intel"};
waitUntil {!isNil "infantry_cap"};
waitUntil {!isNil "KPLIB_civ_rep"};
waitUntil {!isNil "KPLIB_guerilla_strength"};
waitUntil {!isNil "infantry_weight"};
waitUntil {!isNil "armor_weight"};
waitUntil {!isNil "air_weight"};
waitUntil {KPLIB_saveLoaded};

// ---------- Helper to collect current state ----------
private _collectState = {
    [
        KPLIB_fob_resources,       // 0
        KPLIB_supplies_global,     // 1
        KPLIB_ammo_global,         // 2
        KPLIB_fuel_global,         // 3
        unitcap,                   // 4
        KPLIB_heli_count,          // 5
        KPLIB_plane_count,         // 6
        KPLIB_heli_slots,          // 7
        KPLIB_plane_slots,         // 8
        KPLIB_enemyReadiness,      // 9
        resources_intel,           // 10
        infantry_cap,              // 11
        KPLIB_civ_rep,             // 12
        KPLIB_guerilla_strength,   // 13
        infantry_weight,           // 14
        armor_weight,              // 15
        air_weight                 // 16
    ]
};

// ---------- Initial sync ----------
private _currentState = [] call _collectState;
private _oldState = +_currentState;

sync_rev = 0;
sync_vars_full = [sync_rev, _currentState];
sync_vars_delta = [];
publicVariable "sync_vars_full";
publicVariable "sync_vars_delta";

private _lastFull = diag_tickTime;
private _fullEvery = 30; // seconds

// ---------- Main sync loop ----------
while {true} do {
    sleep 1;

    _currentState = [] call _collectState;
    private _changes = [];

    {
        private _oldVal = _oldState select _forEachIndex;
        if !(_x isEqualTo _oldVal) then {
            _changes pushBack [_forEachIndex, _x];
        };
    } forEach _currentState;

    if !(_changes isEqualTo []) then {
        sync_rev = sync_rev + 1;
        sync_vars_delta = [sync_rev, _changes];
        publicVariable "sync_vars_delta";
        _oldState = +_currentState;
    };

    if ((diag_tickTime - _lastFull) > _fullEvery) then {
        sync_rev = sync_rev + 1;
        sync_vars_full = [sync_rev, _currentState];
        publicVariable "sync_vars_full";
        _lastFull = diag_tickTime;
        _oldState = +_currentState;
    };
};
