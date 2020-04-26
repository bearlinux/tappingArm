bx=60; //body x
by=60;
bz=60;
hd=25.41; //hole diameter
hz=bz+2;
ax=19.3; // arm x
ay=2*by;
az=38.1;

lsd=7.5; //large screw diameter
lsh=25;
ssd=4.7; //small screw diameter
ssh=20;
ssnd=5.1; //small screw diameter
cz=5; //cover thickness


module armMount(){
    difference(){
        cube([bx,by,bz]);
        
        //hole
        translate([ 5+(hd/2),(by/2),0-((hz-bz)/2)]){
            cylinder(d=hd,h=hz,$fn=180);
        }
        //screw for hole
        translate([ 5+(hd/2),-1,bz/2]){
            rotate([-90,0,0]){
                cylinder(d=lsd,h=lsh);
            }
        }
        
        translate([bx-ax,0-(ay-by)/2,(bz-az)/2]){
            cube([ax,ay,az]);
        }
        
        //screw for hole bottom front
        translate([ bx+1,5,5]){
            rotate([0,-90,0]){
                cylinder(d=ssd,h=ssh);
            }
        }
        
        //screw for hole bottom back
        translate([ bx+1,by-5,5]){
            rotate([0,-90,0]){
                cylinder(d=ssd,h=ssh);
            }
        }
        //screw for hole top front
        translate([ bx+1,5,bz-5]){
            rotate([0,-90,0]){
                cylinder(d=ssd,h=ssh);
            }
        }
        
        //screw for hole top back
        translate([ bx+1,by-5,bz-5]){
            rotate([0,-90,0]){
                cylinder(d=ssd,h=ssh);
            }
        }
    }
}

module armMountPlate(){
    difference(){
        cube([bz,by,cz]);
       
        //screw for hole bottom front
        translate([ 5,5,-1]){
                cylinder(d=ssnd,h=ssh);
        }
        
        //screw for hole bottom back
        translate([ 5,by-5,-1]){
                cylinder(d=ssnd,h=ssh);
        }
        //screw for hole top front
        translate([ bz-5,5,-1]){
                cylinder(d=ssnd,h=ssh);
        }
        
        //screw for hole top back
        translate([ bz-5,by-5,-1]){
                cylinder(d=ssnd,h=ssh);
        }

    }
}
//armMountPlate();
armMount();