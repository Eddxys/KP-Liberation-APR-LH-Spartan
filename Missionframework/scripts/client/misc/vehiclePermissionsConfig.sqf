// vehiclePermissionsConfig.sqf

VEHICLE_ROLE_PERMISSIONS = createHashMapFromArray [
    // Light Vehicles
    ["Car_F", ["rifleman", "crewman", "medic", "helicopterpilot", "fighterjet", "atspecialist", "automaticrifleman", "engineer", "grenadier", "ltspecialist", "sniper", "squadleader", "uavoperator", "commander"]],
    ["Boat_F", ["rifleman", "crewman", "medic", "helicopterpilot", "fighterjet", "atspecialist", "automaticrifleman", "engineer", "grenadier", "ltspecialist", "sniper", "squadleader", "uavoperator", "commander"]],

    // Helicopters
    ["Helicopter", ["helicopterpilot"]],

    // Planes
    ["Plane", ["fighterjet"]],

    // Tanks / APCs
    ["Tank", ["crewman"]]
];