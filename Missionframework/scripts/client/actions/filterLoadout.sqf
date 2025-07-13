/*
    Removes everything the player is not allowed to have
    (based on KPLIB_arsenalAllowed built by the preset/role system)
*/
params ["_unit"];

private _allowed = +KPLIB_arsenalAllowed;          // master allow‑list
private _gear = items _unit + weapons _unit + magazines _unit;

{
    if !(_x in _allowed) then {
        if (primaryWeapon _unit == _x)   then { _unit removeWeaponGlobal _x };
        if (secondaryWeapon _unit == _x) then { _unit removeWeaponGlobal _x };
        if (handgunWeapon _unit == _x)   then { _unit removeWeaponGlobal _x };
        if (_unit hasWeapon _x)          then { _unit removeWeaponGlobal _x };
        _unit removeItems     _x;
        _unit removeMagazines _x;
        removeUniform _unit;
        removeVest _unit;
        removeBackpack _unit;
        removeHeadgear _unit;
        removeGoggles _unit;
    };
} forEach _gear;

