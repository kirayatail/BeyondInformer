void initOCDCam(){
 cam = new Camera(this,500*(1.75+camMoveX),500*(0.6+camMoveY),500,500*(1.75+camMoveX),500*(0.6+camMoveY),0);
 cam.roll(PI);
 cam.jump(500*(1.2+camMoveX),500*(.6+camMoveY),500*(camMoveZ)); 
 cam.aim(500*(1.2+camMoveX+camCorrectionX),500*(.6+camMoveY+camCorrectionY),0); 
}
 void initOCDCamSide(){
 camSide = new Camera(this, 500,3.2*500,0,   1.2*500,1.2*500,0);
 camSide.roll(PI/2);
}
void initOCDCamFront(){
 camFront = new Camera(this, 3.6*500,300,0,    500,300,0);
 camFront.roll(-PI/2);
}



