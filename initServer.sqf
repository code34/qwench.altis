	/*  QWENCH CODE */
	call compile preprocessFileLineNumbers "qwench\qwench_server.sqf";
	/* END QWENCH CODE */

	//setWeapon = {
	//	private _weapon = _this select 0;
	//	private _life = _this select 1;
	//	private _query = format ['INSERT INTO player (arme, vie) VALUES ("%1", "%2")', _weapon, _life];
	//	_result = ["executeQuery", _query] call qwench_extdb3;
	//	if(_result isEqualTo []) then { true; } else { false;};
	//};