/*
    File: synchronise_vars_deltaClient.sqf
    Purpose: Listen to delta and full sync from server
*/

scriptName "synchronise_vars_deltaClient";

if (!hasInterface) exitWith {};

diag_log "[SYNC-DEBUG] Client delta script started.";

private _applySyncState = {
    params ["_data"];
    KPLIB_fob_resources = _data select 0;
    KPLIB_supplies_global = _data select 1;
    KPLIB_ammo_global = _data select 2;
    KPLIB_fuel_global = _data select 3;
    unitcap = _data select 4;
    KPLIB_heli_count = _data select 5;
    KPLIB_plane_count = _data select 6;
    KPLIB_heli_slots = _data select 7;
    KPLIB_plane_slots = _data select 8;
    KPLIB_enemyReadiness = _data select 9;
    resources_intel = _data select 10;
    infantry_cap = _data select 11;
    KPLIB_civ_rep = _data select 12;
    KPLIB_guerilla_strength = _data select 13;
    infantry_weight = _data select 14;
    armor_weight = _data select 15;
    air_weight = _data select 16;
};

// This stores the latest full state
KPLIB_synced_state = [];

"sync_vars_full" addPublicVariableEventHandler {
    params ["_varName", "_data"];
    diag_log format ["[SYNC-DEBUG] Received FULL sync rev %1", _data select 0];
    KPLIB_synced_state = _data select 1;
    [_data select 1] call _applySyncState;
};


"sync_vars_delta" addPublicVariableEventHandler {
    params ["_varName", "_delta"];
    private _rev = _delta select 0;
    private _changes = _delta select 1;
    diag_log format ["[SYNC-DEBUG] Received DELTA sync rev %1", _rev];

    {
        private _idx = _x select 0;
        private _val = _x select 1;
        KPLIB_synced_state set [_idx, _val];
    } forEach _changes;

    [KPLIB_synced_state] call _applySyncState;
};

one_synchro_done = true;
synchro_done = true;
