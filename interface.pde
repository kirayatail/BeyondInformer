
// global variables
float angleX=rotX;
float angleY=rotY;
float angleZ=rotZ;
float triangleSide = .55;
float threshold2 = 1.2;
float lightAngle= .05;
float flowAngle= .15;
float camCorrectionX =-.15;
float camCorrectionY =0;
float camMoveZ;
float camMoveX;
float camMoveY;
float camZoom;
float showAll=0;
float heightCut=hCut;
float topClip=heightTrim;
float bottomClip=bottomTrim;
float leftClip;
float rightClip;
int cams;
// define control objects
ControlP5 controlP5;
ControlWindow controlWindow;
Controller kController;

// user interface function
void GUIsetup(){
  controlP5 = new ControlP5(this);
  
 // control window
  controlWindow = controlP5.addControlWindow("controlWindow", 10,10, 550, 400);
  controlWindow.setBackground(color(0));

 // control sliders 
  kController = controlP5.addSlider("angleX",     1, 2, 40, 20, 400, 10);
  kController.setWindow(controlWindow);
  kController = controlP5.addSlider("angleY",     -.1, .1, 40, 40, 400, 10);
  kController.setWindow(controlWindow);
  kController = controlP5.addSlider("angleZ",     PI-1, PI+1, 40, 60, 400, 10);
  kController.setWindow(controlWindow);
  kController = controlP5.addSlider("moveX",     -.3, 1.7, 40, 80, 400, 10);
  kController.setWindow(controlWindow);
  kController = controlP5.addSlider("moveY",     .4, .7, 40, 100, 400, 10);
  kController.setWindow(controlWindow);
  kController = controlP5.addSlider("moveZ",     1, 3.5, 40, 120, 400, 10);
  kController.setWindow(controlWindow);
   kController = controlP5.addSlider("lightAngle",     -PI, PI, 40, 140, 400, 10);
  kController.setWindow(controlWindow); 
     kController = controlP5.addSlider("flowAngle",     -PI, PI, 40, 160, 400, 10);
  kController.setWindow(controlWindow);
  kController = controlP5.addSlider("camCorrectionX",-.2, .2, 40, 180, 400, 10);
  kController.setWindow(controlWindow);
  kController = controlP5.addSlider("camCorrectionY",-.2, .2, 40, 200, 400, 10);
  kController.setWindow(controlWindow);
   kController = controlP5.addSlider("camMoveX",-1.1, 1.1, 40, 220, 400, 10);
  kController.setWindow(controlWindow);
  kController = controlP5.addSlider("camMoveY",-1, 1, 40, 240, 400, 10);
  kController.setWindow(controlWindow);
  kController = controlP5.addSlider("camMoveZ",2, 4, 40, 260, 400, 10);
  kController.setWindow(controlWindow);
  kController = controlP5.addSlider("heightCut",-.3, .3, 40, 280, 400, 10);
  kController.setWindow(controlWindow);
  kController = controlP5.addSlider("topClip",-1, 1, 40, 300, 400, 10);
  kController.setWindow(controlWindow);
  kController = controlP5.addSlider("bottomClip",-1, 1, 40, 320, 400, 10);
  kController.setWindow(controlWindow);
  kController = controlP5.addSlider("leftClip",-1, 1, 40, 340, 400, 10);
  kController.setWindow(controlWindow);
  kController = controlP5.addSlider("rightClip",-1, 1, 40, 360, 400, 10);
  kController.setWindow(controlWindow);
  
  kController=controlP5.addButton("cams",0,40,380,10,10);
  kController.setWindow(controlWindow);
    kController=controlP5.addButton("cams",1,60,380,10,10);
  kController.setWindow(controlWindow);
    kController=controlP5.addButton("cams",2,80,380,10,10);
  kController.setWindow(controlWindow);
      kController=controlP5.addToggle("showAll",1,0,40,10);
  kController.setWindow(controlWindow);
 
 
} 

