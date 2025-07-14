// fn_hasVehiclePermission.sqf

params ["_player", "_vehicle"];

private _role = _player getVariable ["KPLIB_role", ""];
private _vehClass = typeOf _vehicle;

#include "..\scripts\client\misc\vehiclePermissionsConfig.sqf"

switch (_role) do {
    case "fighterjet": {
        _vehClass in VEHICLE_CLASSES_JETS
    };
    case "helicopterpilot": {
        _vehClass in VEHICLE_CLASSES_HELICOPTERS
    };
    case "crewman": {
        _vehClass in VEHICLE_CLASSES_HEAVY
    };
    default {
        // Anyone else can use light/boats only
        _vehClass in VEHICLE_CLASSES_LIGHT
    };
};
