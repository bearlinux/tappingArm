
tmx=60; //tap mount 
tmy=40;
tmz=80;

army=19.3;
armx=38.1;
armz=100;

sleeved=25.4; //sleeve diameter

screwd=8*.9;

module armbracket(){
    difference(){
        cube([tmx,tmy,tmz]);
        translate([-1,tmy/2,tmy/2]){
            rotate([0,90,0]){
                cylinder(d=sleeved,h=tmx+2,$fn=60);
            }
        }
        translate([tmx/2-armx/2,tmy/2-army/2,tmz/2]){
            cube([armx,army,armz]);
        }
        
        //arm mount hole
        translate([tmx/2,-1,tmz*.75]){
            rotate([-90,0,0]){
                cylinder(d=screwd,h=tmy+2);
            }
        }
        
        //sleeve screw hole
        translate([tmx/2,-1,tmz*.25]){
            rotate([-90,0,0]){
                cylinder(d=screwd,h=tmy+2);
            }
        }
        
    }
}
armbracket();