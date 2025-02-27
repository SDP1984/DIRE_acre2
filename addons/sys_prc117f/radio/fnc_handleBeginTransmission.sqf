#include "script_component.hpp"
/*
 * Author: ACRE2Team
 * SHORT DESCRIPTION
 *
 * Arguments:
 * 0: ARGUMENT ONE <TYPE>
 * 1: ARGUMENT TWO <TYPE>
 *
 * Return Value:
 * RETURN VALUE <TYPE>
 *
 * Example:
 * [ARGUMENTS] call acre_sys_prc117f_fnc_handleBeginTransmission
 *
 * Public: No
 */

params ["_radioId", "_eventKind", "_eventData"];

if (_radioId isNotEqualTo GVAR(currentRadioId)) exitWith { true };

// If display is open
private _currentMenu = GET_STATE_DEF("currentMenu", "");
if (_currentMenu isEqualType "" && {_currentMenu != ""}) then {
    private _tmpMenu = HASH_GET(GVAR(Menus), _currentMenu);
    if (!isNil "_tmpMenu") then {
        _currentMenu = _tmpMenu;
    };
};

[_currentMenu, _currentMenu] call FUNC(renderMenu);

true;
