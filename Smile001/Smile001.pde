import processing.serial.*;
import JMyron.*;
import pSmile.PSmile;


JMyron m;
PSmile smile;
PImage img1, img2;
float res;
PFont font;
int w, h;
Serial arduinoPort;  //arduino libray

void setup() {
  arduinoPort = new Serial(this, "COM11", 9600); 
  size(640,480);
  w = width/2;
  h = height/2;
  background(0);
  m = new JMyron();
  m.start(width,height);
  m.findGlobs(0);
  img1 = createImage(width,height,ARGB);
  img2 = createImage(w,h,ARGB);
  smile = new PSmile(this,w,h);
  res = 0.0;
  font = loadFont("SansSerif.plain-16.vlw");
  textFont(font,16);
  textAlign(CENTER);
  noStroke();
  fill(255,200,0);
  rectMode(CORNER);
}

void draw() {
  m.update();
  arraycopy(m.cameraImage(),img1.pixels);
  img1.updatePixels();
  img2.copy(img1,0,0,width,height,0,0,w,h);
  img2.updatePixels();
  image(img1,0,0);
  res = smile.getSmile(img2);
  if (res>0) {
    float t_h = res*30;
    rect(width/2-20,height-t_h-30,40,t_h);
  }
  String str = nf(res,1,4);
  text(str,width/2,height-10);
  text("Nível de Humor: ",width/9,height-10);
  
  if(res<0){
    text("Normal",width/4,height-10);
    arduinoPort.write("0");
  
}

  if(res>0 && res<=5){
    text("Feliz",width/4,height-10);
    arduinoPort.write("1");
  
}

if(res>5 && res <=6){
  text("Muito Feliz",width/4,height-10);
  arduinoPort.write("2");
}

  if(res>6){
    text("Super Feliz",width/4,height-10);
    arduinoPort.write("3");
  
}



}

void stop() {
  m.stop();
  super.stop();
}

