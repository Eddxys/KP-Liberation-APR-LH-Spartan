scriptName "manage_time";

// Apply a time multiplier if it's night time
while {true} do {
    // So if default time accel is 4, night time accell will be 4 * 3 (or 12 hours per hour)
    _nightTimeAccelFactor = 3;

    // Make dawn "come" half an hour earlier (so timeAccel shuts off a little early) - 0 if you want exact dawn
    _dawnOffset = -0.5;

    // Make sunset "come" half an hour later (so timeAccel starts a little later) - 0 if you want exact sunset
    _sunsetOffset = +0.5;

    _actualDawn = (date call BIS_fnc_sunriseSunsetTime) select 0;
    _actualSunset = (date call BIS_fnc_sunriseSunsetTime) select 1;
    // Calculate dawn and sunset (decimal 24hr format) *correct for date on the map*
    _dawnOffsetted = _actualDawn + _dawnOffset;
    _sunsetOffsetted = _actualSunset + _sunsetOffset;

    // True only if current time is after dawn and before sunset
    _isNightTime = !(dayTime > _dawnOffsetted && dayTime < _sunsetOffsetted);

    if (KPLIB_param_shorterNights && _isNightTime) then {
        setTimeMultiplier (KPLIB_param_timeMulti * _nightTimeAccelFactor);
    } else {
        setTimeMultiplier KPLIB_param_timeMulti;
    };
    sleep 10;
};