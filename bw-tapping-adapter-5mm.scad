
bd=40; //body top diameter
tbd=25.4; //body bottom diameter


sxy=12.7; //socket size x,y
sz=21; //socket height
ssd=5; // socket screw diameter


thxy=5; //tap head size x, y
thz=11; // tap head height
tsd=5; // tap screw diameter

tp=0.75; //thread percentage

mz=10; // middle height

bh=thz+mz+sz; //body height

difference(){
    
    //body
    union(){
        translate([0,0,thz+mz]){cylinder(d=bd,h=sz,$fn=200);}
        translate([0,0,thz]){cylinder(d1=tbd,d2=bd,h=mz,$fn=200);}
        cylinder(d=tbd,h=thz,$fn=200);
    }
    
    //socket
    translate([-sxy/2,-sxy/2,(bh-sz)+1]){
        cube([sxy,sxy,sz]);
    }
    //socket screw y
    translate([0,bd/2,bh-ssd]){
        rotate([90,0,0]){
            cylinder(d=ssd*.75,h=bd+2,$fn=30);
        }
    }
    //socket screw x
    translate([-bd/2,0,bh-ssd]){
        rotate([0,90,0]){
            cylinder(d=ssd*.75,h=bd+2,$fn=30);
        }
    }
    
    //tap head
    translate([-thxy/2,-thxy/2,-1]){
        cube([thxy,thxy,thz]);
    }
    // tap screw y
    translate([0,bd/2,tsd]){
        rotate([90,0,0]){
            cylinder(d=tsd*.75,h=bd+2,$fn=30);
        }
    }
    // tap screw x
    translate([-bd/2,0,tsd]){
        rotate([0,90,0]){
            cylinder(d=tsd*.75,h=bd+2,$fn=30);
        }
    }
}