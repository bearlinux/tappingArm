bx=200; //body x
by=200;

hd=25.41; //hole diameter
hh=bx+2;
hb=5; //hole border

ax=bx+2;
ay=38.1;
az=19.3; // arm z
ab=10; //arm border

bz=hd+hb+1+az;

lsd=8; //large screw diameter
lsh=25;
ssd=5; //small screw diameter
ssh=20;
ssnd=6; //small screw diameter
cz=5; //cover thickness

module arm_mount(){
    difference(){
        cube([bx,by,bz]);
        translate([hb+hd/2,-1,hb+hd/2]){
            rotate([-90,0,0]){
                cylinder(d=hd,h=hh,$fn=200);
            }
        }
        translate([hb+hd/2,by/2,bz-lsh]){cylinder(d=lsd*0.75,h=lsh,$fn=60);}
        
        translate([-1,ab,bz-az]){
            cube([ax,ay,az]);
        }
        translate([260,0,0]){
            rotate([0,0,45]){
                cube([bx,by*2,bz]);
            }
        }
        
        
        translate([ab/2,ab/2,bz-ssh]){cylinder(d=ssd*0.75,h=ssh,$fn=60);}
        translate([bx/2,ab/2,bz-ssh]){cylinder(d=ssd*0.75,h=ssh,$fn=60);}
        translate([bx-ab/2,ab/2,bz-ssh]){cylinder(d=ssd*0.75,h=ssh,$fn=60);}
        
        translate([ab/2,ab+ay+ab/2,bz-ssh]){cylinder(d=ssd*0.75,h=ssh,$fn=60);}
        translate([bx/2,ab+ay+ab/2,bz-ssh]){cylinder(d=ssd*0.75,h=ssh,$fn=60);}
        translate([bx-ab/2,ab+ay+ab/2,bz-ssh]){cylinder(d=ssd*0.75,h=ssh,$fn=60);}
    }
}
module arm_mount_cover(){
    difference(){
        cube([bx,ab*2+ay,cz]);
        translate([ab/2,ab/2,0]){cylinder(d=ssnd,h=ssh,$fn=60);}
        translate([bx/2,ab/2,0]){cylinder(d=ssnd,h=ssh,$fn=60);}
        translate([bx-ab/2,ab/2,0]){cylinder(d=ssnd,h=ssh,$fn=60);}
        
        translate([ab/2,ab+ay+ab/2,0]){cylinder(d=ssnd,h=ssh,$fn=60);}
        translate([bx/2,ab+ay+ab/2,0]){cylinder(d=ssnd,h=ssh,$fn=60);}
        translate([bx-ab/2,ab+ay+ab/2,0]){cylinder(d=ssnd,h=ssh,$fn=60);}
    }
}
/*
translate([0,-60,0]){
    arm_mount_cover();
}
*/
arm_mount();