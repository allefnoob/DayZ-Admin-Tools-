//Player only
if (!isDedicated) then {
  hotkey_hitme = 0;
  hotkey_tools = 0;
  dayz_spaceInterrupt = {
    private ["_dikCode", "_handled"];
    _dikCode =  _this select 1;
    _handled = false;
    if (_dikCode in actionKeys "User20" and hotkey_hitme == 0 and (time - dayz_lastCheckBit > 1)) then {
      dayz_lastCheckBit = time; hotkey_hitme = 1;
      debugmenu = player addAction ["Toggle Debug", "debug\playerstats.sqf"]; 
	};
    if (_dikCode in actionKeys "User20" and hotkey_hitme == 1 and (time - dayz_lastCheckBit > 1)) then {
      dayz_lastCheckBit = time; hintSilent ""; hotkey_hitme = 0;
	  player removeAction debugmenu
    };
    if (_dikCode in actionKeys "User19" and hotkey_tools == 0 and (time - dayz_lastCheckBit > 1)) then {
      dayz_lastCheckBit = time; hotkey_tools = 1;
      toolsmenu = player addAction ["Tools Menu", "admintools\AdminToolsMain.sqf"]; 
      };
    if (_dikCode in actionKeys "User19" and hotkey_tools == 1 and (time - dayz_lastCheckBit > 1)) then {
      dayz_lastCheckBit = time; hintSilent ""; hotkey_tools = 0;
	  player removeAction toolsmenu
    };
    if ((_dikCode == 0x3E or _dikCode == 0x0F or _dikCode == 0xD3) and (time - dayz_lastCheckBit > 10)) then {
      dayz_lastCheckBit = time;
    };
    _handled
  };
};