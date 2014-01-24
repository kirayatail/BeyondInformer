
Vec3D cherryVector = new Vec3D(0,0,0);
CherryMode cherryMode = CherryMode.INACTIVE;
// Possible CherryMode: INACTIVE, ACTIVE, CANDIDATE


void renderCherry() {
  if (cherryMode != CherryMode.ACTIVE) {
    return;
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
