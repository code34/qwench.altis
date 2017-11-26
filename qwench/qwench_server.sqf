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

	diag_log "----------------------------------------------------------------------------------------------------";
	diag_log "---------------------------------- QWENCH SERVER INIT -----------------------------------";
	diag_log "----------------------------------------------------------------------------------------------------";

	call compile preprocessFileLineNumbers "qwench\objects\oo_bme.sqf";
	call compile preprocessFileLineNumbers "qwench\objects\oo_extdb3.sqf";

	diag_log "----------------------------------------------------------------------------------------------------";
	diag_log "---------------------------------- INITIALIZE DATABASE  -----------------------------------";
	diag_log "----------------------------------------------------------------------------------------------------";
	
	private _extdb3 = NEW(OO_EXTDB3, nil);
	_result = "isDllEnabled" call _extdb3;
	if!(_result) exitWith { 
		hintc "QWENCH: extdb3 addon load failed";
		diag_log "QWENCH: extdb3 addon load failed";
	};

	["setIniSectionDatabase", _db_inisection] call _extdb3;
	["setDatabaseName", _db_databasename] call _extdb3;
	["setQueryType", _db_sqltype] call _extdb3;
	_result = "connect" call _extdb3;
	qwench_extdb3 = _extdb3;

	if!(_result) exitWith { 
		hintc "QWENCH INIT DB FAILED - check DB is ON or DB credentials";
		diag_log "QWENCH INIT DB FAILED - check DB is ON or DB credentials";
	};

	diag_log "----------------------------------------------------------------------------------------------------";
	diag_log "---------------------------------- INITIALIZE BUS MESSAGE--------------------------------";
	diag_log "----------------------------------------------------------------------------------------------------";
	
	if((isServer) and (isDedicated)) then { qwench_bmeserver = NEW(OO_BME, nil);};
	qwenchIsAlive = { true;};

	diag_log "----------------------------------------------------------------------------------------------------";
	diag_log "---------------------------------- QWENCH SERVER SUCCESS ----------------------------";
	diag_log "----------------------------------------------------------------------------------------------------";
