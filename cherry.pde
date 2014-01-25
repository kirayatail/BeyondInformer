
Vec3D cherryVector = new Vec3D(0,0,0);
PImage cherryImage;
float scaleFactor = 500;
CherryMode cherryMode = CherryMode.INACTIVE;
// Possible CherryMode: INACTIVE, ACTIVE, CANDIDATE

String cherryStatus = "";

void renderCherry() {
  if (cherryMode != CherryMode.ACTIVE) {
    return;
  } 
  else {
    scale(1/scaleFactor);
//    image(cherryImage, cherryVector.x*scaleFactor-cherryImage.width/2, cherryVector.y*scaleFactor-cherryImage.height/2);
    scale(scaleFactor); 
    
    fill (0,0,0);
    text(cherryStatus, cherryVector.x, cherryVector.y, 0);
  }  
  
}

void randomizeCherry() {
  cherryMode = CherryMode.CANDIDATE;
  
  float x = random(plateX);
  float y = random(plateY);
  cherryVector.set(x,y,0);
}

Vec3D getCherryCoordinate() {
  return cherryVector;
}

void cherryCallback(String pointStatus) {
  println("point status: "+´pointStatus);
  cherryStatus = pointStatus;
  if (cherryMode == CherryMode.CANDIDATE) {
    if (pointStatus.equals("nothing")) {
      cherryMode = CherryMode.ACTIVE;
    } else {
      randomizeCherry(); 
    }
  }
  
  // If inactive - do nothing
  
  // If active and a color - Count towards that color or reset and restart count
  
  // If active and nothing - Reset
  
  // If candidate and color - Re-run Randomize
  
}
