
Vec3D cherryVector = new Vec3D(0,0,0);
PImage cherryImage;
float scaleFactor = 500;
CherryMode cherryMode = CherryMode.INACTIVE;
// Possible CherryMode: INACTIVE, ACTIVE, CANDIDATE


void renderCherry() {
  if (cherryMode != CherryMode.ACTIVE) {
    return;
  } 
  else {
    scale(1/scaleFactor);
    image(cherryImage, cherryVector.x*scaleFactor-cherryImage.width/2, cherryVector.y*scaleFactor-cherryImage.height/2);
    scale(scaleFactor); 
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
  
  // If inactive - do nothing
  
  // If active and a color - Count towards that color or reset and restart count
  
  // If active and nothing - Reset
  
  // If candidate and nothing - Switch to active
  
  // If candidate and color - Re-run Randomize
  
}
