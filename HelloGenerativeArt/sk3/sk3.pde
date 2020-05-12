float xstart, xnoise, ystart, ynoise;
int count = 0;
void setup() {
  size(1000, 800);
  smooth(); 
  background(175, 240, 255);
  xstart = random(10);
  ystart = random(10);
}


void draw () {
  if( count > 300) return;
  background(175, 240, 255);
  xstart += 0.02;
  ystart += 0.02;
  xnoise = xstart;
  ynoise = ystart;
  for (int y = 0; y <= height; y+=5) {
    ynoise += 0.02;
    xnoise = xstart;
    for (int x = 0; x <= width; x+=5) {
      xnoise += 0.02;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
  saveFrame("frames3/######.png");
  count += 1;
}
   void drawPoint(float x, float y, float noiseFactor) {
     pushMatrix();
     translate(x,y);
     rotate(noiseFactor * radians(540));
     noStroke();
     float edgeSize = noiseFactor * 35;
     float grey = 180 + (noiseFactor * 120);
     float alph = noiseFactor * 120;
     fill(grey, alph);
     if(edgeSize > 5 && alph > 15){
       ellipse(0,0, edgeSize, edgeSize/2);
     }
     popMatrix();
}
