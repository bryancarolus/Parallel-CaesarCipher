__kernel void encryption(int key,
					 __global char *ptVector, 
					 __global char *ctVector) {
	int gid = get_global_id(0); 
	if ((ptVector[gid]>= 'a') && (ptVector[gid] <= 'z')){   // treat lowercase
		ptVector[gid] = ptVector [gid] - 32 + key;
		if (ptVector[gid] > 'Z'){
			ptVector[gid] = ptVector[gid] - 'Z' + 'A' - 1;
		}else if (ptVector[gid] < 'A') {							
			ptVector[gid] = ptVector[gid] - 'A' + 'Z' + 1;		
		}
		ctVector[gid] = ptVector[gid];					
	}
	else if ((ptVector[gid] >= 'A') && (ptVector[gid] <= 'Z')) {	  // treat uppercase
		ptVector[gid] = ptVector[gid] + key;					
		if (ptVector[gid] > 'Z') {								
			ptVector[gid] = ptVector[gid] - 'Z' + 'A' - 1;			
		}
		else if (ptVector[gid] < 'A') {								
			ptVector[gid] = ptVector[gid] - 'A' + 'Z' + 1;		
		}
		ctVector[gid] = ptVector[gid];						
	}
	else {					// treat the other char as normal
		ctVector[gid] = ptVector[gid];
	}
}
