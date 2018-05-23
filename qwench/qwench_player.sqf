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

	call compile preprocessFileLineNumbers "qwench\objects\oo_bme.sqf";
	call compile preprocessFileLineNumbers "qwench\objects\oo_log.sqf";

	private _log = NEW(OO_LOG, nil);
	["log", "CLIENT INIT"] call _log;
	["log", "INITIALIZE BUS MESSAGE"] call _log;

	qwench_bme = NEW(OO_BME, nil);
	private _result = false;
	while { _result isEqualTo false} do { 
		_result= ["remoteCall", ["qwenchIsAlive", "" , 2, false]] call qwench_bme;
		sleep 0.1;
	};

	["log", "CLIENT INITIALIZATION SUCCESS"] call _log;
	_result;