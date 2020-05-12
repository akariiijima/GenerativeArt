int count = 0;
Flower flower1;
Flower flower2;
Flower flower3;
Flower flower4;
Flower flower5;
Flower flower6;
Flower flower7;

void setup() {
  size(1000, 800);
  int centx = width/2;
  int centy = height/2;
  background(255, 200, 230);
  strokeWeight(0.5);
  smooth();
  flower1 = new Flower(centx+200, centy-200, 255, 100,  100);
  flower2 = new Flower(centx-200, centy-200, 230, 150,  80);
  flower3 = new Flower(centx+200, centy+200, 250, 170,  50);
  flower4 = new Flower(centx-200, centy+200, 200, 120, 200);
  flower5 = new Flower(centx+400, centy,     200, 120, 200);
  flower6 = new Flower(centx-400, centy,     255, 100,  100);
}


void draw() {
  if (count > 40) return;
  flower1.update(count);
  flower4.update(count);
  
  if(count > 10){
    flower2.update(count-10);
    flower3.update(count-10);
  }
  if(count > 15){
    flower5.update(count-15);
    flower6.update(count-15);
  }
  count += 1;
  //saveFrame("frames1/######.png");
}

class Flower{
  float r;
  float x, y, lastx, lasty, centx, centy;
  int red, green, blue;
  
  Flower(float centx, float centy, int red,int green, int blue){
    r = 0;
    this.centx = centx;
    this.centy = centy;
    lastx = centx;
    lasty = centy;
    this.red = red;
    this.green = green;
    this.blue = blue;
  }
  
  void update(int count){
    float randomNoise = 0;
    float randomStart = random(360);
    stroke(red, green, blue, 20);
    fill(red, green, blue, 20);
    beginShape();
    for (float ang = randomStart; ang <= randomStart + 2000; ang += 1) {
      float noise = noise(randomNoise)*300-100;
      x = centx + ((r+noise) * cos(radians(ang)));
      y = centy + ((r+noise) * sin(radians(ang)));
      line(x, y, lastx, lasty);
      lastx = x;
      lasty = y;
      r += count*0.001;
      randomNoise += 0.05;
      curveVertex(x, y);
    }
    line(lastx, lasty, centx, centy);
    endShape();
  }
}
