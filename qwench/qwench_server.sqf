	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2018 Nicolas BOITEUX

	QWENCH - REAL PLAY SERVER ENGINE

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
	*/

	#include "objects\oop.h"
	#include "qwench_config.sqf"

	call compile preprocessFileLineNumbers "qwench\objects\oo_bme.sqf";
	call compile preprocessFileLineNumbers "qwench\objects\oo_extdb3.sqf";
	call compile preprocessFileLineNumbers "qwench\objects\oo_log.sqf";

	private _log = NEW(OO_LOG, nil);
	["log", "SERVER INIT"] call _log;
	["log", "INITIALIZE DATABASE"] call _log;

	private _extdb3 = NEW(OO_EXTDB3, nil);
	_result = "isDllEnabled" call _extdb3;
	if!(_result) exitWith {
		hintc "QWENCH: extdb3 addon load failed";
		["errorlog", "Extdb3 addon load failed"] call _log;
	};

	["setIniSectionDatabase", _db_inisection] call _extdb3;
	["setDatabaseName", _db_databasename] call _extdb3;
	["setQueryType", _db_sqltype] call _extdb3;
	_result = "connect" call _extdb3;
	qwench_extdb3 = _extdb3;

	if!(_result) exitWith { 
		hintc "QWENCH INIT DB FAILED - check DB is ON or DB credentials";
		["errorlog", "Init DB failed - check DB is ON or DB credentials"] call _log;
	};

	["log", "INITIALIZE BUS MESSAGE"] call _log;
	if((isServer) and (isDedicated)) then { qwench_bme = NEW(OO_BME, nil);};
	qwenchIsAlive = { true;};

	["log", "SERVER INITIALIZATION SUCCESS"] call _log;