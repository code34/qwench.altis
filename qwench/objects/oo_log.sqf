	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2017-2018 Nicolas BOITEUX

	CLASS OO_LOG

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

	#include "oop.h"

	CLASS("OO_LOG")
		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_LOG::constructor")
		};

		/*
			Add logs
		*/
		PUBLIC FUNCTION("string","log") {
			DEBUG(#, "OO_LOG::log")
			diag_log "----------------------------------------------------------------------------------------------------";
			diag_log format["QWENCH: %1", _this];
			diag_log "----------------------------------------------------------------------------------------------------";
		};

		/*
			Add error logs
		*/
		PUBLIC FUNCTION("string","errorlog") {
			DEBUG(#, "OO_LOG::errorlog")
			diag_log format["QWENCH ERROR: %1", _this];
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_LOG::deconstructor")
		};
	ENDCLASS;