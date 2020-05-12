int count = 0;
int centx;
int centy;
MoveLine moveLine1;
MoveLine moveLine2;
MoveLine moveLine3;
MoveLine moveLine4;
MoveLine moveLine5;
MoveLine moveLine6;
MoveLine moveLine7;
MoveLine moveLine8;
MoveLine moveLine9;
MoveLine moveLine10;

void setup() {
  frameRate(200);
  size(1000, 800);
  centx = width/2;
  centy = height/2;
  background(255,192,203);
  strokeWeight(0.5);
  noFill();
  smooth();
  moveLine1 = new MoveLine(255,160,122);
  moveLine2 = new MoveLine(250,128,114);
  moveLine3 = new MoveLine(233,150,122);
  moveLine4 = new MoveLine(240,128,128);
  moveLine5 = new MoveLine(255,127,80);
  moveLine6 = new MoveLine(255,127,80);
  moveLine7 = new MoveLine(233,150,122);
  moveLine8 = new MoveLine(240,128,128);
  moveLine9 = new MoveLine(255,160,122);
  moveLine10 = new MoveLine(250,128,114);
}

void draw(){
  if(count == 400) return;
  moveLine1.update();
  moveLine2.update();
  moveLine3.update();
  moveLine4.update();
  moveLine5.update();
  moveLine6.update();
  moveLine7.update();
  moveLine8.update();
  moveLine9.update();
  moveLine10.update();  
  
  saveFrame("frames2/######.png");
  count += 1; 
}

class MoveLine{
  float angnoise, radiusnoise, xnoise, ynoise, radius, angle;
  int red, green, blue, alpha;
  
  MoveLine(int red, int green, int blue){
    angnoise = random(10);
    radiusnoise = random(10);
    xnoise = random(10);
    ynoise = random(10);
    angle = 0;
    alpha = 50;
    this.red = red;
    this.green = green;
    this.blue = blue;
  }
  
  void update(){
    stroke(red, green, blue, alpha);
    radius = (noise(radiusnoise) * 550) +100;
    angle += (noise(angnoise) * 8) - 3;
    radiusnoise += 0.005;
    alpha += count/100;
    angnoise += 0.005;
    if (angle > 200) { angle -= 360; }
    if (angle < 0) { angle += 360; }
      
    xnoise += 0.01;
    ynoise += 0.01;

    float rad = radians(angle);
    
    float noisecentx = centx + (noise(xnoise) * 300) - 150;
    float noisecenty = centy + (noise(ynoise) * 300) - 150;
       
    float x = noisecentx + (1.3*radius * cos(rad));
    float y = noisecenty + (1.3*radius * sin(rad));
    float lastx = noisecentx + (1.3*radius * cos(rad + PI));
    float lasty = noisecenty + (1.3*radius * sin(rad + PI));
    line(x, y, lastx, lasty);
  }
}
