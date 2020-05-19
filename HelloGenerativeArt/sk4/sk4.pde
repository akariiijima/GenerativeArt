int radius = 200;
int count = 0;

void setup() {
  size(500, 500, P3D);
  background(255); 
  sphereDetail(12);
  stroke(0);
}
void draw() {
  if( count > 500) return;
  background(0);
  translate(width/2, height/2, 0); 
  rotateY(frameCount * 0.01); 
  rotateX(frameCount * 0.01);
  rotateZ(frameCount * 0.01);
  float s = 0;
  float t = 0;
  float lastx = 0;
  float lasty = 0;
  float lastz = 0;

  while (t <= 360) {
    s += 50;
    t += 1;
    float radianS = radians(s);
    float radianT = radians(t);
    float thisx = 0 + (radius * cos(radianS) * sin(radianT) * noise(t * 0.1) * 3); 
    float thisy = 0 + (radius * sin(radianS) * sin(radianT) * noise(t * 0.1) * 3); 
    float thisz = 0 + (radius * cos(radianT));
    if (lastx != 0) {
      drawLine(thisx, thisy, thisz, lastx, lasty, lastz);
      drawLine(thisx + 200, thisy, thisz, lastx, lasty, lastz);
    }
    drawSphere(thisx, thisy, thisz);
    drawSphere(thisx + 200, thisy, thisz);
    
    lastx = thisx; 
    lasty = thisy; 
    lastz = thisz;
  }
  
  saveFrame("frames4/######.tif");
  count += 1;
}

void drawLine(float x, float y, float z, float lastx, float lasty, float lastz) {
  pushMatrix();
  stroke( 255, 255, 255, 50);
  line(x, y, z, lastx, lasty, lastz);
  popMatrix();
}

void drawSphere(float x, float y, float z) {
  pushMatrix();
  fill(255, 255, 230, 100);
  noStroke();
  translate(x, y, z);
  sphere(noise(frameCount*0.1) * 10);
  popMatrix();
}
