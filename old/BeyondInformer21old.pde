import processing.serial.*;
import damkjer.ocd.*;
import processing.opengl.*;
import dLibs.freenect.toolbox.*;
import dLibs.freenect.constants.*;
import dLibs.freenect.interfaces.*;
import dLibs.freenect.*;
import toxi.geom.*;
import controlP5.*;
//---------------------------------------------------IMPORTS--
PFont skrifttype;
Kinect kinect_;                     // main kinect-object
KinectFrameVideo kinect_video_;     // video frame
KinectFrameDepth kinect_depth_;     // depth frame
Kinect3D k3d_;
int kinectFrame_size_x = VIDEO_FORMAT._RGB_.getWidth();   // width of kinect frame
int kinectFrame_size_y = VIDEO_FORMAT._RGB_.getHeight();  // height of kinect frame
Camera cam;  
Camera camSide;
Camera camFront;
///////////////////////////////////// The serial port
import processing.serial.*;
Serial myPort;        
/////////////////////////////////Other Variables
float scaleF=1.01;
float plateX=1.96;
float plateY=1.22;
float kinectEdge=0.15;
float valMp1=0;
float valMp2=0;
float valMp3=0;
float valMp4=0;
float valMp5=0;
float valMp6=0;
float valPin1=0;
float valPin2=0;
float valPin3=0;
float valPin4=0;
ArrayList pointListAll;
ArrayList sensorsAll;

int whiteCount = 0;
int blueCount = 0;
int redCount = 0;
/////////////SETTINGS
       float rotX;
       float rotY;
       float rotZ;        
       float moveX;
       float moveY;
       float moveZ;
       float lightA;
       float camCorrX;
       float camCorrY;
       float camZ;
       float camX;
       float camY;
       float hCut;
       //////////////
       String info[] = new String[13];
       //////////////Sensor POSITIONS
Vec3D ptMove = new Vec3D(0, 0, 0);
Vec3D mp1=new Vec3D(.44,.225,0); //mp1 
Vec3D mp2=new Vec3D(.635,.225,0);  //mp2
Vec3D mp3=new Vec3D (.535,.42,0); //mp3
Vec3D mp4=new Vec3D(1.323,.76,0); //mp4
Vec3D mp5=new Vec3D(1.513,.76,0); //mp5
Vec3D mp6=new Vec3D(1.42,.93,0); //mp6
Vec3D pin1=new Vec3D(.73,.44,.45);
Vec3D pin2=new Vec3D(1.215,.61,.45);
Vec3D pin3=new Vec3D(.84,.765,0);
Vec3D pin4=new Vec3D(1.13,.26,0);
Vec3D sun=new Vec3D(0,0,2.3);
Vec3D vent=new Vec3D(0,0,.5);
///////////////////////////////////SETUP///////////////////////////////
void setup(){
  size(1660,1015,OPENGL);
  skrifttype =loadFont("SwissFont.vlw");
  textFont(skrifttype);
  textSize(.017);
 // textMode(SCREEN);
  //size(kinectFrame_size_x, kinectFrame_size_y, OPENGL);
  kinect_ = new Kinect(0);  //create a main kinect instance with index 0
  kinect_video_ = new KinectFrameVideo(VIDEO_FORMAT._RGB_);    // create a video instance
  kinect_depth_ = new KinectFrameDepth(DEPTH_FORMAT._11BIT_);  // create a depth instance
  
  k3d_ = new Kinect3D(); // generate a 3d instance
  k3d_.setFrameRate(15); // set framerate
  kinect_video_.connect(kinect_);  //connect the created video instance to the main kinect
  kinect_depth_.connect(kinect_);  //connect the created depth instance to the main kinect
  k3d_.connect(kinect_);
  //////////////////////////////////////////////PortArduino
  myPort = new Serial(this, "COM5", 9600);
  myPort.bufferUntil('\n');

  /////////////////////////////////////////////////read Rotations
  
   String[] settingLines = loadStrings("rotations.txt");
   // for(int i = 0; i < settingLines.length; ++i){
    //String[] pieces = split(lines[0], ',');
        rotX = float(settingLines[0]) ;
        rotY = float(settingLines[1]) ;
        rotZ = float(settingLines[2]) ;
        moveX = float(settingLines[3]) ;
        moveY = float(settingLines[4]) ;
        moveZ = float(settingLines[5]) ;
        lightA= float(settingLines[6]);
        camCorrX=float(settingLines[7]);
        camCorrY=float(settingLines[8]);
        camX=float(settingLines[9]);
        camY=float(settingLines[10]);
        camZ=float(settingLines[11]);
        hCut=float(settingLines[12]);
      
        angleX=rotX;
        angleY=rotY;
        angleZ=rotZ;
        lightAngle=lightA;
        camCorrectionX=camCorrX;
        camCorrectionY=camCorrY;
        camMoveZ=camZ;
        camMoveX=camX;
        camMoveY=camY;
        heightCut=hCut;
      
   ////////////////////////////////////////////////Kinect
 initOCDCam();
 initOCDCamSide();
 initOCDCamFront();
 
  GUIsetup();
  pointListAll = new ArrayList();
  sensorsAll = new ArrayList();
 
sun.x=plateX*.5+(1*cos(lightAngle));
sun.y=plateY*.5+(1*sin(lightAngle));

sensorsAll.add(mp1);
sensorsAll.add(mp2);
sensorsAll.add(mp3);
sensorsAll.add(mp4);
sensorsAll.add(mp5);
sensorsAll.add(mp6);
sensorsAll.add(pin1);
sensorsAll.add(pin2);
sensorsAll.add(pin3);
sensorsAll.add(pin4);
sensorsAll.add(sun);
}
///////////////////////////////////DRAW///////////////////////////////
void draw (){

  scale(500); // to scale the scene (original units are in meters)
  background(0);


 textSize(.018);
 text("Light:",pin3.x-.3,pin3.y+.08,0.3); text(int(valPin3),pin3.x-.3+.09,pin3.y+.08,0.3);
 text("Light:",pin4.x,pin4.y+.08,0.3); text(int(valPin4),pin4.x+.09,pin4.y+.08,0.3);
 
 textSize(.010);
 text("Air Flow:",pin1.x+.04,pin1.y+.05,0.6);  textSize(.020); text(int(valPin1),pin1.x+.10,pin1.y+.05,0.6);textSize(.010);
 text("Air Flow:",pin2.x-.12,pin2.y,0.6); textSize(.020); text(int(valPin2),pin2.x-.07,pin2.y,.6);textSize(.010);
 
  if(valPin1+3<valPin2)     {text("Less air please",pin2.x-.11,pin2.y+.02,0.6);text("More air please",pin1.x+.04,pin1.y+.07,0.6);}
 else if(valPin2+3<valPin1){text("Less air please",pin1.x+.04,pin1.y+.07,0.6);text("More air please",pin2.x-.11,pin2.y+.02,0.6);}
 else{ text("Air in Balance!",pin1.x+.04,pin1.y+.07,0.6);text("Air in Balance!",pin2.x-.11,pin2.y+.02,0.6);}
 
 textSize(.020);
 if(valPin3+20>valPin4)     { text("Build to shade here, please",pin3.x-.3,pin3.y+.10,0.3);text("Get more light here, please",pin4.x,pin4.y+.10,0.3);}
 else if(valPin4+20>valPin3){ text("Get more light here, please",pin3.x-.3,pin3.y+.10,0.3);text("Build to Shade here, please",pin4.x,pin4.y+.10,0.3);}
 else{ text("Light in balance..",pin3.x-.3,pin3.y+.10,0.3);text("Light in balance..",pin4.x,pin4.y+.10,0.3);}

 
 //bottomClip / heightClip / rightClip / widthClip / frontClip / debthClip/ res / ptSize)
drawPointCloud((plateY*-.5)-kinectEdge,plateY+kinectEdge*2,-plateX*.5-kinectEdge,plateX+kinectEdge*2,0,6,3,14);
 coordinateSystem();
 
 print("Total point count: "+whiteCount+"\n");
 print("Blue count: "+blueCount+"\n");
 print("Red count: "+redCount+"\n");
 
 whiteCount = 0;
 blueCount = 0;
 redCount = 0;

 Balance(pointListAll,int((2000-(valPin3+valPin4))/8),int((2000-(valPin3+valPin4))/8),int((2000-(valPin3+valPin4))/8),15 );


 if(cams==0)cam.feed();
 if(cams==1)camSide.feed();
 if(cams==2)camFront.feed();
}
void keyPressed() {

if(key=='s'){
   info[0]=angleX+"";
   info[1]=angleY+"";
   info[2]=angleZ+"";
   info[3]=moveX+"";
   info[4]=moveY+"";
   info[5]=moveZ+"";
   info[6]=lightAngle+"";
   info[7]=camCorrectionX+"";
   info[8]=camCorrectionY+"";
   info[9]=camMoveX+"";
   info[10]=camMoveY+"";
   info[11]=camMoveZ+"";
   info[12]=heightCut+"";
   
  
  saveStrings("rotations.txt", info );
  }
   
if(key=='c'){
// cam.jump(500*(.325+camMoveX),500*(.275+camMoveY),500*(camMoveZ)); 
 //cam.aim(500*(.325+camMoveX),500*(.275+camMoveY+camCorrection),0); 
 cam.jump(500*(1.2+camMoveX),500*(.6+camMoveY),500*(camMoveZ)); 
 cam.aim(500*(1.2+camMoveX+camCorrectionY),500*(.6+camMoveY+camCorrectionX),0);
}
if(key=='-'){
 if(cams==0) cam.zoom(.005);
 if(cams==1) camSide.zoom(.01);
 if(cams==2) camFront.zoom(.01);
 
 }
if(key=='+'){
 if(cams==0) cam.zoom(-.01);
 if(cams==1) camSide.zoom(-.01);
 if(cams==2) camFront.zoom(-.01);
}
}

