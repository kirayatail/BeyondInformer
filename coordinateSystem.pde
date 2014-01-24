
void coordinateSystem(){

 
  //first the cornerlines
strokeWeight(4);

stroke(0);
line(0,plateY,0,plateX,plateY,0);
line(plateX,0,0,plateX,plateY,0);

line(0,0,0,plateX,0,0);
line(0,0,0,0,plateY,0);
stroke(255,0,0);
line(0,0,0,0,0,.4);
stroke(0,255,0);
line(plateX,0,0,plateX,0,.4);
stroke(255,255,255);
line(plateX,plateY,0,plateX,plateY,.4);
stroke(0,0,255);
line(0,plateY,0,0,plateY,.4);
stroke(255,255,255);
/*stroke(90,90,90);
for (float i=0;i<plateX;i=i+.15){
if(i<1.21)line(0,i,0,  2.4,i,0);
line(i,0,0,  i,1.2,0);

}*/
/*
strokeWeight(8);
point(.44,.255,0); //mp3
point(.635,.255,0); //mp1
point(.535,.42,0);  //mp2

point(1.323,.76,0); //mp4
point(1.513,.76,0); //mp5
point(1.42,.93,0); //mp6
stroke(0,255,0);
*/
strokeWeight(0);

/*Vec3D mp1=new Vec3D(.44,.225,0); //mp1 
Vec3D mp2=new Vec3D(.635,.225,0);  //mp2
Vec3D mp3=new Vec3D (.535,.42,0); //mp3
Vec3D mp4=new Vec3D(1.323,.76,0); //mp4
Vec3D mp5=new Vec3D(1.513,.76,0); //mp5
Vec3D mp6=new Vec3D(1.42,.93,0); //mp6
*/

}
